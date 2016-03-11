# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
TARGET_BOOTANIMATION_HALF_RES := true

# Release name
PRODUCT_RELEASE_NAME := p880

# Inherit common product files.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/p880/p880.mk)

# CM Snap camera
PRODUCT_PACKAGES += Snap

# Extra tools in CM
PRODUCT_PACKAGES += \
    bash \
    bzip2 \
    curl \
    unrar \
    unzip \
    zip

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p880
PRODUCT_NAME := cm_p880
PRODUCT_BRAND := LG
PRODUCT_MODEL := Optimus 4X HD
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=x3 BUILD_FINGERPRINT=lge/x3_open_eu/x3:4.1.2/JZO54K/P88020c.20d4ae5fac:user/release-keys PRIVATE_BUILD_DESC="x3_open_eu-user 4.1.2 JZO54K P88020c.20d4ae5fac release-keys"
