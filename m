From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 3/8] clocksource/drivers/tegra: Set and use timer's
 period
Date: Wed, 19 Jun 2019 03:41:05 +0300
Message-ID: <17556fe2-8481-258a-9be9-2598da0a67eb@gmail.com>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-4-digetx@gmail.com>
 <16c20c1b-d106-cb1e-6d67-bdd402ecf57f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <16c20c1b-d106-cb1e-6d67-bdd402ecf57f@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.06.2019 19:32, Jon Hunter пишет:
> 
> On 18/06/2019 15:03, Dmitry Osipenko wrote:
>> The of_clk structure has a period field that is set up initially by
>> timer_of_clk_init(), that period value need to be adjusted for a case of
>> TIMER1-9 that are running at a fixed rate that doesn't match the clock's
>> rate. Note that the period value is currently used only by some of the
>> clocksource drivers internally and hence this is just a minor cleanup
>> change that doesn't fix anything.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/clocksource/timer-tegra.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
>> index ff5a4ccb5d52..e6221e070499 100644
>> --- a/drivers/clocksource/timer-tegra.c
>> +++ b/drivers/clocksource/timer-tegra.c
>> @@ -71,9 +71,9 @@ static int tegra_timer_shutdown(struct clock_event_device *evt)
>>  static int tegra_timer_set_periodic(struct clock_event_device *evt)
>>  {
>>  	void __iomem *reg_base = timer_of_base(to_timer_of(evt)); 
>> +	unsigned long period = timer_of_period(to_timer_of(evt));
>>  
>> -	writel_relaxed(TIMER_PTV_EN | TIMER_PTV_PER |
>> -		       ((timer_of_rate(to_timer_of(evt)) / HZ) - 1),
>> +	writel_relaxed(TIMER_PTV_EN | TIMER_PTV_PER | (period - 1),
>>  		       reg_base + TIMER_PTV);
>>  
>>  	return 0;
>> @@ -297,6 +297,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>>  		cpu_to->clkevt.rating = rating;
>>  		cpu_to->clkevt.cpumask = cpumask_of(cpu);
>>  		cpu_to->of_base.base = timer_reg_base + base;
>> +		cpu_to->of_clk.period = rate / HZ;
>>  		cpu_to->of_clk.rate = rate;
>>  
>>  		irq_set_status_flags(cpu_to->clkevt.irq, IRQ_NOAUTOEN);
> 
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
