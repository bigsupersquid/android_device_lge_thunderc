PRODUCT_BOOT_JARS += qcmediaplayer

# thunderc specific configs
PRODUCT_COPY_FILES += \
   	$(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
	$(LOCAL_PATH)/configs/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/configs/default.prop:root/default.prop

# thunderc init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.thunderc.rc:root/init.thunderc.rc \
    $(LOCAL_PATH)/ueventd.thunderc.rc:root/ueventd.thunderc.rc \
    $(LOCAL_PATH)/fstab.thunderc:root/fstab.thunderc 

# Media
#PRODUCT_COPY_FILES += \
#frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
#frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
#frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml
# Media
PRODUCT_PROPERTY_OVERRIDES += \
lpa.decode=true \
qcom.hw.aac.encoder=true \
af.resampler.quality=255 \
persist.audio.lowlatency.rec=false

# art bits,currently disabled
#PRODUCT_PACKAGES += \
#dex2oat \
#core-libart \
#libart

PRODUCT_PACKAGES += \
init.qcom.sh 
#multirom \
#trampoline \
#multirom_zip \
#multirom_uninstaller
# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
debug.egl.hw=1 \
debug.sf.hw=1 \
debug.composition.type=dyn \
persist.hwc.mdpcomp.enable=true \
debug.mdpcomp.logs=0 \
debug.enabletr=0
# QCOM Display
PRODUCT_PACKAGES += \
libgenlock \
libmemalloc \
liboverlay \
libqdutils \
libtilerenderer

USE_OPENGL_RENDERER := true

# Omx
PRODUCT_PACKAGES += \
libdivxdrmdecrypt \
libmm-omxcore \
libOmxCore \
libstagefrighthw \
libOmxVdec \
libOmxVenc \
libOmxAacEnc \
libOmxAmrEnc \
libOmxEvrcEnc \
libOmxQcelp13Enc \
libdashplayer \
qcmediaplayer
#this is the USA not europe
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf
PRODUCT_LOCALES := en_US

#recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.thunderc:recovery/root/fstab.thunderc \
    $(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

#codecs
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
#    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml

# Overrides
PRODUCT_NAME := thunderc
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LG-VM670
PRODUCT_MANUFACTURER := LGE

#sysctl tweaks
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/sysctl.conf:system/etc/sysctl.conf

#fsck_f2fs
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/01fsck_f2fs:system/etc/init.d/01fsck_f2fs

#minfree and oom controls
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/59minfree:system/etc/init.d/59minfree

CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin Mobile
CDMA_CARRIER_NUMERIC := 311490
#data runs off gsm code, does it need these for decoding in the build?
GSM_GOOGLE_BASE := android-sprint-us
GSM_CARRIER_ALPHA := Virgin Mobile
GSM_CARRIER_NUMERIC := 311490

DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.force_hw_ui=true 
        
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cdma.home.operator.numeric=311490 \
    ro.com.google.clientidbase=android-sprint-us \
    gsm.sim.operator.numeric = 311490 \
    gsm.sim.operator.iso-country = us \
    gsm.operator.numeric = 311490 \
    gsm.operator.iso-country = us \
    persist.usb.serialno=0123456789ABCDEF \
    ro.serialno=0123456789ABCDEF

# thunderc overlays (Most specific last)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit products (Most specific first)
$(call inherit-product, vendor/lge/thunderc/thunderc-vendor.mk)
$(call inherit-product, device/lge/thunder-common/thunder-common.mk)
