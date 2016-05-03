From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] soc/tegra: pmc: Add support for IO pads power state
 and voltage
Date: Tue, 3 May 2016 14:12:01 +0100
Message-ID: <5728A3A1.2030304@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
 <1462191434-28933-4-git-send-email-ldewangan@nvidia.com>
 <57289AC0.4090604@nvidia.com> <57289A2B.7040501@nvidia.com>
 <57289FB5.5040705@nvidia.com> <57289E35.8040400@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57289E35.8040400-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 03/05/16 13:48, Laxman Dewangan wrote:
> 
> On Tuesday 03 May 2016 06:25 PM, Jon Hunter wrote:
>>
>>>
>>> Currently SOR driver is using the tegra_io_rail_power_off/on() APIs.
>>> Once the proper interface available then I will move sor driver to use
>>> new method and then we can full get rid of older APIs and macros.
>>>
>>> Till that, we need to have this.
>> I prefer it is done before this series. In other words, if we need a
>> proper enum for the rail/pad IDs then add one and convert any existing
>> drivers over to use any new APIs first.
> 
> But the converting to new API can be done after this patch only.

Yes but before you add the pinctrl driver. May be you should separate
the two.

My point is that any follow-up series to this, would have to touch the
pmc and the sor driver. So why not make the changes for the pmc and sor
now, and once in place then add the pinctrl driver?

Jon
