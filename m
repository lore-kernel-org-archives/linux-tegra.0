From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 03/19] dt-bindings: cpufreq: tegra124: remove
 vdd-cpu-supply from required properties
Date: Wed, 5 Dec 2018 11:05:58 +0800
Message-ID: <3a6f4512-db3f-4cba-21da-572edf14c5dc@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-4-josephl@nvidia.com>
 <20181204153600.GA26056@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204153600.GA26056@pdeschrijver-desktop.Nvidia.com>
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
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: devicetree@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 12/4/18 11:36 PM, Peter De Schrijver wrote:
> On Tue, Dec 04, 2018 at 05:25:32PM +0800, Joseph Lo wrote:
>> The Tegra124 cpufreq driver works only with DFLL clock, which is a
>> hardware-based frequency/voltage controller. The driver doesn't need to
>> control the regulator itself. Hence remove that.
>>
> 
> I think this is required for DFLL controlled I2C regulators because the
> regulator is queried for voltage selectors and I2C slave ID?
> 

Hi Peter,

Yes, it's required for DFLL-I2C mode and defined in DFLL node. It's not 
needed here in the CPU node for CPU freq driver to handle that. Hence 
remove that.

Thanks,
Joseph


> 
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt     | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> index b1669fbfb740..031545a29caf 100644
>> --- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> +++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> @@ -13,7 +13,6 @@ Required properties:
>>     - pll_x: Fast PLL clocksource.
>>     - pll_p: Auxiliary PLL used during fast PLL rate changes.
>>     - dfll: Fast DFLL clocksource that also automatically scales CPU voltage.
>> -- vdd-cpu-supply: Regulator for CPU voltage
>>   
>>   Optional properties:
>>   - clock-latency: Specify the possible maximum transition latency for clock,
>> @@ -37,7 +36,6 @@ cpus {
>>   			 <&dfll>;
>>   		clock-names = "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
>>   		clock-latency = <300000>;
>> -		vdd-cpu-supply: <&vdd_cpu>;
>>   	};
>>   
>>   	<...>
>> -- 
>> 2.19.2
>>
