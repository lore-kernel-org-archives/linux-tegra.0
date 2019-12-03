From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v1 15/17] dt-bindings: tegra186-pmc: Add Tegra PMC clock
 bindings
Date: Tue, 3 Dec 2019 15:28:09 -0800
Message-ID: <5445c579-4a85-ca36-69c9-7fe86dbf1fa9@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
 <1574146234-3871-16-git-send-email-skomatineni@nvidia.com>
 <20191203221137.GC22716@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191203221137.GC22716@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/3/19 2:11 PM, Rob Herring wrote:
> On Mon, Nov 18, 2019 at 10:50:32PM -0800, Sowjanya Komatineni wrote:
>> Document clock bindings for pmc clocks clk_out_1, clk_out_2 and clk_out_3.
>> These clocks are part of Tegra PMC block and pmc node is the provider for
>> these clocks.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     | 44 ++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
>> index 2d89cdc39eb0..4576de92e4cc 100644
>> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
>> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
>> @@ -12,6 +12,10 @@ Required properties:
>>     - "aotag"
>>     - "scratch"
>>     - "misc" (Only for Tegra194)
>> +- #clock-cells : Should be 1 for Tegra30 and higher.
>> +  In clock consumers, this cell represents the PMC clock ID.
>> +  The assignments may be found in header file
>> +  <dt-bindings/soc/tegra-pmc.h>.
> Kind of strange the header is shared, but the binding doc is not.

v2 has this patch removed. Tegra186 does not have pmc clocks. They were 
accidentally added in v1 and this is fixed in v2.

>
>>   
>>   Optional properties:
>>   - nvidia,invert-interrupt: If present, inverts the PMU interrupt signal.
>> @@ -130,3 +134,43 @@ Pinctrl client example:
>>   		pinctrl-1 = <&hdmi_on>;
>>   		pinctrl-names = "hdmi-on", "hdmi-off";
>>   	};
>> +
>> +== Clock Control ==
>> +
>> +Tegra PMC has 3 clocks clk_1, clk_2 and clk_3. Each of these clocks has
>> +source selection and enable/disable gate.
>> +Parent/source for these clocks can be either of clk_m, clk_m_div2, clk_m_div4,
>> +or extern clock from Tegra CAR module.
>> +
>> +Clock configuration example:
>> +	pmc: pmc@7000e400 {
>> +		compatible = "nvidia,tegra186-pmc";
>> +		reg = <0 0x0c360000 0 0x10000>,
>> +		      <0 0x0c370000 0 0x10000>,
>> +		      <0 0x0c380000 0 0x10000>,
>> +		      <0 0x0c390000 0 0x10000>;
>> +		reg-names = "pmc", "wake", "aotag", "scratch";
>> +		...
>> +		#clock-cells = <1>;
>> +		...
> Once converted to schema, the examples have to compile and this won't.
> They also have to be complete enough to pass validation checks.
ok, will go thru and run the validation checks.
>> +	};
>> +
>> +Clock consumer example:
>> +	host1x@50000000 {
>> +		...
>> +		vi@54080000 {
>> +		...
>> +		assigned-clocks = <&pmc TEGRA_PMC_CLK_OUT_3_MUX>;
>> +		assigned-clock-parents = <&tegra_car TEGRA210_CLK_EXTERN3>;
> Indentation is wrong.
>
>> +		};
>> +		...
>> +	};
>> +	...
>> +	i2c@7000c500 {
>> +		cam_sensor {
>> +		...
>> +		clocks = <&pmc TEGRA_PMC_CLK_OUT_3>;
>> +		clock-names = "mclk";
> Same here.
>
>> +		...
>> +		};
>> +	};
>> -- 
>> 2.7.4
>>
