From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 1/2] clocksource: tegra: Use rating when registering clock
 source
Date: Fri, 14 Jun 2019 20:00:09 +0300
Message-ID: <1e3bd8af-6341-f3c9-e3da-40cc4670134a@gmail.com>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
 <20190614132253.GE15526@ulmo>
 <3c339341-e77a-38aa-702a-1aef6c229eed@gmail.com>
 <20190614135353.GH15526@ulmo>
 <286cb0b7-1c8a-1a61-517e-1a9eee08e614@gmail.com>
 <fba9791a-8e73-398b-5851-689dc1d769f0@gmail.com>
 <20190614153712.GL15526@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614153712.GL15526@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.06.2019 18:37, Thierry Reding пишет:
> On Fri, Jun 14, 2019 at 05:06:48PM +0300, Dmitry Osipenko wrote:
>> 14.06.2019 17:02, Dmitry Osipenko пишет:
>>> 14.06.2019 16:53, Thierry Reding пишет:
>>>> On Fri, Jun 14, 2019 at 04:29:17PM +0300, Dmitry Osipenko wrote:
>>>>> 14.06.2019 16:22, Thierry Reding пишет:
>>>>>> On Fri, Jun 14, 2019 at 03:24:07PM +0300, Dmitry Osipenko wrote:
>>>>>>> 14.06.2019 13:47, Thierry Reding пишет:
>>>>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>>>>
>>>>>>>> The rating is parameterized depending on SoC generation to make sure it
>>>>>>>> takes precedence on implementations where the architected timer can't be
>>>>>>>> used. This rating is already used for the clock event device. Use the
>>>>>>>> same rating for the clock source to be consistent.
>>>>>>>>
>>>>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>>>>> ---
>>>>>>>>  drivers/clocksource/timer-tegra.c | 2 +-
>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
>>>>>>>> index f6a8eb0d7322..e6608141cccb 100644
>>>>>>>> --- a/drivers/clocksource/timer-tegra.c
>>>>>>>> +++ b/drivers/clocksource/timer-tegra.c
>>>>>>>> @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>>>>>>>>  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
>>>>>>>>  
>>>>>>>>  	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
>>>>>>>> -				    "timer_us", TIMER_1MHz, 300, 32,
>>>>>>>> +				    "timer_us", TIMER_1MHz, rating, 32,
>>>>>>>>  				    clocksource_mmio_readl_up);
>>>>>>>>  	if (ret)
>>>>>>>>  		pr_err("failed to register clocksource: %d\n", ret);
>>>>>>>>
>>>>>>>
>>>>>>> Looks good. Although, could you please clarify whether arch-timer stops on T210 when CPU
>>>>>>> enters deepest (powerdown) idle state? I'm starting to lose track a bit already. Because
>>>>>>> if arch-timer stops in the deepest idle state, then it's a bit odd that Joseph didn't add
>>>>>>> the clocksource for T210 in the first place and v5.1 probably shouldn't work well because
>>>>>>> of that already.
>>>>>>
>>>>>> Yes, the architected timer doesn't work across an SC7 (which is what the
>>>>>> deepest idle state is called on Tegra210) transition, hence why we can't
>>>>>> use it as a suspend clocksource. I actually sent out a patch to do that,
>>>>>> earlier.
>>>>>>
>>>>>> And yes, it's entirely possible that v5.1 doesn't work in this regard,
>>>>>> but we're not noticing that because we don't have suspend/resume support
>>>>>> for Tegra210 anyway. There are a couple of missing pieces that we need
>>>>>> in order to make it work.
>>>>>>
>>>>>> This change in particular is only going to affect the CPU idle state
>>>>>> (CC7). Since the architected timer doesn't survive that either, we need
>>>>>> the Tegra timer to be preferred over the architected timer for normal
>>>>>> operation.
>>>>>>
>>>>>> All of these issues go away on Tegra186 and later, where the architected
>>>>>> timer is in an always-on partition and has a PLL that remains on during
>>>>>> SC7 (and CC7).
>>>>>
>>>>> Thank you very much for the clarification. But then what about the
>>>>> sched_clock? I suppose sched_clock will suffer on T210 as well and it's
>>>>> a bit trickier case because apparently arch-timer always wins since it
>>>>> has a higher precision. I guess the best solution will be to just bail
>>>>> out from arch-timer's driver probe in a case of T210.
>>>>>
>>>>> if (of_machine_is_compatible("nvidia,tegra210"))
>>>>> 	return 0.
>>>>
>>>> I don't think there's any issue with the scheduler clock on Tegra210.
>>>> Before the CPU can be turned off, all tasks scheduled on that CPU have
>>>> to be migrated to another CPU, right? Conversely, before any tasks can
>>>> be scheduled on a CPU that CPU needs to be brought online, at which
>>>> point the architected timer should work fine again.
>>>
>>> Is SC7 a CPU-idle state that cpuidle driver may enter or it's a
>>> system-wide suspend state? It's still not clear to me.
>>>
>>
>> Ah, looks like I see now. So CC7 (CPU idle state) also affects the
>> arch-timer (like SC7) and hence scheduler clock will be stopped while it
>> shouldn't, which doesn't sound good.
> 
> We enable CC7 on Jetson TX1 and I've just verified on Jetson Nano that
> there are no issues if CC7 is enabled. From the boot log I can see that
> the architected timer is still used as scheduler clock.
> 
> So that either means that the scheduler doesn't mind if the clock is
> disabled when a CPU is asleep or it means that CC7 does not impact the
> architected timer. I thought we had already confirmed that the latter
> isn't true, i.e. that the architected timer is disabled during CC7, so
> that would mean that indeed the scheduler continues to work fine if the
> clock is off during sleep. I also don't understand why it would break,
> given that it's only put to sleep when there are no longer any tasks
> running on it.

CPU may enter idling state while task is sleeping, i.e. waiting for some event. To be
honest, I don't know much about how scheduling actually works in the kernel and what
are the actual purposes of scheduler clock. Maybe Daniel could clarify it all for us?
