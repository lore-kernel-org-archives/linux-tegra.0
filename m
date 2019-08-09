From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 08/21] clk: tegra: periph: Add restore_context support
Date: Fri, 9 Aug 2019 15:20:01 +0300
Message-ID: <0f8259d8-08f2-671c-331c-fe2d83518be0@gmail.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-9-git-send-email-skomatineni@nvidia.com>
 <5a5f9fb9-9cdd-5d91-4b0e-9bdb95b2625e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5a5f9fb9-9cdd-5d91-4b0e-9bdb95b2625e@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

09.08.2019 14:55, Dmitry Osipenko пишет:
> 09.08.2019 2:46, Sowjanya Komatineni пишет:
>> This patch implements restore_context support for clk-periph and
>> clk-sdmmc-mux clock operations to restore clock parent and rates
>> on system resume.
>>
>> During system suspend, core power goes off and looses the context
>> of the Tegra clock controller registers.
>>
>> So on system resume, clocks parent and rate are restored back to
>> the context before suspend based on cached data.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-periph.c    | 18 ++++++++++++++++++
>>  drivers/clk/tegra/clk-sdmmc-mux.c | 12 ++++++++++++
>>  2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
>> index 58437da25156..c9d28cbadccc 100644
>> --- a/drivers/clk/tegra/clk-periph.c
>> +++ b/drivers/clk/tegra/clk-periph.c
>> @@ -3,6 +3,7 @@
>>   * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
>>   */
>>  
>> +#include <linux/clk.h>
>>  #include <linux/clk-provider.h>
>>  #include <linux/export.h>
>>  #include <linux/slab.h>
>> @@ -99,6 +100,20 @@ static void clk_periph_disable(struct clk_hw *hw)
>>  	gate_ops->disable(gate_hw);
>>  }
>>  
>> +static void clk_periph_restore_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph *periph = to_clk_periph(hw);
>> +	const struct clk_ops *div_ops = periph->div_ops;
>> +	struct clk_hw *div_hw = &periph->divider.hw;
>> +	struct clk_hw *parent = clk_hw_get_parent(hw);
>> +	int parent_id = clk_hw_get_parent_index(hw, parent);
>> +
>> +	if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
>> +		div_ops->restore_context(div_hw);
>> +
>> +	clk_periph_set_parent(hw, parent_id);
>> +}
>> +
>>  const struct clk_ops tegra_clk_periph_ops = {
>>  	.get_parent = clk_periph_get_parent,
>>  	.set_parent = clk_periph_set_parent,
>> @@ -108,6 +123,7 @@ const struct clk_ops tegra_clk_periph_ops = {
>>  	.is_enabled = clk_periph_is_enabled,
>>  	.enable = clk_periph_enable,
>>  	.disable = clk_periph_disable,
>> +	.restore_context = clk_periph_restore_context,
>>  };
>>  
>>  static const struct clk_ops tegra_clk_periph_nodiv_ops = {
>> @@ -116,6 +132,7 @@ static const struct clk_ops tegra_clk_periph_nodiv_ops = {
>>  	.is_enabled = clk_periph_is_enabled,
>>  	.enable = clk_periph_enable,
>>  	.disable = clk_periph_disable,
>> +	.restore_context = clk_periph_restore_context,
>>  };
>>  
>>  static const struct clk_ops tegra_clk_periph_no_gate_ops = {
>> @@ -124,6 +141,7 @@ static const struct clk_ops tegra_clk_periph_no_gate_ops = {
>>  	.recalc_rate = clk_periph_recalc_rate,
>>  	.round_rate = clk_periph_round_rate,
>>  	.set_rate = clk_periph_set_rate,
>> +	.restore_context = clk_periph_restore_context,
>>  };
>>  
>>  static struct clk *_tegra_clk_register_periph(const char *name,
>> diff --git a/drivers/clk/tegra/clk-sdmmc-mux.c b/drivers/clk/tegra/clk-sdmmc-mux.c
>> index a5cd3e31dbae..8db48966b100 100644
>> --- a/drivers/clk/tegra/clk-sdmmc-mux.c
>> +++ b/drivers/clk/tegra/clk-sdmmc-mux.c
>> @@ -194,6 +194,17 @@ static void clk_sdmmc_mux_disable(struct clk_hw *hw)
>>  	gate_ops->disable(gate_hw);
>>  }
>>  
>> +static void clk_sdmmc_mux_restore_context(struct clk_hw *hw)
>> +{
>> +	struct clk_hw *parent = clk_hw_get_parent(hw);
>> +	unsigned long parent_rate = clk_hw_get_rate(parent);
>> +	unsigned long rate = clk_hw_get_rate(hw);
>> +	int parent_id = clk_hw_get_parent_index(hw, parent);
>> +
>> +	clk_sdmmc_mux_set_parent(hw, parent_id);
>> +	clk_sdmmc_mux_set_rate(hw, rate, parent_rate);
> 
> For the periph clocks you're restoring rate at first and then the
> parent, while here it's the other way around. I'm wondering if there is
> any difference in practice and thus whether rate's divider need to be
> set to a some safe value before switching to a new parent that has a
> higher clock rate than the old parent.

Although, I guess that all peripheral clocks should be disabled at this
point of resume. Correct?

>> +}
>> +
>>  static const struct clk_ops tegra_clk_sdmmc_mux_ops = {
>>  	.get_parent = clk_sdmmc_mux_get_parent,
>>  	.set_parent = clk_sdmmc_mux_set_parent,
>> @@ -203,6 +214,7 @@ static const struct clk_ops tegra_clk_sdmmc_mux_ops = {
>>  	.is_enabled = clk_sdmmc_mux_is_enabled,
>>  	.enable = clk_sdmmc_mux_enable,
>>  	.disable = clk_sdmmc_mux_disable,
>> +	.restore_context = clk_sdmmc_mux_restore_context,
>>  };
>>  
>>  struct clk *tegra_clk_register_sdmmc_mux_div(const char *name,
>>
> 
