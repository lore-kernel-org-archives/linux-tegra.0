From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Select appropriate DMA options for LPAE
Date: Tue, 04 Jul 2017 17:29:05 +0300
Message-ID: <1499178545.12420.4.camel@paulk.fr>
References: <20170424225946.19425-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170424225946.19425-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2017-04-25 at 00:59 +0200, Paul Kocialkowski wrote:
> This automatically selects options for zone DMA and 64 bit DMA addresses
> when LPAE is enabled on ARM Tegra platforms. These options are required
> for proper operation with LPAE enabled.

Bumping this one since it did not get any review yet.

It should be a good candidate for inclusion now that the merge window is open.

> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/mach-tegra/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
> index 329f01c5b6f8..c8368d647741 100644
> --- a/arch/arm/mach-tegra/Kconfig
> +++ b/arch/arm/mach-tegra/Kconfig
> @@ -13,5 +13,7 @@ menuconfig ARCH_TEGRA
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select RESET_CONTROLLER
>  	select SOC_BUS
> +	select ZONE_DMA if ARM_LPAE
> +	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
>  	help
>  	  This enables support for NVIDIA Tegra based systems.
-- 
Paul Kocialkowski, developer of free digital technology and hardware support

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
