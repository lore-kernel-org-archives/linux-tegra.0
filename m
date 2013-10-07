From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 7/9] ARM: tegra: Enable DSI support on Dalmore
Date: Mon, 07 Oct 2013 15:25:52 -0600
Message-ID: <525326E0.7080703@wwwdotorg.org>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com> <1381146528-18069-8-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-8-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 05:48 AM, Thierry Reding wrote:
> Dalmore has a 10.1" WUXGA panel connected to one of the DSI outputs of
> the Tegra114.

> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts

> -		lcd_bl_en_reg: regulator@2 {
> +		usb1_vbus_reg: regulator@2 {
>  			compatible = "regulator-fixed";
>  			reg = <2>;
> -			regulator-name = "lcd_bl_en";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			gpio = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> -		};
> -
> -		usb1_vbus_reg: regulator@3 {
> -			compatible = "regulator-fixed";
> -			reg = <3>;
>  			regulator-name = "usb1_vbus";
>  			regulator-min-microvolt = <5000000>;
>  			regulator-max-microvolt = <5000000>;

Rather than renumbering all the regulators, can you just delete the one
regulator and leave a gap in the numbering? That'd make the diff a lot
smaller and clearer. There's no need for the reg values to be contiguous
here, so I don't think the renumbering is useful in-and-of-itself.
