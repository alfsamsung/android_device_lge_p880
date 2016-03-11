# inherit from the proprietary version
-include vendor/lge/p880/BoardConfigVendor.mk

#Build variant; user,userdebug,eng
TARGET_BUILD_VARIANT := userdebug

#GCC
#TARGET_GCC_VERSION_EXP := 4.9-sm
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-5.3-ub/bin/

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true
DISABLE_DROIDDOC := true

# Remove some stupid logging
COMMON_GLOBAL_CFLAGS += -DSTOP_LOG_SPAM

# Build with Clang by default
USE_CLANG_PLATFORM_BUILD := true

TARGET_SPECIFIC_HEADER_PATH += device/lge/p880/include

# Board nameing
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := tegra
TARGET_BOOTLOADER_BOARD_NAME := x3

# Target arch settings
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := $(TARGET_CPU_VARIANT)
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINE := true
#ARCH_ARM_USE_NON_NEON_MEMCPY := true

# Images
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760 # 10M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760 # 10M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736 # 1.5GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13375635456 # 12.3GB
BOARD_CACHEIMAGE_PARTITION_SIZE := 422576128 # 403M
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
# Disable journaling on system.img to save space.
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Build the kernel
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive androidboot.hardware=x3 androidboot.bootdevice=sdhci-tegra.3
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := cyanogenmod_x3-light-MM_defconfig

ifeq ($(TARGET_BUILD_VARIANT),user)
COMMON_GLOBAL_CFLAGS += -DALLOW_LOCAL_PROP_OVERRIDE=1 -DALLOW_DISABLE_SELINUX=1 -DALLOW_ADBD_ROOT=1
WITH_DEXPREOPT := true
DONT_DEXPREOPT_PREBUILTS := true
WITH_DEXPREOPT_COMP := true
endif

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB = device/lge/p880/fstab.x3
RECOVERY_FSTAB_VERSION = 2
BOARD_CUSTOM_GRAPHICS := ../../../device/lge/p880/recovery-gfx.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/lge/p880/recovery-keys.c

# Egl
BOARD_EGL_CFG := device/lge/p880/egl.cfg
HWUI_COMPILE_FOR_PERF := true

# Wifi related defines
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/lge/p880/bluetooth/vnd_bt.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/p880/bluetooth

# Flags
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR0_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS
#COMMON_GLOBAL_CFLAGS += -DSK_SUPPORT_LEGACY_DECODEFILE

# Enable various build optimizations
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=32
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon-fp16 -mfp16-format=alternative \
          -mfloat-abi=softfp -mvectorize-with-neon-quad --param l1-cache-line-size=32 \
          --param l1-cache-size=32 --param l2-cache-size=1024
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon-fp16 -mfp16-format=alternative \
          -mfloat-abi=softfp -mvectorize-with-neon-quad --param l1-cache-line-size=32 \
          --param l1-cache-size=32 --param l2-cache-size=1024

# Kitkat
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_SKIP_FIRST_DEQUEUE := true
BOARD_EGL_NEEDS_FNW := true

# Lollipop
USE_LEGACY_AUDIO_POLICY := 1
BOARD_USES_LEGACY_MMAP := true
#libsymbols COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
TARGET_NEEDS_NON_PIE_SUPPORT := true
COMMON_GLOBAL_CFLAGS += -DTARGET_NEEDS_HWC_V0
COMMON_GLOBAL_CFLAGS += -DBOARD_CANT_REALLOCATE_OMX_BUFFERS

# Marshmallow
TARGET_NEEDS_TEXT_RELOCS_SUPPORT := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

## Radio fixes
BOARD_RIL_CLASS := ../../../device/lge/p880/ril/

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.x3

# Preload misc old symbols
TARGET_LDPRELOAD += /system/lib/libx3_misc_cpp.so

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Misc
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_BATTERY_DEVICE_NAME := battery

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

BOARD_SEPOLICY_DIRS += device/lge/p880/sepolicy

BOARD_HARDWARE_CLASS := device/lge/p880/cmhw/
