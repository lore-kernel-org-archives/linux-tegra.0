From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Wed, 28 Sep 2011 10:50:45 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173955580F@HQMAIL01.nvidia.com>
References: <1317172068-14872-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317172068-14872-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "Arnd Bergmann (arnd-r2nGTMty4D4@public.gmane.org)" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Tuesday, September 27, 2011 7:08 PM:
> This patch causes the kernel uncompressor to determine the physical address
> of the SDRAM at runtime. This allows the kernel to boot on both tegra20 and
> tegra30 even though SDRAM is at different physical addresses on both SoCs.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

An alternative would be to simply add that config option to the relevant
defconfig/.config file. I see both cases in use in the kernel. Still, the
code change this enables looks fine to just turn on all the time, and will
be needed for Tegra30 support, so I'm fine just selecting it as you have.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 472a7f8..474737b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -596,6 +596,7 @@ config ARCH_TEGRA
>  	select HAVE_CLK
>  	select HAVE_SCHED_CLOCK
>  	select ARCH_HAS_CPUFREQ
> +	select AUTO_ZRELADDR
>  	help
>  	  This enables support for NVIDIA Tegra based systems (Tegra APX,
>  	  Tegra 6xx and Tegra 2 series).

P.S. Since this patch relates to Tegra, you should CC the Tegra maintainers
and list; I've done so on this message. I also added Arnd; he might take
this through the arm-soc tree.

-- 
nvpublic
