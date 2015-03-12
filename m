From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH v7 11/18] memory: tegra: Add EMC (external memory
 controller) driver
Date: Thu, 12 Mar 2015 09:04:14 +0100
Message-ID: <1426147454.5304.9.camel@x220>
References: <1426070126-26910-1-git-send-email-tomeu.vizoso@collabora.com>
	 <1426070126-26910-12-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426070126-26910-12-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joerg Roedel <jroedel-l3A5Bk7waGM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 2015-03-11 at 11:34 +0100, Tomeu Vizoso wrote:
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> +
> +

(Nit: just one empty line, please.)

> +config TEGRA124_EMC
> +	bool "Tegra124 External Memory Controller driver"

This patch adds a bool symbol...

> +	default y
> +	depends on TEGRA_MC && ARCH_TEGRA_124_SOC
> +	help
> +	  This driver is for the External Memory Controller (EMC) found on
> +	  Tegra124 chips. The EMC controls the external DRAM on the board.
> +	  This driver is required to change memory timings / clock rate for
> +	  external memory.
> \ No newline at end of file

(Another nit, reported by git.)

> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -5,3 +5,5 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_114_SOC) += tegra114.o
>  tegra-mc-$(CONFIG_ARCH_TEGRA_124_SOC) += tegra124.o
>  
>  obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
> +
> +obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o

... and tegra124-emc.o will never be part of a module ...

> --- /dev/null
> +++ b/drivers/memory/tegra/tegra124-emc.c

... so:

> +#include <linux/module.h>

- I guess linux/module.h is not needed;

> +MODULE_DEVICE_TABLE(of, tegra_emc_of_match);

- this macro will be preprocessed away;

> +static int tegra_emc_probe(struct platform_device *pdev)
> +{
> +	[...]
> +
> +	platform_set_drvdata(pdev, tegra);
> +
> +

(Nit: this adds two empty lines.)

> +	return 0;
> +};

> +MODULE_AUTHOR("Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
> +MODULE_DESCRIPTION("Tegra124 EMC memory driver");
> +MODULE_LICENSE("GPL v2");

- and these three macros will be, effectively, preprocessed away,
