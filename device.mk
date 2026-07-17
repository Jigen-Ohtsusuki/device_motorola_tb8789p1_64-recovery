#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 TeamWin Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/tb8789p1_64

# A/B support
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.0-service

# Virtual A/B support
PRODUCT_PACKAGES += \
    libsnapshot_nobinder

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Recovery init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6785.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6785.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt8789.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt8789.rc

# Copy stock fstabs for first-stage init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.emmc:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.emmc \
    $(LOCAL_PATH)/fstab.mt6785:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.mt6785 \
    $(LOCAL_PATH)/fstab.mt8789:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.mt8789

PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/dtb.img:dtb.img

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rebootsystem.sh:recovery/root/system/bin/rebootsystem.sh
