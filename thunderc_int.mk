# Inherit products (Most specific first)
$(call inherit-product, vendor/lge/thunderc/thunderc-vendor.mk) 
$(call inherit-product, device/lge/msm7x27-common/device.mk)
$(call inherit-product, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)
$(call inherit-product, vendor/cm/config/tiny.mk)
#$(call inherit-product, vendor/cm/config/mini.mk)
#$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, device/mdpi-common/mdpi.mk)


#PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/hostapd.conf:system/etc/wifi/hostapd.conf \
    $(LOCAL_PATH)/configs/default.prop:root/default.prop

# thunderc configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thunder_keypad.kl:system/usr/keylayout/thunder_keypad.kl \
    $(LOCAL_PATH)/configs/thunder_keypad.kcm.bin:system/usr/keychars/thunder_keypad.kcm.bin \
    $(LOCAL_PATH)/configs/touch_mcs6000.idc:system/usr/idc/touch_mcs6000.idc \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# thunderc init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.thunderc.rc:root/init.thunderc.rc \
    $(LOCAL_PATH)/ueventd.thunderc.rc:root/ueventd.thunderc.rc \
    $(LOCAL_PATH)/fstab.thunderc:root/fstab.thunderc 
#	$(LOCAL_PATH)/extra.fstab:recovery/root/etc/extra.fstab
	
# P500 bluetooth vendor configuration 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf
	
#P500_SPEAKER_IN_CALL_FIX 
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

#emoji fonts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/fonts/AndroidEmoji.ttf:system/fonts/AndroidEmoji.ttf \
    $(LOCAL_PATH)/prebuilt/fonts/NotoColorEmoji.ttf:system/fonts/NotoColorEmoji.ttf
    
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

# Camera
PRODUCT_PACKAGES += \
	libcamera \
    camera.msm7x27

# input
PRODUCT_PACKAGES += \
PCKeyboard \
libjni_pckeyboard

# more stuff
PRODUCT_PACKAGES += \
Email \
LockClock \
Launcher3 \
Trebuchet 

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

PRODUCT_PACKAGES += \
    VideoEditor \
    libvideoeditor_jni \
    libvideoeditor_core \
    libvideoeditor_osal \
    libvideoeditor_videofilters \
    libvideoeditorplayer

PRODUCT_PACKAGES += \
init.qcom.rc \
init.qcom.sh \
init.qcom.post_boot.sh

PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/default.prop:root/default.prop 
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/thunderc_keypad.kl:system/usr/keylayout/thunderc_keypad.kl 
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/thunderc_keypad.kcm.bin:system/usr/keychars/thunderc_keypad.kcm.bin 
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl 
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/Generic.kl:system/usr/keylayout/Generic.kl 

# Overrides
PRODUCT_NAME := thunderc
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LG-VM670
PRODUCT_MANUFACTURER := LGE

#all audio
$(call inherit-product, frameworks/base/data/sounds/AllAudio.mk)

# Common assets 
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi 

#these should build from Android.mk now
#override androidarmv6 init.qcom.rc that manually mounts internal partitions
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/init.qcom.rc:root/init.qcom.rc
#still uses this
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/init.qcom.sh:root/init.qcom.sh

#this is the USA not europe
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf
PRODUCT_LOCALES := en_US

#sysctl tweaks
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/sysctl.conf:system/etc/sysctl.conf

#override apns-conf
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml

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
        ro.secure=0 \
        ro.adb.secure=0 \
		ro.allow.mock.location=1 \
        ro.debuggable=1 \
        persist.service.adb.enable=1 \
        persist.sys.usb.config=mtp,adb \
        persist.sys.force_hw_ui=true \
        debug.composition.type=mdp \
        debug.egl.force_msaa=false 
        
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
    persist.service.adb.enable=1 

  # Development settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp,adb 
  
CM_EXTRAVERSION := -bigsuperROM-internal
