From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/6] arm/tegra: implement support for tegra30
Date: Thu, 27 Oct 2011 13:10:10 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173E1B49B6@HQMAIL01.nvidia.com>
References: <1319561644-6160-1-git-send-email-pdeschrijver@nvidia.com>
 <1319561644-6160-5-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1319561644-6160-5-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at  Tuesday, October 25, 2011 10:54 AM:
> From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some description here would be nice. And notes re: stuff like lack of
clock/... support yet, since this just gets stuff booted to a UART with
no clocks/devices/...

> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig

> +config ARCH_TEGRA_3x_SOC
> +	bool "Enable support for Tegra30 family"
> +	select CPU_V7
> +	select ARM_GIC
> +	select ARCH_REQUIRE_GPIOLIB
> +	select USB_ARCH_HAS_EHCI if USB_SUPPORT
> +	select USB_ULPI if USB_SUPPORT
> +	select USB_ULPI_VIEWPORT if USB_SUPPORT
> +	select USE_OF
> +	help
> +	  Support for NVIDIA Tegra T30 processorfamily, based on the
> +	  ARM CortexA9MP CPU and the ARM PL310 L2 cache controller

Either remove "family" or add a space before it to separate the words.

-- 
nvpublic
