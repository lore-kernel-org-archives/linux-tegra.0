From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/4] clk: tegra20/30: Add custom EMC clock
 implementation
Date: Fri, 26 Apr 2019 00:42:19 +0300
Message-ID: <2b4f56cd-caf9-e6b5-6344-a045e08a9c91@gmail.com>
References: <20190414202009.31268-1-digetx@gmail.com>
 <20190414202009.31268-2-digetx@gmail.com>
 <155621927685.15276.16453873579880842057@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155621927685.15276.16453873579880842057@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

25.04.2019 22:07, Stephen Boyd пишет:
> Quoting Dmitry Osipenko (2019-04-14 13:20:06)
>> diff --git a/drivers/clk/tegra/clk-tegra20-emc.c b/drivers/clk/tegra/clk-tegra20-emc.c
>> new file mode 100644
>> index 000000000000..35b67a9989c8
>> --- /dev/null
>> +++ b/drivers/clk/tegra/clk-tegra20-emc.c
>> @@ -0,0 +1,307 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/bits.h>
>> +#include <linux/clk/tegra.h>
> 
> Include clk-provider.h as this is a clk provider driver.

Okay, although clk-provider.h is also included by clk.h below.

>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/slab.h>
>> +
>> +#include "clk.h"
>> +
>> +#define CLK_SOURCE_EMC_2X_CLK_DIVISOR_MASK     GENMASK(7, 0)
>> +#define CLK_SOURCE_EMC_2X_CLK_SRC_MASK         GENMASK(31, 30)
> [...]
>> +
>> +static const struct clk_ops tegra_clk_emc_ops = {
>> +       .recalc_rate = emc_recalc_rate,
>> +       .get_parent = emc_get_parent,
>> +       .set_parent = emc_set_parent,
>> +       .set_rate = emc_set_rate,
>> +       .set_rate_and_parent = emc_set_rate_and_parent,
>> +       .determine_rate = emc_determine_rate,
>> +};
>> +
>> +void tegra20_clk_set_emc_round_callback(void *round_cb, void *arg_cb)
> 
> Why can't we have type safety on these function pointers?

It is probably not really necessary since it's a platform-specific API.
But I'll add an explicit type in v3 for consistency, thanks.

>> +{
>> +       struct clk *clk = __clk_lookup("emc");
>> +       struct tegra_clk_emc *emc;
>> +       struct clk_hw *hw;
>> +
>> +       if (clk) {
>> +               hw = __clk_get_hw(clk);
>> +               emc = to_tegra_clk_emc(hw);
>> +
>> +               emc->round_cb = round_cb;
>> +               emc->arg_cb = arg_cb;
>> +       }
>> +}
>> +
>> +bool tegra20_clk_emc_driver_available(void)
>> +{
>> +       struct clk *clk = __clk_lookup("emc");
> 
> Can we avoid using __clk_lookup()? Maybe by having the clk_hw pointer in
> this driver somehow?

tegra20_clk_emc_driver_available() is a private function of the Tegra's
clk-core. Please note that prototype of this function is added to the
local "drivers/clk/tegra/clk.h" file.

It is indeed possible to use clk pointer instead of __clk_lookup() and
I'll change that in v3 since it's causing some confusion.

>> +       struct tegra_clk_emc *emc;
>> +       struct clk_hw *hw;
>> +
>> +       if (clk) {
>> +               hw = __clk_get_hw(clk);
> 
> This gets further to the point, we don't prefer to see drivers use
> __clk_get_hw() unless they absolutely need to. Maybe I don't understand
> the driver structure, but it seems like maybe the driver that's
> providing the callbacks could be the same driver that's registering
> these clks, and thus everything could be inside one file so that we
> don't have to pass around callbacks and clk_hw pointers? Commit text
> says "this is how it's been" but that's not a reason to keep doing it.

Again, tegra20_clk_emc_driver_available() is for the Terga's clk-core
and not for the EMC (External Memory Controller) driver. This function
is used to determine whether EMC driver is ready to handle clock-rate
changes (PRE/POST rate-change notifications), clk users can't get EMC
clock until driver is ready (i.e. the "round" callback is registered by
the driver).

Please see tegra20_clk_src_onecell_get() changes in this patch and
drivers/memory/tegra/tegra20-emc.c for clarity.

It is not possible to register clk from the EMC driver without having
some custom integration with the clk-core because CLK and EMC are
different hardware units and hence EMC driver doesn't have direct access
to the CLK registers. I think it is better to keep CLK and memory-timing
programming logically separated simply for consistency, although I'm
open to suggestions.
