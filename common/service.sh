# This script will be executed in late_start service mode
# More info in the main Magisk thread
mount -o rw,remount /system
mount --bind $SYS/bin/bash $SYS/bin/sh
mount -o ro,remount /system
