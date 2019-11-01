LOCAL_PATH := $(call my-dir)

ifneq ($(filter A5_Pro,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
