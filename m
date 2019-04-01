From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 1/8] dt-bindings: memory: tegra: Add Tegra210 EMC bindings
Date: Mon, 1 Apr 2019 15:57:47 +0800
Message-ID: <7d680700-d2f2-7b6c-a8bf-dca6d54dbf2c@nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-2-josephl@nvidia.com>
 <5ca06133.1c69fb81.11ebf.91ce@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5ca06133.1c69fb81.11ebf.91ce@mx.google.com>
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
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 3/31/19 2:41 PM, Rob Herring wrote:
> On Mon, Mar 25, 2019 at 03:45:16PM +0800, Joseph Lo wrote:
>> Add the binding document for the external memory controller (EMC) which
>> communicates with external LPDDR4 devices. It includes the bindings of
>> the EMC node and the EMC table of different rates.
>>
>> To support high rates for LPDDR4, the EMC table must be trained before
>> it can be used for runtime clock switching. It has been done by firmware
>> and merged to the table that Linux kernel uses. For backward
>> compatibility with the devices that had been launched on the market, like
>> Shield and Jetson platforms, the bindings in the EMC table should remain
>> the same. So the firmware can recognize them and merge the trained EMC
>> table for the kernel.

Hi Rob,

Thanks for reviewing.

> 
> Overall seems pretty bloated. How much of this really varies by board
> vs. just being a dump of all the register values to stuff?

Most of them are register values. And by different SDRAM devices that 
could be used on the same platform (use ram code to identify them), the 
value could be different.

> 
> Primarily, I'm leary of getting a similar binding for every vendor's DDR
> setup.
> 
> Some mostly trivial comments follow.

Really sorry about that. I understand these basic rules for DT bindings, 
but the case here is that these un-reviewed bindings have been used in 
the firmware on the shipped products. To support the same with the 
upstream kernel and consider the firmware blob may not be updated, we 
have no choice to just use the same bindings in the upstream kernel.

How can we deal with this case?

> 
snip.
>> +Example:
>> +	external-memory-controller@7001b000 {
>> +		compatible = "nvidia,tegra21-emc", "nvidia,tegra210-emc";
>> +		reg = <0x0 0x7001b000 0x0 0x1000>,
>> +		      <0x0 0x7001e000 0x0 0x1000>,
>> +		      <0x0 0x7001f000 0x0 0x1000>;
>> +		clocks = <&tegra_car TEGRA210_CLK_EMC>,
>> +		         <&tegra_car TEGRA210_CLK_PLL_M>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_C>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_P>,
>> +			 <&tegra_car TEGRA210_CLK_CLK_M>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_M_UD>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_MB_UD>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_MB>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_P_UD>;
>> +		clock-names = "emc", "pll_m", "pll_c", "pll_p", "clk_m",
>> +			      "pll_m_ud", "pll_mb_ud", "pll_mb", "pll_p_ud";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		nvidia,memory-controller = <&mc>;
>> +		nvidia,use-ram-code;
>> +
>> +		emc-table@0 {
> 
> Unit address without reg is not valid.
> 
>> +			nvidia,ram-code = <0>;
>> +			emc-table@40800 {
> 
> And here.
> 

Will fix this.
Thanks,
Joseph

>> +				compatible = "nvidia,tegra21-emc-table";
>> +				...
>> +			};
>> +			emc-table@204000 {
>> +				...
>> +			};
>> +			...
>> +		};
>> +
>> +		emc-table@1 {
>> +			nvidia,ram-code = <1>;
>> +			emc-table@40800 {
>> +				compatible = "nvidia,tegra21-emc-table";
>> +				...
>> +			};
>> +			emc-table@204000 {
>> +				...
>> +			};
>> +			...
>> +		};
>> +	};
>> -- 
>> 2.21.0
>>
> 
