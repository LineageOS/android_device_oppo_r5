#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FORCE_32_BIT := true

include device/oppo/msm8939-common/BoardConfigCommon.mk

DEVICE_PATH := device/oppo/r5

# Assert
TARGET_OTA_ASSERT_DEVICE := r5,R5,R8106,R8107

# Assertions
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
BOARD_GLOBAL_CFLAGS += -DCONFIG_OPPO_CAMERA_51

# Kernel
BOARD_DTBTOOL_ARGS := --force-v2
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset 0x02000000
TARGET_KERNEL_CONFIG := lineageos_r5_defconfig

# Keymaster
TARGET_KEYMASTER_SKIP_WAITING_FOR_QSEE := true

# Partition info
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1807745024
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13218315264 # 13218331648 - 16384

# Recovery
LZMA_RAMDISK_TARGETS := recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Shim
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/libmmcamera2_stats_modules.so|libshim_camera.so \
    /system/lib/hw/camera.vendor.msm8916.so|libshim_camera.so \
    /system/vendor/lib/libmmqjpeg_codec.so|libboringssl-compat.so

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 19

# Inherit from proprietary files
include vendor/oppo/r5/BoardConfigVendor.mk
