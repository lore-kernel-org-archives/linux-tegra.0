From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V5 2/7] clocksource: tegra: add Tegra210 timer support
Date: Sat, 2 Feb 2019 07:53:46 +0800
Message-ID: <a24d9152-2bcd-7276-478c-63ee6923178e@nvidia.com>
References: <20190201033621.16814-1-josephl@nvidia.com>
 <20190201033621.16814-3-josephl@nvidia.com>
 <9370a0e4-2c76-6e9e-9219-121f92cdb14a@gmail.com>
 <46a1a62f-29b1-caac-ba68-e1394a76b3af@gmail.com>
 <85988378-0c88-6b71-00df-0700a7b4cdf7@nvidia.com>
 <4c89fd38-eacd-4643-52d3-da4760ecb4c5@nvidia.com>
 <57549882-4d0a-64ac-da04-7e790ac2d80e@gmail.com>
 <9437d5b5-5af0-9393-169c-2ebaf384c75c@nvidia.com>
 <705a0eff-cb1e-0e7d-add7-fb1a993291dc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <705a0eff-cb1e-0e7d-add7-fb1a993291dc@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 2/2/19 2:08 AM, Dmitry Osipenko wrote:
> 01.02.2019 18:37, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 2/1/19 11:13 PM, Dmitry Osipenko wrote:
>>> 01.02.2019 17:13, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 2/1/19 9:54 PM, Jon Hunter wrote:
>>>>>
>>>>> On 01/02/2019 13:11, Dmitry Osipenko wrote:
>>>>>> 01.02.2019 16:06, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> 01.02.2019 6:36, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>> Add support for the Tegra210 timer that runs at oscillator clock
>>>>>>>> (TMR10-TMR13). We need these timers to work as clock event device =
and to
>>>>>>>> replace the ARMv8 architected timer due to it can't survive across=
 the
>>>>>>>> power cycle of the CPU core or CPUPORESET signal. So it can't be a=
 wake-up
>>>>>>>> source when CPU suspends in power down state.
>>>>>>>>
>>>>>>>> Also convert the original driver to use timer-of API.
>>>>>>>>
>>>>>>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>>>>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>>>> ---
>> snip.
>>>>>>>> +}
>>>>>>>> +TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra21=
0_timer_init);
>>>>>>>> +#else /* CONFIG_ARM */
>>>>>>>> +static int __init tegra20_init_timer(struct device_node *np)
>>>>>>>> +{
>>>>>>> What about T132? Isn't it ARM64 which uses tegra20-timer IP? At lea=
st T132 DT suggests so and seems this change will break it.
>>>>>>>
>>>>>>> [snip]
>>>>>>>
>>>>>>
>>>>>> Ah, noticed the "depends on ARM" in Kconfig.. Seems okay then.
>>>>>>
>>>>>
>>>>>
>>>>> This is a good point, because even though we had 'depends on ARM', th=
is
>>>>> still means that the Tegra132 DT is incorrect.
>>>>>
>>>>> Joseph, can you take a quick look at Tegra132?
>>>>
>>>> Hi Jon and Dmitry,
>>>>
>>>> No worry about T132, T132 uses arch timer (v7). The tegra20 timer driv=
er has never been used. We should fix the dtsi file later.
>>>
>>> Hi Joseph,
>>>
>>> So is T132 HW actually incompatible with the tegra20-timer? If it's com=
patible, then I think the driver's code should be made more universal to su=
pport T132.
>>>
>>
>>  From HW point of view, the TIMER1 ~ TIMER4 is compatible with "nvidia,t=
egra20-timer". But Tegra132 actually has 10 timers which are exactly the sa=
me as Tegra30. So it should backward compatible with "nvidia,tegra30-timer"=
, which is tegra_wdt driver now. And Tegra132 should never use this driver.
>>
>> The Tegra timer driver should only be used on Tegra20/30/210, three plat=
forms only. Others use arch timer driver for system timer driver.
>>
>> So we don't really need to take care the usage on other Tegra platforms.
>=20
> Doesn't Linux kernel put in use all of available timers? If yes, then we =
probably would want to expose all available timers. It looks to me that rig=
ht now tegra20-timer exposes only a single-shared timer to the system [plea=
se correct me if I'm wrong]. Wouldn't make sense at least to give a timer p=
er CPU core?
>=20

No, only one timer driver works at a time. ( see /proc/timer_list to=20
check which timer is working.)

 > It looks to me that right now tegra20-timer exposes only a=20
single-shared timer to the system [please correct me if I'm wrong].=20
Wouldn't make sense at least to give a timer per CPU core?

Yes, it's correct. the timer-tegra20 only provides a single-shared=20
timer. And yes, ,it should provide a timer per CPU core. But that is=20
another task, this patch only introduce the timer support for Tegra210.=20
Others that originally from timer-tegra20 driver still remain the same.

Thanks,
Joseph
