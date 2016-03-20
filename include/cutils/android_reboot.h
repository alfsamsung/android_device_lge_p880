/*
 * Copyright (c) 2016 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "../../../../../system/core/include/cutils/android_reboot.h"
#include <stdlib.h>

/* Inject code only in android_reboot.c */
#ifdef _SYS_REBOOT_H_
#ifdef _SYS_SYSCALL_H_
#ifdef _SYS_TYPES_H_
#ifdef _SYS_STAT_H_

int android_reboot2(int cmd, int flags, const char *arg);

int android_reboot(int cmd, int flags __attribute__((unused)), const char *arg)
{
    if (cmd == (int) ANDROID_RB_RESTART2 && arg && strlen(arg) > 0) {
        char cmd[PATH_MAX];
        sprintf(cmd, "/system/bin/setup-recovery" " %s", arg);
        system(cmd);
    }
    return android_reboot2(cmd, flags, arg);
}
#define android_reboot(cmd, flags, arg) android_reboot2(cmd, flags, arg)
#endif /* _SYS_STAT_H_ */
#endif /* _SYS_TYPES_H_ */
#endif /* _SYS_SYSCALL_H_ */
#endif /* _SYS_REBOOT_H_ */