From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mfd: tps65910: Correct power-off programming sequence
Date: Wed, 27 May 2020 18:03:26 +0300
Message-ID: <90055b31-22ea-d427-42cb-79bcc0a350bd@gmail.com>
References: <20200524192643.18207-1-digetx@gmail.com>
 <20200526145952.GA2517@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200526145952.GA2517-cHozx32mtrEEUmgCuDUIdw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Zack Pearsall <zpearsall-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

26.05.2020 18:01, Michał Mirosław пишет:
> On Sun, May 24, 2020 at 10:26:43PM +0300, Dmitry Osipenko wrote:
>> This patch fixes system shutdown on a devices that use TPS65910 as a
>> system's power controller. In accordance to the TPS65910 datasheet, the
>> PMIC's state-machine transitions into the OFF state only when DEV_OFF
>> bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
>> otherwise PMIC won't get into a proper state on shutdown. Devices like
>> Nexus 7 tablet and Ouya game console are now shutting down properly.
> 
> The datasheets of 65910 and 65911 say that ON and SLP bits are cleared
> during OFF state. But I guess the hardware might work differently.

Indeed, sounds like we can remove the SLP bit-clearing safely. IIUC,
both tps65910 and tps65911 are nearly the same in regards to the
power-off programming, tps65911 only supports an additional (sequential)
power-off mode.

I'm not sure whether we've tried to remove the SLP bit-clearing before,
will be interesting to try.

> [...]
>> --- a/drivers/mfd/tps65910.c
>> +++ b/drivers/mfd/tps65910.c
>> @@ -440,8 +440,13 @@ static void tps65910_power_off(void)
>>  			DEVCTRL_PWR_OFF_MASK) < 0)
>>  		return;
>>  
>> -	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>> -			DEVCTRL_DEV_ON_MASK);
>> +	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>> +			DEVCTRL_DEV_SLP_MASK) < 0)
>> +		return;
>> +
>> +	tps65910_reg_update_bits(tps65910, TPS65910_DEVCTRL,
>> +				 DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
>> +				 DEVCTRL_DEV_OFF_MASK);
>>  }
> 
> There is tps65910_reg_set_bits() at the start of function. I guess it
> doesn't work if your changes are needed. Maybe you can remove it?

It enables the "sequential power-off, reverse of power-on sequence",
like datasheet says. I think it works and we actually need that PWR_OFF
bit to be set separately, before setting the DEV_OFF bit.

> I would also include your observations about the chip's behaviour in the
> commit message so it doesn't get "fixed" later.

I'll add a clarifying comment about it in v3, thank you for the suggestions.
