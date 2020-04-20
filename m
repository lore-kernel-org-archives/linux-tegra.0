From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: tegra: Make the RTC a wakeup source on Jetson
 TX2
Date: Mon, 20 Apr 2020 15:43:51 +0100
Message-ID: <07d3ac3a-cfa1-16f3-0401-df478c8e9831@nvidia.com>
References: <20200417171117.2556374-1-thierry.reding@gmail.com>
 <20200417171117.2556374-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200417171117.2556374-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 17/04/2020 18:11, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The RTC found on the MAX77620 PMIC can be used as a wakeup source on
> Jetson TX2, which is useful to wake the system from suspend at a given
> time.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> index da96de04d003..7a0fa157f48c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> @@ -221,7 +221,8 @@ pmic: pmic@3c {
>  				compatible = "maxim,max77620";
>  				reg = <0x3c>;
>  
> -				interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pmc>;
> +				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
>  				#interrupt-cells = <2>;
>  				interrupt-controller;
>  
> @@ -379,6 +380,10 @@ vdd_pex: ldo8 {
>  						regulator-max-microvolt = <1050000>;
>  					};
>  				};
> +
> +				rtc {
> +					wakeup-source;
> +				};
>  			};
>  		};
>  	};
> 


Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
