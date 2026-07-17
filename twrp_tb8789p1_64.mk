#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 TeamWin Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Inherit from tb8789p1_64 device
$(call inherit-product, device/motorola/tb8789p1_64/device.mk)

# Inherit TWRP common configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier
PRODUCT_DEVICE := tb8789p1_64
PRODUCT_NAME := twrp_tb8789p1_64
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := moto tab g70 LTE
PRODUCT_MANUFACTURER := Motorola
