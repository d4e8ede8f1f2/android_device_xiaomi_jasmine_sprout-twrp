#!/sbin/sh

finish()
{
 umount /s
 rmdir /s
 setprop crypto.ready 1
 exit 0
}

suffix=$(getprop ro.boot.slot_suffix)

if [ -z "$suffix" ]; then
 suf=$(getprop ro.boot.slot)
 suffix="_$suf"
fi

syspath="/dev/block/bootdevice/by-name/system$suffix"
mkdir /s
mount -t ext4 -o ro "$syspath" /s

is_fastboot_twrp=$(getprop ro.boot.fastboot)

if [ ! -z "$is_fastboot_twrp" ]; then
 osver=$(getprop ro.build.version.release_orig)
 patchlevel=$(getprop ro.build.version.security_patch_orig)
 setprop ro.build.version.release "$osver"
 setprop ro.build.version.security_patch "$patchlevel"
 finish
fi

if [ -f /s/system/build.prop ]; then
 osver=$(grep -i 'ro.build.version.release' /s/system/build.prop  | cut -f2 -d'=')
 patchlevel=$(grep -i 'ro.build.version.security_patch' /s/system/build.prop  | cut -f2 -d'=')
 setprop ro.build.version.release "$osver"
 setprop ro.build.version.security_patch "$patchlevel"
 finish
else
 osver=$(getprop ro.build.version.release_orig)
 patchlevel=$(getprop ro.build.version.security_patch_orig)
 setprop ro.build.version.release "$osver"
 setprop ro.build.version.security_patch "$patchlevel"
 finish
fi
