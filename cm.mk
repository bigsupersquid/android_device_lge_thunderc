TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320
TARGET_BOOTANIMATION_HALF_RES := true
$(call inherit-product, vendor/cm/config/mini.mk)

# Inherit device configuration for thunderc.
$(call inherit-product, device/lge/thunderc/thunderc.mk)

# Overrides
PRODUCT_NAME := cm_thunderc
PRODUCT_CHARACTERISTICS := phone

# Release name and versioning
PRODUCT_RELEASE_NAME := VM670
PRODUCT_VERSION_DEVICE_SPECIFIC :=

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=lge_VM670 

