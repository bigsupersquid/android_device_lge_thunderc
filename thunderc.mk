CM_BUILDTYPE := EXPERIMENTAL
CM_EXTRAVERSION := os2sd_bigsuperROM

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/default.prop:root/default.prop

# thunderc configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thunder_keypad.kl:system/usr/keylayout/thunder_keypad.kl \
    $(LOCAL_PATH)/configs/thunder_keypad.kcm.bin:system/usr/keychars/thunder_keypad.kcm.bin \
   	$(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
	$(LOCAL_PATH)/configs/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/configs/touch_mcs6000.idc:system/usr/idc/touch_mcs6000.idc \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
    
# thunderc init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.thunderc.rc:root/init.thunderc.rc \
    $(LOCAL_PATH)/ueventd.thunderc.rc:root/ueventd.thunderc.rc \
    $(LOCAL_PATH)/fstab.thunderc:root/fstab.thunderc 

# wallpapers and screensavers
PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml
PRODUCT_PACKAGES += \
Apollo \
SpeechRecorder \
VoicePlus \
PhotoTable \
WebView \
Basic \
Galaxy4 \
HoloSpiral \
MagicSmoke \
MusicVisualization \
NoiseField \
PhaseBeam \
LiveWallpapers \
LiveWallpapersPicker \
VisualizationWallpapers \
librs_jni
#dex2oat \
#core-libart \
#libart

# Camera
#PRODUCT_PACKAGES += \
#	libcamera \
#    camera.msm7x27

# input
PRODUCT_PACKAGES += \
PCKeyboard \
libjni_pckeyboard

# more stuff
PRODUCT_PACKAGES += \
Launcher3 

PRODUCT_PACKAGES += \
init.qcom.rc \
init.qcom.sh \
init.qcom.post_boot.sh

# dual-mode recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/twrp_sd.fstab:recovery/root/fstab.thunderc \
    $(LOCAL_PATH)/recovery/twrp_sd.fstab:recovery/root/etc/twrp_sd.fstab \
    $(LOCAL_PATH)/recovery/twrp_sd.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/recovery/twrp_int.fstab:recovery/root/etc/twrp_int.fstab

# Overrides
PRODUCT_NAME := thunderc
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LG-VM670
PRODUCT_MANUFACTURER := LGE

#all audio
#$(call inherit-product, frameworks/base/data/sounds/AllAudio.mk)

# Common assets 
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi

#this is the USA not europe
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf
PRODUCT_LOCALES := en_US

#sysctl tweaks
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/sysctl.conf:system/etc/sysctl.conf

# P500 bluetooth vendor configuration 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf
	
#P500_SPEAKER_IN_CALL_FIX 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

#emoji fonts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/fonts/AndroidEmoji.ttf:system/fonts/AndroidEmoji.ttf \
    $(LOCAL_PATH)/prebuilt/fonts/NotoColorEmoji.ttf:system/fonts/NotoColorEmoji.ttf
    
#codecs
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml

#override apns-conf
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml

#override init.qcom.rc for mounting fs in init.thunderc.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/rootdir/etc/init.qcom.rc:root/init.qcom.rc

# thunderc overlays (Most specific last)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

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
    com.qc.hdmi_out=false \
    debug.sf.hw=1 \
    debug.composition.type=mdp \
    persist.sys.purgeable_assets=1 \
    persist.usb.serialno=0123456789ABCDEF

PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.checkjni=false \
	dalvik.vm.dexopt-data-only=0 \
	dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=36m \
    dalvik.vm.heapsize=64m \
    dalvik.vm.heaptargetutilization=0.25 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m \
    dalvik.vm.dexopt-data-only=0 \
    dalvik.vm.verify-bytecode=false \
    dalvik.vm.stack-trace-file=/data/anr/traces.txt \
    dalvik.vm.jmiopts=forcecopy \
    dalvik.vm.execution-mode=int:jit
    
PRODUCT_PROPERTY_OVERRIDES += ro.config.low_ram=true
# Inherit products (Most specific first)
$(call inherit-product, vendor/lge/thunderc/thunderc-vendor.mk) 
$(call inherit-product, device/lge/msm7x27-common/device.mk)
$(call inherit-product, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)
$(call inherit-product, device/mdpi-common/mdpi.mk)
#$(call inherit-product, vendor/cm/config/common_full_phone.mk)
