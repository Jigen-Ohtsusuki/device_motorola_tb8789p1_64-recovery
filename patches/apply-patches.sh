#!/bin/bash

# Get the root directory of the TWRP source tree
ROOT_DIR=$(cd ../../../../ && pwd)
PATCH_DIR=$(pwd)

echo "Applying TWRP patches for motorola tb8789p1_64..."

cd ${ROOT_DIR}/system/vold
patch -p1 < ${PATCH_DIR}/0001-vold-bypass-installProvisioningKey-error.patch
echo "Applied system/vold patches"

cd ${ROOT_DIR}/bootable/recovery
patch -p1 < ${PATCH_DIR}/0002-bootable_recovery.patch
echo "Applied bootable/recovery patches"

cd ${ROOT_DIR}/system/tools/hidl
patch -p1 < ${PATCH_DIR}/0003-system_tools_hidl.patch
echo "Applied system/tools/hidl patches"

cd ${ROOT_DIR}/hardware/interfaces
patch -p1 < ${PATCH_DIR}/0004-hardware_interfaces.patch
echo "Applied hardware/interfaces patches"

cd ${ROOT_DIR}/system/core
patch -p1 < ${PATCH_DIR}/0005-system_core.patch
echo "Applied system/core patches"

echo "All patches applied successfully!"
