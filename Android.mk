
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), jasmine_sprout)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
