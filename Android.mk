# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


LOCAL_PATH := $(call my-dir)
TARGET_ARCH_ABI := $(APP_ABI)

rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

# Creating prebuilt for dependency: modloader - version: 1.1.0
include $(CLEAR_VARS)
LOCAL_MODULE := modloader
LOCAL_EXPORT_C_INCLUDES := extern/modloader
LOCAL_SRC_FILES := extern/libmodloader.so
include $(PREBUILT_SHARED_LIBRARY)
# Creating prebuilt for dependency: beatsaber-hook - version: 2.0.3
include $(CLEAR_VARS)
LOCAL_MODULE := beatsaber-hook_2_0_3
LOCAL_EXPORT_C_INCLUDES := extern/beatsaber-hook
LOCAL_SRC_FILES := extern/libbeatsaber-hook_1_3_5.so
LOCAL_CPP_FEATURES += exceptions
include $(PREBUILT_SHARED_LIBRARY)
# Creating prebuilt for dependency: monkecodegen - version: 0.6.0
include $(CLEAR_VARS)
LOCAL_MODULE := monkecodegen_0_6_0
LOCAL_EXPORT_C_INCLUDES := extern/monkecodegen/include
LOCAL_SRC_FILES := extern/libmonkecodegen_0_6_0.so
include $(PREBUILT_SHARED_LIBRARY)
# Creating prebuilt for dependency: monkecomputer - version: 1.5.2
include $(CLEAR_VARS)
LOCAL_MODULE := monkecomputer
LOCAL_EXPORT_C_INCLUDES := extern/monkecomputer
LOCAL_SRC_FILES := extern/libmonkecomputer.so
include $(PREBUILT_SHARED_LIBRARY)
# Creating prebuilt for dependency: custom-types - version: 0.8.3
include $(CLEAR_VARS)
LOCAL_MODULE := custom-types
LOCAL_EXPORT_C_INCLUDES := extern/custom-types
LOCAL_SRC_FILES := extern/libcustom-types.so
include $(PREBUILT_SHARED_LIBRARY)
# Creating prebuilt for dependency: quest-cosmetic-loader - version: 0.1.4
include $(CLEAR_VARS)
LOCAL_MODULE := quest-cosmetic-loader_0_1_4
LOCAL_EXPORT_C_INCLUDES := extern/quest-cosmetic-loader
LOCAL_SRC_FILES := extern/libquest-cosmetic-loader_0_1_4.so
include $(PREBUILT_SHARED_LIBRARY)
# Creating prebuilt for dependency: zip - version: 1.7.4
include $(CLEAR_VARS)
LOCAL_MODULE := zip
LOCAL_EXPORT_C_INCLUDES := extern/zip
LOCAL_SRC_FILES := extern/libzip.so
include $(PREBUILT_SHARED_LIBRARY)
# Creating prebuilt for dependency: gorilla-utils - version: 0.1.5
include $(CLEAR_VARS)
LOCAL_MODULE := gorilla-utils
LOCAL_EXPORT_C_INCLUDES := extern/gorilla-utils
LOCAL_SRC_FILES := extern/libgorilla-utils.so
include $(PREBUILT_SHARED_LIBRARY)
# Creating prebuilt for dependency: libcurl - version: 7.76.0

include $(CLEAR_VARS)
LOCAL_MODULE := gorillafriends
LOCAL_SRC_FILES += $(call rwildcard,src/,*.cpp)
LOCAL_SRC_FILES += $(call rwildcard,extern/beatsaber-hook/src/inline-hook,*.cpp)
LOCAL_SRC_FILES += $(call rwildcard,extern/beatsaber-hook/src/inline-hook,*.c)
LOCAL_SHARED_LIBRARIES += modloader
LOCAL_SHARED_LIBRARIES += beatsaber-hook_2_0_3
LOCAL_SHARED_LIBRARIES += monkecodegen_0_6_0
LOCAL_SHARED_LIBRARIES += monkecomputer
LOCAL_SHARED_LIBRARIES += custom-types
LOCAL_SHARED_LIBRARIES += quest-cosmetic-loader_0_1_4
LOCAL_SHARED_LIBRARIES += zip
LOCAL_SHARED_LIBRARIES += gorilla-utils
LOCAL_LDLIBS += -llog
LOCAL_CFLAGS += -I'extern/libil2cpp/il2cpp/libil2cpp' -DID='"gorillafriends"' -DVERSION='"0.1.0"' -I'./shared' -I'./extern' -isystem'extern/codegen/include'
LOCAL_CPPFLAGS += -std=c++2a
LOCAL_C_INCLUDES += ./include ./src
include $(BUILD_SHARED_LIBRARY)
