From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 2/2] arm64: tegra: Add CPU nodes to Tegra194 device tree
Date: Thu, 28 Jun 2018 08:57:23 +0300
Message-ID: <4eacd53a-b128-241f-8284-14e315451c8e@kapsi.fi>
References: <20180620122827.14165-1-mperttunen@nvidia.com>
 <20180620122827.14165-2-mperttunen@nvidia.com>
 <20180627165730.GA15867@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180627165730.GA15867@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 27.06.2018 19:57, Rob Herring wrote:
> On Wed, Jun 20, 2018 at 03:28:27PM +0300, Mikko Perttunen wrote:
>> Add CPU and PSCI nodes to device tree. The Tegra194 SoC contains
>> eight NVIDIA Carmel CPUs.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 40 +++++++++++++++++++
>>   arch/arm64/boot/dts/nvidia/tegra194.dtsi       | 53 ++++++++++++++++++++++++++
>>   2 files changed, 93 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> index ecb034177fc2..859ab5af17c1 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> @@ -229,6 +229,46 @@
>>   		};
>>   	};
>>   
>> +	cpus {
>> +		cpu@0 {
>> +			enable-method = "psci";
>> +		};
> 
> Kind of strange to have this separated out. I guess you have non-PSCI
> firmware too? In any case, unless things have changed, upstream is only
> supporting spin-table or PSCI for arm64. So please combine this with the
> rest of the cpu nodes.

This was copied from older Tegras - we might have had some systems in 
the past with non-PSCI firmware, but certainly don't have that anymore. 
I'll combine the nodes.

Mikko

> 
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
