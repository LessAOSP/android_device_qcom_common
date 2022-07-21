# Copyright (C) 2022 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Include QTI Bluetooth makefiles.
ifeq ($(TARGET_FWK_SUPPORTS_FULL_VALUEADDS),true)
$(call inherit-product, vendor/qcom/opensource/commonsys-intf/bluetooth/bt-system-opensource-product.mk)
endif

# Properties
ifneq ($(TARGET_USE_QTI_BT_STACK),false)
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.bluetooth.library_name=libbluetooth_qti.so
endif

# Packages
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth@1.0.vendor

# Get non-open-source specific aspects.
$(call inherit-product-if-exists, vendor/qcom/common/system/bt/bt-vendor.mk)
