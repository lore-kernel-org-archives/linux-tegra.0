From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 1/2] arm64: tegra: add ACONNECT, ADMA and AGIC nodes
Date: Wed, 12 Jun 2019 18:29:17 +0530
Message-ID: <ad169cb8-733c-96d4-5eee-1131c53320b6@nvidia.com>
References: <1560243406-2535-1-git-send-email-spujar@nvidia.com>
 <1f2020ae-12f3-2ad1-c844-b4b7885d41f9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1f2020ae-12f3-2ad1-c844-b4b7885d41f9@nvidia.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: mkumard@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 6/12/2019 6:06 PM, Jon Hunter wrote:
> On 11/06/2019 09:56, Sameer Pujar wrote:
>> Add DT nodes for following devices on Tegra186 and Tegra194
>>   * ACONNECT
>>   * ADMA
>>   * AGIC
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra186.dtsi | 68 ++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 68 ++++++++++++++++++++++++++++++++
>>   2 files changed, 136 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>> index 426ac0b..ccd902b 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>> @@ -1295,4 +1295,72 @@
>>   				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>>   		interrupt-parent = <&gic>;
>>   	};
>> +
>> +	aconnect@2a41000 {
>> +		compatible = "nvidia,tegra210-aconnect";
>> +		clocks = <&bpmp TEGRA186_CLK_APE>,
>> +			 <&bpmp TEGRA186_CLK_APB2APE>;
>> +		clock-names = "ape", "apb2ape";
>> +		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_AUD>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x02930000 0x0 0x02930000 0x50000
>> +			  0x02a41000 0x0 0x02a41000 0x3000>;
> We only need one address range here that covers the entire APE.
will update.
>
>> +		status = "disabled";
>> +
>> +		dma-controller@2930000 {
>> +			compatible = "nvidia,tegra186-adma";
>> +			reg = <0x02930000 0x50000>;
>> +			interrupt-parent = <&agic>;
>> +			interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
>> +				      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>> +			#dma-cells = <1>;
>> +			clocks = <&bpmp TEGRA186_CLK_AHUB>;
>> +			clock-names = "d_audio";
>> +			status = "disabled";
>> +		};
>> +
>> +		agic: agic@2a41000 {
>> +			compatible = "nvidia,tegra210-agic";
>> +			#interrupt-cells = <3>;
>> +			interrupt-controller;
>> +			reg = <0x02a41000 0x1000>,
>> +			      <0x02a41000 0x2000>;
> These addresses should not overlap.
typo! will fix, Thanks.
>
> Cheers
> Jon
>
