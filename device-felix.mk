#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_RIGHT

TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := felix
TARGET_KERNEL_DIR := device/google/$(TARGET_KERNEL_DEVICE)-kernels/$(TARGET_LINUX_KERNEL_VERSION)
TARGET_KERNEL_PLATFORM_SOURCE := google/gs-$(TARGET_LINUX_KERNEL_VERSION)

DEVICE_PACKAGE_OVERLAYS += device/google/felix/felix/overlay
DEVICE_PACKAGE_OVERLAYS += device/google/felix/overlay-lineage

include device/google/gs201/device-shipping-common.mk
include device/google/felix/vibrator/cs40l26/device.mk

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.prebuilt.xml \
    android.hardware.bluetooth_le.prebuilt.xml

DEVICE_MANIFEST_FILE += device/google/gs-common/bcmbt/manifest_bluetooth.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += device/google/gs-common/bcmbt/compatibility_matrix.xml

# Display
PRODUCT_PACKAGES += \
    dump_exynos_second_display

# Touch
PRODUCT_PACKAGES += \
    dump_touch.sh \
    predump_gti0.sh \
    predump_gti1.sh \
    predump_stm.sh \
    predump_touch.sh

PRODUCT_VENDOR_PROPERTIES += ro.vendor.touch.dump.sys=/sys/class/spi_master/spi6/spi6.0
PRODUCT_VENDOR_PROPERTIES += ro.vendor.touch.dump.proc=/proc/fts_ext/driver_test

# UWB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.uwb.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.uwb.xml

# Recovery files
PRODUCT_COPY_FILES += \
    device/google/felix/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.felix.rc

# Media Performance Class 13
PRODUCT_PROPERTY_OVERRIDES += ro.odm.build.media_performance_class=33

# Display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	vendor.display.lbe.supported=1 \
	vendor.display.async_off.supported=true \
	ro.surface_flinger.ignore_hdr_camera_layers=true

#config of display brightness dimming
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.0.brightness.dimming.usage=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.1.brightness.dimming.usage=2

# Early wake up sysfs path for the secondary display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	vendor.display.secondary_early_wakeup_node=/sys/devices/platform/1c241000.drmdecon/early_wakeup

# NFC
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml

PRODUCT_PACKAGES += \
	android.hardware.nfc-service.st \
	NfcOverlayFelix

# Shared Modem Platform
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += device/google/gs-common/modem/modem_svc_sit/compatibility_matrix.xml

# SecureElement
PRODUCT_PACKAGES += \
	android.hardware.secure_element@1.2-service-gto \
	android.hardware.secure_element@1.2-service-gto-ese2

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
	frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml

DEVICE_MANIFEST_FILE += \
	device/google/felix/nfc/manifest_se.xml

# Bluetooth HAL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.a2dp_offload.supported=true \
    persist.bluetooth.a2dp_offload.disabled=false \
    persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-ldac-opus

# Enable Bluetooth AutoOn feature
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.server.automatic_turn_on=true

# optimize spatializer effect
PRODUCT_PROPERTY_OVERRIDES += \
       audio.spatializer.effect.util_clamp_min=300

# declare use of spatial audio
PRODUCT_PROPERTY_OVERRIDES += \
       ro.audio.spatializer_enabled=true \
       ro.audio.spatializer_transaural_enabled_default=false \
       persist.vendor.audio.spatializer.speaker_enabled=true

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.a2dp_aac.vbr_supported=true

# default BDADDR for EVB only
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.bluetooth.evb_bdaddr="22:22:22:33:44:55"

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += \
    device/google/felix/powerstats/felix \
    device/google/felix

# Increment the SVN for any official public releases
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.build.svn=78

# Set device family property for SMR
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.device_family=F10

# Vibrator HAL
PRODUCT_VENDOR_PROPERTIES +=\
    ro.vendor.vibrator.hal.long.frequency.shift=0 \
    ro.vendor.vibrator.hal.gpio.num=44 \
    ro.vendor.vibrator.hal.gpio.shift=2 \
    persist.vendor.vibrator.hal.chirp.enabled=0

# Override Output Distortion Gain
PRODUCT_VENDOR_PROPERTIES += \
    vendor.audio.hapticgenerator.distortion.output.gain=0.52

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# The default value of this variable is false and should only be set to true when
# the device allows users to enable the seamless transfer feature.
PRODUCT_PRODUCT_PROPERTIES += \
   euicc.seamless_transfer_enabled_in_non_qs=true

# DCK properties based on target
PRODUCT_PROPERTY_OVERRIDES += \
    ro.gms.dck.eligible_wcc=3 \
    ro.gms.dck.se_capability=1

# Graphics
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.enable_frame_rate_override=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.set_idle_timer_ms_4619827677550801152=80
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.support_kernel_idle_timer_4619827677550801152=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.set_idle_timer_ms_4619827677550801153=1000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.support_kernel_idle_timer_4619827677550801153=false

# Set zram size
PRODUCT_VENDOR_PROPERTIES += \
    vendor.zram.size=3g

# SKU specific RROs
PRODUCT_PACKAGES += \
    SettingsOverlayG0B96 \
    SettingsOverlayG9FPL

# Set zram size
PRODUCT_VENDOR_PROPERTIES += \
       vendor.zram.size=3g

# Set support one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=false

# Hinge angle sensor
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.sensor.hinge_angle.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hinge_angle.xml

PRODUCT_PACKAGES += \
        UwbOverlayF10 \
        WifiOverlay2023Mid_F10

DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += device/google/felix/device_framework_matrix_product_felix.xml

# Device features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Increase thread priority for nodes stop
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.increase_thread_priority_nodes_stop=true

##Audio Vendor property
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.audio.cca.enabled=false

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.adjust_backend_min_freq_for_1p_front_video_1080p_30fps=1 \
    persist.vendor.camera.extended_launch_boost=1 \
    persist.vendor.camera.multicam_streaming_boost=1 \
    persist.vendor.camera.optimized_tnr_freq=1 \
    persist.vendor.camera.raise_buf_allocation_priority=1 \
    persist.vendor.camera.start_cpu_throttling_at_moderate_thermal=1 \
    camera.enable_landscape_to_portrait=true \
    persist.vendor.camera.debug.bypass_csi_link_error=true \
    vendor.camera.allow_sensor_binning_aspect_ratio_to_override_itp_output=false \
    vendor.camera.support_specific_stream_aspect_ratio=0.75

# Enable camera exif model/make reporting
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.exif_reveal_make_model=true

# Enable front camera always binning for 720P or smaller resolution
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.front_720P_always_binning=true

# Bluetooth OPUS codec
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.opus.enabled=true

# Bluetooth LE Audio
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bluetooth.leaudio_offload.supported=true \
    persist.bluetooth.leaudio_offload.disabled=false \
    ro.bluetooth.leaudio_switcher.supported=true \
    bluetooth.profile.bap.unicast.client.enabled=true \
    bluetooth.profile.csip.set_coordinator.enabled=true \
    bluetooth.profile.hap.client.enabled=true \
    bluetooth.profile.mcp.server.enabled=true \
    bluetooth.profile.ccp.server.enabled=true \
    bluetooth.profile.vcp.controller.enabled=true \

# Override BQR mask to enable LE Audio Choppy report
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.bqr.event_mask=295006 \
    persist.bluetooth.bqr.vnd_quality_mask=16 \
    persist.bluetooth.bqr.vnd_trace_mask=0 \
    persist.bluetooth.vendor.btsnoop=false

# Bluetooth LE Audio CIS handover to SCO
# Set the property only if the controller doesn't support CIS and SCO
# simultaneously. More details in b/242908683.
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.leaudio.notify.idle.during.call=true

# BT controller not able to support LE Audio dual mic SWB call
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.leaudio.dual_bidirection_swb.supported=false

# LE Audio Unicast Allowlist
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.leaudio.allow_list=SM-R510,WF-1000XM5,SM-R630

# Disable Bluetooth HAP by default
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.hap.enabled_by_default=false

# Disable Bluetooth LE Audio toggle for ASHA device
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.leaudio.toggle_visible_for_asha=false

# Enable DeviceAsWebcam support
PRODUCT_VENDOR_PROPERTIES += \
    ro.usb.uvc.enabled=true

# Quick Start device-specific settings
PRODUCT_PRODUCT_PROPERTIES += \
    ro.quick_start.oem_id=00e0 \
    ro.quick_start.device_id=felix

# Set support hide display cutout feature
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_hide_display_cutout=true

PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    AvoidAppsInCutoutOverlay

# Bluetooth device id
# Felix: 0x410C
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.device_id.product_id=16652

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

# Dumpstate
PRODUCT_PACKAGES += \
    dump_gsc.sh

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

PRODUCT_PACKAGES += \
    EuiccSupportPixelOverlay

# Fold extensions
PRODUCT_SYSTEM_SERVER_JARS += \
    system_ext:felix-services

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.sensors-V2-ndk.vendor:64

# HBM
PRODUCT_PACKAGES += \
    HbmSVManagerOverlayFelix

# Init
PRODUCT_PACKAGES += \
    init.recovery.felix.touch.rc

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Sensors
PRODUCT_PACKAGES += \
    sensors.dynamic_sensor_hal

# Wireless charging
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += device/google/gs-common/wireless_charger/compatibility_matrix.xml
