From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Add Avionic Design Plutux support
Date: Fri, 27 Jul 2012 14:22:33 -0600
Message-ID: <5012F889.1020004@wwwdotorg.org>
References: <1343228775-1330-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343228775-1330-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/25/2012 09:06 AM, Thierry Reding wrote:
> The Plutux is a set-top box device based on the Tamonten SOM and can be
> connected to a display via HDMI.

> diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/tegra20-plutux.dts

> +	regulators {
> +		compatible = "simple-bus";
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;

Depending on the outcome of the simple-bus discussion I mentioned on
IRC, this might want to be updated to match that. We'll see!

> +	sound {
> +		compatible = "nvidia,tegra-audio-wm8903-harmony",
> +			     "nvidia,tegra-audio-wm8903";

I think that first compatible value should be more like
"at,tegra-audio-plutux" or something like that; the driver itself
matches on "nvidia,tegra-audio-wm8903" only, and the first compatible
value is just in case we ever need board-specific fixes/hacks in the driver.

> diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Makefile.boot

>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-trimslice.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-ventana.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-whistler.dtb
> +dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-plutux.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_3x_SOC) += tegra30-cardhu.dtb

It'd be nice to keep that sorted first on 2x/3x SoC version, then
alphabetically.
