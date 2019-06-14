From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 3/6] clocksource/drivers/tegra: Set and use timer's
 period
Date: Fri, 14 Jun 2019 19:45:48 +0300
Message-ID: <3e941c50-ac62-719e-aac1-7072e9a3bcd0@gmail.com>
References: <20190610164400.11830-1-digetx@gmail.com>
 <20190610164400.11830-4-digetx@gmail.com>
 <ac8a1da8-9b82-3d5a-5fa6-0c1cc7f627f1@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ac8a1da8-9b82-3d5a-5fa6-0c1cc7f627f1@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.06.2019 18:48, Jon Hunter пишет:
> 
> On 10/06/2019 17:43, Dmitry Osipenko wrote:
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
>> index 810b4e7435cf..646b3530c2d2 100644
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
>> +		cpu_to->of_clk.period = DIV_ROUND_UP(rate, HZ);
> 
> Any reason you made this a round-up?

That's what timer_of_clk_init() does, I assume it should be a more correct variant.
