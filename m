From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V4 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Fri, 25 Nov 2016 23:15:05 +0530
Message-ID: <583878A1.7090207@nvidia.com>
References: <1479976734-30498-1-git-send-email-ldewangan@nvidia.com> <1479976734-30498-3-git-send-email-ldewangan@nvidia.com> <20161125095744.GB11512@ulmo.ba.sec> <2a767269-dc64-3639-2e14-7c6f57230dcf@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <2a767269-dc64-3639-2e14-7c6f57230dcf@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, swarren@wwwdotorg.org, gnurou@gmail.com, joe@perches.com, yamada.masahiro@socionext.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Friday 25 November 2016 10:56 PM, Jon Hunter wrote:
> On 25/11/16 09:57, Thierry Reding wrote:
>> * PGP Signed by an unknown key
>>
>> On Thu, Nov 24, 2016 at 02:08:54PM +0530, Laxman Dewangan wrote:
> ...
>
>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c b/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
>>> new file mode 100644
>>> index 0000000..aab02d0
>>> --- /dev/null
>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
>>> @@ -0,0 +1,530 @@
>>> +/*
>>> + * pinctrl-tegra-io-pad: IO PAD driver for configuration of IO rail and deep
>>> + *			 Power Down mode via pinctrl framework.
>>> + *
>>> + * Copyright (C) 2016 NVIDIA CORPORATION. All rights reserved.
>>> + *
>>> + * Author: Laxman Dewangan <ldewangan@nvidia.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +#include <linux/delay.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/pinctrl/pinctrl.h>
>>> +#include <linux/pinctrl/pinconf-generic.h>
>>> +#include <linux/pinctrl/pinconf.h>
>>> +#include <linux/pinctrl/pinmux.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regulator/consumer.h>
>>> +#include <soc/tegra/pmc.h>
>> Have you considered moving this code into the PMC driver? It seems a
>> little over the top to go through all of the platform device creation
>> and driver registration dance only to call into a public API later on.
> I would prefer moving this under driver/soc/tegra as well (even if it is
> not in the same source file) so we don't need all this public APIs.
>

Do we really gain anything here by moving driver to drivers/soc/tegra?
The folder drivers/pinctrl/tegra is dedicated folder for Tegra specific.

We should keep the related driver in given subsystem until this is 
really hard to do it.
Even if we organise and move this driver to the driver/soc/tegra, we 
will need only 3-4 APIs from the public pmc header to the private header.

I think calling the tegra specific headers/APIs from tegra specific 
driver should be fine here.



