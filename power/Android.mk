ifneq ($(filter msm8226,$(TARGET_BOARD_PLATFORM)),)
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_POWERHAL_VARIANT),AOSP)

INCLUDE := device/qcom/common/power
QCOM_HAL := ../../../../$(INCLUDE)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_SHARED_LIBRARIES := liblog libcutils libdl
LOCAL_C_INCLUDES := $(INCLUDE)
LOCAL_SRC_FILES += \
	$(QCOM_HAL)/metadata-parser.c \
	$(QCOM_HAL)/utils.c \
	$(QCOM_HAL)/list.c \
	$(QCOM_HAL)/hint-data.c \
	$(QCOM_HAL)/power-8226.c \
	power.c

LOCAL_MODULE := power.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

endif # TARGET_POWERHAL_VARIANT == AOSP
endif
