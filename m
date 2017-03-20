From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 3/5] soc/tegra: Move Tegra flowctrl driver
Date: Mon, 20 Mar 2017 16:37:58 +0000
Message-ID: <c0b18931-1377-813d-c8a3-60aea4379aa6@nvidia.com>
References: <1489584715-23138-1-git-send-email-jonathanh@nvidia.com>
 <1489584715-23138-4-git-send-email-jonathanh@nvidia.com>
 <20170320141434.GC28203@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170320141434.GC28203@ulmo.ba.sec>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org



On 20/03/17 14:14, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Mar 15, 2017 at 01:31:53PM +0000, Jon Hunter wrote:
> [...]
>> +static int __init tegra_flowctrl_init(void)
>> +{
>> +	/* hardcoded fallback if device tree node is missing */
>> +	unsigned long base = 0x60007000;
>> +	unsigned long size = SZ_4K;
>> +	struct device_node *np;
>> +
>> +	if (!soc_is_tegra())
>> +		return 0;
>> +
>> +	np = of_find_matching_node(NULL, matches);
>> +	if (np) {
>> +		struct resource res;
>> +
>> +		if (of_address_to_resource(np, 0, &res) == 0) {
>> +			size = resource_size(&res);
>> +			base = res.start;
>> +		}
>> +
>> +		of_node_put(np);
>> +	}
>> +
>> +	tegra_flowctrl_base = ioremap_nocache(base, size);
>> +
>> +	if (!tegra_flowctrl_base)
>> +		return -ENXIO;
>> +
>> +	return 0;
>> +}
>> +early_initcall(tegra_flowctrl_init);
> 
> Do we want to implement a hand-off to a proper driver at some point,
> similar to what we have for PMC?

Yes I can add, it won't do much apart from remap the io-space, but at
least it is registered as a device then.

>> diff --git a/include/soc/tegra/flowctrl.h b/include/soc/tegra/flowctrl.h
> [...]
>> +#ifndef __ASSEMBLY__
>> +u32 flowctrl_read_cpu_csr(unsigned int cpuid);
>> +void flowctrl_write_cpu_csr(unsigned int cpuid, u32 value);
>> +void flowctrl_write_cpu_halt(unsigned int cpuid, u32 value);
>> +
>> +void flowctrl_cpu_suspend_enter(unsigned int cpuid);
>> +void flowctrl_cpu_suspend_exit(unsigned int cpuid);
>> +#endif
> 
> Perhaps we want the same type of dummy functions scheme here for
> !SOC_TEGRA_FLOWCTRL that Arnd proposed for !SOC_TEGRA_PMC?

Yes that is a better solution, so will do the same here.

Jon

-- 
nvpublic
