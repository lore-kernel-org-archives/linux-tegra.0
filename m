From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 1/2] ARM: dts: tegra20: restore address order
Date: Thu, 26 Jul 2018 10:38:20 +0200
Message-ID: <f62f73d659eecb8fe96983038e83621a@agner.ch>
References: <20180720163426.4410-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720163426.4410-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 20.07.2018 18:34, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Commit 6c468f109884 ("ARM: dts: tegra: add Tegra20 NAND flash
> controller node") introduced the nand-controller node. However, it got
> added at the wrong spot not honoring the address order. Fix this.
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> 
> ---
> 
>  arch/arm/boot/dts/tegra20.dtsi | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 979f38293fe5..a22c6a8f8f83 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -419,19 +419,6 @@
>  		status = "disabled";
>  	};
>  
> -	gmi@70009000 {
> -		compatible = "nvidia,tegra20-gmi";
> -		reg = <0x70009000 0x1000>;
> -		#address-cells = <2>;
> -		#size-cells = <1>;
> -		ranges = <0 0 0xd0000000 0xfffffff>;
> -		clocks = <&tegra_car TEGRA20_CLK_NOR>;
> -		clock-names = "gmi";
> -		resets = <&tegra_car 42>;
> -		reset-names = "gmi";
> -		status = "disabled";
> -	};
> -
>  	nand-controller@70008000 {
>  		compatible = "nvidia,tegra20-nand";
>  		reg = <0x70008000 0x100>;
> @@ -447,6 +434,19 @@
>  		status = "disabled";
>  	};
>  
> +	gmi@70009000 {
> +		compatible = "nvidia,tegra20-gmi";
> +		reg = <0x70009000 0x1000>;
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0xd0000000 0xfffffff>;
> +		clocks = <&tegra_car TEGRA20_CLK_NOR>;
> +		clock-names = "gmi";
> +		resets = <&tegra_car 42>;
> +		reset-names = "gmi";
> +		status = "disabled";
> +	};
> +
>  	pwm: pwm@7000a000 {
>  		compatible = "nvidia,tegra20-pwm";
>  		reg = <0x7000a000 0x100>;
