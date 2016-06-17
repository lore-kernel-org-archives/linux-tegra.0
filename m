From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Fri, 17 Jun 2016 14:49:41 +0100
Message-ID: <5763FFF5.5000303@nvidia.com>
References: <1464280891-23036-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464280891-23036-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On 26/05/16 17:41, Rhyland Klein wrote:
> From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> Move the UTMIPLL initialization code form clk-tegra<chip>.c files into
> clk-pll.c. UTMIPLL was being configured and set in HW control right
> after registration. However, when the clock init_table is processed and
> child clks of PLLU are enabled, it will call in and enable PLLU as
> well, and initiate SW enabling sequence even though PLLU is already in
> HW control. This leads to getting UTMIPLL stuck with a SEQ_BUSY status.
> 
> Doing the initialization once during pllu_enable means we configure it
> properly into HW control.
> 
> A side effect of the commonization/localization of the UTMIPLL init
> code, is that it corrects some errors that were present for earlier
> generations. For instance, in clk-tegra124.c, it used to have:
> 
> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
> 
> when the correct shift to use is present in the new version:
> 
> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
> 
> which matches the Tegra124 TRM register definition.
> 
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> [rklein: Merged in some later fixes for potential deadlocks]
> 
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v5:
>  - Initialized flags to 0 to avoid harmless spinlock warnings
> 
> v4:
>  - Re-added examples in patch description
> 
> v3:
>  - Flushed out description to describe this patch.
> 
>  drivers/clk/tegra/clk-pll.c      | 484 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-tegra114.c | 155 +------------
>  drivers/clk/tegra/clk-tegra124.c | 156 +------------
>  drivers/clk/tegra/clk-tegra210.c | 182 +--------------
>  drivers/clk/tegra/clk-tegra30.c  | 113 +--------
>  drivers/clk/tegra/clk.h          |  17 ++
>  6 files changed, 510 insertions(+), 597 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 4e194ecc8d5e..31e20110fae4 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c

...

> +static int clk_pllu_tegra210_enable(struct clk_hw *hw)
> +{
> +	struct tegra_clk_pll *pll = to_clk_pll(hw);
> +	struct clk_hw *pll_ref = clk_hw_get_parent(hw);
> +	struct clk_hw *osc = clk_hw_get_parent(pll_ref);
> +	unsigned long flags = 0, input_rate;
> +	unsigned int i;
> +	int ret = 0;
> +	u32 val;
> +
> +	if (!osc) {
> +		pr_err("%s: failed to get OSC clock\n", __func__);
> +		return -EINVAL;
> +	}
> +	input_rate = clk_hw_get_rate(osc);
> +
> +	if (pll->lock)
> +		spin_lock_irqsave(pll->lock, flags);
> +
> +	_clk_pll_enable(hw);
> +	ret = clk_pll_wait_for_lock(pll);
> +	if (ret < 0)
> +		goto out;
> +
> +	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
> +		if (input_rate == utmi_parameters[i].osc_frequency)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(utmi_parameters)) {
> +		pr_err("%s: Unexpected input rate %lu\n", __func__, input_rate);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	val = pll_readl_base(pll);
> +	val &= ~PLLU_BASE_OVERRIDE;
> +	pll_writel_base(val, pll);
> +
> +	/* Put PLLU under HW control */
> +	val = readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
> +	val |= PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE |
> +	       PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT |
> +	       PLLU_HW_PWRDN_CFG0_USE_LOCKDET;
> +	val &= ~(PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL |
> +		  PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL);
> +	writel_relaxed(val, pll->clk_base + PLLU_HW_PWRDN_CFG0);
> +
> +	val = readl_relaxed(pll->clk_base + XUSB_PLL_CFG0);
> +	val &= ~XUSB_PLL_CFG0_PLLU_LOCK_DLY;
> +	writel_relaxed(val, pll->clk_base + XUSB_PLL_CFG0);
> +	udelay(1);
> +
> +	val = readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
> +	val |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
> +	writel_relaxed(val, pll->clk_base + PLLU_HW_PWRDN_CFG0);
> +	udelay(1);
> +
> +	/* Disable PLLU clock branch to UTMIPLL since it uses OSC */
> +	val = pll_readl_base(pll);
> +	val &= ~PLLU_BASE_CLKENABLE_USB;
> +	pll_writel_base(val, pll);
> +
> +	val = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
> +	if (val & UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE) {
> +		pr_debug("UTMIPLL already enabled\n");
> +		goto out;
> +	}
> +	val &= ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
> +	writel_relaxed(val, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
> +
> +	/* Program UTMIP PLL stable and active counts */
> +	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
> +	val &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
> +	val |= UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
> +	val &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
> +	val |= UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(
> +			utmi_parameters[i].active_delay_count);
> +	val |= UTMIP_PLL_CFG2_PHY_XTAL_CLOCKEN;
> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG2);
> +
> +	/* Program UTMIP PLL delay and oscillator frequency counts */
> +	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
> +	val &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
> +	val |= UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(
> +		utmi_parameters[i].enable_delay_count);
> +	val &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
> +	val |= UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(
> +		utmi_parameters[i].xtal_freq_count);
> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
> +
> +	/* Remove power downs from UTMIP PLL control bits */
> +	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
> +	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
> +	val |= UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
> +	udelay(100);

In next-20160617 I see that this udelay is now a usleep_range(100, 200)
and this is causing the following splat when the clock is enabled. I
don't think that we can use usleep here ...

[    0.224571] BUG: scheduling while atomic: swapper/0/1/0x00000003
[    0.224583] Modules linked in:
[    0.224597] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 4.7.0-rc3-next-20160617+ #277
[    0.224613] Hardware name: Google Pixel C (DT)
[    0.224623] Call trace:
[    0.224640] [<ffff0000080888b0>] dump_backtrace+0x0/0x1ac
[    0.224653] [<ffff000008088a70>] show_stack+0x14/0x1c
[    0.224669] [<ffff00000834a984>] dump_stack+0x8c/0xb0
[    0.224683] [<ffff00000814db30>] __schedule_bug+0x3c/0x50
[    0.224698] [<ffff0000087cd80c>] __schedule+0x470/0x56c
[    0.224708] [<ffff0000087cd948>] schedule+0x40/0xa4
[    0.224720] [<ffff0000087d0a14>] schedule_hrtimeout_range_clock+0x84/0xf0
[    0.224731] [<ffff0000087d0a90>] schedule_hrtimeout_range+0x10/0x18
[    0.224743] [<ffff0000087d05c8>] usleep_range+0x3c/0x44
[    0.224756] [<ffff0000086b25a4>] clk_pllu_tegra210_enable+0x200/0x2a8
[    0.224770] [<ffff000008698ef4>] clk_core_enable+0x5c/0x94
[    0.224780] [<ffff000008698edc>] clk_core_enable+0x44/0x94
[    0.224791] [<ffff000008698edc>] clk_core_enable+0x44/0x94
[    0.224801] [<ffff000008698edc>] clk_core_enable+0x44/0x94
[    0.224812] [<ffff0000086991b8>] clk_enable+0x24/0x40
[    0.224825] [<ffff00000842dd60>] tegra_powergate_enable_clocks.isra.6+0x90/0xd0
[    0.224840] [<ffff00000842e230>] tegra_powergate_power_up+0xa4/0x144
[    0.224851] [<ffff00000842ec40>] tegra_pmc_probe+0x6e0/0x8ec
[    0.224865] [<ffff0000084a72f4>] platform_drv_probe+0x50/0xbc
[    0.224879] [<ffff0000084a56fc>] driver_probe_device+0x1fc/0x29c
[    0.224890] [<ffff0000084a5840>] __driver_attach+0xa4/0xa8
[    0.224902] [<ffff0000084a3824>] bus_for_each_dev+0x58/0x98
[    0.224913] [<ffff0000084a5028>] driver_attach+0x20/0x28
[    0.224924] [<ffff0000084a4c48>] bus_add_driver+0x1c8/0x22c
[    0.224935] [<ffff0000084a60d8>] driver_register+0x68/0x108
[    0.224945] [<ffff0000084a7238>] __platform_driver_register+0x48/0x50
[    0.224960] [<ffff000008b37a30>] tegra_pmc_driver_init+0x18/0x20
[    0.224971] [<ffff000008081a54>] do_one_initcall+0x38/0x12c
[    0.224985] [<ffff000008b10ce0>] kernel_init_freeable+0x148/0x1ec
[    0.224997] [<ffff0000087caf98>] kernel_init+0x10/0x100
[    0.225008] [<ffff000008084e10>] ret_from_fork+0x10/0x40

Note the above is from some testing I am doing with adding power-domains for
XUSB in my local branch so you may not see the exact same dump in the mainline.

Cheers
Jon

-- 
nvpublic
