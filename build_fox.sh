#!/bin/bash

# what device are we building for?
TARGET_DEVICE="breeze"

# Apply some crazy patches xD
cd bootable/recovery
patch -p1<../../device/umidigi/A5_Pro/patches/android_bootable_recovery.patch
cd ../..

# configure some default settings for the build
Default_Settings() {
  	export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
	export ALLOW_MISSING_DEPENDENCIES=true
	export TARGET_ARCH="arm64"
	export TW_DEFAULT_LANGUAGE="en"
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"
	export LC_ALL="C"
	export USE_CCACHE="1"
  	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
	export OF_DONT_PATCH_ENCRYPTED_DEVICE="1"
	export OF_OTA_RES_DECRYPT="1"
	export FOX_REPLACE_BUSYBOX_PS="1"
	export FOX_USE_BASH_SHELL="1"
	export FOX_USE_NANO_EDITOR="1"
  	export OF_STATUS_INDENT_LEFT="48"
  	export OF_STATUS_INDENT_RIGHT="48"
  	export OF_SCREEN_H="2280"

#       export OF_DONT_PATCH_ON_FRESH_INSTALLATION="1"
#      	export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
#       export FOX_USE_LZMA_COMPRESSION="1"
#       export FOX_DELETE_AROMAFM="1"
#       export OF_SUPPORT_PRE_FLASH_SCRIPT="1"
#       export OF_AB_DEVICE="1"
#       export OF_DISABLE_MIUI_SPECIFIC_FEATURES="1"

  	# lzma
  	[ "$FOX_USE_LZMA_COMPRESSION" = "1" ] && export LZMA_RAMDISK_TARGETS="recovery"

  	# A/B devices
  	[ "$OF_AB_DEVICE" = "1" ] && export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"

  	# magiskboot
  	[ "$OF_USE_MAGISKBOOT_FOR_ALL_PATCHES" = "1" ] && export OF_USE_MAGISKBOOT="1"
}

# build the project
do_build() {
  Default_Settings
  
  # use ccache ??
  [ "$USE_CCACHE" = "1" ] && ccache -M 20G

  # compile it
  . build/envsetup.sh
  
  lunch omni_"$TARGET_DEVICE"-eng
  
  mka recoveryimage
}


# --- main --- #
do_build
#
