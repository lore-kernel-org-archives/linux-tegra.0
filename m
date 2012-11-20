From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] ARM: tegra: ventana: enable internal display
Date: Tue, 20 Nov 2012 09:37:41 +0800
Message-ID: <50AADEE5.2030302@nvidia.com>
References: <1353318187-26484-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353318187-26484-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Great. So this means I2C2 is used for LCD and HDMI both. While HDMI is
not plugged, the EDID of LCD will be checked out, right?

Mark
On 11/19/2012 05:43 PM, Alexandre Courbot wrote:
> Enable host1x and add the rgb output.
> 
> Also add the power sequence that controls the backlight and panel. The
> sequence strictly follows the order and timings of the panel
> specification.
> 
> Currently the backlight device controls both backlight and panel, this
> needs to be fixed once the panel framework supports power sequences.
> 
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-ventana.dts | 108 +++++++++++++++++++++++++++++++++-
>  1 file changed, 105 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
> index adc4754..31c9c5c 100644
> --- a/arch/arm/boot/dts/tegra20-ventana.dts
> +++ b/arch/arm/boot/dts/tegra20-ventana.dts
> @@ -10,6 +10,15 @@
>  		reg = <0x00000000 0x40000000>;
>  	};
>  
> +	host1x {
> +		dc@54200000 {
> +			rgb {
> +				status = "okay";
> +				nvidia,ddc-i2c-bus = <&lcd_ddc>;
> +			};
> +		};
> +	};
> +
>  	pinmux {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&state_default>;
> @@ -341,7 +350,7 @@
>  			#size-cells = <0>;
>  		};
>  
> -		i2c@1 {
> +		lcd_ddc: i2c@1 {
>  			reg = <1>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> @@ -516,6 +525,99 @@
>  		bus-width = <8>;
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 16 32 48 64 80 96 112 128 144 160 176 192 208 224 240 255>;
> +		default-brightness-level = <12>;
> +
> +		/* resources used by the power sequences */
> +		pwms = <&pwm 2 5000000>;
> +		pwm-names = "backlight";
> +		power-supply = <&vdd_bl_reg>;
> +		panel-supply = <&vdd_panel_reg>;
> +
> +		power-sequences {
> +			power-on {
> +				/*
> +				 * Panel power and LVDS enable.
> +				 * TODO: move into the panel device as soon as
> +				 * panel framework supports power sequences.
> +				 */
> +				step0 {
> +					type = "regulator";
> +					id = "panel";
> +					enable;
> +				};
> +				step1 {
> +					type = "gpio";
> +					gpio = <&gpio 10 0>;
> +					value = <1>;
> +				};
> +				step2 {
> +					type = "delay";
> +					delay = <200000>;
> +				};
> +				/* Backlight sequence. This belongs here. */
> +				step3 {
> +					type = "regulator";
> +					id = "power";
> +					enable;
> +				};
> +				step4 {
> +					type = "delay";
> +					delay = <10000>;
> +				};
> +				step5 {
> +					type = "pwm";
> +					id = "backlight";
> +					enable;
> +				};
> +				step6 {
> +					type = "gpio";
> +					gpio = <&gpio 28 0>;
> +					value = <1>;
> +				};
> +			};
> +
> +			power-off {
> +				step0 {
> +					type = "gpio";
> +					gpio = <&gpio 28 0>;
> +					value = <0>;
> +				};
> +				step1 {
> +					type = "pwm";
> +					id = "backlight";
> +					disable;
> +				};
> +				step2 {
> +					type = "delay";
> +					delay = <10000>;
> +				};
> +				step3 {
> +					type = "regulator";
> +					id = "power";
> +					disable;
> +				};
> +				/* This also belongs to the panel sequence */
> +				step4 {
> +					type = "delay";
> +					delay = <200000>;
> +				};
> +				step5 {
> +					type = "gpio";
> +					gpio = <&gpio 10 0>;
> +					value = <0>;
> +				};
> +				step6 {
> +					type = "regulator";
> +					id = "panel";
> +					disable;
> +				};
> +			};
> +		};
> +	};
> +
>  	regulators {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> @@ -549,7 +651,7 @@
>  			enable-active-high;
>  		};
>  
> -		regulator@3 {
> +		vdd_panel_reg: regulator@3 {
>  			compatible = "regulator-fixed";
>  			reg = <3>;
>  			regulator-name = "vdd_pnl";
> @@ -559,7 +661,7 @@
>  			enable-active-high;
>  		};
>  
> -		regulator@4 {
> +		vdd_bl_reg: regulator@4 {
>  			compatible = "regulator-fixed";
>  			reg = <4>;
>  			regulator-name = "vdd_bl";
> 
