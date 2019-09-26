From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 1/2] soc/tegra: pmc: Query PCLK clock rate at probe
 time
Date: Thu, 26 Sep 2019 21:33:50 +0300
Message-ID: <4fb0ac32-863e-c922-471f-1dea8f95c53b@gmail.com>
References: <20190804202927.15014-1-digetx@gmail.com>
 <23856887-06b0-66a8-1df2-ef4d7b48dc68@nvidia.com>
 <854c90c4-9e42-2020-5fa7-8711203f56a5@gmail.com>
 <c5a5a059-c949-1a25-c7ac-59d88ad9a026@nvidia.com>
 <ff1a790f-baba-dd0b-8cbe-f9468fbd56e3@gmail.com>
 <546ec91f-2486-21e1-9fdf-b3d087e176ed@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <546ec91f-2486-21e1-9fdf-b3d087e176ed@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

23.09.2019 16:36, Dmitry Osipenko пишет:
> 23.09.2019 16:31, Dmitry Osipenko пишет:
>> 23.09.2019 16:01, Jon Hunter пишет:
>>>
>>> On 23/09/2019 13:49, Dmitry Osipenko wrote:
>>>> 23.09.2019 13:56, Jon Hunter пишет:
>>>>>
>>>>>
>>>>> On 04/08/2019 21:29, Dmitry Osipenko wrote:
>>>>>> It is possible to get a lockup if kernel decides to enter LP2 cpuidle
>>>>>> from some clk-notifier, in that case CCF's "prepare" mutex is kept locked
>>>>>> and thus clk_get_rate(pclk) blocks on the same mutex with interrupts being
>>>>>> disabled.
>>>>>>
>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>> ---
>>>>>>
>>>>>> Changelog:
>>>>>>
>>>>>> v4: Added clk-notifier to track PCLK rate-changes, which may become useful
>>>>>>     in the future. That's done in response to v3 review comment from Peter
>>>>>>     De Schrijver.
>>>>>>
>>>>>>     Now properly handling case where clk pointer is intentionally NULL on
>>>>>>     the driver's probe.
>>>>>>
>>>>>> v3: Changed commit's message because I actually recalled what was the
>>>>>>     initial reason for the patch, since the problem reoccurred once again.
>>>>>>
>>>>>> v2: Addressed review comments that were made by Jon Hunter to v1 by
>>>>>>     not moving the memory barrier, replacing one missed clk_get_rate()
>>>>>>     with pmc->rate, handling possible clk_get_rate() error on probe and
>>>>>>     slightly adjusting the commits message.
>>>>>>
>>>>>>  drivers/soc/tegra/pmc.c | 71 ++++++++++++++++++++++++++++++-----------
>>>>>>  1 file changed, 53 insertions(+), 18 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>>>> index 9f9c1c677cf4..4e44943d0b26 100644
>>>>>> --- a/drivers/soc/tegra/pmc.c
>>>>>> +++ b/drivers/soc/tegra/pmc.c
>>>>>> @@ -309,6 +309,7 @@ static const char * const tegra210_reset_sources[] = {
>>>>>>   * @pctl_dev: pin controller exposed by the PMC
>>>>>>   * @domain: IRQ domain provided by the PMC
>>>>>>   * @irq: chip implementation for the IRQ domain
>>>>>> + * @clk_nb: pclk clock changes handler
>>>>>>   */
>>>>>>  struct tegra_pmc {
>>>>>>  	struct device *dev;
>>>>>> @@ -344,6 +345,8 @@ struct tegra_pmc {
>>>>>>  
>>>>>>  	struct irq_domain *domain;
>>>>>>  	struct irq_chip irq;
>>>>>> +
>>>>>> +	struct notifier_block clk_nb;
>>>>>>  };
>>>>>>  
>>>>>>  static struct tegra_pmc *pmc = &(struct tegra_pmc) {
>>>>>> @@ -1192,7 +1195,7 @@ static int tegra_io_pad_prepare(struct tegra_pmc *pmc, enum tegra_io_pad id,
>>>>>>  		return err;
>>>>>>  
>>>>>>  	if (pmc->clk) {
>>>>>> -		rate = clk_get_rate(pmc->clk);
>>>>>> +		rate = pmc->rate;
>>>>>>  		if (!rate) {
>>>>>>  			dev_err(pmc->dev, "failed to get clock rate\n");
>>>>>>  			return -ENODEV;
>>>>>
>>>>> So this error should never happen now, right? Assuming that rate is
>>>>> never set to 0. But ...
>>>>
>>>> Good catch!
>>>>
>>>>>> @@ -1433,6 +1436,7 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
>>>>>>  void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>>>>>  {
>>>>>>  	unsigned long long rate = 0;
>>>>>> +	u64 ticks;
>>>>>>  	u32 value;
>>>>>>  
>>>>>>  	switch (mode) {
>>>>>> @@ -1441,31 +1445,22 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>>>>>  		break;
>>>>>>  
>>>>>>  	case TEGRA_SUSPEND_LP2:
>>>>>> -		rate = clk_get_rate(pmc->clk);
>>>>>> +		rate = pmc->rate;
>>>>>>  		break;
>>>>>>  
>>>>>>  	default:
>>>>>>  		break;
>>>>>>  	}
>>>>>>  
>>>>>> -	if (WARN_ON_ONCE(rate == 0))
>>>>>> -		rate = 100000000;
>>>>>> -
>>>>>> -	if (rate != pmc->rate) {
>>>>>> -		u64 ticks;
>>>>>> -
>>>>>> -		ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
>>>>>> -		do_div(ticks, USEC_PER_SEC);
>>>>>> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
>>>>>> +	ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
>>>>>> +	do_div(ticks, USEC_PER_SEC);
>>>>>> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
>>>>>>  
>>>>>> -		ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
>>>>>> -		do_div(ticks, USEC_PER_SEC);
>>>>>> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>>>>>> +	ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
>>>>>> +	do_div(ticks, USEC_PER_SEC);
>>>>>> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>>>>>>  
>>>>>> -		wmb();
>>>>>> -
>>>>>> -		pmc->rate = rate;
>>>>>> -	}
>>>>>> +	wmb();
>>>>>>  
>>>>>>  	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>>>>>  	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
>>>>>> @@ -2019,6 +2014,20 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
>>>>>>  	return 0;
>>>>>>  }
>>>>>>  
>>>>>> +static int tegra_pmc_clk_notify_cb(struct notifier_block *nb,
>>>>>> +				   unsigned long action, void *ptr)
>>>>>> +{
>>>>>> +	struct clk_notifier_data *data = ptr;
>>>>>> +	struct tegra_pmc *pmc;
>>>>>> +
>>>>>> +	if (action == POST_RATE_CHANGE) {
>>>>>> +		pmc = container_of(nb, struct tegra_pmc, clk_nb);
>>>>>> +		pmc->rate = data->new_rate;
>>>>>> +	}
>>>>>> +
>>>>>> +	return NOTIFY_OK;
>>>>>> +}
>>>>>> +
>>>>>>  static int tegra_pmc_probe(struct platform_device *pdev)
>>>>>>  {
>>>>>>  	void __iomem *base;
>>>>>> @@ -2082,6 +2091,30 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>>>>>>  		pmc->clk = NULL;
>>>>>>  	}
>>>>>>  
>>>>>> +	/*
>>>>>> +	 * PCLK clock rate can't be retrieved using CLK API because it
>>>>>> +	 * causes lockup if CPU enters LP2 idle state from some other
>>>>>> +	 * CLK notifier, hence we're caching the rate's value locally.
>>>>>> +	 */
>>>>>> +	if (pmc->clk) {
>>>>>> +		pmc->clk_nb.notifier_call = tegra_pmc_clk_notify_cb;
>>>>>> +		err = clk_notifier_register(pmc->clk, &pmc->clk_nb);
>>>>>> +		if (err) {
>>>>>> +			dev_err(&pdev->dev,
>>>>>> +				"failed to register clk notifier\n");
>>>>>> +			return err;
>>>>>> +		}
>>>>>> +
>>>>>> +		pmc->rate = clk_get_rate(pmc->clk);
>>>>>> +	}
>>>>>> +
>>>>>> +	if (!pmc->rate) {
>>>>>> +		if (pmc->clk)
>>>>>> +			dev_err(&pdev->dev, "failed to get pclk rate\n");
>>>>>> +
>>>>>> +		pmc->rate = 100000000;
>>>>>
>>>>> I wonder if we should just let this fail. Or set to 0 so that if the
>>>>> rate is not set we will never suspend or configure the IO pads? I could
>>>>> run some quick tests to see if there are any problems by failing here.
>>>>
>>>> Do you mean to fail the PMC driver to probe? I guess that will be fatal
>>>> and system won't be in a useful state, from a user perspective that
>>>> should be equal to a hang on boot with a black screen. On the other
>>>> hand, it seems that failing tegra_io_pad_prepare() should have similar
>>>> fatal result.
>>>>
>>>> I'm wondering whether that IO PAD misconfiguration could be harmful. If
>>>> not, then looks like falling back to 100Mhz should be good enough. In
>>>> practice clk_get_rate() shouldn't ever fail unless there is some serious
>>>> bug in clk/. What do you think?
>>>
>>> Exactly. I think that if clk_get_rate() is failing then something bad is
>>> happening. I can see if this causes any obvious problems across the
>>> different boards we test, but it would be great to get rid of this
>>> 100MHz value (unless Peter knows of a good reason to keep it).
>>
>> Okay!
>>
>> Peter, do you have any thoughts about whether it worth to keep the
>> 100MHz workaround?
>>
>> BTW.. looking at tegra_io_pad_prepare() again, I think that it should be
>> fine to simply keep the clk_get_rate() there.
> 
> [it will be fine without having the clk notifier or without the locking
> within the notifier that I suggested below]
> 
>> It also looks like clk notifier should actually take powergates_lock to
>> be really robust and not potentially race with tegra_io_pad_prepare(). I
>> can fix up it in v5, but.. maybe it will be better to postpone the clk
>> notifier addition until there will be a real use-case for PMC clk
>> freq-scaling and for now assume that clk rate is static?

I'll make a new version that has proper locking and preserves the
original 100MHz fallback logic, any other changes could be made on top
of it. Let's continue in the new thread.
