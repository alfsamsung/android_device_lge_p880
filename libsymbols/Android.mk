LOCAL_PATH := $(call my-dir)

#Misc media c++
include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES := libbinder libui libgui libutils
LOCAL_SRC_FILES := libx3_misc_cpp.cpp
LOCAL_MODULE := libx3_misc_cpp
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
