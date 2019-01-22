From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 1/2] ARM: dts: Add stmpe-adc DT node to Toradex iMX6
 modules
Date: Tue, 22 Jan 2019 15:53:30 +0100
Message-ID: <959c74d19959e0cf2261df7f3deaf536@agner.ch>
References: <20190122132135.5012-1-dev@pschenker.ch>
 <20190122132135.5012-2-dev@pschenker.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122132135.5012-2-dev@pschenker.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <dev@pschenker.ch>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, marcel.ziswiler@toradex.com, max.krummenacher@toradex.com, Philippe Schenker <philippe.schenker@toradex.com>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, NXP Linux Team <linux-imx@nxp.com>
List-Id: linux-tegra@vger.kernel.org

On 22.01.2019 14:21, Philippe Schenker wrote:
> From: Philippe Schenker <philippe.schenker@toradex.com>
> 
> Add the stmpe-adc DT node as found on Toradex iMX6 modules
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
> 
>  arch/arm/boot/dts/imx6qdl-apalis.dtsi  | 22 ++++++++++++++--------
>  arch/arm/boot/dts/imx6qdl-colibri.dtsi | 22 ++++++++++++++--------
>  2 files changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> index 8380f1b26826..e8c7ef7e078a 100644
> --- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> @@ -332,11 +332,17 @@
>  		id = <0>;
>  		blocks = <0x5>;
>  		irq-trigger = <0x1>;
> +		/* 3.25 MHz ADC clock speed */
> +		st,adc-freq = <1>;
> +		/* 12-bit ADC */
> +		st,mod-12b = <1>;
> +		/* internal ADC reference */
> +		st,ref-sel = <0>;
> +		/* ADC converstion time: 80 clocks */
> +		st,sample-time = <4>;
>  
>  		stmpe_touchscreen {
>  			compatible = "st,stmpe-ts";
> -			/* 3.25 MHz ADC clock speed */
> -			st,adc-freq = <1>;
>  			/* 8 sample average control */
>  			st,ave-ctrl = <3>;
>  			/* 7 length fractional part in z */
> @@ -346,17 +352,17 @@
>  			 * current limit value
>  			 */
>  			st,i-drive = <1>;
> -			/* 12-bit ADC */
> -			st,mod-12b = <1>;
> -			/* internal ADC reference */
> -			st,ref-sel = <0>;
> -			/* ADC converstion time: 80 clocks */
> -			st,sample-time = <4>;
>  			/* 1 ms panel driver settling time */
>  			st,settling = <3>;
>  			/* 5 ms touch detect interrupt delay */
>  			st,touch-det-delay = <5>;
>  		};
> +
> +		stmpe_adc {
> +			compatible = "st,stmpe-adc";
> +			/* forbid to use ADC channels 3-0 (touch) */
> +			st,norequest-mask = <0x0F>;
> +		};
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> index 87e15e7cb32b..eb8603a2444e 100644
> --- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> @@ -262,11 +262,17 @@
>  		id = <0>;
>  		blocks = <0x5>;
>  		irq-trigger = <0x1>;
> +		/* 3.25 MHz ADC clock speed */
> +		st,adc-freq = <1>;
> +		/* 12-bit ADC */
> +		st,mod-12b = <1>;
> +		/* internal ADC reference */
> +		st,ref-sel = <0>;
> +		/* ADC converstion time: 80 clocks */
> +		st,sample-time = <4>;
>  
>  		stmpe_touchscreen {
>  			compatible = "st,stmpe-ts";
> -			/* 3.25 MHz ADC clock speed */
> -			st,adc-freq = <1>;
>  			/* 8 sample average control */
>  			st,ave-ctrl = <3>;
>  			/* 7 length fractional part in z */
> @@ -276,17 +282,17 @@
>  			 * current limit value
>  			 */
>  			st,i-drive = <1>;
> -			/* 12-bit ADC */
> -			st,mod-12b = <1>;
> -			/* internal ADC reference */
> -			st,ref-sel = <0>;
> -			/* ADC converstion time: 80 clocks */
> -			st,sample-time = <4>;
>  			/* 1 ms panel driver settling time */
>  			st,settling = <3>;
>  			/* 5 ms touch detect interrupt delay */
>  			st,touch-det-delay = <5>;
>  		};
> +
> +		stmpe_adc {
> +			compatible = "st,stmpe-adc";
> +			/* forbid to use ADC channels 3-0 (touch) */
> +			st,norequest-mask = <0x0F>;
> +		};
>  	};
>  };
