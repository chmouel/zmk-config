#!/usr/bin/env bash
# Author: Chmouel Boudjnah <chmouel@chmouel.com>
set -eufo pipefail

cPWD="$(dirname $(readlink -f $0))"
zmkRepo="$(readlink -f $cPWD/../zmk)"
cd $zmkRepo/app || exit 1
source $zmkRepo/.venv/bin/activate

west build -b planck_rev6 -S studio-rpc-usb-uart \
  -- -DZMK_CONFIG=$cPWD/config -DCONFIG_ZMK_STUDIO=y -DKEYMAP_FILE=$cPWD/config/planck_rev6.keymap &&
  west flash

if [[ -e config/includes/local.h ]]; then
  cat <<EOF >config/includes/local.h
#define MYDEBUG_PASTE_MACRO &kp D &kp E &kp B &kp U &kp G
#define MYDEBUG_PASTE_MACRO_2 &kp STAR &kp SPACE &kp D &kp E &kp B &kp U &kp G &kp SPACE &kp STAR
EOF
fi

function echo_red() {
  echo -e "\033[0;31m$1\033[0m"
}

function echo_green() {
  echo -e "\033[0;32m$1\033[0m"
}

function echo_blue() {
  echo -e "\033[0;34m$1\033[0m"
}

function echo_yellow() {
  echo -e "\033[0;33m$1\033[0m"
}

echo -n "$(echo_red ) Unplug the keyboard: "
while true; do
  if dfu-util -l 2>/dev/null | grep -q "Found DFU"; then
    echo -n "$(echo_blue .)"
    sleep 1
  else
    break
  fi
done
echo_yellow " done"

echo -n "$(echo_green ) Plug the keyboard: "
while true; do
  if lsusb | grep -q "Planck"; then
    break
  else
    echo -n "$(echo_blue .)"
    sleep 1
  fi
done
echo_yellow " done"
