#!/usr/bin/env python3
import re
import sys

first_line = True
filename = "config/eyelash_corne.keymap"
if sys.argv[1:]:
    filename = sys.argv[1]

with open(filename, "r") as f:
    for line in f:
        if line.strip().startswith("display-name ="):
            if not first_line:
                print()
            else:
                first_line = False
            print(re.sub(r'display-name =|"|;', "", line).strip())

        if line.startswith("//    "):
            print(line.strip().replace("//    ", ""))
