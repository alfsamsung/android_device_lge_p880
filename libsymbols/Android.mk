LOCAL_PATH := $(call my-dir)

#Libs with missing symbols: Missing_symbols.txt

#RIL
include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_SRC_FILES := libx3_ril.c
LOCAL_MODULE := libx3_ril
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

#Misc media c++
include $(CLEAR_VARS)
LOCAL_CPPFLAGS += -Werror
LOCAL_SHARED_LIBRARIES := libbinder libgui libutils
LOCAL_SRC_FILES := libx3_misc_cpp.cpp
LOCAL_MODULE := libx3_misc_cpp
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

#Camera
include $(CLEAR_VARS)
LOCAL_CPPFLAGS += -Werror
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_SRC_FILES := gui/SensorManager.cpp libx3_mediabuffer.cpp

LOCAL_SHARED_LIBRARIES := \
    libbinder libcutils libgui libhardware liblog libsync libui libutils libstagefright

LOCAL_MODULE := libx3_cam
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
