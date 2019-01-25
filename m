From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 4/6] arm64: dts: tegra210: add CPU idle states properties
Date: Fri, 25 Jan 2019 11:58:09 +0800
Message-ID: <dc12f759-d324-c696-26bc-30fde9c3a0b7@nvidia.com>
References: <20190107032810.13522-1-josephl@nvidia.com>
 <20190107032810.13522-5-josephl@nvidia.com>
 <ef99309d-4c03-0c9e-16f0-055059a355d4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ef99309d-4c03-0c9e-16f0-055059a355d4@nvidia.com>
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
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 1/24/19 7:21 PM, Jon Hunter wrote:
> 
> On 07/01/2019 03:28, Joseph Lo wrote:
>> Add idle states properties for generic ARM CPU idle driver. This
>> includes a C7 state which is the power down state of CPU cores.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> Note:
>> This dt patch depends on the DT changes in below series.
>> http://patchwork.ozlabs.org/project/linux-tegra/list/?series=84380
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> index 143bd103c923..b583d3065946 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> @@ -1308,24 +1308,41 @@
>>   				 <&dfll>;
>>   			clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
>>   			clock-latency = <300000>;
>> +			cpu-idle-states = <&C7>;
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
>> +				wakeup-latency-us = <130>;
>> +				min-residency-us = <1000>;
>> +				idle-state-name = "c7-cpu-powergated";
>> +				status = "disabled";
>> +			};
>>   		};
>>   	};
> 
> The binding doc says that both 'entry-latency-us' and 'exit-latency-us'
> properties are required. Are we able to populate these?
> 

Indeed, will fix that.

Thanks,
Joseph
