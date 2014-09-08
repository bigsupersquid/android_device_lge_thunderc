-include vendor/lge/thunderc/BoardConfigVendor.mk
-include device/lge/thunder-common/BoardConfig.mk

TARGET_BOOTLOADER_BOARD_NAME 		:= thunderc
TARGET_OTA_ASSERT_DEVICE 			:= thunderc,LS670,VM670,thunderc_LS670,thunderc_VM670
BOARD_KERNEL_CMDLINE 				:= mem=471M console=ttyMSM2,115200n8 androidboot.hardware=thunderc lge.rev=10
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
# Recovery size
TARGET_KERNEL_CONFIG 				:= thunderc-recovery_defconfig
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 0x00600000
endif
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

TARGET_RECOVERY_FSTAB 				:= device/lge/thunderc/recovery.fstab

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
