CM_EXTRAVERSION := internal_bigsuperROM
$(call inherit-product, device/lge/thunderc/cm.mk)

# thunderc init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.thunderc_int.rc:root/init.thunderc.rc \
    $(LOCAL_PATH)/fstab.thunderc_int:root/fstab.thunderc 

# recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/fstab_int:recovery/root/etc/fstab \
    $(LOCAL_PATH)/recovery/twrp_int.fstab:recovery/root/etc/twrp.fstab
    $(LOCAL_PATH)/recovery_int.fstab:$(LOCAL_PATH)/recovery.fstab

#releasetools
    $(LOCAL_PATH)/releasetools/extras.txt.int:$(LOCAL_PATH)/releasetools/extras.txt
