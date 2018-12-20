From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 8/8] ARM: dts: Add stmpe-adc DT node to Toradex T30
 modules
Date: Thu, 20 Dec 2018 15:34:16 +0300
Message-ID: <9c380fe2-2db8-8bc6-15b6-d112f982b70a@gmail.com>
References: <20181212130649.15146-1-dev@pschenker.ch>
 <20181212130649.15146-8-dev@pschenker.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212130649.15146-8-dev@pschenker.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <dev@pschenker.ch>, jic23@kernel.org, marcel.ziswiler@toradex.com, stefan@agner.ch
Cc: thierry.reding@gmail.com, Philippe Schenker <philippe.schenker@toradex.com>, devicetree@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

Hello Philippe,

Please CC all the patches in the series to every recipient.

On 12.12.2018 16:06, Philippe Schenker wrote:
> Add the stmpe-adc DT node as found on Toradex T30 modules
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> ---
> 
> Changes in v4:
>  - New separate commit to hold T30 devicetree changes
> 
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/tegra30-apalis.dtsi  | 22 ++++++++++++++--------
>  arch/arm/boot/dts/tegra30-colibri.dtsi | 22 ++++++++++++++--------
>  2 files changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
> index 7f112f192fe9..850b0d13549a 100644
> --- a/arch/arm/boot/dts/tegra30-apalis.dtsi
> +++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
> @@ -976,11 +976,18 @@
>  			id = <0>;
>  			blocks = <0x5>;
>  			irq-trigger = <0x1>;
> +			/* 3.25 MHz ADC clock speed */
> +			st,adc-freq = <1>;
> +			/* 12-bit ADC */
> +			st,mod-12b = <1>;
> +			/* internal ADC reference */
> +			st,ref-sel = <0>;
> +			/* ADC converstion time: 80 clocks */
> +			st,sample-time = <4>;
> +			/* forbid to use ADC channels 3-0 (touch) */>  			stmpe_touchscreen {
>  				compatible = "st,stmpe-ts";
> -				/* 3.25 MHz ADC clock speed */
> -				st,adc-freq = <1>;
>  				/* 8 sample average control */
>  				st,ave-ctrl = <3>;
>  				/* 7 length fractional part in z */
> @@ -990,17 +997,16 @@
>  				 * current limit value
>  				 */
>  				st,i-drive = <1>;
> -				/* 12-bit ADC */
> -				st,mod-12b = <1>;
> -				/* internal ADC reference */
> -				st,ref-sel = <0>;
> -				/* ADC converstion time: 80 clocks */
> -				st,sample-time = <4>;

Does this change depend on some other patch in the series? Is this a backwards-compatible change? Please explain.

>  				/* 1 ms panel driver settling time */
>  				st,settling = <3>;
>  				/* 5 ms touch detect interrupt delay */
>  				st,touch-det-delay = <5>;
>  			};
> +
> +			stmpe_adc {
> +				compatible = "st,stmpe-adc";
> +				st,norequest-mask = <0x0F>;
> +			};
>  		};
>  
>  		/*
> diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
> index 35af03ca9e90..1f9198bb24ff 100644
> --- a/arch/arm/boot/dts/tegra30-colibri.dtsi
> +++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
> @@ -845,11 +845,18 @@
>  			id = <0>;
>  			blocks = <0x5>;
>  			irq-trigger = <0x1>;
> +			/* 3.25 MHz ADC clock speed */
> +			st,adc-freq = <1>;
> +			/* 12-bit ADC */
> +			st,mod-12b = <1>;
> +			/* internal ADC reference */
> +			st,ref-sel = <0>;
> +			/* ADC converstion time: 80 clocks */
> +			st,sample-time = <4>;
> +			/* forbid to use ADC channels 3-0 (touch) */
>  
>  			stmpe_touchscreen {
>  				compatible = "st,stmpe-ts";
> -				/* 3.25 MHz ADC clock speed */
> -				st,adc-freq = <1>;
>  				/* 8 sample average control */
>  				st,ave-ctrl = <3>;
>  				/* 7 length fractional part in z */
> @@ -859,17 +866,16 @@
>  				 * current limit value
>  				 */
>  				st,i-drive = <1>;
> -				/* 12-bit ADC */
> -				st,mod-12b = <1>;
> -				/* internal ADC reference */
> -				st,ref-sel = <0>;
> -				/* ADC converstion time: 80 clocks */
> -				st,sample-time = <4>;
>  				/* 1 ms panel driver settling time */
>  				st,settling = <3>;
>  				/* 5 ms touch detect interrupt delay */
>  				st,touch-det-delay = <5>;
>  			};
> +
> +			stmpe_adc {
> +				compatible = "st,stmpe-adc";
> +				st,norequest-mask = <0x0F>;
> +			};
>  		};
>  
>  		/*
> 
