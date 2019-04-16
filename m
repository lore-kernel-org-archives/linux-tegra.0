From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V2 13/16] arm64: tegra: Enable PCIe slots in P2972-0000
 board
Date: Tue, 16 Apr 2019 23:25:41 +0530
Message-ID: <d020562a-d97c-7eae-cd4f-01e4df0ff686@nvidia.com>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
 <1554407683-31580-14-git-send-email-vidyas@nvidia.com>
 <20190415151235.GH29254@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415151235.GH29254@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 4/15/2019 8:42 PM, Thierry Reding wrote:
> On Fri, Apr 05, 2019 at 01:24:40AM +0530, Vidya Sagar wrote:
>> Enable PCIe controller nodes to enable respective PCIe slots on
>> P2972-0000 board. Following is the ownership of slots by different
>> PCIe controllers.
>> Controller-0 : M.2 Key-M slot
>> Controller-1 : On-board Marvell eSATA controller
>> Controller-3 : M.2 Key-E slot
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>> Changes since [v1]:
>> * Dropped 'pcie-' from phy-names property strings
>>
>>   arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  2 +-
>>   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 50 ++++++++++++++++++++++
>>   2 files changed, 51 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> index 246c1ebbd055..13263529125b 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> @@ -191,7 +191,7 @@
>>   						regulator-boot-on;
>>   					};
>>   
>> -					sd3 {
>> +					vdd_1v8ao: sd3 {
>>   						regulator-name = "VDD_1V8AO";
>>   						regulator-min-microvolt = <1800000>;
>>   						regulator-max-microvolt = <1800000>;
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>> index b62e96945846..82eb30bceaa6 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>> @@ -169,4 +169,54 @@
>>   			};
>>   		};
>>   	};
>> +
>> +	pcie@14180000 {
>> +		status = "okay";
>> +
>> +		vddio-pex-ctl-supply = <&vdd_1v8ao>;
>> +
>> +		phys = <&p2u_2>,
>> +		       <&p2u_3>,
>> +		       <&p2u_4>,
>> +		       <&p2u_5>;
> 
> You can use multiple entries on a single line, especially if they are
> this short.
> 
>> +		phy-names = "p2u-0", "p2u-1", "p2u-2",
>> +			    "p2u-3";
> 
> Same here.
> 
>> +	};
>> +
>> +	pcie@14100000 {
>> +		status = "okay";
>> +
>> +		vddio-pex-ctl-supply = <&vdd_1v8ao>;
>> +
>> +		phys = <&p2u_0>;
>> +		phy-names = "p2u-0";
>> +	};
>> +
>> +	pcie@14140000 {
>> +		status = "okay";
>> +
>> +		vddio-pex-ctl-supply = <&vdd_1v8ao>;
>> +
>> +		phys = <&p2u_7>;
>> +		phy-names = "p2u-0";
>> +	};
>> +
>> +	pcie@141a0000 {
>> +		status = "disabled";
>> +
>> +		vddio-pex-ctl-supply = <&vdd_1v8ao>;
>> +
>> +		phys = <&p2u_12>,
>> +		       <&p2u_13>,
>> +		       <&p2u_14>,
>> +		       <&p2u_15>,
>> +		       <&p2u_16>,
>> +		       <&p2u_17>,
>> +		       <&p2u_18>,
>> +		       <&p2u_19>;
>> +
>> +		phy-names = "p2u-0", "p2u-1", "p2u-2",
>> +			    "p2u-3", "p2u-4", "p2u-5",
>> +			    "p2u-6", "p2u-7";
> 
> And here.
I'll take care of all these in V3 series.

> 
> Thierry
> 
>> +	};
>>   };
>> -- 
>> 2.7.4
>>
