# Release name
PRODUCT_RELEASE_NAME := a5_pro

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := UMIDIGI
PRODUCT_DEVICE := a5_pro
PRODUCT_MANUFACTURER := UMIDIGI
PRODUCT_MODEL := a5_pro
PRODUCT_NAME := omni_a5_pro

# enable stock zip packages flash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.allow.mock.location=0
