From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] mfd: tps65910: Correct power-off programming sequence
Date: Sun, 24 May 2020 22:09:09 +0300
Message-ID: <86d37179-53d1-e0df-6b30-62160351fa4d@gmail.com>
References: <20200514205022.7024-1-digetx@gmail.com>
 <20200515110754.GB20564@qmqm.qmqm.pl>
 <7e1eaac5-34d1-f76e-e4c5-bc36f56a7064@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7e1eaac5-34d1-f76e-e4c5-bc36f56a7064-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Zack Pearsall <zpearsall-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

15.05.2020 20:30, Dmitry Osipenko пишет:
> 15.05.2020 16:30, Michał Mirosław пишет:
>> On Thu, May 14, 2020 at 11:50:21PM +0300, Dmitry Osipenko wrote:
>>> This patch fixes system shutdown on a devices that use TPS65910 as a
>>> system's power controller. In accordance to the TPS65910 datasheet, the
>>> PMIC's state-machine transitions into the OFF state only when DEV_OFF
>>> bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
>>> otherwise PMIC won't get into a proper state on shutdown. Devices like
>>> Nexus 7 tablet and Ouya game console are now shutting down properly.
>>>
>>> Tested-by: Zack Pearsall <zpearsall-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/mfd/tps65910.c | 12 ++++++++++--
>>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
>>> index 11959021b50a..22116cee411d 100644
>>> --- a/drivers/mfd/tps65910.c
>>> +++ b/drivers/mfd/tps65910.c
>>> @@ -440,8 +440,16 @@ static void tps65910_power_off(void)
>>>  			DEVCTRL_PWR_OFF_MASK) < 0)
>>>  		return;
>>>  
>>> -	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>>> -			DEVCTRL_DEV_ON_MASK);
>>> +	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>>> +			DEVCTRL_DEV_SLP_MASK) < 0)
>>> +		return;
>>> +
>>> +	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>>> +			DEVCTRL_DEV_ON_MASK) < 0)
>>> +		return;
>>> +
>>> +	tps65910_reg_set_bits(tps65910, TPS65910_DEVCTRL,
>>> +			DEVCTRL_DEV_OFF_MASK);
>>>  }
>>
>> Isn't it enough to update the DEVCTRL with just one
>> tps65910_reg_update_bits()?
> 
> IIRC, we've tried that variant and it didn't work. Although, maybe it
> was affected by some other changes that we were trying simultaneously,
> so could be worthwhile to re-check it. Thank you for the comment!
> 

We tried it once again and the variant with a single update_bits() for
all bits doesn't work. The single update_bits() for the ON/OFF_MASK mask
works, it's actually the same what downstream driver does [1].

[1]
https://android.googlesource.com/kernel/tegra/+/refs/heads/android-tegra3-grouper-3.1-lollipop-release/drivers/mfd/tps6591x.c#374

I'll prepare a v2.
