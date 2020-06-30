From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] cpuidle: tegra: Correctly handle result of
 arm_cpuidle_simple_enter()
Date: Tue, 30 Jun 2020 21:54:57 +0300
Message-ID: <4bae133b-1b51-281c-1759-ca0d259b18ca@gmail.com>
References: <20200629222625.674-1-digetx@gmail.com>
 <d9efb0f5-d6ab-f3db-540e-c6ae1b42e45e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d9efb0f5-d6ab-f3db-540e-c6ae1b42e45e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

30.06.2020 12:02, Jon Hunter пишет:
> 
> On 29/06/2020 23:26, Dmitry Osipenko wrote:
>> The arm_cpuidle_simple_enter() returns the entered idle-index and not a
>> error code. It happened that TEGRA_C1=index=err=0, and hence this typo
>> was difficult to notice in the code since everything happened to work
>> properly. This patch fixes the minor typo, it doesn't fix any problem.
> 
> I guess that is dependent on if CPUIDLE is enabled ...
> 
> #ifdef CONFIG_CPU_IDLE
> extern int arm_cpuidle_simple_enter(struct cpuidle_device *dev,
>                 struct cpuidle_driver *drv, int index);
> #else
> static inline int arm_cpuidle_simple_enter(struct cpuidle_device *dev,
>                  struct cpuidle_driver *drv, int index) { return -ENODEV; }
> #endif
> 
> Looks like it could return an error.

Hello Jon!

The cpuidle's enter() callback returns an index of the entered state on
success, on negative value on failure.

The negative number *could be* a proper error code, but in the same time
it also doesn't matter what's the exact negative value is for the
cpuidle's core code. Please see more below!

>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/cpuidle/cpuidle-tegra.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
>> index 150045849d78..9e9a9cccd755 100644
>> --- a/drivers/cpuidle/cpuidle-tegra.c
>> +++ b/drivers/cpuidle/cpuidle-tegra.c
>> @@ -236,14 +236,14 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
>>  			       int index)
>>  {
>>  	unsigned int cpu = cpu_logical_map(dev->cpu);
>> -	int err;
>> +	int err = 0;
>>  
>>  	index = tegra_cpuidle_adjust_state_index(index, cpu);
>>  	if (dev->states_usage[index].disable)
>>  		return -1;
>>  
>>  	if (index == TEGRA_C1)
>> -		err = arm_cpuidle_simple_enter(dev, drv, index);
>> +		index = arm_cpuidle_simple_enter(dev, drv, index);
>>  	else
>>  		err = tegra_cpuidle_state_enter(dev, index, cpu);
>>  
>>
> 
> However, I do think that there is something not right in the error handling
> here. Would also be nice to get rid of these -1.

IIRC, the -1 was borrowed from some other cpuidle driver, for example
cpuidle-psci[1] and coupled.c[2] are returning -1 on a failure.

[1]
https://elixir.bootlin.com/linux/v5.8-rc3/source/drivers/cpuidle/cpuidle-psci.c#L63
[2]
https://elixir.bootlin.com/linux/v5.8-rc3/source/drivers/cpuidle/coupled.c#L473

Looking at the the cpuidle's call chain, all of the code checks only
whether the returned value of the enter() is negative or not and in the
end that value is ignored [3][4].

[3]
https://elixir.bootlin.com/linux/v5.8-rc3/source/kernel/sched/idle.c#L216
[4]
https://elixir.bootlin.com/linux/v5.8-rc3/source/drivers/cpuidle/cpuidle.c#L360

Indeed, it would be better to return something more meaningful, but what
should we return for a disabled state if not -1?
