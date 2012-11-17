From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4 2/2] ARM: tegra: paz00: enable backlight
Date: Sat, 17 Nov 2012 16:04:16 +0100
Message-ID: <4922850.oFZuYxy0MN@ax5200p>
References: <138e6f406aef20f6257a8f90af45865bd9c88092.1353107865.git.marvin24@gmx.de> <4de446eaf895ffa01d397cf70cec02620e16f690.1353107865.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4de446eaf895ffa01d397cf70cec02620e16f690.1353107865.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

since backlight will only come in 3.9, I can add some remarks myself, so I 
don't forget them next time.

On Saturday 17 November 2012 00:20:32 Marc Dietrich wrote:
> This enables backlight using power sequences.
> 
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-paz00.dts |   72
> +++++++++++++++++++++++++++++++++++ 1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts
> b/arch/arm/boot/dts/tegra20-paz00.dts index 8a14e1d..7349aa3 100644
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> @@ -15,6 +15,10 @@
>  			rgb {
>  				status = "okay";
>  				nvidia,ddc-i2c-bus = <&lvds_ddc>;
> +
> +				display {
> +					nvidia,backlight = <&backlight>;
> +				};
>  			};
>  		};
>  	};
> @@ -461,6 +465,74 @@
>  		};
>  	};
> 
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 16 32 48 64 80 96 112 128 144 160 176 192 208 
224
> 240 255>; +		default-brightness-level = <12>;
> +
> +		/* resources used by the power sequences */
> +		pwms = <&pwm 0 5000000>;
> +		pwm-names = "backlight";
> +
> +		power-sequences {
> +			power-on {
> +				step0 {
> +					type = "pwm";
> +					id = "backlight";
> +					enable;
> +				};
> +				step1 {
> +					type = "gpio";
> +					gpio = <&gpio 4 0>;   /* gpio PA4, en_vdd_pnl  */
> +					value = <1>;
> +				};
> +				step2 {
> +					type = "gpio";
> +					gpio = <&gpio 176 0>; /* gpio PW0, bl_vdd */

this one needs to be removed as it is not used. There is bl_pwm (gpio U3) 
however which I cannot sort in here.

> +					value = <1>;
> +				};
> +				step3 {
> +					type = "gpio";
> +					gpio = <&gpio 102 0>; /* gpio PM6, lvds_shdn */
> +					value = <1>;
> +				};
> +				step4 {
> +					type = "gpio";
> +					gpio = <&gpio 164 0>; /* gpio PU4, bl_enb */
> +					value = <1>;
> +				};
> +			};
> +
> +			power-off {
> +				step4 {
> +					type = "gpio";
> +					gpio = <&gpio 164 0>; /* gpio PU4, bl_enb */
> +					value = <0>;

and this is totally bogus.

/me notes: better do not send patches after midnight!

Marc
