From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] soc/tegra: pmc: Query PCLK clock rate at probe time
Date: Thu, 18 Jul 2019 21:24:19 +0300
Message-ID: <d9b64f71-a91d-be34-1f36-28727c4beff6@gmail.com>
References: <20190707230843.11224-1-digetx@gmail.com>
 <c9bd6dd3-7a03-6e2c-db9f-fefa059a428f@nvidia.com>
 <aa12115c-bf1c-f50b-f38a-97fb398d1af0@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <aa12115c-bf1c-f50b-f38a-97fb398d1af0@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.07.2019 12:53, Jon Hunter пишет:
> 
> On 18/07/2019 10:45, Jon Hunter wrote:
>>
>> On 08/07/2019 00:08, Dmitry Osipenko wrote:
>>> The PCLK clock is running off SCLK, which is a critical clock that is
>>> very unlikely to randomly change its rate. It's also a bit clumsy (and
>>> apparently incorrect) to query the clock's rate with interrupts being
>>> disabled because clk_get_rate() takes a mutex and that's the case during
>>> suspend/cpuidle entering. Lastly, it's better to always fully reprogram
>>> PMC state because it's not obvious whether it could be changed after SC7.
>>
>> I agree with the first part, but I would drop the last sentence because
>> I see no evidence of this. Maybe Peter can confirm.
>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/soc/tegra/pmc.c | 26 +++++++++++---------------
>>>  1 file changed, 11 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>> index 9f9c1c677cf4..532e0ada012b 100644
>>> --- a/drivers/soc/tegra/pmc.c
>>> +++ b/drivers/soc/tegra/pmc.c
>>> @@ -1433,6 +1433,7 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
>>>  void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>>  {
>>>  	unsigned long long rate = 0;
>>> +	u64 ticks;
>>>  	u32 value;
>>>  
>>>  	switch (mode) {
>>> @@ -1441,7 +1442,7 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>>  		break;
>>>  
>>>  	case TEGRA_SUSPEND_LP2:
>>> -		rate = clk_get_rate(pmc->clk);
>>> +		rate = pmc->rate;
>>
>> There is another call to clk_get_rate() that could be removed as well.
>>
>>>  		break;
>>>  
>>>  	default:
>>> @@ -1451,26 +1452,20 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>>  	if (WARN_ON_ONCE(rate == 0))
>>>  		rate = 100000000;
>>>  
>>> -	if (rate != pmc->rate) {
>>> -		u64 ticks;
>>> -
>>> -		ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
>>> -		do_div(ticks, USEC_PER_SEC);
>>> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
>>> -
>>> -		ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
>>> -		do_div(ticks, USEC_PER_SEC);
>>> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>>> +	ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
>>> +	do_div(ticks, USEC_PER_SEC);
>>> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
>>
>> You could go a step further and update the cpu_good_time/cpu_off_time to
>> be ticks and calculated once during probe and recalculated if
>> tegra_pmc_set_suspend_mode is called. I am not sure why we really need
>> to pass mode to tegra_pmc_enter_suspend_mode() seeing as the mode is
>> stored in the pmc struct.
>>
>>>  
>>> -		wmb();
>>> -
>>> -		pmc->rate = rate;
>>> -	}
>>> +	ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
>>> +	do_div(ticks, USEC_PER_SEC);
>>> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>>>  
>>>  	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>>  	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
>>>  	value |= PMC_CNTRL_CPU_PWRREQ_OE;
>>>  	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>> +
>>> +	wmb();
> 
> I would not move the barrier unless there is a good reason. Maybe it is
> intentional that this happens before the other writes.

Looking at 'git blame', the barrier was copied by Thierry while he moved
PMC driver form mach-tegra/ to soc/. Originally the barrier appeared in
d552920a02759cdc45d8507868de10ac2f5b9a18 (ARM: tegra30: cpuidle: add
powered-down state for CPU0).

But really there is no good justification for that barrier at all
because PMC logic kicks-in when CPU enters power-gated state and at that
point all CPU accesses guaranteed to be finished no matter what, hence
this barrier just doesn't make much sense and can be removed safely.
I'll make a separate commit for that.
