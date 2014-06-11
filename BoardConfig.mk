-include vendor/lge/thunderc/BoardConfigVendor.mk
-include device/lge/msm7x27-common/BoardConfigCommon.mk

## Boot loader & recovery
SKIP_SET_METADATA := true

## Kernel
BOARD_KERNEL_BASE := 0x12200000
TARGET_KERNEL_CONFIG := thunderc-test_defconfig
BOARD_KERNEL_CMDLINE := mem=471M console=ttyMSM2,115200n8 androidboot.hardware=thunderc lge.rev=10 
#mtdparts=msm_nand:112k@0x2f20000(boot),1762k@0x2f20000(cache),112k@0x9d40000(recovery)5494k@0xa680000(system)
TARGET_KERNEL_CUSTOM_TOOLCHAIN := ../../../prebuilts/gcc/linux-x86/arm/arm-eabi-4.7

ifneq (eng,$(TARGET_BUILD_VARIANT))
COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"lge.reboot"' -DBOARD_CHARGING_CMDLINE_VALUE='"pwroff"'
else
# Real recovery size
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00700000
endif
## Partition Sizes: Fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00440000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00600000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0xff00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0c780000
BOARD_FLASH_BLOCK_SIZE := 0
TARGET_BOOTLOADER_BOARD_NAME := thunderc
TARGET_OTA_ASSERT_DEVICE := thunderc,LS670,VM670,thunderc_LS670,thunderc_VM670
TARGET_RECOVERY_FSTAB := device/lge/thunderc/fstab.thunderc

#BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/thunderc/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/lge/thunderc/bluetooth/vnd_thunderc.txt

P500_SPEAKER_IN_CALL_FIX := true
## Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_CAMERA_NO_UNWANTED_MSG := true
TARGET_CAMERA_SENSOR_MP_SIZE := 3
TARGET_PREBUILT_LIBCAMERA := false
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS


BOARD_HAS_LOW_RESOLUTION := true
## RIL
BOARD_CDMA_NETWORK := true

## OTA script extras file (build/tools/releasetools)
TARGET_OTA_EXTRAS_FILE := device/lge/thunderc/releasetools/extras.txt

#TARGET_RECOVERY_FSTAB := device/lge/thunderc/recovery.fstab

#TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
#BOARD_HAS_NO_SELECT_BUTTON := true
#TARGET_NO_BOOTLOADER := true
#BOARD_USES_RECOVERY_CHARGEMODE := false 
#TARGET_RECOVERY_INITRC := device/lge/thunderc/init.recovery.rc
#twrp
#DEVICE_RESOLUTION := 320x480
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
#HAVE_SELINUX := true
#TW_NO_REBOOT_BOOTLOADER := true
#LOCAL_CFLAGS += -DTW_NO_REBOOT_BOOTLOADER
#TW_CUSTOM_POWER_BUTTON := 107 

#TARGET_RECOVERY_PIXEL_FORMAT := RGB_565
#TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"

#SMALLER_FONT_FOOTPRINT := true
