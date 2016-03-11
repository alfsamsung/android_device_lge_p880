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

enum {
    PROFILE_POWER_SAVE = 0,
    PROFILE_BALANCED,
    PROFILE_HIGH_PERFORMANCE,
    PROFILE_BIAS_POWER_SAVE,
    PROFILE_BIAS_PERFORMANCE,
    PROFILE_MAX
};

typedef struct governor_settings {
    int is_interactive;
    int boost_freq; //620000kHZ
    int boost_time; //400msec
    int go_maxspeed_load;
    int go_maxspeed_load_off;
    int timer_rate;
    int timer_rate_off;
    int io_is_busy;
    int min_sample_time;
    int core_bias; //0-3, 0=default and lowest threads, 3=running threads disabled.
    int balance_level; //Cpu usage in %, 75
    int down_delay; //500msec
    int lm3533_bl_hvled; //0-2, 0=maks
    int sched_mc_power_savings; //0-2, 0=default and no saving
} power_profile;

static power_profile profiles[PROFILE_MAX] = {
    [PROFILE_POWER_SAVE] = {
        .boost_freq = 0,
        .boost_time = 0,
        .go_maxspeed_load = 99,
        .go_maxspeed_load_off = 110,
        .timer_rate = 45000,
        .timer_rate_off = 50000,
        .io_is_busy = 0,
        .min_sample_time = 20000,
        .core_bias = 2,
        .balance_level = 90,
        .down_delay = 300,
        .lm3533_bl_hvled = 1,
        .sched_mc_power_savings = 2,
    },
    [PROFILE_BIAS_POWER_SAVE] = {
        .boost_freq = 0,
        .boost_time = 0,
        .go_maxspeed_load = 98,
        .go_maxspeed_load_off = 110,
        .timer_rate = 45000,
        .timer_rate_off = 50000,
        .io_is_busy = 1,
        .min_sample_time = 30000,
        .core_bias = 2,
        .balance_level = 85,
        .down_delay = 400,
        .lm3533_bl_hvled = 2,
        .sched_mc_power_savings = 1,
    },
    [PROFILE_BALANCED] = {
        .boost_freq = 0,
        .boost_time = 0,
        .go_maxspeed_load = 96,
        .go_maxspeed_load_off = 110,
        .timer_rate = 40000,
        .timer_rate_off = 50000,
        .io_is_busy = 1,
        .min_sample_time = 40000,
        .core_bias = 1,
        .balance_level = 80,
        .down_delay = 500,
        .lm3533_bl_hvled = 0,
        .sched_mc_power_savings = 1,
    },
    [PROFILE_BIAS_PERFORMANCE] = {
        .boost_freq = 620000,
        .boost_time = 400,
        .go_maxspeed_load = 95,
        .go_maxspeed_load_off = 110,
        .timer_rate = 35000,
        .timer_rate_off = 50000,
        .io_is_busy = 1,
        .min_sample_time = 50000,
        .core_bias = 1,
        .balance_level = 80,
        .down_delay = 500,
        .lm3533_bl_hvled = 0,
        .sched_mc_power_savings = 1,
    },
    [PROFILE_HIGH_PERFORMANCE] = {
        .boost_freq = 760000,
        .boost_time = 500,
        .go_maxspeed_load = 94,
        .go_maxspeed_load_off = 110,
        .timer_rate = 30000,
        .timer_rate_off = 50000,
        .io_is_busy = 1,
        .min_sample_time = 60000,
        .core_bias = 0,
        .balance_level = 75,
        .down_delay = 500,
        .lm3533_bl_hvled = 0,
        .sched_mc_power_savings = 0,
    },
};
