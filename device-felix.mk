#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := felix
TARGET_KERNEL_DIR := device/google/$(TARGET_KERNEL_DEVICE)-kernels/$(TARGET_LINUX_KERNEL_VERSION)
TARGET_KERNEL_PLATFORM_SOURCE := google/gs-$(TARGET_LINUX_KERNEL_VERSION)

# Inherit from gs201
include device/google/gs201/device-shipping-common.mk

# Fold extensions
PRODUCT_SYSTEM_SERVER_JARS += \
    system_ext:felix-services

# Hinge angle sensor
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.hinge_angle.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hinge_angle.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    device/google/felix/overlay-lineage

PRODUCT_PACKAGES += \
    BiometricGs201Overlay \
    DMServiceOverlayProductGs201 \
    DMServiceOverlayVendorFelix \
    FrameworkResOverlayProductFelix \
    FrameworkResOverlayVendorFelix \
    HbmSVManagerOverlayProductFelix \
    LargeScreenConfigOverlay \
    LargeScreenSettingsProviderOverlay \
    PixelNfcOverlayFelix \
    PixelWifiOverlay2023_midyear_F10 \
    SafetyRegulatoryInfoOverlayProductFelix \
    SettingsGoogleOverlayFelix \
    SettingsGoogleOverlayProductFelix \
    SettingsGoogleOverlayVendorFelix \
    SettingsOverlayG0B96 \
    SettingsOverlayG9FPL \
    SfpsOverlayFelix \
    SfpsOverlayGs201 \
    SystemUIGoogleOverlayProductFelix \
    SystemUIGoogleOverlayVendorFelix \
    TeleServiceOverlayProductFelix

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.felix.rc

PRODUCT_PACKAGES += \
    init.recovery.felix.touch.rc

TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_RIGHT

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# UWB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.uwb.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.uwb.xml

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/device_framework_matrix_product.xml
