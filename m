From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] regulator: tps65910: Sleep control through external
 inputs
Date: Wed, 25 Jan 2012 18:17:43 +0530
Message-ID: <4F1FF9EF.9000004@nvidia.com>
References: <1327489068-9460-1-git-send-email-ldewangan@nvidia.com> <20120125124250.GH3687@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120125124250.GH3687-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 25 January 2012 06:12 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Jan 25, 2012 at 04:27:48PM +0530, Laxman Dewangan wrote:
>
>> @@ -450,6 +489,29 @@ static int tps65910_set_mode(struct regulator_dev *dev, unsigned int mode)
>>   	struct tps65910 *mfd = pmic->mfd;
>>   	int reg, value, id = rdev_get_id(dev);
>>
>> +	/*
>> +	 * If regulator is controlled through external control then
>> +	 * mode can be identified by the input level of EN1/EN2/EN3.
>> +	 * If it is HIGH then regulators is on, full power.
>> +	 * If it is LOW then:
>> +	 *       - the regulator is set off if its corresponding Control
>> +	 *         bit = 0 in SLEEP_KEEP_XXX_ON.
>> +	 *       - the regulator is set in low-power mode if its corresponding
>> +	 *         control bit = 1 in SLEEP_KEEP_XXX_ON register.
>> +	 */
> This really isn't what the set_mode() API is for - especially the fact
> that it supports turning the regulator off which really isn't what
> set_mode() is supposed to do.  A generic driver using this API isn't
> going to play too well.
Then what should be the method? Is it through the macro similar to patch 
V1 where LOW_POWER mode option come from platform data? The idea  is to 
set the regulator in OFF or low power mode based on external control.

>> +	if (pmic->board_ext_control[id]) {
>> +		u8 regoffs = (pmic->ext_sleep_control[id]>>  8)&  0xFF;
>> +		u8 bit_pos = (1<<  pmic->ext_sleep_control[id]&  0xFF);
>> +		int ret = 0;
>> +		if ((mode == REGULATOR_MODE_IDLE) ||
>> +			(mode == REGULATOR_MODE_STANDBY))
>> +			ret = tps65910_set_bits(mfd,
>> +				TPS65910_SLEEP_KEEP_LDO_ON + regoffs, bit_pos);
> As a coding style thing this should be a switch statement.
I will take care in next patch once above question is clear.

> * Unknown Key
> * 0x6E30FDDD
