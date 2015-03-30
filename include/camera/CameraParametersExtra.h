/*
 * Copyright (C) 2014 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define CAMERA_PARAMETERS_EXTRA_C \
const char CameraParameters::KEY_ISO_MODE[] = "iso"; \
const char CameraParameters::KEY_SUPPORTED_ISO_MODES[] = "iso-values"; \
const char CameraParameters::KEY_CAPTURE_MODE[] = "capture-mode"; \
const char CameraParameters::CAPTURE_MODE_NORMAL[] = "normal"; \
const char CameraParameters::CAPTURE_MODE_SHOT2SHOT[] = "shot2shot"; \
const char CameraParameters::KEY_SUPPORTED_CAPTURE_MODES[] = "capture-mode-values"; \
const char CameraParameters::KEY_SATURATION[] = "saturation"; \
const char CameraParameters::KEY_MINMAX_SATURATION[] = "saturation-minmax"; \
const char CameraParameters::ISO_AUTO[] = "auto"; \
const char CameraParameters::ISO_100[] = "ISO100"; \
const char CameraParameters::ISO_200[] = "ISO200"; \
const char CameraParameters::ISO_400[] = "ISO400"; \
const char CameraParameters::ISO_800[] = "ISO800"; \

#define CAMERA_PARAMETERS_EXTRA_H \
    static const char KEY_ISO_MODE[]; \
    static const char KEY_SUPPORTED_ISO_MODES[]; \
    static const char KEY_CAPTURE_MODE[]; \
    static const char CAPTURE_MODE_NORMAL[]; \
    static const char CAPTURE_MODE_SHOT2SHOT[]; \
    static const char KEY_SUPPORTED_CAPTURE_MODES[]; \
    static const char KEY_SATURATION[]; \
    static const char KEY_MINMAX_SATURATION[]; \
    static const char ISO_AUTO[]; \
    static const char ISO_100[]; \
    static const char ISO_200[] ; \
    static const char ISO_400[]; \
    static const char ISO_800[]; \
