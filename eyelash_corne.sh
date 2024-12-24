#!/usr/bin/env bash
# shellcheck disable=SC1091
# Author: Chmouel Boudjnah <chmouel@chmouel.com>
set -eufo pipefail

cPWD="$(dirname $(readlink -f $0))"
zmkRepo="$(readlink -f $cPWD/../zmk)"
eyeZMK="$(readlink -f $cPWD/../new_corne)"
cd $zmkRepo/app || exit 1
source $zmkRepo/.venv/bin/activate
source ${cPWD}/lib/functions.sh

function flash() {
  side=${1}
  id=${2}

  west build -b eyelash_corne_${side} \
    --build-dir build-${side} \
    -S studio-rpc-usb-uart -- \
    -DSHIELD=nice_view \
    -DCONFIG_ZMK_STUDIO=y \
    -DCONFIG_ZMK_STUDIO_LOCKING=n \
    -DZMK_CONFIG=$cPWD/config \
    -DKEYMAP_FILE=$cPWD/config/eyelash_corne.keymap \
    -DZMK_EXTRA_MODULES=$eyeZMK

  echo -n "$(echo_red ) Connect ${side} side as usb storage: "
  while [[ ! -e /dev/disk/by-id/${id} ]]; do
    echo -n "$(echo_blue .)"
    sleep 1
  done
  echo " ✅"
  sudo umount /mnt 2>/dev/null >/dev/null || true
  sudo mount /dev/disk/by-id/${id} /mnt
  sudo cp -bv build-${side}/zephyr/zmk.uf2 /mnt/CURRENT.UF2
  sync
  sudo umount /mnt
}

flash left usb-Adafruit_nRF_UF2_D9D14D5F56CF8D6F-0:0
echo "$(echo_green ) Left side is completed.."
sleep 2

flash right usb-Adafruit_nRF_UF2_07E2C44920A78BC8-0:0
echo $(echo_green ) "Right side is completed.. enjoy 🥳"
