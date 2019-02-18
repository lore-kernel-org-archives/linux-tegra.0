From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V6 5/7] arm64: dts: tegra210: add CPU idle states
 properties
Date: Mon, 18 Feb 2019 17:21:19 +0800
Message-ID: <b6f7b1d2-5d7e-dbb2-9b43-f9bd727442d3@nvidia.com>
References: <20190201161654.18315-1-josephl@nvidia.com>
 <20190201161654.18315-6-josephl@nvidia.com>
 <d98266b3-f0a4-cebe-174a-2ab5c4051fde@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d98266b3-f0a4-cebe-174a-2ab5c4051fde@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thomas
 Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 2/15/19 11:47 PM, Daniel Lezcano wrote:
> On 01/02/2019 17:16, Joseph Lo wrote:
>> Add idle states properties for generic ARM CPU idle driver. This
>> includes a C7 state which is the power down state of CPU cores.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> v6:
>>   * add ack tag from Jon.
>> v5:
>>   * no change
>> v4:
>>   * no change
>> v3:
>>   * no change
>> v2:
>>   * add entry-latency-us and exit-latency-us properties
>>
>> Note:
>> This dt patch depends on the DT changes in below series.
>> http://patchwork.ozlabs.org/project/linux-tegra/list/?series=84380
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> index 2b387364afc3..75534692604c 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> @@ -1318,24 +1318,43 @@
>>   				 <&dfll>;
>>   			clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
>>   			clock-latency = <300000>;
>> +			cpu-idle-states = <&C7>;
> 
> Please change the C7 name, that will be confusing with the C-state.
> 
> CPU_SLEEP would be nice and consistent with other drivers.
> 
>>   		};
>>   
>>   		cpu@1 {
>>   			device_type = "cpu";
>>   			compatible = "arm,cortex-a57";
>>   			reg = <1>;
>> +			cpu-idle-states = <&C7>;
>>   		};
>>   
>>   		cpu@2 {
>>   			device_type = "cpu";
>>   			compatible = "arm,cortex-a57";
>>   			reg = <2>;
>> +			cpu-idle-states = <&C7>;
>>   		};
>>   
>>   		cpu@3 {
>>   			device_type = "cpu";
>>   			compatible = "arm,cortex-a57";
>>   			reg = <3>;
>> +			cpu-idle-states = <&C7>;
>> +		};
>> +
>> +		idle-states {
>> +			entry-method = "psci";
>> +
>> +			C7: c7 {
>> +				compatible = "arm,idle-state";
>> +				arm,psci-suspend-param = <0x40000007>;
>> +				entry-latency-us = <250>;
>> +				exit-latency-us = <100>;
>> +				min-residency-us = <1000>;
>> +				wakeup-latency-us = <130>;
> 
> Regarding the entry and the exit latency, the wakeup latency sounds a
> bit small.
> 
> ./devicetree/bindings/arm/idle-states.txt
> 
>> +				idle-state-name = "c7-cpu-powergated";
> 
> "cpu-sleep"
> 

Will fix them.

Thanks for reviewing,
Joseph

>> +				status = "disabled";
>> +			};
>>   		};
>>   	};
>>   
>>
> 
> 
