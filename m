From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Add AHB driver
Date: Mon, 23 Apr 2012 12:33:09 +0000
Message-ID: <201204231233.09423.arnd@arndb.de>
References: <1335181043-15348-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335181043-15348-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Monday 23 April 2012, Hiroshi DOYU wrote:
> The AHB Bus conforms to the AMBA Specification (Rev 2.0) Advanced
> High-performance Bus (AHB) architecture.
> 
> Both Tegra20/30 have this.
> 
> Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Please explain in the text above why it's a good idea to have this
driver.


> @@ -122,6 +123,7 @@ void __init tegra20_init_early(void)
>  	tegra_init_cache(0x331, 0x441);
>  	tegra_pmc_init();
>  	tegra_powergate_init();
> +	tegra_ahb_gizmo_init();
>  }
>  #endif
>  #ifdef CONFIG_ARCH_TEGRA_3x_SOC
> @@ -132,5 +134,6 @@ void __init tegra30_init_early(void)
>  	tegra_init_cache(0x441, 0x551);
>  	tegra_pmc_init();
>  	tegra_powergate_init();
> +	tegra_ahb_gizmo_init();
>  }
>  #endif

Does it really have to be "early", rather than an initcall? Why?

> +
> +static inline unsigned long gizmo_readl(unsigned long offset)
> +{
> +	return readl(IO_TO_VIRT(TEGRA_AHB_GIZMO_BASE + offset));
> +}
> +
> +static inline void gizmo_writel(unsigned long value, unsigned long offset)
> +{
> +	writel(value, IO_TO_VIRT(TEGRA_AHB_GIZMO_BASE + offset));
> +}

Please change this to no longer use hardcoded addresses. A good
implementation would scan the device tree for the physical address
and then ioremap the registers in the init function, in order to
save a local __iomem pointer.

	Arnd
