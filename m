From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V6 9/9] irqchip/gic: Add platform driver for non-root GICs
 that require RPM
Date: Mon, 13 Jun 2016 11:27:38 +0100
Message-ID: <575E8A9A.1040907@nvidia.com>
References: <1465312354-27778-1-git-send-email-jonathanh@nvidia.com>
 <1465312354-27778-10-git-send-email-jonathanh@nvidia.com>
 <575E789F.3050509@arm.com> <575E83B8.2050602@nvidia.com>
 <575E8741.8060902@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575E8741.8060902-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 13/06/16 11:13, Marc Zyngier wrote:

...

> OK, that's because ARM_GIC_PM is never selected (and there is no way I
> can actually select). Do you have some additional patches that selects
> it for Tegra?

Yes locally, I have the following for testing ...

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 03089ad2fc65..ffd02a3c093a 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -63,6 +63,7 @@ config ARCH_TEGRA_132_SOC

 config ARCH_TEGRA_210_SOC
        bool "NVIDIA Tegra210 SoC"
+       select ARM_GIC_PM
        select PINCTRL_TEGRA210

>> The correct fix is ...
>>
>> diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
>> index 57423f3b218b..1de07eb5839c 100644
>> --- a/drivers/irqchip/irq-gic.c
>> +++ b/drivers/irqchip/irq-gic.c
>> @@ -1272,7 +1272,7 @@ static bool gic_check_eoimode(struct device_node *node, void __iomem **base)
>>         return true;
>>  }
>>  
>> -static int __init gic_of_setup(struct gic_chip_data *gic, struct device_node *node)
>> +static int gic_of_setup(struct gic_chip_data *gic, struct device_node *node)
>>  {
>>         if (!gic || !node)
>>                 return -EINVAL;
> 
> OK, I've applied this locally (no need to resend).

Great. Thanks. Sorry about this.

Jon

-- 
nvpublic
