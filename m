From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 6/9] ARM: dt: tegra114: Add new SoC base, Tegra 114 SoC
Date: Tue, 08 Jan 2013 15:49:27 -0700
Message-ID: <50ECA277.5050907@wwwdotorg.org>
References: <1357649263-1098-1-git-send-email-hdoyu@nvidia.com> <1357649263-1098-7-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357649263-1098-7-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/08/2013 05:47 AM, Hiroshi Doyu wrote:
> Initial support for Tegra 114 SoC. This is expected to be included in
> the board DTS files, Tegra 114 SoC based evaluation board family.

> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi

> +	gic: interrupt-controller {
> +		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> +		reg = <0x50041000 0x1000
> +		       0x50042000 0x1000>;
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +	};

Last time around, Marc Zyngier asked:

> If this is indeed an A15 GIC, how about adding the GICH and GICV
> regions, as well as the VGIC maintenance interrupt?
