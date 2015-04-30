From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 16/19] clk: tegra: pll: Add Set_default logic
Date: Thu, 30 Apr 2015 11:31:22 -0400
Message-ID: <55424ACA.9010406@nvidia.com>
References: <1430328109-537-1-git-send-email-rklein@nvidia.com> <1430328109-537-17-git-send-email-rklein@nvidia.com> <20150430101225.GU3097@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150430101225.GU3097-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 4/30/2015 6:12 AM, Peter De Schrijver wrote:
> On Wed, Apr 29, 2015 at 01:21:46PM -0400, Rhyland Klein wrote:
>> From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Add logic which (if specified for a pll) can verify that a PLL is set
>> to the proper default value and if not can set it. This can be
>> specified per PLL as each will have different default values.
>>
> 
> Why can't we just set the default values at init time?

Sorry, I did some investigation into this and wrote up a nice response
... and forgot to hit send ...

The reason this can't be run only once at init time is the following. In
reality, we want to have the defined default values written as early as
possible. Idealy, the bootloader could write these, so the kernel need
only check, see they are right, and not touch them. However, since we
can't rely on the bootloader to do so, the kernel needs the support to
be able to write these default values. At init time, some pll's will be
enabled (from bootloader) and because they are enabled (and the rest of
the clk framework isn't done being setup yet) we can't disable them to
write the full register values. Therefore, the set_defaults logic uses a
2-pass system.

first pass: Try to set defaults at init/registration time. If pll is
disabled, this works fine. If it is enabled, then we update a subset of
the register as a "best effort" setting of the defaults.

second pass: Should only run the first time we go through set_rate for a
pll. If the first pass already wrote default value, then it skips this
step. Otherwise it will go in, once the pll is disabled in the set_rate
path, and write the full register default.

This is required because some registers need to be reset to the default
values we have to ensure locking works correctly. Does that make sense?

-rhyland

> 
>> Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> v2:
>>   - Remove MACRO for PLL_MISC_CHECK_DEFAULT as suggested, and instead
>>     the tegra210 driver will include an inline version of this function.
>>
>>  drivers/clk/tegra/clk-pll.c |   46 ++++++++++++++++++++++++++++++++-----------
>>  drivers/clk/tegra/clk.h     |    2 ++
>>  2 files changed, 37 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>> index 00f0e621533a..28a2376cd8a7 100644
>> --- a/drivers/clk/tegra/clk-pll.c
>> +++ b/drivers/clk/tegra/clk-pll.c
>> @@ -658,15 +658,28 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
>>  			unsigned long rate)
>>  {
>>  	struct tegra_clk_pll *pll = to_clk_pll(hw);
>> +	struct tegra_clk_pll_freq_table old_cfg;
>>  	int state, ret = 0;
>>  
>>  	state = clk_pll_is_enabled(hw);
>>  
>> +	_get_pll_mnp(pll, &old_cfg);
>> +
>> +	if (state && pll->params->defaults_set && pll->params->dyn_ramp &&
>> +			(cfg->m == old_cfg.m) && (cfg->p == old_cfg.p)) {
>> +		ret = pll->params->dyn_ramp(pll, cfg);
>> +		if (!ret)
>> +			return 0;
>> +	}
>> +
>>  	if (state) {
>>  		pll_clk_stop_ss(pll);
>>  		_clk_pll_disable(hw);
>>  	}
>>  
>> +	if (!pll->params->defaults_set && pll->params->set_defaults)
>> +		pll->params->set_defaults(pll);
>> +
>>  	_update_pll_mnp(pll, cfg);
>>  
>>  	if (pll->params->flags & TEGRA_PLL_HAS_CPCON)
>> @@ -1526,6 +1539,9 @@ static struct clk *_tegra_clk_register_pll(struct tegra_clk_pll *pll,
>>  	if (!pll->params->calc_rate)
>>  		pll->params->calc_rate = _calc_rate;
>>  
>> +	if (pll->params->set_defaults)
>> +		pll->params->set_defaults(pll);
>> +
>>  	/* Data in .init is copied by clk_register(), so stack variable OK */
>>  	pll->hw.init = &init;
>>  
>> @@ -1644,7 +1660,6 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
>>  	struct tegra_clk_pll *pll;
>>  	struct clk *clk, *parent;
>>  	unsigned long parent_rate;
>> -	int err;
>>  	u32 val, val_iddq;
>>  
>>  	parent = __clk_lookup(parent_name);
>> @@ -1665,18 +1680,27 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
>>  		pll_params->vco_min = pll_params->adjust_vco(pll_params,
>>  							     parent_rate);
>>  
>> -	err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
>> -	if (err)
>> -		return ERR_PTR(err);
>> +	/*
>> +	 * If the pll has a set_defaults callback, it will take care of
>> +	 * configuring dynamic ramping and setting IDDQ in that path.
>> +	 */
>> +	if (!pll_params->set_defaults) {
>> +		int err;
>>  
>> -	val = readl_relaxed(clk_base + pll_params->base_reg);
>> -	val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
>> +		err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
>> +		if (err)
>> +			return ERR_PTR(err);
>>  
>> -	if (val & PLL_BASE_ENABLE)
>> -		WARN_ON(val_iddq & BIT(pll_params->iddq_bit_idx));
>> -	else {
>> -		val_iddq |= BIT(pll_params->iddq_bit_idx);
>> -		writel_relaxed(val_iddq, clk_base + pll_params->iddq_reg);
>> +		val = readl_relaxed(clk_base + pll_params->base_reg);
>> +		val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
>> +
>> +		if (val & PLL_BASE_ENABLE)
>> +			WARN_ON(val_iddq & BIT(pll_params->iddq_bit_idx));
>> +		else {
>> +			val_iddq |= BIT(pll_params->iddq_bit_idx);
>> +			writel_relaxed(val_iddq,
>> +				       clk_base + pll_params->iddq_reg);
>> +		}
>>  	}
>>  
>>  	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>> index 850521d42be6..84c417576c18 100644
>> --- a/drivers/clk/tegra/clk.h
>> +++ b/drivers/clk/tegra/clk.h
>> @@ -239,6 +239,7 @@ struct tegra_clk_pll_params {
>>  	int		stepb_shift;
>>  	int		lock_delay;
>>  	int		max_p;
>> +	bool		defaults_set;
>>  	struct pdiv_map *pdiv_tohw;
>>  	struct div_nmp	*div_nmp;
>>  	struct tegra_clk_pll_freq_table	*freq_table;
>> @@ -254,6 +255,7 @@ struct tegra_clk_pll_params {
>>  				unsigned long parent_rate);
>>  	int	(*dyn_ramp)(struct tegra_clk_pll *pll,
>>  			struct tegra_clk_pll_freq_table *cfg);
>> +	void	(*set_defaults)(struct tegra_clk_pll *pll);
>>  };
>>  
>>  #define TEGRA_PLL_USE_LOCK BIT(0)
>> -- 
>> 1.7.9.5
>>


-- 
nvpublic
