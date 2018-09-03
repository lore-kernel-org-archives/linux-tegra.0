From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v2 15/34] ARM: tegra: apalis_t30: reorder backlight
 properties
Date: Mon, 3 Sep 2018 10:22:28 +0100
Message-ID: <20180903092228.7k46uf6qehgou5wx@holly.lan>
References: <20180831163817.23970-1-marcel@ziswiler.com>
 <20180831163817.23970-16-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180831163817.23970-16-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 31, 2018 at 06:37:57PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Reorder backlight properties.

This is a bit terse. Should the header explain why too?


> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v2: None
> 
>  arch/arm/boot/dts/tegra30-apalis-eval.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
> index 9f2392a05532..300ce726ff4d 100644
> --- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
> +++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
> @@ -185,13 +185,12 @@
>  
>  	backlight: backlight {
>  		compatible = "pwm-backlight";
> -		/* PWM_BKL1 */
> -		pwms = <&pwm 0 5000000>;
>  		brightness-levels = <255 231 223 207 191 159 127 0>;
>  		default-brightness-level = <6>;
>  		/* BKL1_ON */
>  		enable-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
>  		power-supply = <&reg_3v3>;
> +		pwms = <&pwm 0 5000000>; /* BKL1_PWM */
>  	};
>  
>  	gpio-keys {
> -- 
> 2.14.4
> 
