From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 5/6] ARM: tegra: Add Tegra20 GMI support
Date: Thu, 3 Nov 2016 10:29:14 +0000
Message-ID: <d8ab8a32-8019-45e6-59b1-8914937e1705@nvidia.com>
References: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
 <1477576872-2665-6-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477576872-2665-6-git-send-email-mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 27/10/16 15:01, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Add a device node for the GMI controller found on Tegra20.
>
> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
> ---
>
> Changes in v2:
> - added address-cells, size-cells and ranges properties
>
> Changes in v3:
> - fixed range address which is not the same as Tegra30.
>
>  arch/arm/boot/dts/tegra20.dtsi | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 2207c08..b22cddb 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -1,4 +1,4 @@
> -#include <dt-bindings/clock/tegra20-car.h>
> +include <dt-bindings/clock/tegra20-car.h>

After fixing up this, can you also ...

>  #include <dt-bindings/gpio/tegra-gpio.h>
>  #include <dt-bindings/pinctrl/pinctrl-tegra.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -376,6 +376,20 @@
>  		status = "disabled";
>  	};
>
> +

Drop this additional line?

> +	gmi@70009000 {
> +		compatible = "nvidia,tegra20-gmi";
> +		reg = <0x70009000 0x1000>;
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0xd0000000 0xfffffff>;
> +		clocks = <&tegra_car TEGRA20_CLK_NOR>;
> +		clock-names = "gmi";
> +		resets = < &tegra_car 42>;

Get rid of this additional space?

> +		reset-names = "gmi";
> +		status = "disabled";
> +	};
> +

Otherwise ...

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
