#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_foldable_book_telephony.mk)

# Inherit device configuration
DEVICE_CODENAME := felix
DEVICE_PATH := device/google/felix
VENDOR_PATH := vendor/google/felix
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)
$(call inherit-product, device/google/gs201/lineage_common.mk)
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-lineage.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel Fold
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)

PRODUCT_SYSTEM_NAME := $(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2092
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME) \
    PRIVATE_BUILD_DESC="felix-user 14 AP2A.240905.003 12231197 release-keys"

BUILD_FINGERPRINT := google/felix/felix:14/AP2A.240905.003/12231197:user/release-keys

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
