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

## Build Status (Initial Bring-up)

This is a lightweight, **decryption-less** initial build of TWRP. Due to strict size limitations on the `boot` partition (32MB limit) and kernel incompatibilities with LZMA compression, hardware encryption services (Keymaster/Gatekeeper) have been stripped from this tree. 

### What Works:
- [x] Booting TWRP
- [x] Touchscreen
- [x] Screen brightness settings
- [x] ADB & Fastbootd
- [x] MTP (Media Transfer Protocol)
- [x] Flashing (Magisk, no ROMs yet for this tab)
- [x] Backup & Restore (Unencrypted partitions)

### Known Issues / TO-DO:
- [ ] Decryption of `/data` (FBE/Keystore2 unsupported in this lightweight build)
- [ ] ADB Sideload (Requires testing)
- [ ] USB OTG (Requires testing)

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

### 3. Build the Recovery Image
Set up the build environment, select the device target, and compile the `bootimage` (as this device uses `BOARD_USES_RECOVERY_AS_BOOT`):

```bash
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch twrp_tb8789p1_64-eng
mka bootimage
```

---

## Installation & Testing

> [!WARNING]
> Because this is a decryption-less TWRP build, the `/data` partition cannot be decrypted. **If you plan to flash Magisk, you MUST Format Data (wipe) first.** Otherwise, TWRP will not be able to mount your internal storage properly.

Once the build is complete, you can find the compiled image at:  
`out/target/product/tb8789p1_64/boot.img`

To test the image, reboot your device to the bootloader/fastboot mode and flash it directly to the boot partition:

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
This device tree currently uses a **precompiled stock kernel**. 
If a custom kernel is built in the future with LZMA ramdisk decompression support, encryption services can be reintroduced into this tree.
