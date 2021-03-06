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
TARGET_KERNEL_CONFIG 				:= thunderc-enforcing_defconfig
#TARGET_KERNEL_CONFIG 				:= thunderc-permissive_defconfig
#TARGET_KERNEL_CONFIG 				:= thunderc-permissive-legacy_defconfig
BOARD_CHARGING_CMDLINE_NAME         := "lge.reboot"
BOARD_CHARGING_CMDLINE_VALUE        := "pwroff"
else
TARGET_KERNEL_CONFIG 				:= thunderc-recovery_defconfig
endif
# Recovery size
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 0x00600000
TARGET_RECOVERY_FSTAB 				:= device/lge/thunderc/recovery.fstab
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/thunderc/bluetooth
MINIGZIP 							:= $(shell which lzma)

## TLS register
#ARCH_ARM_HAVE_TLS_REGISTER			:=
## Partition Sizes: Fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE 		:= 0x00440000
#BOARD_SYSTEMIMAGE_PARTITION_SIZE	:= 0x09E00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE 	:= 0x20000000
BOARD_USERDATAIMAGE_PARTITION_SIZE 	:= 0x0c780000
BOARD_FLASH_BLOCK_SIZE 				:= 0

#mtdparts=msm_nand:112k@0x2f20000(boot),1762k@0x2f20000(cache),112k@0x9d40000(recovery)5494k@0xa680000(system)

## RIL
BOARD_CDMA_NETWORK 					:= true

#Art
#ART_USE_PORTABLE_COMPILER 			:= true
PRODUCT_RUNTIMES 					:= runtime_libdvm_default
#PRODUCT_RUNTIMES += runtime_libart
#WITH_ART_USE_PORTABLE_COMPILER 	:= true

## revert TEMPORARY HACK: skip building external/chromium_org/
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := 

#Normal kernel loading and ramdisk addresses
#0x12208000
#0x13200000
#cat /proc/iomem
#12200000-2d0fffff : System RAM
#  12237000-12912ddf : Kernel text
#  12914000-12b4059b : Kernel data

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_a
MR_INIT_DEVICES := device/lge/thunderc/mr_init_devices.c
MR_RD_ADDR := 0x13BF8000
MR_DPI := mdpi
MR_DPI_MUL := 0.25
MR_FSTAB := device/lge/thunderc/mrom.fstab
MR_USE_MROM_FSTAB := true
MR_KEXEC_MEM_MIN := 0x12c00000
#MR_INFOS := device/lge/thunderc/mrom_infos

#BOARD_WANTS_EMMC_BOOT := true

#TARGET_EXTRA_CFLAGS += $(call cc-option,-mcpu=arm1176jzf-s) $(call cc-option,-mfpu=vfp) $(call cc-option,-mfloat-abi=softfp)
TARGET_ARCH_VARIANT_CPU         := arm1176jzf-s

## ODEX ROM
WITH_DEXPREOPT := true

#COMMON_GLOBAL_CFLAGS += -DMAX_RES_720P -DUSE_OPENGL_RENDERER

#COMMON_GLOBAL_CFLAGS += -DMAX_RES_480P

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/lge/thunderc/sepolicy

BOARD_SEPOLICY_UNION += \
    ami304d.te \
    app.te \
    auditd.te \
    bluetooth.te \
    bootanim.te \
    device.te \
    domain.te \
    drmserver.te \
    file_contexts \
    file.te \
    hci_init.te \
    healthd.te \
    init.te \
    init_shell.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    netd.te \
    qmuxd.te \
    rild.te \
    su_daemon.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    untrusted_app.te \
    vold.te \
    wpa.te \
    wpa_socket.te
    
#TARGET_USES_QCOM_BSP := true
#COMMON_GLOBAL_CFLAGS += -DQCOM_BSP -DGRALLOC_USAGE_PRIVATE_INTERNAL_ONLY
