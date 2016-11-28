From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Mon, 28 Nov 2016 09:31:49 +0000
Message-ID: <de867e80-3f22-ec3c-71c3-b35b548f1ad4@nvidia.com>
References: <1479976734-30498-1-git-send-email-ldewangan@nvidia.com>
 <1479976734-30498-3-git-send-email-ldewangan@nvidia.com>
 <20161125095744.GB11512@ulmo.ba.sec>
 <2a767269-dc64-3639-2e14-7c6f57230dcf@nvidia.com>
 <583878A1.7090207@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <583878A1.7090207-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/11/16 17:45, Laxman Dewangan wrote:
> 
> On Friday 25 November 2016 10:56 PM, Jon Hunter wrote:
>> On 25/11/16 09:57, Thierry Reding wrote:
>>> * PGP Signed by an unknown key
>>>
>>> On Thu, Nov 24, 2016 at 02:08:54PM +0530, Laxman Dewangan wrote:
>> ...
>>
>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
>>>> b/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
>>>> new file mode 100644
>>>> index 0000000..aab02d0
>>>> --- /dev/null
>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
>>>> @@ -0,0 +1,530 @@
>>>> +/*
>>>> + * pinctrl-tegra-io-pad: IO PAD driver for configuration of IO rail
>>>> and deep
>>>> + *             Power Down mode via pinctrl framework.
>>>> + *
>>>> + * Copyright (C) 2016 NVIDIA CORPORATION. All rights reserved.
>>>> + *
>>>> + * Author: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or
>>>> modify
>>>> + * it under the terms of the GNU General Public License version 2 as
>>>> + * published by the Free Software Foundation.
>>>> + */
>>>> +
>>>> +#include <linux/delay.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/pinctrl/pinctrl.h>
>>>> +#include <linux/pinctrl/pinconf-generic.h>
>>>> +#include <linux/pinctrl/pinconf.h>
>>>> +#include <linux/pinctrl/pinmux.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/regulator/consumer.h>
>>>> +#include <soc/tegra/pmc.h>
>>> Have you considered moving this code into the PMC driver? It seems a
>>> little over the top to go through all of the platform device creation
>>> and driver registration dance only to call into a public API later on.
>> I would prefer moving this under driver/soc/tegra as well (even if it is
>> not in the same source file) so we don't need all this public APIs.
>>
> 
> Do we really gain anything here by moving driver to drivers/soc/tegra?

Only avoid adding these public APIs. By using the pinctrl framework, it
would be nice to avoid having to still have public APIs that someone
could use directly.

> The folder drivers/pinctrl/tegra is dedicated folder for Tegra specific.
> We should keep the related driver in given subsystem until this is
> really hard to do it.
> Even if we organise and move this driver to the driver/soc/tegra, we
> will need only 3-4 APIs from the public pmc header to the private header.
> I think calling the tegra specific headers/APIs from tegra specific
> driver should be fine here.

Its OK, but I still prefer not having them at all.

Jon

-- 
nvpublic
