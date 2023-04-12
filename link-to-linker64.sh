#!/bin/bash

relink()
{
 cp $1 ${1}_old
 sed 's|/system/bin/linker64|///////sbin/linker64|' "${1}_old" > "$1"
 chmod 755 $1
 rm ${1}_old
}

cd ./recovery/root/vendor/bin/hw
relink android.hardware.boot@1.0-service
relink android.hardware.gatekeeper@1.0-service-qti
relink android.hardware.keymaster@3.0-service-qti

cd ..
relink qseecomd
relink time_daemon

exit 0
