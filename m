From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 6/6] clocksource/drivers/tegra: Restore base address
 before cleanup
Date: Fri, 14 Jun 2019 19:51:31 +0300
Message-ID: <dbc69b48-f83c-7af7-4a49-7cd2ee9937ab@gmail.com>
References: <20190610164400.11830-1-digetx@gmail.com>
 <20190610164400.11830-7-digetx@gmail.com>
 <b2eeb477-2e08-eaf5-6355-4a05cec5a9b7@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b2eeb477-2e08-eaf5-6355-4a05cec5a9b7@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.06.2019 18:48, Jon Hunter пишет:
> 
> On 10/06/2019 17:44, Dmitry Osipenko wrote:
>> We're adjusting the timer's base for each per-CPU timer to point to the
>> actual start of the timer since device-tree defines a compound registers
>> range that includes all of the timers. In this case the original base
>> need to be restore before calling iounmap to unmap the proper address.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/clocksource/timer-tegra.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
>> index 2a428fdf702f..7be91db98bd7 100644
>> --- a/drivers/clocksource/timer-tegra.c
>> +++ b/drivers/clocksource/timer-tegra.c
>> @@ -345,6 +345,8 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>>  			irq_dispose_mapping(cpu_to->clkevt.irq);
>>  		}
>>  	}
>> +
>> +	to->of_base.base = timer_reg_base;
>>  out:
>>  	timer_of_cleanup(to);
> 
> So what you are saying is that because we don't know which CPU executes
> the tegra_init_timer() function, then it is necessary to restore the
> base. IOW if it is not CPU0, then the base will be updated and hence,
> need to be restored. Correct?

We know what the CPU is, it is always CPU0. What we don't know is what TIMER is
assigned for CPU0. On Tegra210 it is TIMER10, for other Tegra's it is TIMER0.
