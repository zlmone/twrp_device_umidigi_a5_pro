# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_RELEASE_NAME := Breeze
PRODUCT_BRAND := UMIDIGI
PRODUCT_DEVICE := A5_Pro
PRODUCT_MANUFACTURER := UMIDIGI
PRODUCT_MODEL := A5_Pro
PRODUCT_NAME := omni_A5_Pro

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="UMIDIGI/A5_Pro/A5_Pro:9/PPR1.180610.011/1559618636:user/release-keys" \
    PRIVATE_BUILD_DESC="A5_Pro-user 9 PPR1.180610.011 1559618636 release-keys"

# enable stock zip packages flash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    persist.sys.usb.config=mtp \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.allow.mock.location=0


