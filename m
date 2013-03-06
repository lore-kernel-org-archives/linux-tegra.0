From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: provide dummy cpu car ops
Date: Wed, 06 Mar 2013 16:42:53 -0700
Message-ID: <5137D47D.6030105@wwwdotorg.org>
References: <1360853581-9756-1-git-send-email-pdeschrijver@nvidia.com> <643E69AA4436674C8F39DCC2C05F7638629CA50C97@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F7638629CA50C97-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/2013 04:20 PM, Andrew Chew wrote:
>> Subject: [PATCH] clk: tegra: provide dummy cpu car ops
>>
>> tegra_boot_secondary() relies on some of the car ops. This means having an
>> uninitialized tegra_cpu_car_ops will lead to an early boot panic.
>> Providing a dummy struct avoids this and makes adding Tegra114 clock
>> support in a bisectable way a lot easier.
>>
>> --
>>
>> Stephen,
>>
>> Should this be a separate patch or should I make this part of new release of
>> the Tegra114 clock series?

I'm not sure if I answered this. Peter, I intend to apply this patch to
a branch right before the CCF, so there's no explicit need to include it
in the series, although if you do, that's fine.

>> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c index

>>  /* Global data of Tegra CPU CAR ops */
>> -struct tegra_cpu_car_ops *tegra_cpu_car_ops;
> 
> Sorry for bringing this up so late...
> Shouldn't the above be "struct tegra_cpu_car_ops tegra_cpu_car_ops;"?
> 
>> +static struct tegra_cpu_car_ops *dummy_car_ops; struct
>> +tegra_cpu_car_ops *tegra_cpu_car_ops = &dummy_car_ops;

No, the value is used as a pointer in include/linux/clk/tegra.h, e.g.:

tegra_cpu_car_ops->wait_for_reset(cpu);
