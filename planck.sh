#!/usr/bin/env bash
# Author: Chmouel Boudjnah <chmouel@chmouel.com>
set -eufo pipefail

cPWD="$(dirname $(readlink -f $0))"
source ${cPWD}/lib/functions.sh

zmkRepo="$(readlink -f $cPWD/../zmk)"
cd $zmkRepo/app || exit 1
source $zmkRepo/.venv/bin/activate

west build -b planck_rev6 -S studio-rpc-usb-uart \
  -- -DZMK_CONFIG=$cPWD/config -DCONFIG_ZMK_STUDIO=y -DKEYMAP_FILE=$cPWD/config/planck_rev6.keymap &&
  west flash

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
