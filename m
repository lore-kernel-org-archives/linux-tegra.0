From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 1/2] arm64: tegra: add ACONNECT, ADMA and AGIC nodes
Date: Thu, 13 Jun 2019 15:09:11 +0100
Message-ID: <3f1ebc62-1498-f26c-9044-8634242fc61e@nvidia.com>
References: <1560422477-11242-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560422477-11242-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: mkumard@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 13/06/2019 11:41, Sameer Pujar wrote:
> Add DT nodes for following devices on Tegra186 and Tegra194
>  * ACONNECT
>  * ADMA
>  * AGIC
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  changes from previous revision
>   * fixed size value for ranges property in aconnect
> 
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 67 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 67 ++++++++++++++++++++++++++++++++
>  2 files changed, 134 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> index 426ac0b..5e9fe7e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> @@ -1295,4 +1295,71 @@
>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  		interrupt-parent = <&gic>;
>  	};
> +
> +	aconnect {
> +		compatible = "nvidia,tegra210-aconnect";
> +		clocks = <&bpmp TEGRA186_CLK_APE>,
> +			 <&bpmp TEGRA186_CLK_APB2APE>;
> +		clock-names = "ape", "apb2ape";
> +		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_AUD>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x02900000 0x0 0x02900000 0x200000>;
> +		status = "disabled";
> +
> +		dma-controller@2930000 {
> +			compatible = "nvidia,tegra186-adma";
> +			reg = <0x02930000 0x50000>;

Sorry but I have been double checking these register addresses and I
wonder if this should be a length of 0x10000. The 0x50000 includes all
the ranges where the registers are paged, so I don't think that this is
correct including these.

> +			interrupt-parent = <&agic>;
> +			interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			clocks = <&bpmp TEGRA186_CLK_AHUB>;
> +			clock-names = "d_audio";
> +			status = "disabled";
> +		};
> +
> +		agic: interrupt-controller@2a41000 {

I think that this should be 2a40000 but otherwise looks correct.

Sorry but you are too quick for me to keep up!

Cheers
Jon

-- 
nvpublic
