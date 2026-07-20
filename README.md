# TWRP Device Tree for Motorola Moto Tab G70 LTE (tb8789p1_64)

This is the TWRP (TeamWin Recovery Project) device tree for the Motorola Moto Tab G70 LTE.

## Device Specifications

| Feature | Specification |
| :--- | :--- |
| **Device** | Motorola Moto Tab G70 LTE |
| **Codename** | `tb8789p1_64` |
| **SoC** | MediaTek Helio G90T (MT8789 / MT6785) |
| **Release Date** | January 2022 |
| **Android Version** | Android 11 (Upgradable to 12) |

## Build Status

This is a fully functional build of TWRP for Android 12, featuring fully working Keystore2 FBE decryption. It uses LZMA ramdisk compression to fit hardware encryption services within the strict 32MB `boot` partition limit.

### What Works:
- [x] Booting TWRP
- [x] Touchscreen
- [x] Screen brightness settings
- [x] ADB & Fastbootd
- [x] MTP (Media Transfer Protocol) - Fixed FFS configfs coexistence
- [x] Decryption of `/data` (Android 12 Keystore2 FBE)
- [x] Flashing Zips & Magisk
- [x] Backup & Restore

### Known Issues:
- None identified at this time!

---

## Compilation Guide

### 1. Initialize the TWRP Workspace
First, create a workspace and synchronize the TWRP 12.1 (AOSP) source code:

```bash
mkdir twrp
cd twrp
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -j$(nproc --all) --force-sync
```

### 2. Clone the Device Tree
Clone this repository into the appropriate device directory:

```bash
git clone https://github.com/Jigen-Ohtsusuki/android_device_motorola_tb8789p1_64-recovery device/motorola/tb8789p1_64
```

### 3. Apply TWRP Source Patches
Because of MediaTek kernel quirks regarding `fscrypt-provisioning` and some Keystore2 dependencies, a few modifications to the TWRP source tree are required before building. 

To instantly apply all necessary fixes to your TWRP tree, run the provided patch script:

```bash
cd device/motorola/tb8789p1_64
bash patches/apply-patches.sh
cd ../../../
```

### 4. Build the Recovery Image
Set up the build environment, select the device target, and compile the `bootimage` (as this device uses `BOARD_USES_RECOVERY_AS_BOOT`):

```bash
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch twrp_tb8789p1_64-eng
mka bootimage
```

---

## Installation

Once the build is complete, you can find the compiled image at:  
`out/target/product/tb8789p1_64/boot.img`

To install the image, reboot your device to the bootloader/fastboot mode and flash it directly to the boot partition:

```bash
# Reboot to bootloader
adb reboot bootloader

# Flash the compiled image
fastboot flash boot out/target/product/tb8789p1_64/boot.img

# Reboot into TWRP
fastboot reboot recovery
```

---

## Kernel Source
The kernel (`Image.gz`) used in this tree is built from the Lenovo P11 Plus kernel source, which is being actively maintained for the Moto Tab G70. 

You can find the kernel source code here:
[android_kernel_motorola_mt6785](https://github.com/Jigen-Ohtsusuki/android_kernel_motorola_mt6785)
