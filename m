From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] soc/tegra: pmc: Query PCLK clock rate at probe time
Date: Thu, 18 Jul 2019 21:12:10 +0300
Message-ID: <040ce6d7-5c97-6112-4b9e-a320d12fcdca@gmail.com>
References: <20190707230843.11224-1-digetx@gmail.com>
 <c9bd6dd3-7a03-6e2c-db9f-fefa059a428f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c9bd6dd3-7a03-6e2c-db9f-fefa059a428f@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.07.2019 12:45, Jon Hunter пишет:
> 
> On 08/07/2019 00:08, Dmitry Osipenko wrote:
>> The PCLK clock is running off SCLK, which is a critical clock that is
>> very unlikely to randomly change its rate. It's also a bit clumsy (and
>> apparently incorrect) to query the clock's rate with interrupts being
>> disabled because clk_get_rate() takes a mutex and that's the case during
>> suspend/cpuidle entering. Lastly, it's better to always fully reprogram
>> PMC state because it's not obvious whether it could be changed after SC7.
> 
> I agree with the first part, but I would drop the last sentence because
> I see no evidence of this. Maybe Peter can confirm.

Okay.

>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/soc/tegra/pmc.c | 26 +++++++++++---------------
>>  1 file changed, 11 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index 9f9c1c677cf4..532e0ada012b 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -1433,6 +1433,7 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
>>  void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>  {
>>  	unsigned long long rate = 0;
>> +	u64 ticks;
>>  	u32 value;
>>  
>>  	switch (mode) {
>> @@ -1441,7 +1442,7 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>  		break;
>>  
>>  	case TEGRA_SUSPEND_LP2:
>> -		rate = clk_get_rate(pmc->clk);
>> +		rate = pmc->rate;
> 
> There is another call to clk_get_rate() that could be removed as well.

Indeed!

>>  		break;
>>  
>>  	default:
>> @@ -1451,26 +1452,20 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>  	if (WARN_ON_ONCE(rate == 0))
>>  		rate = 100000000;
>>  
>> -	if (rate != pmc->rate) {
>> -		u64 ticks;
>> -
>> -		ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
>> -		do_div(ticks, USEC_PER_SEC);
>> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
>> -
>> -		ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
>> -		do_div(ticks, USEC_PER_SEC);
>> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>> +	ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
>> +	do_div(ticks, USEC_PER_SEC);
>> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
> 
> You could go a step further and update the cpu_good_time/cpu_off_time to
> be ticks and calculated once during probe and recalculated if
> tegra_pmc_set_suspend_mode is called. I am not sure why we really need
> to pass mode to tegra_pmc_enter_suspend_mode() seeing as the mode is
> stored in the pmc struct.

The mode will differ depending on the idling mode. The system suspend
could be LP1, while CPUIDLE is LP2. Hence the mode need to be
reconfigured dynamically and thus the ticks.

>>  
>> -		wmb();
>> -
>> -		pmc->rate = rate;
>> -	}
>> +	ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
>> +	do_div(ticks, USEC_PER_SEC);
>> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>>  
>>  	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>  	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
>>  	value |= PMC_CNTRL_CPU_PWRREQ_OE;
>>  	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>> +
>> +	wmb();
>>  }
>>  #endif
>>  
>> @@ -2082,6 +2077,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>>  		pmc->clk = NULL;
>>  	}
>>  
>> +	pmc->rate = clk_get_rate(pmc->clk);
> 
> You should check the value returned is not 0 here.

Good point!
