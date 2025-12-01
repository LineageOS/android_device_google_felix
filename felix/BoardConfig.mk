#
# SPDX-FileCopyrightText: 2020 The Android Open-Source Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_BOARD_INFO_FILE := device/google/felix/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := felix
TARGET_SCREEN_DENSITY := 420

BOARD_KERNEL_CMDLINE += swiotlb=noforce

# Enable load module in parallel
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true

# The modules which need to be loaded in sequential
BOARD_KERNEL_CMDLINE += fips140.load_sequential=1
BOARD_KERNEL_CMDLINE += exynos_drm.load_sequential=1
BOARD_KERNEL_CMDLINE += panel-samsung-ana6707-f10.load_sequential=1
BOARD_KERNEL_CMDLINE += s2mpg12-regulator.load_sequential=1

include device/google/gs201/BoardConfig-common.mk
include device/google/felix/sepolicy/felix-sepolicy.mk
include device/google/felix/wifi/BoardConfig-wifi.mk

DEVICE_PATH := device/google/felix
VENDOR_PATH := vendor/google/felix
include $(DEVICE_PATH)/$(TARGET_BOOTLOADER_BOARD_NAME)/BoardConfigLineage.mk
