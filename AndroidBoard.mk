LOCAL_PATH := $(call my-dir)

ifneq ($(filter a5_breeze,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif