# Inherit device configuration for thunderc.
$(call inherit-product, device/lge/thunderc/thunderc.mk)

TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320
$(call inherit-product, vendor/cm/config/mini.mk)

# Overrides
PRODUCT_NAME := cm_thunderc
PRODUCT_BRAND := lge
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LG-VM670
PRODUCT_MANUFACTURER := LGE
PRODUCT_CHARACTERISTICS := phone

# Release name and versioning
PRODUCT_RELEASE_NAME := VM670
PRODUCT_VERSION_DEVICE_SPECIFIC :=

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=lge_VM670 \
    BUILD_FINGERPRINT="lge/LS670/LS670:2.3.3/GRI40/LG-LS670-V20g.19C11F164C:user/release-keys" \
    PRIVATE_BUILD_DESC="thunderc-user 2.3.3 GRI40  LG-LS670-V20g.19C11F164C release-keys"

#override cm apns-conf
PRODUCT_COPY_FILES += device/lge/thunderc/prebuilt/common/etc/apns-conf.xml:/system/etc/apns-conf.xml
