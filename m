From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tip: timers/core] clocksource/drivers/timer-probe: Avoid
 creating dead devices
Date: Thu, 26 Mar 2020 04:21:38 +0300
Message-ID: <a34e69a2-9e55-b4a2-ed8f-06e315db612f@gmail.com>
References: <20200111052125.238212-1-saravanak@google.com>
 <158460766637.28353.11325960928759668587.tip-bot2@tip-bot2>
 <20200324175955.GA16972@arm.com>
 <e75ae529-264c-9aa6-f711-2afe28ceec36@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e75ae529-264c-9aa6-f711-2afe28ceec36-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ionela Voinescu <ionela.voinescu-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Saravana Kannan <saravanak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tip-commits-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, x86 <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, liviu.dudau-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

26.03.2020 00:29, Jon Hunter пишет:
> 
> On 24/03/2020 17:59, Ionela Voinescu wrote:
>> Hi guys,
>>
>> On Thursday 19 Mar 2020 at 08:47:46 (-0000), tip-bot2 for Saravana Kannan wrote:
>>> The following commit has been merged into the timers/core branch of tip:
>>>
>>> Conommit-ID:     4f41fe386a94639cd9a1831298d4f85db5662f1e
>>> Gitweb:        https://git.kernel.org/tip/4f41fe386a94639cd9a1831298d4f85db5662f1e
>>> Author:        Saravana Kannan <saravanak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>>> AuthorDate:    Fri, 10 Jan 2020 21:21:25 -08:00
>>> Committer:     Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> CommitterDate: Tue, 17 Mar 2020 13:10:07 +01:00
>>>
>>> clocksource/drivers/timer-probe: Avoid creating dead devices
>>>
>>> Timer initialization is done during early boot way before the driver
>>> core starts processing devices and drivers. Timers initialized during
>>> this early boot period don't really need or use a struct device.
>>>
>>> However, for timers represented as device tree nodes, the struct devices
>>> are still created and sit around unused and wasting memory. This change
>>> avoid this by marking the device tree nodes as "populated" if the
>>> corresponding timer is successfully initialized.
>>>
>>> Signed-off-by: Saravana Kannan <saravanak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Link: https://lore.kernel.org/r/20200111052125.238212-1-saravanak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
>>> ---
>>>  drivers/clocksource/timer-probe.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/clocksource/timer-probe.c b/drivers/clocksource/timer-probe.c
>>> index ee9574d..a10f28d 100644
>>> --- a/drivers/clocksource/timer-probe.c
>>> +++ b/drivers/clocksource/timer-probe.c
>>> @@ -27,8 +27,10 @@ void __init timer_probe(void)
>>>  
>>>  		init_func_ret = match->data;
>>>  
>>> +		of_node_set_flag(np, OF_POPULATED);
>>>  		ret = init_func_ret(np);
>>>  		if (ret) {
>>> +			of_node_clear_flag(np, OF_POPULATED);
>>>  			if (ret != -EPROBE_DEFER)
>>>  				pr_err("Failed to initialize '%pOF': %d\n", np,
>>>  				       ret);
>>>
>>
>> This patch is creating problems on some vexpress platforms - ones that
>> are using CLKSRC_VERSATILE (drivers/clocksource/timer-versatile.c).
>> I noticed issues on TC2 and FVPs (fixed virtual platforms) starting with
>> next-20200318 and still reproducible with next-20200323.
> 
> I am also seeing a regression on tegra30-cardhu-a04 when testing system
> suspend on -next. Bisect is pointing to this commit and reverting on top
> of -next fixes the problem. Unfortunately, there is no crash dump
> observed, but the device hangs somewhere when testing suspend.
> 
> I have not looked into this any further but wanted to report the problem.

IIUC, this should also break the watchdog driver on Tegra because the
device tree node is shared by both clocksource and watchdog.
