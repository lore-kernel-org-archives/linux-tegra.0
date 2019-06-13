From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 1/8] clk: tegra20/30: Add custom EMC clock
 implementation
Date: Thu, 13 Jun 2019 15:14:28 +0300
Message-ID: <9c4af080-89d1-84a3-d909-b5595b8a6959@gmail.com>
References: <20190524172353.29087-1-digetx@gmail.com>
 <20190524172353.29087-2-digetx@gmail.com>
 <20190613104945.GJ29894@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613104945.GJ29894@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

13.06.2019 13:49, Peter De Schrijver пишет:
> On Fri, May 24, 2019 at 08:23:46PM +0300, Dmitry Osipenko wrote:
>> A proper External Memory Controller clock rounding and parent selection
>> functionality is required by the EMC drivers. It is not available using
>> the generic clock implementation, hence add a custom one. The clock rate
>> rounding shall be done by the EMC drivers because they have information
>> about available memory timings, so the drivers will have to register a
>> callback that will round the requested rate. EMC clock users won't be able
>> to request EMC clock by getting -EPROBE_DEFER until EMC driver is probed
>> and the callback is set up. The functionality is somewhat similar to the
>> clk-emc.c which serves Tegra124+ SoC's, the later HW generations support
>> more parent clock sources and the HW configuration and integration with
>> the EMC drivers differs a tad from the older gens, hence it's not really
>> worth to try to squash everything into a single source file.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/clk/tegra/Makefile          |   2 +
>>  drivers/clk/tegra/clk-tegra20-emc.c | 299 ++++++++++++++++++++++++++++
>>  drivers/clk/tegra/clk-tegra20.c     |  55 ++---
>>  drivers/clk/tegra/clk-tegra30.c     |  38 +++-
>>  drivers/clk/tegra/clk.h             |   6 +
>>  include/linux/clk/tegra.h           |  14 ++
>>  6 files changed, 362 insertions(+), 52 deletions(-)
>>  create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
>>
>> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
>> index 4812e45c2214..df966ca06788 100644
>> --- a/drivers/clk/tegra/Makefile
>> +++ b/drivers/clk/tegra/Makefile
>> @@ -17,7 +17,9 @@ obj-y					+= clk-tegra-fixed.o
>>  obj-y					+= clk-tegra-super-gen4.o
>>  obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o
>>  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
>> +obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= clk-tegra20-emc.o
>>  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
>> +obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= clk-tegra20-emc.o
>>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
>>  obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
>> diff --git a/drivers/clk/tegra/clk-tegra20-emc.c b/drivers/clk/tegra/clk-tegra20-emc.c
>> new file mode 100644
>> index 000000000000..d971b5425ce3
>> --- /dev/null
>> +++ b/drivers/clk/tegra/clk-tegra20-emc.c
>> @@ -0,0 +1,299 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/bits.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/clk/tegra.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/slab.h>
>> +
>> +#include "clk.h"
>> +
>> +#define CLK_SOURCE_EMC_2X_CLK_DIVISOR_MASK	GENMASK(7, 0)
>> +#define CLK_SOURCE_EMC_2X_CLK_SRC_MASK		GENMASK(31, 30)
>> +#define CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT		30
>> +
>> +#define MC_EMC_SAME_FREQ	BIT(16)
>> +#define USE_PLLM_UD		BIT(29)
>> +
>> +#define EMC_SRC_PLL_M		0
>> +#define EMC_SRC_PLL_C		1
>> +#define EMC_SRC_PLL_P		2
>> +#define EMC_SRC_CLK_M		3
>> +
>> +static const char * const emc_parent_clk_names[] = {
>> +	"pll_m", "pll_c", "pll_p", "clk_m",
>> +};
>> +
>> +struct tegra_clk_emc {
>> +	struct clk_hw hw;
>> +	void __iomem *reg;
>> +	bool mc_same_freq;
>> +	bool want_low_jitter;
>> +
>> +	tegra20_clk_emc_round_cb *round_cb;
>> +	void *cb_arg;
>> +};
>> +
>> +static inline struct tegra_clk_emc *to_tegra_clk_emc(struct clk_hw *hw)
>> +{
>> +	return container_of(hw, struct tegra_clk_emc, hw);
>> +}
>> +
>> +static unsigned long emc_recalc_rate(struct clk_hw *hw,
>> +				     unsigned long parent_rate)
>> +{
>> +	struct tegra_clk_emc *emc = to_tegra_clk_emc(hw);
>> +	u32 val, div;
>> +
>> +	val = readl_relaxed(emc->reg);
>> +	div = val & CLK_SOURCE_EMC_2X_CLK_DIVISOR_MASK;
>> +
>> +	return DIV_ROUND_UP(parent_rate * 2, div + 2);
>> +}
>> +
>> +static u8 emc_get_parent(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_emc *emc = to_tegra_clk_emc(hw);
>> +
>> +	return readl_relaxed(emc->reg) >> CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT;
>> +}
>> +
>> +static int emc_set_parent(struct clk_hw *hw, u8 index)
>> +{
>> +	struct tegra_clk_emc *emc = to_tegra_clk_emc(hw);
>> +	u32 val, div;
>> +
>> +	val = readl_relaxed(emc->reg);
>> +	val &= ~CLK_SOURCE_EMC_2X_CLK_SRC_MASK;
>> +	val |= index << CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT;
>> +
>> +	div = val & CLK_SOURCE_EMC_2X_CLK_DIVISOR_MASK;
>> +
>> +	if (index == EMC_SRC_PLL_M && div == 0 && emc->want_low_jitter)
>> +		val |= USE_PLLM_UD;
>> +	else
>> +		val &= ~USE_PLLM_UD;
>> +
>> +	if (emc->mc_same_freq)
>> +		val |= MC_EMC_SAME_FREQ;
>> +	else
>> +		val &= ~MC_EMC_SAME_FREQ;
>> +
>> +	writel_relaxed(val, emc->reg);
>> +
> 
> I think technically you need a fence_udelay(1) here, but in practice
> this is probably not needed because you will poll some EMC register for
> the frequency completion anyway. Maybe add a comment about this?
> 
>> +	return 0;
>> +}
>> +
>> +static int emc_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			unsigned long parent_rate)
>> +{
>> +	struct tegra_clk_emc *emc = to_tegra_clk_emc(hw);
>> +	unsigned int index;
>> +	u32 val, div;
>> +
>> +	div = div_frac_get(rate, parent_rate, 8, 1, 0);
>> +
>> +	val = readl_relaxed(emc->reg);
>> +	val &= ~CLK_SOURCE_EMC_2X_CLK_DIVISOR_MASK;
>> +	val |= div;
>> +
>> +	index = val >> CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT;
>> +
>> +	if (index == EMC_SRC_PLL_M && div == 0 && emc->want_low_jitter)
>> +		val |= USE_PLLM_UD;
>> +	else
>> +		val &= ~USE_PLLM_UD;
>> +
>> +	if (emc->mc_same_freq)
>> +		val |= MC_EMC_SAME_FREQ;
>> +	else
>> +		val &= ~MC_EMC_SAME_FREQ;
>> +
>> +	writel_relaxed(val, emc->reg);
>> +
> 
> Same here.
> 
>> +	return 0;
>> +}
>> +
>> +static int emc_set_rate_and_parent(struct clk_hw *hw,
>> +				   unsigned long rate,
>> +				   unsigned long parent_rate,
>> +				   u8 index)
>> +{
>> +	struct tegra_clk_emc *emc = to_tegra_clk_emc(hw);
>> +	u32 val, div;
>> +
>> +	div = div_frac_get(rate, parent_rate, 8, 1, 0);
>> +
>> +	val = readl_relaxed(emc->reg);
>> +
>> +	val &= ~CLK_SOURCE_EMC_2X_CLK_SRC_MASK;
>> +	val |= index << CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT;
>> +
>> +	val &= ~CLK_SOURCE_EMC_2X_CLK_DIVISOR_MASK;
>> +	val |= div;
>> +
>> +	if (index == EMC_SRC_PLL_M && div == 0 && emc->want_low_jitter)
>> +		val |= USE_PLLM_UD;
>> +	else
>> +		val &= ~USE_PLLM_UD;
>> +
>> +	if (emc->mc_same_freq)
>> +		val |= MC_EMC_SAME_FREQ;
>> +	else
>> +		val &= ~MC_EMC_SAME_FREQ;
>> +
>> +	writel_relaxed(val, emc->reg);
>> +
> 
> And here.
> 
>> +	return 0;
>> +}
> 
> Peter.
> 

Thank you very much for the feedback! Indeed, it will be a bit more
robust to add fence_udelay() since one microsecond is practically
nothing and then it will be a part of the clk-change awaiting anyway
(note that EMC driver waits for the interrupt event and doesn't poll the
status), we also don't really care about the EMC rate-change performance
much because it won't happen frequently.
