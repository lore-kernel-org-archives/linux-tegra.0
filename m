From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 6/6] arm/tegra: add support for tegra30 based board
 cardhu
Date: Thu, 27 Oct 2011 13:22:04 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173E1B49C9@HQMAIL01.nvidia.com>
References: <1319561644-6160-1-git-send-email-pdeschrijver@nvidia.com>
 <1319561644-6160-7-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1319561644-6160-7-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Tuesday, October 25, 2011 10:54 AM:
> From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some description of what Cardhu is and what's done in the patch please.

> diff --git a/arch/arm/boot/dts/tegra-cardhu.dts b/arch/arm/boot/dts/tegra-cardhu.dts
> new file mode 100644
> index 0000000..0f3f8a8
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra-cardhu.dts
> @@ -0,0 +1,37 @@
> +/dts-v1/;
> +
> +/include/ "tegra30.dtsi"
> +
> +/ {
> +	model = "NVIDIA Tegra30 Cardhu evaluation board";
> +	compatible = "nvidia,cardhu", "nvidia,tegra30";
> +
> +	memory {
> +		device_type = "memory";

The other boards don't contain this. If they should, can you please post
a patch to add it to them all? Thanks.

> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
> index 21c99f9..3ff191a 100644
> --- a/arch/arm/mach-tegra/Kconfig
> +++ b/arch/arm/mach-tegra/Kconfig
> @@ -83,6 +83,12 @@ config MACH_VENTANA
>         help
>           Support for the nVidia Ventana development platform
> 
> +config MACH_CARDHU
> +       bool "Cardhu board"
> +       select MACH_TEGRA_DT
> +       help
> +         Support for the nVidia Cardhu development platform

This should depend on Tegra30 support.

Please use the capitalization NVIDIA; we should do a pass and clean up
any existing instances sometime.

-- 
nvpublic
