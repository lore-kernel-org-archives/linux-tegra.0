From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/2] arm64: tegra: add ACONNECT, ADMA and AGIC nodes
Date: Tue, 4 Jun 2019 10:07:53 +0100
Message-ID: <9f9962fc-a261-aecc-b4c5-408a75ebcb5f@nvidia.com>
References: <1557143908-5850-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557143908-5850-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 06/05/2019 12:58, Sameer Pujar wrote:
> Add DT nodes for following devices on Tegra186 and Tegra194
>  * ACONNECT
>  * ADMA
>  * AGIC
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 67 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 67 ++++++++++++++++++++++++++++++++
>  2 files changed, 134 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> index 6e2b6ce..2c432c9 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> @@ -1153,4 +1153,71 @@
>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  		interrupt-parent = <&gic>;
>  	};
> +
> +	aconnect@2a41000 {
> +		compatible = "nvidia,tegra210-aconnect";
> +		clocks = <&bpmp TEGRA186_CLK_APE>,
> +			 <&bpmp TEGRA186_CLK_APB2APE>;
> +		clock-names = "ape", "apb2ape";
> +		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_AUD>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;

My recollection is that non-empty range is preferred from what Rob told
me in the past. See the Tegra210 binding.

> +		status = "disabled";
> +
> +		dma@2930000 {

Although I did not do this for Tegra210, I think that the preferred
convention is 'dma-controller@xxxxxxxxx'.

> +			compatible = "nvidia,tegra186-adma";
> +			reg = <0x0 0x02930000 0x0 0x50000>;
> +			interrupt-parent = <&agic>;
> +			interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#dma-cells = <1>;
> +			clocks = <&bpmp TEGRA186_CLK_AHUB>;
> +			clock-names = "d_audio";
> +			status = "disabled";
> +		};
> +
> +		agic: agic@2a41000 {
> +			compatible = "nvidia,tegra210-agic";
> +			#interrupt-cells = <4>;

Why 4? This does not match the binding document for the arm-gic.

> +			interrupt-controller;
> +			reg = <0x0 0x02a41000 0x0 0x1000>,
> +			      <0x0 0x02a42000 0x0 0x1000>;

I believe that the 2nd address range should have size 0x2000 for the CPU
interfaces.

> +			interrupts = <GIC_SPI 145 (GIC_CPU_MASK_SIMPLE(4) |
> +					IRQ_TYPE_LEVEL_HIGH)>;
> +			clocks = <&bpmp TEGRA186_CLK_APE>;
> +			clock-names = "clk";
> +			status = "disabled";
> +		};
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index c77ca21..dcab504 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1054,4 +1054,71 @@
>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  		interrupt-parent = <&gic>;
>  	};
> +
> +	aconnect@2a41000 {
> +		compatible = "nvidia,tegra210-aconnect";
> +		clocks = <&bpmp TEGRA194_CLK_APE>,
> +			 <&bpmp TEGRA194_CLK_APB2APE>;
> +		clock-names = "ape", "apb2ape";
> +		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_AUD>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;

Same as above.

> +		status = "disabled";
> +
> +		dma@2930000 {

Same as above.

> +			compatible = "nvidia,tegra186-adma";
> +			reg = <0x0 0x02930000 0x0 0x50000>;
> +			interrupt-parent = <&agic>;
> +			interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
> +				      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#dma-cells = <1>;
> +			clocks = <&bpmp TEGRA194_CLK_AHUB>;
> +			clock-names = "d_audio";
> +			status = "disabled";
> +		};
> +
> +		agic: agic@2a41000 {
> +			compatible = "nvidia,tegra210-agic";
> +			#interrupt-cells = <4>;

Same as above.

> +			interrupt-controller;
> +			reg = <0x0 0x02a41000 0x0 0x1000>,
> +			      <0x0 0x02a42000 0x0 0x1000>;

Same as above.

> +			interrupts = <GIC_SPI 145 (GIC_CPU_MASK_SIMPLE(4) |
> +					IRQ_TYPE_LEVEL_HIGH)>;
> +			clocks = <&bpmp TEGRA194_CLK_APE>;
> +			clock-names = "clk";
> +			status = "disabled";
> +		};
> +	};
>  };
> 

Cheers
Jon

-- 
nvpublic
