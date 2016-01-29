LOCAL_PATH := $(call my-dir)

#Libs with missing symbols: libnvwinsys.so libnvwinsys.so libnvcap.so libnvcpud.so
#libnvomxadaptor.so vendor/libwvm.so liblgdrm.so libril.ro lge-ril.so

#RIL
include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_SRC_FILES := libx3_ril.c
LOCAL_MODULE := libx3_ril
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

#Misc media c++
include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES := libbinder libstagefright libui libgui libutils
LOCAL_SRC_FILES := libx3_misc_cpp.cpp
LOCAL_MODULE := libx3_misc_cpp
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

#Camera
include $(CLEAR_VARS)

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_SRC_FILES := gui/SensorManager.cpp

LOCAL_SHARED_LIBRARIES := \
    libbinder libcutils libgui libhardware liblog libsync libui libutils

LOCAL_MODULE := libx3_cam
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
