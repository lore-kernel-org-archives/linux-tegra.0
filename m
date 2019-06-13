From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 1/2] arm64: tegra: add ACONNECT, ADMA and AGIC nodes
Date: Thu, 13 Jun 2019 15:17:02 +0530
Message-ID: <6a4b5fac-68cd-542a-a907-0d80713f9d82@nvidia.com>
References: <1560417053-2966-1-git-send-email-spujar@nvidia.com>
 <8a71e670-7943-6bce-ba61-3f020fd9450d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8a71e670-7943-6bce-ba61-3f020fd9450d@nvidia.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: mkumard@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 6/13/2019 3:12 PM, Jon Hunter wrote:
> On 13/06/2019 10:10, Sameer Pujar wrote:
>> Add DT nodes for following devices on Tegra186 and Tegra194
>>   * ACONNECT
>>   * ADMA
>>   * AGIC
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   changes in current revision
>>    * use single address range for all APE modules
>>    * fix address range for agic
>>
>>   arch/arm64/boot/dts/nvidia/tegra186.dtsi | 67 ++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 67 ++++++++++++++++++++++++++++++++
>>   2 files changed, 134 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>> index 426ac0b..b4d735e 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>> @@ -1295,4 +1295,71 @@
>>   				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>>   		interrupt-parent = <&gic>;
>>   	};
>> +
>> +	aconnect@2a41000 {
> This address does not look correct. This appears to be the address of
> the AGIC. I think it should be 2900000, however, I also wonder if we
> should even bother with an address for the aconnect as this is just a
> bus and we don't specific a 'reg' property.
Do you mean, should be ok to just mention "aconnect {"?
>
>> +		compatible = "nvidia,tegra210-aconnect";
>> +		clocks = <&bpmp TEGRA186_CLK_APE>,
>> +			 <&bpmp TEGRA186_CLK_APB2APE>;
>> +		clock-names = "ape", "apb2ape";
>> +		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_AUD>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x02900000 0x0 0x02900000 0x1FFFFF>;
> This should be 0x1fffff.
done
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
> I think that this should also be "agic: interrupt-controller@xxxx" to
> conform with standard names. Sorry the Tegra210 version is not the best
> reference!
will change
> Cheers
> Jon
>
