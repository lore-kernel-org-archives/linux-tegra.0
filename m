From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v5 2/3] ARM: dts: tegra: Fix unit_address_vs_reg and
 avoid_unnecessary_addr_size DTC warnings
Date: Thu, 17 May 2018 13:30:48 +0200
Message-ID: <6c8e0e10662c29b49b45e37d031a712b@agner.ch>
References: <1526543103-21668-1-git-send-email-krzk@kernel.org>
 <1526543103-21668-2-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526543103-21668-2-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Lucas Stach <dev@lynxeye.de>
List-Id: linux-tegra@vger.kernel.org

On 17.05.2018 09:45, Krzysztof Kozlowski wrote:
> Remove unneeded address/size cells properties and unit addresses to fix
> DTC warnings like:
> 
>     arch/arm/boot/dts/tegra30-apalis-eval.dtb: Warning (unit_address_vs_reg):
>         /i2c@7000d000/stmpe811@41/stmpe_touchscreen@0: node has a unit
> name, but no reg property
>     arch/arm/boot/dts/tegra30-apalis-eval.dtb: Warning
> (avoid_unnecessary_addr_size):
>         /i2c@7000d000/stmpe811@41: unnecessary
> #address-cells/#size-cells without "ranges" or child "reg" property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Looks good!

Reviewed-by: Stefan Agner <stefan@agner.ch>

> 
> ---
> 
> Changes since v4:
> 1. None
> ---
>  arch/arm/boot/dts/tegra30-apalis.dtsi  | 4 +---
>  arch/arm/boot/dts/tegra30-beaver.dts   | 3 ---
>  arch/arm/boot/dts/tegra30-colibri.dtsi | 2 --
>  3 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi
> b/arch/arm/boot/dts/tegra30-apalis.dtsi
> index 184f60c720fa..5038ca7b68af 100644
> --- a/arch/arm/boot/dts/tegra30-apalis.dtsi
> +++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
> @@ -590,8 +590,6 @@
>  		/* STMPE811 touch screen controller */
>  		stmpe811@41 {
>  			compatible = "st,stmpe811";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			reg = <0x41>;
>  			interrupts = <TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
>  			interrupt-parent = <&gpio>;
> @@ -600,7 +598,7 @@
>  			blocks = <0x5>;
>  			irq-trigger = <0x1>;
>  
> -			stmpe_touchscreen@0 {
> +			stmpe_touchscreen {
>  				compatible = "st,stmpe-ts";
>  				/* 3.25 MHz ADC clock speed */
>  				st,adc-freq = <1>;
> diff --git a/arch/arm/boot/dts/tegra30-beaver.dts
> b/arch/arm/boot/dts/tegra30-beaver.dts
> index 72369877d284..961934f70639 100644
> --- a/arch/arm/boot/dts/tegra30-beaver.dts
> +++ b/arch/arm/boot/dts/tegra30-beaver.dts
> @@ -1791,9 +1791,6 @@
>  			vccio-supply = <&vdd_5v_in_reg>;
>  
>  			regulators {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
>  				vdd1_reg: vdd1 {
>  					regulator-name = "vddio_ddr_1v2";
>  					regulator-min-microvolt = <1200000>;
> diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi
> b/arch/arm/boot/dts/tegra30-colibri.dtsi
> index cc46cedf80b9..a593dc8be47f 100644
> --- a/arch/arm/boot/dts/tegra30-colibri.dtsi
> +++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
> @@ -352,8 +352,6 @@
>  		/* STMPE811 touch screen controller */
>  		stmpe811@41 {
>  			compatible = "st,stmpe811";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			reg = <0x41>;
>  			interrupts = <TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
>  			interrupt-parent = <&gpio>;
