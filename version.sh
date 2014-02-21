#!/bin/bash

if [ "$1" = 'sd' ]
then
	cp -v thunderc_sd.mk thunderc.mk
	cp -v cm_sd.mk cm.mk
fi
if [ "$1" = 'int' ]
then
	cp -v thunderc_int.mk thunderc.mk
	cp -v cm_int.mk cm.mk
fi
if [ "$1" = '' ]
then
	echo "version.sh [int][ext]"
fi
