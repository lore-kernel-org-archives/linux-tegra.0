From: Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] ARM: tegra: dalmore: add thermal zones for nct1008
Date: Mon, 25 Aug 2014 07:08:46 -0400
Message-ID: <20140825110844.GB12349@developer>
References: <1408948188-4181-1-git-send-email-wni@nvidia.com>
 <1408948188-4181-5-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408948188-4181-5-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 25, 2014 at 02:29:48PM +0800, Wei Ni wrote:
> From: lightning314 <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add dt node to describe the thermal zone for the nct1008.
> 
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
> index 5c21d21..94a1b5d 100644
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
> @@ -779,12 +779,14 @@
>  				<&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
>  		};
>  
> -		temperature-sensor@4c {
> +		nct1008: temperature-sensor@4c {
>  			compatible = "onnn,nct1008";
>  			reg = <0x4c>;
>  			vcc-supply = <&palmas_ldo6_reg>;
>  			interrupt-parent = <&gpio>;
>  			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_LOW>;
> +
> +			#thermal-sensor-cells = <1>;
>  		};
>  	};
>  
> @@ -1283,4 +1285,20 @@
>  			 <&tegra_car TEGRA114_CLK_EXTERN1>;
>  		clock-names = "pll_a", "pll_a_out0", "mclk";
>  	};
> +
> +	thermal-zones {
> +		nct1008-local {
> +			polling-delay-passive = <2000>; /* milliseconds */
> +			polling-delay = <0>; /* milliseconds */
> +
> +			thermal-sensors = <&nct1008 0>;
> +		};
> +
> +		nct1008-remote {
> +			polling-delay-passive = <1000>; /* milliseconds */
> +			polling-delay = <0>; /* milliseconds */
> +
> +			thermal-sensors = <&nct1008 1>;
> +		};
> +	};

The above zones misses the required properties, as per the thermal.txt
binding description. Could you please have a look on those that are
required and improve the zones above?

>  };
> -- 
> 1.8.1.5
> 
