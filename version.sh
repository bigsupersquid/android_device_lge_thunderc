#!/bin/bash

if [ "$1" = 'sd' ]
then
	cp -v init.thunderc_sd.rc init.thunderc.rc
	cp -v fstab.thunderc_sd fstab.thunderc
	cp -v recovery_sd.fstab recovery.fstab
	cp -v ../msm7x27-common/releasetools/extras.txt.sd ../msm7x27-common/releasetools/extras.txt
	fi
if [ "$1" = 'int' ]
then
	cp -v init.thunderc_int.rc init.thunderc.rc
	cp -v fstab.thunderc_int fstab.thunderc
	cp -v recovery_int.fstab recovery.fstab
	cp -v ../msm7x27-common/releasetools/extras.txt.int ../msm7x27-common/releasetools/extras.txt
fi
if [ "$1" = '' ]
then
	echo "version.sh [int][ext]"
fi
