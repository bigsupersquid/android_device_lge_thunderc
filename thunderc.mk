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
    $(LOCAL_PATH)/fstab.thunderc:root/fstab.thunderc \
#	$(LOCAL_PATH)/extra.fstab:recovery/root/etc/extra.fstab
	
# P500 bluetooth vendor configuration 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf
	
#P500_SPEAKER_IN_CALL_FIX 
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Live wallpapers
#PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

PRODUCT_PACKAGES += \
PCKeyboard \
libjni_pckeyboard

PRODUCT_COPY_FILES += device/lge/thunderc/configs/default.prop:root/default.prop 
PRODUCT_COPY_FILES += device/lge/thunderc/configs/thunderc_keypad.kl:system/usr/keylayout/thunderc_keypad.kl 
PRODUCT_COPY_FILES += device/lge/thunderc/configs/thunderc_keypad.kcm.bin:system/usr/keychars/thunderc_keypad.kcm.bin 
PRODUCT_COPY_FILES += device/lge/thunderc/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl 
PRODUCT_COPY_FILES += device/lge/thunderc/configs/Generic.kl:system/usr/keylayout/Generic.kl 

# Inherit products (Most specific first)
$(call inherit-product, vendor/lge/thunderc/thunderc-vendor.mk) 
$(call inherit-product, device/lge/msm7x27-common/device.mk)
$(call inherit-product, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)
# Inherit languages 
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

# Overrides
PRODUCT_NAME := thunderc
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LG-VM670
PRODUCT_MANUFACTURER := LGE

PRODUCT_AAPT_PREF_CONFIG := mdpi 
$(call inherit-product, device/mdpi-common/mdpi.mk)

#override androidarmv6 init.qcom.rc that manually mounts internal partitions
PRODUCT_COPY_FILES += device/lge/thunderc/rootdir/etc/init.qcom.rc:root/init.qcom.rc
#still uses this
PRODUCT_COPY_FILES += device/lge/thunderc/rootdir/etc/init.qcom.sh:root/init.qcom.sh

# thunderc overlays (Most specific last)
DEVICE_PACKAGE_OVERLAYS += device/lge/thunderc/overlay

CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490

DEFAULT_PROPERTY_OVERRIDES += \
        ro.secure=0 \
        ro.adb.secure=0 \
		ro.allow.mock.location=1 \
        ro.debuggable=1 \
        persist.service.adb.enable=1 \
        persist.sys.usb.config=mtp,adb
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cdma.home.operator.numeric=311490 \
    ro.com.google.clientidbase=android-sprint-us \
    ro.cdma.home.operator.alpha=Virgin_Mobile \
    gsm.sim.operator.alpha = Virgin_Mobile \
    gsm.sim.operator.numeric = 311490 \
    gsm.sim.operator.iso-country = us \
    gsm.operator.alpha = Virgin_Mobile \
    gsm.operator.numeric = 311490 \
    gsm.operator.iso-country = us


