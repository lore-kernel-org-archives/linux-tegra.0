From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V5 2/7] clocksource: tegra: add Tegra210 timer support
Date: Fri, 1 Feb 2019 23:49:17 +0800
Message-ID: <c33697d8-43a9-654b-503f-e60adbaf289f@nvidia.com>
References: <20190201033621.16814-1-josephl@nvidia.com>
 <20190201033621.16814-3-josephl@nvidia.com>
 <5490ad66-7d20-7093-7025-1d0ec8da6dec@nvidia.com>
 <3c9b86ba-32dd-76b2-9a51-6cd86782cadf@nvidia.com>
 <ab418999-a45c-bd9c-b9bd-5c382e86d26c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ab418999-a45c-bd9c-b9bd-5c382e86d26c@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 2/1/19 11:43 PM, Jon Hunter wrote:
> 
> 
> On 01/02/2019 14:39, Joseph Lo wrote:
>> On 2/1/19 8:44 PM, Jon Hunter wrote:
>>>
>>> On 01/02/2019 03:36, Joseph Lo wrote:
>>>> Add support for the Tegra210 timer that runs at oscillator clock
>>>> (TMR10-TMR13). We need these timers to work as clock event device and to
>>>> replace the ARMv8 architected timer due to it can't survive across the
>>>> power cycle of the CPU core or CPUPORESET signal. So it can't be a
>>>> wake-up
>>>> source when CPU suspends in power down state.
>>>>
>>>> Also convert the original driver to use timer-of API.
>>>
>>> It may have been nice to split this into 2 patches to make it easier to
>>> see what is going on but not a big deal.
>>>
>>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> ---
snip.
>>>
>> This can't get the timer base address. I think you mean ...
>>
>> +#ifdef CONFIG_ARM
>> +#define TIMER_CPU0 0x50 /* TIMER3 */
>> +#else
>> +#define TIMER_CPU0 0x90 /* TIMER10 */
>> +#endif
>> +#define TIMER_BASE_FOR_CPU(cpu) (TIMER_CPU0 + (cpu) * 8)
> 
> Ah I see.
> 
>> This doesn't need.
>> +#define TIMER_FOR_CPU(cpu) (TIMER_CPU0 + cpu)
> How come? Don't you still need to know the timer index for a given CPU?
> 

Doesn't need. TIMER_BASE_FOR_CPU is enough. Other use cases are well 
handled by timer-of API. :)

Thanks,
Joseph
