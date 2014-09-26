#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
    "/sys/devices/virtual/graphics/fb0",

	"/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0",
	"/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:b368/block/mmcblk0",
	"/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:b368/block/mmcblk0/mmcblk0p1", //sdcard
	"/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:b368/block/mmcblk0/mmcblk0p2", //system
	"/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:b368/block/mmcblk0/mmcblk0p4", //data
	"/sys/bus/mmc",
	"/sys/bus/mmc/drivers/mmcblk",
	"/sys/bus/mmc/drivers/mmc_test",

	"/sys/devices/virtual/bdi/mtd-unmap",
	"/sys/devices/virtual/bdi/mtd-romap",
	"/sys/devices/virtual/bdi/mtd-rwmap",
//	"/sys/devices/virtual/mtd/mtd0",
//	"/sys/devices/virtual/mtd/mtd0/mtdblock0",
//	"/sys/devices/virtual/mtd/mtd0ro",
	"/sys/devices/virtual/mtd/mtd1",
	"/sys/devices/virtual/mtd/mtd1/mtdblock1",
	"/sys/devices/virtual/mtd/mtd1ro",
//	"/sys/devices/virtual/mtd/mtd2",
//	"/sys/devices/virtual/mtd/mtd2/mtdblock2",
//	"/sys/devices/virtual/mtd/mtd2ro",
//	"/sys/devices/virtual/mtd/mtd3",
//	"/sys/devices/virtual/mtd/mtd3/mtdblock3",
//	"/sys/devices/virtual/mtd/mtd3ro",
//	"/sys/devices/virtual/mtd/mtd4",
//	"/sys/devices/virtual/mtd/mtd4/mtdblock4",
//	"/sys/devices/virtual/mtd/mtd4ro",
//	"/sys/devices/virtual/mtd/mtd5",
//	"/sys/devices/virtual/mtd/mtd5/mtdblock5",
//	"/sys/devices/virtual/mtd/mtd5ro",
//	"/sys/devices/virtual/mtd/mtd6",
//	"/sys/devices/virtual/mtd/mtd6/mtdblock6",
//	"/sys/devices/virtual/mtd/mtd6ro",
//	"/sys/devices/virtual/mtd/mtd7",
//	"/sys/devices/virtual/mtd/mtd7/mtdblock7",
//	"/sys/devices/virtual/mtd/mtd7ro",
//	"/sys/devices/virtual/mtd/mtd8",
//	"/sys/devices/virtual/mtd/mtd8/mtdblock8",
//	"/sys/devices/virtual/mtd/mtd8ro",

	"/sys/devices/virtual/misc/uinput",
	"/sys/devices/virtual/input/input0", //touch_mcs6000
	"/sys/devices/virtual/input/input0/event0",
	"/sys/devices/virtual/input/input1", //thunder_keypad
	"/sys/devices/virtual/input/input1/event1",
	"/sys/devices/virtual/input/input4", //7k_handset
	"/sys/devices/virtual/input/input4/event4",

    // for adb
    "/sys/devices/virtual/tty/ptmx",
//	"/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:b368/block/mmcblk0/mmcblk0p2", //system
//	"/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:b368/block/mmcblk0/mmcblk0p4", //data
    "/sys/devices/virtual/misc/android_adb",
	"/sys/devices/virtual/android_usb/android0/f_adb",
    "/sys/bus/platform/drivers/android_usb",

    // exfat requires fuse device
    "/sys/devices/virtual/misc/fuse",

    NULL
};
