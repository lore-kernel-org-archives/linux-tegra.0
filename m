From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/3] clocksource/drivers/tegra: Remove duplicated use
 of per_cpu_ptr
Date: Mon, 10 Jun 2019 13:39:00 +0300
Message-ID: <479f97eb-f695-31d8-d12b-4b577b90f4d0@gmail.com>
References: <20190609192730.29459-1-digetx@gmail.com>
 <20190609192730.29459-2-digetx@gmail.com>
 <4e1f1389-afde-3994-2ccc-4e57e9ad78d1@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4e1f1389-afde-3994-2ccc-4e57e9ad78d1@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

10.06.2019 11:11, Daniel Lezcano пишет:
> 
> Hi Dmitry,
> 
> 
> On 09/06/2019 21:27, Dmitry Osipenko wrote:
>> It was left unnoticed by accident, which means that the code could be
>> cleaned up a tad more.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/clocksource/timer-tegra.c | 40 +++++++++++++++++++------------
>>  1 file changed, 25 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
>> index 9406855781ff..6da169de47f9 100644
>> --- a/drivers/clocksource/timer-tegra.c
>> +++ b/drivers/clocksource/timer-tegra.c
>> @@ -216,6 +216,19 @@ static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
>>  	return TIMER10_IRQ_IDX + cpu;
>>  }
>>  
>> +static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
>> +						 bool tegra20)
>> +{
>> +	/*
>> +	 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
>> +	 * parent clock.
>> +	 */
>> +	if (tegra20)
>> +		return 1000000;
> 
> Mind to take the opportunity to convert the literal value to a constant?

Sure!

>> +
>> +	return to->of_clk.rate;
>> +}
>> +
>>  static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>>  				   int rating)
>>  {
>> @@ -268,30 +281,27 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>>  
>>  	for_each_possible_cpu(cpu) {
>>  		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
>> +		unsigned long flags = IRQF_TIMER | IRQF_NOBALANCING;
>> +		unsigned long rate = tegra_rate_for_timer(&tegra_to, tegra20);

Oh, this actually shall be (to, tegra20). Will correct this in v2!

>>  		unsigned int base = tegra_base_for_cpu(cpu, tegra20);
>>  		unsigned int idx = tegra_irq_idx_for_cpu(cpu, tegra20);
>> +		unsigned int irq = irq_of_parse_and_map(np, idx);
>>  
>> -		/*
>> -		 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
>> -		 * parent clock.
>> -		 */
>> -		if (tegra20)
>> -			cpu_to->of_clk.rate = 1000000;

I also spotted that there is a bug here that I introduced in a previous
patch. The of_clk.rate is initialized only for the first per-cpu
clocksource and then we need to replicate it for the rest of CPU's in a
case of T210. I'll add an explicit fixup for this.
