# config.mk
#
# Product-specific compile-time definitions.
#

# The generic product target doesn't have any hardware-specific pieces.
#TARGET_NO_BOOTLOADER := true
#TARGET_NO_KERNEL := true
#TARGET_CPU_ABI := x86
#TARGET_ARCH := x86
#TARGET_ARCH_VARIANT := x86
TARGET_CPU_ABI := armeabi-v6a
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := arm
TARGET_PRELINK_MODULE := false

# spec gcc version
TARGET_GCC_VERSION_EXP := 4.5

# The IA emulator (qemu) uses the Goldfish devices
HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true

# no hardware camera
USE_CAMERA_STUB := true

# customize the malloced address to be 16-byte aligned
BOARD_MALLOC_ALIGNMENT := 16

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
WITH_DEXPREOPT := true
endif

# Build OpenGLES emulation host and guest libraries
BUILD_EMULATOR_OPENGL := true

# Build and enable the OpenGL ES View renderer. When running on the emulator,
# the GLES renderer disables itself if host GL acceleration isn't available.
USE_OPENGL_RENDERER := true

#TARGET_USERIMAGES_USE_EXT4 := true
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 576716800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true


# Board mini6410
TARGET_USERIMAGES_USE_UBIFS := true
#TARGET_USERIMAGES_USE_NFS := true
#TARGET_KERNEL_USE_UBOOT := true
TARGET_KERNEL_USE_UBIFS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 1*1024*1024
BOARD_KERNELIMAGE_PARTITION_SIZE := 8*1024*1024
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20*1024*1024
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 10*1024*1024
#BOARD_FLASH_CHIP_SIZE := 1024*1024*1024
BOARD_FLASH_BLOCK_SIZE := 128*1024
#BOARD_FLASH_LEB_SIZE := 126976
BOARD_NAND_PAGE_SIZE := 2048
#BOARD_NAND_SUBPAGE_SIZE := 512
#BOARD_NAND_SPARE_SIZE :=


# Prebuilt rootfs
#TARGET_IMAGE_FORCE_ONE := true
#TARGET_PREBUILT_ROOTFS_DIR := device/mini6410/rootfs_test
TARGET_PREBUILT_ROOTFS_DIR := device/mini6410/rootfs_rtm_6410
TARGET_PREBUILT_ROOTFS_FILE := device/mini6410/BoardConfig.mk

TARGET_NO_BOOTLOADER := false
TARGET_PREBUILT_BOOTLOADER := device/mini6410/u-boot-nand.bin

ifdef BOARD_NAND_SUBPAGE_SIZE
TARGET_PREBUILT_KERNEL := device/mini6410/uImage-ecc512
else
TARGET_PREBUILT_KERNEL := device/mini6410/uImage-ecc2048
endif

# TODO: kernel cmdline
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048

#BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=hammerhead user_debug=31 maxcpus=2 msm_watchdog_v2.enable=1
ifeq ($(TARGET_USERIMAGES_USE_NFS),true)
BOARD_KERNEL_CMDLINE := console=ttySAC0,115200 root=/dev/nfs nfsroot=192.168.1.104:/home/ubuntu/nfs/rootfs ip=192.168.1.230:192.168.1.104:192.168.1.1:255.255.255.0:linux.arm9.net:eth0:off
else
BOARD_KERNEL_CMDLINE := root=ubi0:system ubi.mtd=3 rootfstype=ubifs init=/linuxrc console=ttySAC0,115200 mtdparts="NAND 1GiB 3,3V 8-bit:512k(u-boot),512k(env),8M(kernel),64M(rootfs),-(reserved)"
endif

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02900000 --tags_offset 0x02700000
