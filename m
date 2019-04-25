From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 6/6] mfd: max77620: Provide system power-off
 functionality
Date: Thu, 25 Apr 2019 17:58:53 +0300
Message-ID: <7251d025-b229-7c78-f2b8-187b833183fa@gmail.com>
References: <20190424224900.8018-1-digetx@gmail.com>
 <20190424224900.8018-7-digetx@gmail.com> <20190425112241.GA10218@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425112241.GA10218@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

25.04.2019 14:22, Thierry Reding пишет:
> On Thu, Apr 25, 2019 at 01:49:00AM +0300, Dmitry Osipenko wrote:
>> Provide system power-off functionality that allows to turn off machine
>> gracefully.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/mfd/max77620.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
>> index 9b0009c29610..e56223bde568 100644
>> --- a/drivers/mfd/max77620.c
>> +++ b/drivers/mfd/max77620.c
>> @@ -37,6 +37,8 @@
>>  #include <linux/regmap.h>
>>  #include <linux/slab.h>
>>  
>> +static struct max77620_chip *max77620_scratch;
>> +
>>  static const struct resource gpio_resources[] = {
>>  	DEFINE_RES_IRQ(MAX77620_IRQ_TOP_GPIO),
>>  };
>> @@ -481,6 +483,15 @@ static int max77620_read_es_version(struct max77620_chip *chip)
>>  	return ret;
>>  }
>>  
>> +static void max77620_pm_power_off(void)
>> +{
>> +	struct max77620_chip *chip = max77620_scratch;
>> +
>> +	regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG1,
>> +			   MAX77620_ONOFFCNFG1_SFT_RST,
>> +			   MAX77620_ONOFFCNFG1_SFT_RST);
>> +}
> 
> I think this is only partially correct. See here for a driver that I had
> proposed a while back:
> 
> 	https://github.com/thierryreding/linux/commit/d0eaa77b402f62bd236d76e3edeb3ccf296cbe81
> 
> Note that that driver is part of a larger series to move away from all
> the pm_power_off hackery. There was a fair bit of discussion back when I
> proposed the original power off driver for max77620:
> 
> 	https://lkml.org/lkml/2017/1/12/470
> 
> I think I may have a more up-to-date local branch of the system-power
> branch from my github repository if you're interested in looking at some
> of that code. There wasn't a whole lot of feedback on the patches, but
> the feedback I did get was generally positive. However, since it didn't
> gain any traction I eventually abandoned that effort. It might be worth
> picking it up again, since, as far as I can tell, the situation around
> power off and restart hasn't changed in the meantime.

Hello Thierry,

Thank you very much for the feedback. IIUC, you're asking for a
comprehensive solution that nobody managed to get upstreamed for years
and thus I think it is absolutely fine to have at least a practical
minimum implemented for the start.

In yours system-power series you are saying that the restart handlers
"lack any means of locking against concurrently registering handlers or
formal definitions on what proper priorities are to order handlers", it
looks to me that it will be much easier to just fix the missing locks
and properly define the priorities.

	https://github.com/thierryreding/linux/commit/16e386d4692716c3f2423732a2181fb589421526

In the LKML discussion there is also pointer to the "poweroff handler
call chain" series from 2014 which is similar to the restart handlers
and actually looks nice, sadly it didn't got too far.

	https://lkml.org/lkml/2014/10/21/5

I may try to continue the effort of getting proper restart / poweroff
handlers into upstream at some point in the future. Meanwhile there are
much bigger and fun problems to solve in the kernel and user spaces,
let's get everything step by step on by as-needed basis.
