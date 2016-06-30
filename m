From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH v5] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Thu, 30 Jun 2016 11:32:14 -0400
Message-ID: <943f14f1-1c7c-055d-8dc6-f30f1196430f@nvidia.com>
References: <1464280891-23036-1-git-send-email-rklein@nvidia.com>
 <5763FFF5.5000303@nvidia.com> <20160617152336.GA27475@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160617152336.GA27475@ulmo.ba.sec>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
List-Id: linux-tegra@vger.kernel.org

On 6/17/2016 11:23 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, Jun 17, 2016 at 02:49:41PM +0100, Jon Hunter wrote:
>> Hi Thierry,
>>
>> On 26/05/16 17:41, Rhyland Klein wrote:
>>> From: Andrew Bresticker <abrestic@chromium.org>
>>>
>>> Move the UTMIPLL initialization code form clk-tegra<chip>.c files into
>>> clk-pll.c. UTMIPLL was being configured and set in HW control right
>>> after registration. However, when the clock init_table is processed and
>>> child clks of PLLU are enabled, it will call in and enable PLLU as
>>> well, and initiate SW enabling sequence even though PLLU is already in
>>> HW control. This leads to getting UTMIPLL stuck with a SEQ_BUSY status.
>>>
>>> Doing the initialization once during pllu_enable means we configure it
>>> properly into HW control.
>>>
>>> A side effect of the commonization/localization of the UTMIPLL init
>>> code, is that it corrects some errors that were present for earlier
>>> generations. For instance, in clk-tegra124.c, it used to have:
>>>
>>> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
>>>
>>> when the correct shift to use is present in the new version:
>>>
>>> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
>>>
>>> which matches the Tegra124 TRM register definition.
>>>
>>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>>>
>>> [rklein: Merged in some later fixes for potential deadlocks]
>>>
>>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
>>> ---
>>> v5:
>>>  - Initialized flags to 0 to avoid harmless spinlock warnings
>>>
>>> v4:
>>>  - Re-added examples in patch description
>>>
>>> v3:
>>>  - Flushed out description to describe this patch.
>>>
>>>  drivers/clk/tegra/clk-pll.c      | 484 +++++++++++++++++++++++++++++++++++++++
>>>  drivers/clk/tegra/clk-tegra114.c | 155 +------------
>>>  drivers/clk/tegra/clk-tegra124.c | 156 +------------
>>>  drivers/clk/tegra/clk-tegra210.c | 182 +--------------
>>>  drivers/clk/tegra/clk-tegra30.c  | 113 +--------
>>>  drivers/clk/tegra/clk.h          |  17 ++
>>>  6 files changed, 510 insertions(+), 597 deletions(-)
>>>
>>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>>> index 4e194ecc8d5e..31e20110fae4 100644
>>> --- a/drivers/clk/tegra/clk-pll.c
>>> +++ b/drivers/clk/tegra/clk-pll.c
>>
>> ...
>>
>>> +static int clk_pllu_tegra210_enable(struct clk_hw *hw)
>>> +{
>>> +	struct tegra_clk_pll *pll = to_clk_pll(hw);
>>> +	struct clk_hw *pll_ref = clk_hw_get_parent(hw);
>>> +	struct clk_hw *osc = clk_hw_get_parent(pll_ref);
>>> +	unsigned long flags = 0, input_rate;
>>> +	unsigned int i;
>>> +	int ret = 0;
>>> +	u32 val;
>>> +
>>> +	if (!osc) {
>>> +		pr_err("%s: failed to get OSC clock\n", __func__);
>>> +		return -EINVAL;
>>> +	}
>>> +	input_rate = clk_hw_get_rate(osc);
>>> +
>>> +	if (pll->lock)
>>> +		spin_lock_irqsave(pll->lock, flags);
>>> +
>>> +	_clk_pll_enable(hw);
>>> +	ret = clk_pll_wait_for_lock(pll);
>>> +	if (ret < 0)
>>> +		goto out;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
>>> +		if (input_rate == utmi_parameters[i].osc_frequency)
>>> +			break;
>>> +	}
>>> +
>>> +	if (i == ARRAY_SIZE(utmi_parameters)) {
>>> +		pr_err("%s: Unexpected input rate %lu\n", __func__, input_rate);
>>> +		ret = -EINVAL;
>>> +		goto out;
>>> +	}
>>> +
>>> +	val = pll_readl_base(pll);
>>> +	val &= ~PLLU_BASE_OVERRIDE;
>>> +	pll_writel_base(val, pll);
>>> +
>>> +	/* Put PLLU under HW control */
>>> +	val = readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
>>> +	val |= PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE |
>>> +	       PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT |
>>> +	       PLLU_HW_PWRDN_CFG0_USE_LOCKDET;
>>> +	val &= ~(PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL |
>>> +		  PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL);
>>> +	writel_relaxed(val, pll->clk_base + PLLU_HW_PWRDN_CFG0);
>>> +
>>> +	val = readl_relaxed(pll->clk_base + XUSB_PLL_CFG0);
>>> +	val &= ~XUSB_PLL_CFG0_PLLU_LOCK_DLY;
>>> +	writel_relaxed(val, pll->clk_base + XUSB_PLL_CFG0);
>>> +	udelay(1);
>>> +
>>> +	val = readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
>>> +	val |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
>>> +	writel_relaxed(val, pll->clk_base + PLLU_HW_PWRDN_CFG0);
>>> +	udelay(1);
>>> +
>>> +	/* Disable PLLU clock branch to UTMIPLL since it uses OSC */
>>> +	val = pll_readl_base(pll);
>>> +	val &= ~PLLU_BASE_CLKENABLE_USB;
>>> +	pll_writel_base(val, pll);
>>> +
>>> +	val = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
>>> +	if (val & UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE) {
>>> +		pr_debug("UTMIPLL already enabled\n");
>>> +		goto out;
>>> +	}
>>> +	val &= ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
>>> +	writel_relaxed(val, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
>>> +
>>> +	/* Program UTMIP PLL stable and active counts */
>>> +	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
>>> +	val &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
>>> +	val |= UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
>>> +	val &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
>>> +	val |= UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(
>>> +			utmi_parameters[i].active_delay_count);
>>> +	val |= UTMIP_PLL_CFG2_PHY_XTAL_CLOCKEN;
>>> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG2);
>>> +
>>> +	/* Program UTMIP PLL delay and oscillator frequency counts */
>>> +	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
>>> +	val &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
>>> +	val |= UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(
>>> +		utmi_parameters[i].enable_delay_count);
>>> +	val &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
>>> +	val |= UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(
>>> +		utmi_parameters[i].xtal_freq_count);
>>> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
>>> +
>>> +	/* Remove power downs from UTMIP PLL control bits */
>>> +	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
>>> +	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
>>> +	val |= UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
>>> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
>>> +	udelay(100);
>>
>> In next-20160617 I see that this udelay is now a usleep_range(100, 200)
>> and this is causing the following splat when the clock is enabled. I
>> don't think that we can use usleep here ...
> 
> Okay, I'll back out the patch. I'd really prefer to avoid busy-looping
> for 100 microseconds here, so can we please find another way to do this?
> 

It looks like we should be able to use a short udelay of 1-2us. I
believe the original code had udelay(1) and I know Jon and I tested
udelay(2) and it was ok.

Do you want me to send another patch rev with just the udelay change or
are you going to just modify it locally yourself?

-rhyland

-- 
nvpublic
