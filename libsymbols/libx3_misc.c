/* 
 * Copyright (C) 2015 The Android Open Source Project
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

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

//Needed by libnvwinsys.so LEGACY_SET_POSITION_SYMBOL //libgui
int _ZN7android14SurfaceControl11setPositionEff(float x, float y);
int _ZN7android14SurfaceControl11setPositionEii(int32_t x, int32_t y) {
    return _ZN7android14SurfaceControl11setPositionEff((float)x, (float)y);
}

//Needed by liblgdrm.so and libnvcpud.so getCallingUid() const //libbinder
//Note Lollipo uses int and MM uses pid_t and  uid_t
int _ZNK7android14IPCThreadState13getCallingUidEv();
int _ZN7android14IPCThreadState13getCallingUidEv() {
    return _ZNK7android14IPCThreadState13getCallingUidEv();
}

//Needed by libnvcpud.so: getCallingPid() //libbinder
int _ZNK7android14IPCThreadState13getCallingPidEv();
int _ZN7android14IPCThreadState13getCallingPidEv() {
    return _ZNK7android14IPCThreadState13getCallingPidEv();
}

//Needed by libnvwinsys.so  //libbinder
//LEGACY_MEMORY_DEALER_CONSTRUCTOR_SYMBOL
void _ZN7android12MemoryDealerC2EjPKcj(void* obj, size_t size, const char* name, uint32_t flags);
void _ZN7android12MemoryDealerC1EjPKc(void* obj, size_t size, const char* name) {
    _ZN7android12MemoryDealerC2EjPKcj(obj, size, name, 0);
}
