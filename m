From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH 5/6] arm64: tegra: Enable GPIO controllers nodes for
 P2972-0000 platform
Date: Mon, 25 Nov 2019 12:25:11 +0530
Message-ID: <4a09729b-9a77-65a1-645a-a31e6e62ad1e@nvidia.com>
References: <20191122104505.8986-1-vidyas@nvidia.com>
 <20191122104505.8986-6-vidyas@nvidia.com> <20191122132007.GC1315704@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191122132007.GC1315704@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 11/22/2019 6:50 PM, Thierry Reding wrote:
> On Fri, Nov 22, 2019 at 04:15:04PM +0530, Vidya Sagar wrote:
>> Enable GPIO controllers nodes for P2972-0000 platform which are required
>> by other controllers in the SoC for example when PCIe C5 controller
>> operates in endpoint mode.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 8 ++++++++
>>   1 file changed, 8 insertions(+)
> 
> The GPIO controllers are enabled by default, so there's no need to
> explicitly enable them.
Yup. I'll remove this patch.
Since I didn't see 'status' entry in GPIO nodes in tegra194.dtsi file, I thought
it means 'disabled'. But, contrary to my understanding, absence of 'status' entry
seems to mean 'okay'.

- Vidya Sagar
> 
> Thierry
> 
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>> index 353a6a22196d..7eb64b816e08 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>> @@ -37,6 +37,14 @@
>>   			status = "okay";
>>   		};
>>   
>> +		gpio@2200000 {
>> +			status = "okay";
>> +		};
>> +
>> +		gpio@c2f0000 {
>> +			status = "okay";
>> +		};
>> +
>>   		pwm@c340000 {
>>   			status = "okay";
>>   		};
>> -- 
>> 2.17.1
>>
