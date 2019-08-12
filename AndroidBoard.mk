LOCAL_PATH := $(call my-dir)

ifneq ($(filter a5_pro_e,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif