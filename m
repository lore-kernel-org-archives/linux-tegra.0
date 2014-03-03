From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: dts: exynos5440: fix PCIe interrupt mapping
Date: Mon, 03 Mar 2014 16:40:47 +0900
Message-ID: <000401cf36b3$e4aa0fb0$adfe2f10$%han@samsung.com>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
 <1393608523-17509-5-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1393608523-17509-5-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-language: ko
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Lucas Stach' <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Simon Horman' <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, 'Shawn Guo' <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, 'Thierry Reding' <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, 'Tim Harvey' <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, 'Richard Zhu' <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, 'Arnd Bergmann' <arnd-r2nGTMty4D4@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday, March 01, 2014 2:29 AM, Lucas Stach wrote:
> 
> So it actually works.
> 
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5440.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
> index 02a0a1226cef..65d425d9ec27 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -274,7 +274,7 @@
>  			  0x82000000 0 0x40011000 0x40011000 0 0x1ffef000>; /* non-prefetchable memory */
>  		#interrupt-cells = <1>;
>  		interrupt-map-mask = <0 0 0 0>;
> -		interrupt-map = <0x0 0 &gic 53>;
> +		interrupt-map = <0 0 0 0 &gic GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;

It makes build errors as below:

DTC     arch/arm/boot/dts/exynos5440-ssdk5440.dtb
Error: arch/arm/boot/dts/exynos5440.dtsi:289.33-34 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [arch/arm/boot/dts/exynos5440-ssdk5440.dtb] Error 1
make: *** [exynos5440-ssdk5440.dtb] Error 2

Would you fix it?

Best regards,
Jingoo Han

>  		num-lanes = <4>;
>  		status = "disabled";
>  	};
> @@ -295,7 +295,7 @@
>  			  0x82000000 0 0x60011000 0x60011000 0 0x1ffef000>; /* non-prefetchable memory */
>  		#interrupt-cells = <1>;
>  		interrupt-map-mask = <0 0 0 0>;
> -		interrupt-map = <0x0 0 &gic 56>;
> +		interrupt-map = <0 0 0 0 &gic GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>  		num-lanes = <4>;
>  		status = "disabled";
>  	};
> --
> 1.8.5.3
