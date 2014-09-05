-include vendor/lge/thunderc/BoardConfigVendor.mk
-include device/lge/msm7x27-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME 		:= thunderc
TARGET_OTA_ASSERT_DEVICE 			:= thunderc,LS670,VM670,thunderc_LS670,thunderc_VM670
BOARD_KERNEL_CMDLINE 				:= mem=471M console=ttyMSM2,115200n8 androidboot.hardware=thunderc lge.rev=10
TARGET_KERNEL_SOURCE 				:= kernel/lge/msm7x27-3.0.x-p500

BOARD_KERNEL_BASE 					:= 0x12200000

#for recovery:
ifneq (eng,$(TARGET_BUILD_VARIANT))
# Don't include charger detection in recovery mode
#selinux enforcing mode sucks
#TARGET_KERNEL_CONFIG 				:= thunderc-enforcing_defconfig
TARGET_KERNEL_CONFIG 				:= thunderc-permissive_defconfig
#TARGET_KERNEL_CONFIG 				:= thunderc-permissive-legacy_defconfig
BOARD_CHARGING_CMDLINE_NAME         := "lge.reboot"
BOARD_CHARGING_CMDLINE_VALUE        := "pwroff"
else
# Real recovery size 0x00500000. Use lzma.
TARGET_KERNEL_CONFIG 				:= thunderc-recovery_defconfig
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 0x00600000
endif
MINIGZIP 							:= $(shell which lzma)
ARM_EABI_TOOLCHAIN 					:= $(ANDROID_BUILD_TOP)/prebuilt/linux-x86/toolchain/arm-unknown-eabi-4.7/bin
#ARM_EABI_TOOLCHAIN 				:= $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.9/bin 
TARGET_GCC_VERSION_AND 				:= 4.7-sm

## Boot loader & recovery
SKIP_SET_METADATA 					:= true

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/thunderc/bluetooth

## TLS register
#ARCH_ARM_HAVE_TLS_REGISTER			:=

## Partition Sizes: Fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE 		:= 0x00440000
#BOARD_SYSTEMIMAGE_PARTITION_SIZE	:= 0x09E00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE 	:= 0x10000000
BOARD_USERDATAIMAGE_PARTITION_SIZE 	:= 0x0c780000
BOARD_FLASH_BLOCK_SIZE 				:= 0

#mtdparts=msm_nand:112k@0x2f20000(boot),1762k@0x2f20000(cache),112k@0x9d40000(recovery)5494k@0xa680000(system)

## RIL
BOARD_CDMA_NETWORK 					:= true

## OTA script extras file and trash file (build/tools/releasetools)
TARGET_OTA_EXTRAS_FILE 				:= device/lge/thunderc/releasetools/extras.txt
TARGET_OTA_TRASH_FILE 				:= device/lge/thunderc/releasetools/trash.txt

#Art
#ART_USE_PORTABLE_COMPILER 			:= true
PRODUCT_RUNTIMES 					:= runtime_libdvm_default
#PRODUCT_RUNTIMES += runtime_libart
#WITH_ART_USE_PORTABLE_COMPILER 	:= true

#BOARD_HAS_NO_SELECT_BUTTON 		:= true
#TARGET_NO_BOOTLOADER 				:= true
#BOARD_USES_RECOVERY_CHARGEMODE 	:= false
#TARGET_RECOVERY_INITRC 			:= device/lge/thunderc/init.recovery.rc

DEVICE_RESOLUTION 					:= 320x480
RECOVERY_GRAPHICS_USE_LINELENGTH 	:= true
HAVE_SELINUX 						:= true
BOARD_HAS_NO_SELECT_BUTTON 			:= true
BOARD_USE_CUSTOM_RECOVERY_FONT 		:= \"font_7x16.h\"
TARGET_RECOVERY_PIXEL_FORMAT 		:= "RGB_565"
SMALLER_FONT_FOOTPRINT 				:= true
TARGET_NO_SEPARATE_RECOVERY 		:= true
TARGET_RECOVERY_FSTAB 				:= device/lge/thunderc/recovery.fstab

TARGET_NO_INITLOGO 					:= true
TARGET_RECOVERY_LCD_BACKLIGHT_PATH 	:= \"/sys/class/leds/lcd-backlight/brightness\"
TARGET_USERIMAGES_USE_F2FS 			:= true

TW_BRIGHTNESS_PATH 					:= /sys/class/leds/lcd-backlight/brightness
TW_EXCLUDE_SUPERSU 					:= true
TW_EXCLUDE_ENCRYPTED_BACKUPS 		:= true
TW_MAX_BRIGHTNESS 					:= 255
TW_NO_SCREEN_BLANK 					:= 
#TW_NO_SCREEN_TIMEOUT 				:= false
TW_NO_REBOOT_BOOTLOADER 			:= false
TW_CUSTOM_POWER_BUTTON 				:= 107
#LOCAL_CFLAGS += -DTW_NO_REBOOT_BOOTLOADER

#Camera
TARGET_SPECIFIC_HEADER_PATH 		:= device/lge/thunderc/include3x 
TARGET_CAMERA_SENSOR_MP_SIZE 		:= 3
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT -DZTE_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS


TARGET_EXTRA_CFLAGS += $(call cc-option,-mcpu=arm1136jzf-s) $(call cc-option,-mfpu=vfp) $(call cc-option,-mfloat-abi=softfp)
AUDIO_OUTPUT_FLAG_FAST 				:= 44100

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/lge/thunderc/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    auditd.te \
    bluetooth.te \
    bootanim.te \
    device.te \
    domain.te \
    drmserver.te \
    file_contexts \
    files \
    file.te \
    hci_init.te \
    healthd.te \
    init.te \
    init_shell.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    netd.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    untrusted_app.te \
    vold.te \
    wpa.te \
    wpa_socket.te
