#!/system/bin/sh
# TWRP native hook to clear BCB before rebooting to Android
dd if=/dev/zero of=/dev/block/by-name/misc bs=1 count=40
