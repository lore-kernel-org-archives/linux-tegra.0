From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH v5 16/21] clk: tegra: pll: Add Set_default logic
Date: Wed, 20 May 2015 13:20:55 -0400
Message-ID: <555CC277.1040402@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>	<1431451444-23155-18-git-send-email-rklein@nvidia.com> <CANLzEkv2rO63083RxEFWU0a_qm+7QOx0mCD8ya8hDmp5QMmkgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLzEkv2rO63083RxEFWU0a_qm+7QOx0mCD8ya8hDmp5QMmkgQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benson Leung <bleung@chromium.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 5/13/2015 8:04 PM, Benson Leung wrote:
> On Tue, May 12, 2015 at 10:23 AM, Rhyland Klein <rklein@nvidia.com> wrote:
>> From: Bill Huang <bilhuang@nvidia.com>
>>
>> Add logic which (if specified for a pll) can verify that a PLL is set
>> to the proper default value and if not can set it. This can be
>> specified per PLL as each will have different default values.
>>
>> Based on original work by Aleksandr Frid <afrid@nvidia.com>
>>
>> Signed-off-by: Bill Huang <bilhuang@nvidia.com>
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
>> index 626466665dde..36aa2a95fac0 100644
>> --- a/drivers/clk/tegra/clk-pll.c
>> +++ b/drivers/clk/tegra/clk-pll.c
>> @@ -652,13 +652,26 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
>>                         unsigned long rate)
>>  {
>>         struct tegra_clk_pll *pll = to_clk_pll(hw);
>> +       struct tegra_clk_pll_freq_table old_cfg;
>>         int state, ret = 0;
>>
>>         state = clk_pll_is_enabled(hw);
>>
>> +       _get_pll_mnp(pll, &old_cfg);
>> +
>> +       if (state && pll->params->defaults_set && pll->params->dyn_ramp &&
>> +                       (cfg->m == old_cfg.m) && (cfg->p == old_cfg.p)) {
>> +               ret = pll->params->dyn_ramp(pll, cfg);
>> +               if (!ret)
>> +                       return 0;
>> +       }
>> +
> 
> This block above depends on defaults_set, but seems to be some
> additional dyn_ramp logic that is different from what the commit
> message describes of this patch, namely, setting defaults if
> defaults_set is not true.
> 
> Could you perhaps reverse the order of this patch [16/21] and the
> preceding one [15/21] clk: tegra: pll: Add dyn_ramp callback, and move
> this chunk of code into the dyn_ramp patch?

Will do.

> 
>>         if (state)
>>                 _clk_pll_disable(hw);
>>
>> +       if (!pll->params->defaults_set && pll->params->set_defaults)
>> +               pll->params->set_defaults(pll);
>> +
>>         _update_pll_mnp(pll, cfg);
>>
>>         if (pll->params->flags & TEGRA_PLL_HAS_CPCON)
>> @@ -1517,6 +1530,9 @@ static struct clk *_tegra_clk_register_pll(struct tegra_clk_pll *pll,
>>         if (!pll->params->calc_rate)
>>                 pll->params->calc_rate = _calc_rate;
>>
>> +       if (pll->params->set_defaults)
>> +               pll->params->set_defaults(pll);
>> +
>>         /* Data in .init is copied by clk_register(), so stack variable OK */
>>         pll->hw.init = &init;
>>
>> @@ -1636,7 +1652,6 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
>>         struct tegra_clk_pll *pll;
>>         struct clk *clk, *parent;
>>         unsigned long parent_rate;
>> -       int err;
>>         u32 val, val_iddq;
>>
>>         parent = __clk_lookup(parent_name);
>> @@ -1657,18 +1672,27 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
>>                 pll_params->vco_min = pll_params->adjust_vco(pll_params,
>>                                                              parent_rate);
>>
>> -       err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
>> -       if (err)
>> -               return ERR_PTR(err);
>> +       /*
>> +        * If the pll has a set_defaults callback, it will take care of
>> +        * configuring dynamic ramping and setting IDDQ in that path.
>> +        */
>> +       if (!pll_params->set_defaults) {
>> +               int err;
>>
>> -       val = readl_relaxed(clk_base + pll_params->base_reg);
>> -       val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
>> +               err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
>> +               if (err)
>> +                       return ERR_PTR(err);
>>
>> -       if (val & PLL_BASE_ENABLE)
>> -               WARN_ON(val_iddq & BIT(pll_params->iddq_bit_idx));
>> -       else {
>> -               val_iddq |= BIT(pll_params->iddq_bit_idx);
>> -               writel_relaxed(val_iddq, clk_base + pll_params->iddq_reg);
>> +               val = readl_relaxed(clk_base + pll_params->base_reg);
>> +               val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
>> +
>> +               if (val & PLL_BASE_ENABLE)
>> +                       WARN_ON(val_iddq & BIT(pll_params->iddq_bit_idx));
>> +               else {
>> +                       val_iddq |= BIT(pll_params->iddq_bit_idx);
>> +                       writel_relaxed(val_iddq,
>> +                                      clk_base + pll_params->iddq_reg);
>> +               }
>>         }
>>
>>         pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>> index a61d388364b3..38b4c95cfb2f 100644
>> --- a/drivers/clk/tegra/clk.h
>> +++ b/drivers/clk/tegra/clk.h
>> @@ -261,6 +261,7 @@ struct tegra_clk_pll_params {
>>         int             stepb_shift;
>>         int             lock_delay;
>>         int             max_p;
>> +       bool            defaults_set;
>>         struct pdiv_map *pdiv_tohw;
>>         struct div_nmp  *div_nmp;
>>         struct tegra_clk_pll_freq_table *freq_table;
>> @@ -275,6 +276,7 @@ struct tegra_clk_pll_params {
>>                                 unsigned long parent_rate);
>>         int     (*dyn_ramp)(struct tegra_clk_pll *pll,
>>                         struct tegra_clk_pll_freq_table *cfg);
>> +       void    (*set_defaults)(struct tegra_clk_pll *pll);
> 
> Kerneldoc for the two members, please. This is especially useful since
> the two members have such similar names, but they mean different
> things.
> 

Yah I thought I got all the new members, but apparently I got distracted
part way through the series and missed some. I'll double check for v6
that ALL members are kerneldoc'd.

-rhyland

-- 
nvpublic
