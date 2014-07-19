-include vendor/lge/thunderc/BoardConfigVendor.mk
-include device/lge/msm7x27-common/BoardConfigCommon.mk

## Boot loader & recovery
SKIP_SET_METADATA := true

## Kernel
BOARD_KERNEL_BASE := 0x12200000
TARGET_KERNEL_CONFIG := thunderc-permissive_defconfig
#TARGET_KERNEL_CONFIG := thunderc-enforcing_defconfig
BOARD_KERNEL_CMDLINE := mem=471M console=ttyMSM2,115200n8 androidboot.hardware=thunderc lge.rev=10 
#mtdparts=msm_nand:112k@0x2f20000(boot),1762k@0x2f20000(cache),112k@0x9d40000(recovery)5494k@0xa680000(system)
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-unknown-eabi-4.7
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-v6k-eabi-4.8
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilt/linux-x86/toolchain/arm-eabi-4.9-sm
TARGET_GCC_VERSION_AND := 4.7-sm

BOARD_CHARGING_CMDLINE_NAME := "lge.reboot"
BOARD_CHARGING_CMDLINE_VALUE := "pwroff"
## Partition Sizes: Fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00440000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00600000
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x09E00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x10000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0c780000
BOARD_FLASH_BLOCK_SIZE := 0
TARGET_BOOTLOADER_BOARD_NAME := thunderc
TARGET_OTA_ASSERT_DEVICE := thunderc,LS670,VM670,thunderc_LS670,thunderc_VM670
TARGET_RECOVERY_FSTAB := device/lge/thunderc/fstab.thunderc
TARGET_OTA_NO_SEPERATE_RECOVERY := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/thunderc/bluetooth

BOARD_HAS_LOW_RESOLUTION := true
## RIL
BOARD_CDMA_NETWORK := true

## OTA script extras file (build/tools/releasetools)
TARGET_OTA_EXTRAS_FILE := device/lge/thunderc/releasetools/extras.txt
TARGET_OTA_TRASH_FILE := device/lge/thunderc/releasetools/trash.txt

#TARGET_RECOVERY_FSTAB := device/lge/thunderc/recovery.fstab
#BOARD_HAS_NO_SELECT_BUTTON := true
#TARGET_NO_BOOTLOADER := true
#BOARD_USES_RECOVERY_CHARGEMODE := false
#TARGET_RECOVERY_INITRC := device/lge/thunderc/init.recovery.rc
#twrp
DEVICE_RESOLUTION := 320x480
RECOVERY_GRAPHICS_USE_LINELENGTH := true
HAVE_SELINUX := true
TW_NO_REBOOT_BOOTLOADER := false
TW_CUSTOM_POWER_BUTTON := 107
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
SMALLER_FONT_FOOTPRINT := true
TW_NO_SCREEN_TIMEOUT := true
#LOCAL_CFLAGS += -DTW_NO_REBOOT_BOOTLOADER


TARGET_EXTRA_CFLAGS += $(call cc-option,-mcpu=arm1136jzf-s) $(call cc-option,-mfpu=vfp) $(call cc-option,-mfloat-abi=softfp)
AUDIO_OUTPUT_FLAG_FAST := 44100

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
