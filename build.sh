#!/usr/bin/env bash
# Author: Chmouel Boudjnah <chmouel@chmouel.com>
set -euxfo pipefail

cPWD="$(dirname $(readlink -f $0))"
cd $GOPATH/src/gitlab.com/chmouel/zmk/app/ || exit 1
source $GOPATH/src/gitlab.com/chmouel/zmk/.venv/bin/activate

west build -p -b planck_rev6 -- -DZMK_CONFIG=$cPWD/config -DKEYMAP_FILE=$cPWD/config/planck_rev6.keymap &&
  west flash
