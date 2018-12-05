From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 04/19] dt-bindings: cpufreq: tegra124: remove cpu_lp clock
 from required properties
Date: Wed, 5 Dec 2018 11:10:08 +0800
Message-ID: <d74b8cf3-a072-a53c-2408-9f479998f5d3@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-5-josephl@nvidia.com>
 <20181204153707.GB26056@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204153707.GB26056@pdeschrijver-desktop.Nvidia.com>
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

On 12/4/18 11:37 PM, Peter De Schrijver wrote:
> On Tue, Dec 04, 2018 at 05:25:33PM +0800, Joseph Lo wrote:
>> The cpu_lp clock property is only needed when the CPUfreq driver
>> supports CPU cluster switching. But it was not a design for this driver
>> and it didn't handle that as well. So removing this property.
>>
> 
> I would mark it optional. This means current DTs will still be
> technically compatible with this binding doc.

Hi Peter,

There is no compatible issue of this property. Because the driver 
doesn't use this clock at all. Removing this won't cause any 
backward-compatible issue.

Same as previous patch for removing vdd-cpu-supply property once we fix 
that in the driver. The old dt binding still works with the new driver.

> 
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt   | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> index 031545a29caf..03196d5ea515 100644
>> --- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> +++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> @@ -9,7 +9,6 @@ Required properties:
>>     See ../clocks/clock-bindings.txt for details.
>>   - clock-names: Must include the following entries:
>>     - cpu_g: Clock mux for the fast CPU cluster.
>> -  - cpu_lp: Clock mux for the low-power CPU cluster.
>>     - pll_x: Fast PLL clocksource.
>>     - pll_p: Auxiliary PLL used during fast PLL rate changes.
>>     - dfll: Fast DFLL clocksource that also automatically scales CPU voltage.
>> @@ -30,11 +29,10 @@ cpus {
>>   		reg = <0>;
>>   
>>   		clocks = <&tegra_car TEGRA124_CLK_CCLK_G>,
>> -			 <&tegra_car TEGRA124_CLK_CCLK_LP>,
>>   			 <&tegra_car TEGRA124_CLK_PLL_X>,
>>   			 <&tegra_car TEGRA124_CLK_PLL_P>,
>>   			 <&dfll>;
>> -		clock-names = "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
>> +		clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
>>   		clock-latency = <300000>;
>>   	};
>>   
>> -- 
>> 2.19.2
>>
