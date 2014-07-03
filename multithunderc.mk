CM_BUILDTYPE := EXPERIMENTAL

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
    $(LOCAL_PATH)/ueventd.thunderc.rc:root/ueventd.thunderc.rc

# input
PRODUCT_PACKAGES += \
PCKeyboard \
libjni_pckeyboard

# more stuff
PRODUCT_PACKAGES += \
LockClock \
Launcher3 \
Trebuchet 

PRODUCT_PACKAGES += \
init.qcom.rc \
init.qcom.sh \
init.qcom.post_boot.sh
	
# Inherit products (Most specific first)
$(call inherit-product, vendor/lge/thunderc/thunderc-vendor.mk) 
$(call inherit-product, device/lge/msm7x27-common/device.mk)
$(call inherit-product, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)
$(call inherit-product, device/mdpi-common/mdpi.mk)

# Overrides
PRODUCT_NAME := thunderc
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LG-VM670
PRODUCT_MANUFACTURER := LGE

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
#    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
#    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml

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
