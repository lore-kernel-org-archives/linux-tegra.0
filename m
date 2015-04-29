From: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 12/19] clk: tegra: pll: Add specialized logic for T210
Date: Wed, 29 Apr 2015 11:27:46 -0700
Message-ID: <CAL1qeaEiKdFdhEfbWygFZcEioiGotd7=UDby9T7c_6djaDFxQA@mail.gmail.com>
References: <1430328109-537-1-git-send-email-rklein@nvidia.com>
	<1430328109-537-13-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430328109-537-13-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Rhyland,

On Wed, Apr 29, 2015 at 10:21 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Tegra210 SoC's, the logic to enable several of the plls is different
> from previous generations. Therefore, add registeration functions specific
> to Tegra210 which will handle them appropriately.
>
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> +#if defined(CONFIG_ARCH_TEGRA_210_SOC)
> +static int clk_plle_tegra210_enable(struct clk_hw *hw)
> +{
> +       struct tegra_clk_pll *pll = to_clk_pll(hw);
> +       struct tegra_clk_pll_freq_table sel;
> +       u32 val;
> +       int ret;
> +       unsigned long flags = 0;
> +       unsigned long input_rate = clk_get_rate(clk_get_parent(hw->clk));
> +
> +       if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
> +               return -EINVAL;
> +
> +       if (pll->lock)
> +               spin_lock_irqsave(pll->lock, flags);
> +
> +       val = pll_readl_base(pll);
> +       val &= ~BIT(29); /* Disable lock override */

The LOCK_OVERRIDE bit has also moved on Tegra210 - it's now bit 30.

> +       pll_writel_base(val, pll);
> +
> +       val = pll_readl(pll->params->aux_reg, pll);
> +       val |= PLLE_AUX_ENABLE_SWCTL;
> +       val &= ~PLLE_AUX_SEQ_ENABLE;
> +       pll_writel(val, pll->params->aux_reg, pll);

I'm not sure this bit is necessary - it's not in the TRM and it's not
present in downstream kernels.

> +       udelay(1);
> +
> +       val = pll_readl_misc(pll);
> +       val |= PLLE_MISC_LOCK_ENABLE;
> +       val |= PLLE_MISC_IDDQ_SW_CTRL;
> +       val &= ~PLLE_MISC_IDDQ_SW_VALUE;
> +       val |= PLLE_MISC_PLLE_PTS;
> +       val |= PLLE_MISC_VREG_BG_CTRL_MASK | PLLE_MISC_VREG_CTRL_MASK;
> +       pll_writel_misc(val, pll);
> +       udelay(5);
> +
> +       val = pll_readl(PLLE_SS_CTRL, pll);
> +       val |= PLLE_SS_DISABLE;
> +       pll_writel(val, PLLE_SS_CTRL, pll);
> +
> +       val = pll_readl_base(pll);
> +       val &= ~(divp_mask_shifted(pll) | divn_mask_shifted(pll) |
> +                divm_mask_shifted(pll));
> +       val &= ~(PLLE_BASE_DIVCML_MASK << PLLE_BASE_DIVCML_SHIFT);
> +       val |= sel.m << divm_shift(pll);
> +       val |= sel.n << divn_shift(pll);
> +       val |= sel.cpcon << PLLE_BASE_DIVCML_SHIFT;
> +       pll_writel_base(val, pll);
> +       udelay(1);
> +
> +       val = pll_readl_base(pll);
> +       val |= PLLE_BASE_ENABLE;
> +       pll_writel_base(val, pll);
> +
> +       ret = clk_pll_wait_for_lock(pll);
> +
> +       if (ret < 0)
> +               goto out;
> +
> +       val = pll_readl(PLLE_SS_CTRL, pll);
> +       val &= ~(PLLE_SS_CNTL_CENTER | PLLE_SS_CNTL_INVERT);
> +       val &= ~PLLE_SS_COEFFICIENTS_MASK;
> +       val |= PLLE_SS_COEFFICIENTS_VAL;
> +       pll_writel(val, PLLE_SS_CTRL, pll);
> +       val &= ~(PLLE_SS_CNTL_SSC_BYP | PLLE_SS_CNTL_BYPASS_SS);
> +       pll_writel(val, PLLE_SS_CTRL, pll);
> +       udelay(1);
> +       val &= ~PLLE_SS_CNTL_INTERP_RESET;
> +       pll_writel(val, PLLE_SS_CTRL, pll);
> +       udelay(1);
> +
> +       /* Enable hw control of xusb brick pll */
> +       val = pll_readl_misc(pll);
> +       val &= ~PLLE_MISC_IDDQ_SW_CTRL;
> +       pll_writel_misc(val, pll);
> +
> +       val = pll_readl(pll->params->aux_reg, pll);
> +       val |= (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SEQ_START_STATE);

PLLE_AUX_SS_SEQ_INCLUDE (bit 31) should be set here instead of
PLLE_AUX_SEQ_START_STATE.

> +       val &= ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
> +       pll_writel(val, pll->params->aux_reg, pll);
> +       udelay(1);
> +       val |= PLLE_AUX_SEQ_ENABLE;
> +       pll_writel(val, pll->params->aux_reg, pll);
> +
> +       val = pll_readl(XUSBIO_PLL_CFG0, pll);
> +       val |= (XUSBIO_PLL_CFG0_PADPLL_USE_LOCKDET |
> +               XUSBIO_PLL_CFG0_SEQ_START_STATE);
> +       val &= ~(XUSBIO_PLL_CFG0_CLK_ENABLE_SWCTL |
> +                XUSBIO_PLL_CFG0_PADPLL_RESET_SWCTL);
> +       pll_writel(val, XUSBIO_PLL_CFG0, pll);
> +       udelay(1);
> +       val |= XUSBIO_PLL_CFG0_SEQ_ENABLE;
> +       pll_writel(val, XUSBIO_PLL_CFG0, pll);
> +
> +       /* Enable hw control of SATA pll */
> +       val = pll_readl(SATA_PLL_CFG0, pll);
> +       val &= ~SATA_PLL_CFG0_PADPLL_RESET_SWCTL;
> +       val |= SATA_PLL_CFG0_PADPLL_USE_LOCKDET;
> +       val |= SATA_PLL_CFG0_SEQ_START_STATE;
> +       pll_writel(val, SATA_PLL_CFG0, pll);
> +
> +       udelay(1);
> +
> +       val = pll_readl(SATA_PLL_CFG0, pll);
> +       val |= SATA_PLL_CFG0_SEQ_ENABLE;
> +       pll_writel(val, SATA_PLL_CFG0, pll);

The XUSBIO and SATA PLL bits can be removed for Tegra210.  They must
now be done separately, as part of the UPHY enable sequence.

> +
> +out:
> +       if (pll->lock)
> +               spin_unlock_irqrestore(pll->lock, flags);
> +
> +       return ret;
> +}

> +struct clk *tegra_clk_register_plle_tegra210(const char *name,
> +                               const char *parent_name,
> +                               void __iomem *clk_base, unsigned long flags,
> +                               struct tegra_clk_pll_params *pll_params,
> +                               spinlock_t *lock)
> +{
> +       struct tegra_clk_pll *pll;
> +       struct clk *clk;
> +       u32 val, val_aux;
> +
> +       pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
> +       if (IS_ERR(pll))
> +               return ERR_CAST(pll);
> +
> +       /* ensure parent is set to pll_re_vco */

I think this is a typo - we're ensuring that the parent is set to pll_ref here.

> +       val = pll_readl_base(pll);
> +       val_aux = pll_readl(pll_params->aux_reg, pll);
> +
> +       if (val & PLLE_BASE_ENABLE) {
> +               if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
> +                       (val_aux & PLLE_AUX_PLLP_SEL))
> +                       WARN(1, "pll_e enabled with unsupported parent %s\n",
> +                         (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
> +                                       "pll_re_vco");
> +       } else {
> +               val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
> +               pll_writel(val_aux, pll_params->aux_reg, pll);
> +       }
> +
> +       clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
> +                                     &tegra_clk_plle_tegra210_ops);
> +       if (IS_ERR(clk))
> +               kfree(pll);
> +
> +       return clk;
> +}

-Andrew
