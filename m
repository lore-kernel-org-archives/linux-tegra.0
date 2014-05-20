From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Tue, 20 May 2014 12:24:35 -0600
Message-ID: <537B9DE3.5020807@wwwdotorg.org>
References: <1400553346-23238-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400553346-23238-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/19/2014 08:35 PM, Dylan Reid wrote:
> Add a device node for the HDA controller found on Tegra124.

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi

> +	hda@0,70030000 {
> +		compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
> +		reg = <0x0 0x70030000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&tegra_car TEGRA124_CLK_HDA>,
> +		         <&tegra_car TEGRA124_CLK_HDA2HDMI>,
> +			 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
> +		clock-names = "hda", "hda2hdmi", "hdacodec_2x";

I think that should be "hda2codec_2x". Same for the reset-names property
below. This fix also needs to be propagated into the DT binding
documentation.
