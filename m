From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: USB for Tegra114 Dalmore
Date: Wed, 31 Jul 2013 22:18:55 +0400
Message-ID: <51F9550F.3080503@cogentembedded.com>
References: <1375292543-7896-1-git-send-email-ttynkkynen@nvidia.com> <1375292543-7896-3-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375292543-7896-3-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello.

On 07/31/2013 09:42 PM, Tuomas Tynkkynen wrote:

> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> Device tree entries for the three EHCI controllers on Tegra114.
> Enables the the third controller (USB host) on Dalmore.

    I would have done the board patch separately from the SoC one.

> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[...]

> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
> index abf6c40..2905145 100644
> --- a/arch/arm/boot/dts/tegra114.dtsi
> +++ b/arch/arm/boot/dts/tegra114.dtsi
> @@ -430,6 +430,68 @@
>   		status = "disable";
>   	};
>
> +	usb@7d000000 {
> +		compatible = "nvidia,tegra30-ehci", "usb-ehci";
> +		reg = <0x7d000000 0x4000>;
> +		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +		phy_type = "utmi";
> +		clocks = <&tegra_car TEGRA114_CLK_USBD>;
> +		nvidia,phy = <&phy1>;
> +		status = "disabled";
> +	};
> +
> +	phy1: usb-phy@7d000000 {

    At the same address as the previous node?

> +		compatible = "nvidia,tegra30-usb-phy";
> +		reg = <0x7d000000 0x4000 0x7d000000 0x4000>;

    Hm, there must be some mistake: two similar register ranges.

> +	usb@7d008000 {
> +		compatible = "nvidia,tegra30-ehci", "usb-ehci";
> +		reg = <0x7d008000 0x4000>;
> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +		phy_type = "utmi";
> +		clocks = <&tegra_car TEGRA114_CLK_USB3>;
> +		nvidia,phy = <&phy3>;
> +		status = "disabled";
> +	};
> +
> +	phy3: usb-phy@7d008000 {

    Again at the same address as previous node?

> +		compatible = "nvidia,tegra30-usb-phy";
> +		reg = <0x7d008000 0x4000 0x7d000000 0x4000>;

    Second range conflicts with previous nodes.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
