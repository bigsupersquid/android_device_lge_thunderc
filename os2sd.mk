CM_EXTRAVERSION := os2sd_bigsuperROM
$(call inherit-product, device/lge/thunderc/cm.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# thunderc init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.thunderc_sd.rc:root/init.thunderc.rc \
    $(LOCAL_PATH)/fstab.thunderc_sd:root/fstab.thunderc 

# wallpapers and screensavers
PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml
PRODUCT_PACKAGES += \
    Basic \
    PhotoTable \
    WebView \
    CMWallpapers \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    Galaxy4 \
    HoloSpiral \
    MagicSmoke \
    MusicVisualization \
    NoiseField \
    PhaseBeam \
    librs_jni

# more stuff
PRODUCT_PACKAGES += \
Email 

# recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/fstab_sd:recovery/root/etc/fstab \
    $(LOCAL_PATH)/recovery/twrp_sd.fstab:recovery/root/etc/twrp.fstab
    $(LOCAL_PATH)/recovery_sd.fstab:$(LOCAL_PATH)/recovery.fstab
#all audio
$(call inherit-product, frameworks/base/data/sounds/AllAudio.mk)

#releasetools
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/extras.txt.sd:$(LOCAL_PATH)/releasetools/extras.txt
