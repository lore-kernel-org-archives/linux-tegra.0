From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Fri, 25 Nov 2016 17:26:40 +0000
Message-ID: <2a767269-dc64-3639-2e14-7c6f57230dcf@nvidia.com>
References: <1479976734-30498-1-git-send-email-ldewangan@nvidia.com>
 <1479976734-30498-3-git-send-email-ldewangan@nvidia.com>
 <20161125095744.GB11512@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125095744.GB11512-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/11/16 09:57, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Thu, Nov 24, 2016 at 02:08:54PM +0530, Laxman Dewangan wrote:
>> NVIDIA Tegra124 and later SoCs support the multi-voltage level and
>> low power state of some of its IO pads. The IO pads can work in
>> the voltage of the 1.8V and 3.3V of IO voltage from IO power rail
>> sources. When IO interfaces are not used then IO pads can be
>> configure in low power state to reduce the power consumption from
>> that IO pads.
>>
>> On Tegra124, the voltage level of IO power rail source is auto
>> detected by hardware(SoC) and hence it is only require to configure
>> in low power mode if IO pads are not used.
>>
>> On T210 onwards, the auto-detection of voltage level from IO power
>> rail is removed from SoC and hence SW need to configure the PMC
>> register explicitly to set proper voltage in IO pads based on
>> IO rail power source voltage.
>>
>> This driver adds the IO pad driver to configure the power state and
>> IO pad voltage based on the usage and power tree via pincontrol
>> framework. The configuration can be static and dynamic.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> ---
>> Changes from V1:
>> - Dropped the custom properties to set pad voltage and use regulator.
>> - Added support for regulator to get vottage in boot and configure IO
>>   pad voltage.
>> - Add support for callback to handle regulator notification and configure
>>   IO pad voltage based on voltage change.
>>
>> Changes from V2:
>>  Mostly nit changes per Jon's feedback i.e. use macros for voltage, added
>>  comment on macros, reduce the structure and variable name size, optimise
>>  number of variables, and allocate memory for regulator info when it needed.
>>
>> Changes from V3:
>>  Use the devm_regulator_get() instead of devm_regulator_get_optional().
>>
>>  drivers/pinctrl/tegra/Kconfig                |  12 +
>>  drivers/pinctrl/tegra/Makefile               |   1 +
>>  drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c | 530 +++++++++++++++++++++++++++
>>  3 files changed, 543 insertions(+)
>>  create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c

...

>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c b/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
>> new file mode 100644
>> index 0000000..aab02d0
>> --- /dev/null
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
>> @@ -0,0 +1,530 @@
>> +/*
>> + * pinctrl-tegra-io-pad: IO PAD driver for configuration of IO rail and deep
>> + *			 Power Down mode via pinctrl framework.
>> + *
>> + * Copyright (C) 2016 NVIDIA CORPORATION. All rights reserved.
>> + *
>> + * Author: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/pinctrl/pinctrl.h>
>> +#include <linux/pinctrl/pinconf-generic.h>
>> +#include <linux/pinctrl/pinconf.h>
>> +#include <linux/pinctrl/pinmux.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <soc/tegra/pmc.h>
> 
> Have you considered moving this code into the PMC driver? It seems a
> little over the top to go through all of the platform device creation
> and driver registration dance only to call into a public API later on.

I would prefer moving this under driver/soc/tegra as well (even if it is
not in the same source file) so we don't need all this public APIs.

Cheers
Jon

-- 
nvpublic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
