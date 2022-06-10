#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_KERNEL_DTBO_PREFIX := dts/
TARGET_KERNEL_DTBO := google/devices/felix/dtbo.img
TARGET_KERNEL_DTB := \
    google/devices/felix/google-base/gs201-a0.dtb \
    google/devices/felix/google-base/gs201-b0.dtb

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/felix/vendor_dlkm.modules.load))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOARD_VENDOR_KERNEL_RAMDISK_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/felix/vendor_kernel_boot.modules.load))
BOARD_VENDOR_KERNEL_RAMDISK_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_KERNEL_RAMDISK_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_KERNEL_RAMDISK_KERNEL_MODULES_LOAD)
