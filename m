From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM64: boot: dts: Add regulators for Tegra210 Smaug
Date: Mon, 6 Jun 2016 12:09:41 +0530
Message-ID: <57551AAD.2020805@nvidia.com>
References: <1464985365-11612-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464985365-11612-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Saturday 04 June 2016 01:52 AM, Rhyland Klein wrote:
> +
> +			max77620_default: pinmux@0 {
> +				pin_gpio {
> +					pins = "gpio0", "gpio1", "gpio2", "gpio5",
> +					       "gpio6", "gpio7";
gpio5 and gpio6 are already there in below nodes and hence it is not 
needed here.

> +					function = "gpio";
> +				};
> +
> +				/*
> +				 * GPIO3 is used to en_pp3300, and it is part of power
> +				 * sequence, So it must be sequenced up (automatically
> +				 * set by OTP) and down properly.
> +				 */
> +				pin_gpio3 {
> +					pins = "gpio3";
> +					function = "fps-out";
> +					drive-open-drain = <1>;
> +					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
> +					maxim,active-fps-power-up-slot = <4>;
> +					maxim,active-fps-power-down-slot = <2>;
> +				};
> +
> +				pin_gpio5_6_7 {
node name should be gpio5_6 as there is no gpio7 inside this node.


> +
> +			regulators {
> +				in-ldo0-1-supply = <&pp1350>;
> +				in-ldo2-supply = <&pp3300>;
> +				in-ldo3-5-supply = <&pp3300>;
> +				in-ldo7-8-supply = <&pp1350>;
> +
> +				ppvar_soc: sd0 {
> +					regulator-name = "PPVAR_SOC";
> +					regulator-min-microvolt = <825000>;
> +					regulator-max-microvolt = <1125000>;
> +					regulator-enable-ramp-delay = <146>;
> +					regulator-disable-ramp-delay = <4080>;
> +					regulator-ramp-delay = <27500>;
> +					regulator-ramp-delay-scale = <300>;

There is no disable-ramp-delay in mainline.
Please use the correct value for property as:
                                      regulator-ramp-delay = <9000>;
                                      maxim,ramp-rate-setting = <27500>;


instead of regulator-ramp-delay and regulator-ramp-delay-scale.
The property differs from downstream.

regulator-ramp-delay is what you see in platform and 
maxim,ramp-rate-setting is what you want in register.
