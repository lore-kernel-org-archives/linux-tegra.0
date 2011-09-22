From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Thu, 22 Sep 2011 09:26:36 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1739554CB9@HQMAIL01.nvidia.com>
References: <1316698045-23190-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316698045-23190-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Thursday, September 22, 2011 7:27 AM:
> This patch causes the kernel uncompressor to determine the physical address
> of the SDRAM at runtime. This allows the kernel to boot on both tegra2 and
> tegra3 even though SDRAM is at different physical addresses on both SoCs.

Since this deals with Tegra, it should be mailed to/cc the Tegra
Maintainers and mailing list too (I've done that here). get_maintainer.pl
will no doubt list the main linux-kernel mailing list too.

> Change-Id: I91857a590946bbc54168c04bea3a5bd576d87824

And the internal Change-Id lines should be stripped for upstream
submissions.

> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> ---
>  arch/arm/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 4fda167..9fc0678 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -600,6 +600,7 @@ config ARCH_TEGRA
>  	select HAVE_CLK
>  	select HAVE_SCHED_CLOCK
>  	select ARCH_HAS_CPUFREQ
> +	select AUTO_ZRELADDR
>  	help
>  	  This enables support for NVIDIA Tegra based systems (Tegra APX,
>  	  Tegra 6xx and Tegra 2 series).
> --
> 1.7.7.rc0.72.g4b5ea.dirty

-- 
nvpublic
