#!/usr/bin/env bash
# Author: Chmouel Boudjnah <chmouel@chmouel.com>
set -euxfo pipefail

cPWD="$(dirname $(readlink -f $0))"
cd $GOPATH/src/gitlab.com/chmouel/zmk/app/ || exit 1
source $GOPATH/src/gitlab.com/chmouel/zmk/.venv/bin/activate

west build -p -b planck_rev6 -S studio-rpc-usb-uart \
  -- -DZMK_CONFIG=$cPWD/config -DCONFIG_ZMK_STUDIO=y -DKEYMAP_FILE=$cPWD/config/planck_rev6.keymap &&
  west flash

set +x
echo -n "Unplug the keyboard: "
while true; do
  if dfu-util -l 2>/dev/null | grep -q "Found DFU"; then
    echo -n "."
    sleep 1
  else
    break
  fi
done
echo " done"

echo -n "Plug the keyboard: "
while true; do
  if lsusb | grep -q "Planck"; then
    break
  else
    echo -n "."
    sleep 1
  fi
done
echo " done"
