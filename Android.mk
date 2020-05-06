LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_ANDROID_LIBRARIES := \
    android-support-v4 \
    android-support-v13

LOCAL_STATIC_JAVA_LIBRARIES := \
    xmp_toolkit \
    mp4parser

LOCAL_SRC_FILES := \
    $(call all-java-files-under, src) \
    $(call all-renderscript-files-under, src)

LOCAL_RESOURCE_DIR += $(LOCAL_PATH)/res

LOCAL_AAPT_FLAGS := --auto-add-overlay

LOCAL_USE_AAPT2 := true

LOCAL_PACKAGE_NAME := Gallery2

LOCAL_CERTIFICATE := shared

LOCAL_OVERRIDES_PACKAGES := Gallery Gallery3D GalleryNew3D

LOCAL_SDK_VERSION := current
LOCAL_MIN_SDK_VERSION := 24

LOCAL_JNI_SHARED_LIBRARIES := \
    libjni_eglfence \
    libjni_filtershow_filters \
    libjni_jpegstream
LOCAL_MULTILIB := both

LOCAL_PROGUARD_ENABLED := disabled

LOCAL_JAVA_LIBRARIES := org.apache.http.legacy

LOCAL_REQUIRED_MODULES += privapp_whitelist_com.android.gallery3d.xml

include $(BUILD_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE := privapp_whitelist_com.android.gallery3d.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/permissions
LOCAL_PRODUCT_MODULE := true
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

ifeq ($(strip $(LOCAL_PACKAGE_OVERRIDES)),)

include $(call all-makefiles-under, $(LOCAL_PATH))

endif
