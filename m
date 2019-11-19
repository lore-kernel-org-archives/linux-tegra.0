From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 01/17] soc: tegra: pmc: Add helper functions for PLLM
 overrides
Date: Tue, 19 Nov 2019 22:32:22 +0300
Message-ID: <dec7141c-0761-d38b-890f-5cdd969d1c8c@gmail.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
 <1574146234-3871-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1574146234-3871-2-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.11.2019 09:50, Sowjanya Komatineni пишет:
> Tegra PMC has an option to override the CAR PLLM configuration during
> the warmboot.
> 
> PLLM dividers and enable overrides from Tegra PMC are applicable only
> when PLLM_OVERRIDE bit in PMC_PLLP_WB0_OVERRIDE register is set by Tegra
> the bootloader. During warmboot based on this override enable, PLLM
> divider and enable configuration from overrides in PMC or from CAR
> module are used.
> 
> Currently PLLM overrides in Tegra PMC are directly programmed by the Tegra
> clock driver and with this when PMC is in secure mode, any direct PMC
> register access from non-secure world will not go through.
> 
> This patch adds helper functions for use by the Tegra clock driver to
> configure these PLLM overrides during PLLM clock rate and state changes.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 204 +++++++++++++++++++++++++++++++++++++++++++++++-
>  include/soc/tegra/pmc.h |   5 ++
>  2 files changed, 205 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 8db63cfba833..224e7cf8dc00 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -79,6 +79,14 @@
>  
>  #define PMC_PWR_DET			0x48
>  
> +#define TEGRA186_PMC_PLLP_WB0_OVERRIDE	0x4c
> +#define PMC_PLLP_WB0_OVERRIDE		0xf8
> +#define  PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE BIT(12)
> +#define  PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE BIT(11)
> +
> +#define TEGRA186_PMC_PLLM_WB0_OVERRIDE_FREQ	0x50
> +#define TEGRA186_PMC_PLLM_WB0_OVERRIDE_2	0x54
> +
>  #define PMC_SCRATCH0_MODE_RECOVERY	BIT(31)
>  #define PMC_SCRATCH0_MODE_BOOTLOADER	BIT(30)
>  #define PMC_SCRATCH0_MODE_RCM		BIT(1)
> @@ -122,6 +130,9 @@
>  #define IO_DPD2_STATUS			0x1c4
>  #define SEL_DPD_TIM			0x1c8
>  
> +#define PMC_PLLM_WB0_OVERRIDE_FREQ	0x1dc
> +#define PMC_PLLM_WB0_OVERRIDE_2		0x2b0
> +
>  #define PMC_SCRATCH54			0x258
>  #define  PMC_SCRATCH54_DATA_SHIFT	8
>  #define  PMC_SCRATCH54_ADDR_SHIFT	0
> @@ -182,6 +193,15 @@ struct tegra_pmc_regs {
>  	unsigned int rst_source_mask;
>  	unsigned int rst_level_shift;
>  	unsigned int rst_level_mask;
> +	unsigned int pllp_wb0_override;
> +	unsigned int pllm_wb0_override_freq;
> +	unsigned int pllm_wb0_override_2;
> +	unsigned int override_divm_shift;
> +	unsigned int override_divm_mask;
> +	unsigned int override_divn_shift;
> +	unsigned int override_divn_mask;
> +	unsigned int override_divp_shift;
> +	unsigned int override_divp_mask;
>  };
>  
>  struct tegra_wake_event {
> @@ -227,6 +247,7 @@ struct tegra_pmc_soc {
>  	bool needs_mbist_war;
>  	bool has_impl_33v_pwr;
>  	bool maybe_tz_only;
> +	bool has_pllm_wb0_override;
>  
>  	const struct tegra_io_pad_soc *io_pads;
>  	unsigned int num_io_pads;
> @@ -1156,6 +1177,99 @@ static void tegra_powergate_remove_all(struct device_node *parent)
>  	of_node_put(np);
>  }
>  
> +bool tegra_pmc_is_pllm_wb0_override_enabled(void)
> +{
> +	u32 val;
> +
> +	if (pmc->soc->has_pllm_wb0_override) {
> +		val = tegra_pmc_readl(pmc, pmc->soc->regs->pllp_wb0_override);
> +		return (val & PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE) ? 1 : 0;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_pmc_is_pllm_wb0_override_enabled);
> +
> +bool tegra_pmc_is_pllm_wb0_enabled(void)
> +{
> +	u32 val;
> +
> +	if (pmc->soc->has_pllm_wb0_override) {
> +		val = tegra_pmc_readl(pmc, pmc->soc->regs->pllp_wb0_override);
> +		return (val & PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE) ? 1 : 0;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_pmc_is_pllm_wb0_enabled);
> +
> +void tegra_pmc_set_pllm_wb0_enable(bool enable)
> +{
> +	u32 val;
> +
> +	if (pmc->soc->has_pllm_wb0_override) {
> +		val = tegra_pmc_readl(pmc, pmc->soc->regs->pllp_wb0_override);
> +		if (enable)
> +			val |= PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE;
> +		else
> +			val &= ~PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE;
> +		tegra_pmc_writel(pmc, val, pmc->soc->regs->pllp_wb0_override);
> +	}
> +}
> +EXPORT_SYMBOL(tegra_pmc_set_pllm_wb0_enable);
> +
> +void tegra_pmc_get_pllm_wb0_mnp_overrides(u32 *divm, u32 *divn, u8 *divp)
> +{
> +	u32 val;
> +	unsigned int divnm_reg, divp_reg;
> +
> +	if (pmc->soc->has_pllm_wb0_override) {
> +		divnm_reg = pmc->soc->regs->pllm_wb0_override_freq;
> +		divp_reg = pmc->soc->regs->pllm_wb0_override_2;
> +
> +		if (tegra_pmc_is_pllm_wb0_override_enabled()) {
> +			val = tegra_pmc_readl(pmc, divnm_reg);
> +			*divm = (val >> pmc->soc->regs->override_divm_shift) &
> +				pmc->soc->regs->override_divm_mask;
> +			*divn = (val >> pmc->soc->regs->override_divn_shift) &
> +				pmc->soc->regs->override_divn_mask;
> +			val = tegra_pmc_readl(pmc, divp_reg);
> +			*divp = (val >> pmc->soc->regs->override_divp_shift) &
> +				pmc->soc->regs->override_divp_mask;
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(tegra_pmc_get_pllm_wb0_mnp_overrides);
> +
> +void tegra_pmc_set_pllm_wb0_mnp_overrides(u32 divm, u32 divn, u8 divp)
> +{
> +	u32 val;
> +	unsigned int divnm_reg, divp_reg;
> +
> +	if (pmc->soc->has_pllm_wb0_override) {
> +		divnm_reg = pmc->soc->regs->pllm_wb0_override_freq;
> +		divp_reg = pmc->soc->regs->pllm_wb0_override_2;
> +
> +		if (tegra_pmc_is_pllm_wb0_override_enabled()) {
> +			val = tegra_pmc_readl(pmc, divp_reg);
> +			val &= ~(pmc->soc->regs->override_divp_mask <<
> +				 pmc->soc->regs->override_divp_shift);
> +			val |= (divp << pmc->soc->regs->override_divp_shift);
> +			tegra_pmc_writel(pmc, val, divp_reg);
> +
> +			val = tegra_pmc_readl(pmc, divnm_reg);
> +			val &= ~(pmc->soc->regs->override_divm_mask <<
> +				 pmc->soc->regs->override_divm_shift);
> +			val |= divm << pmc->soc->regs->override_divm_shift;
> +			val &= ~(pmc->soc->regs->override_divn_mask <<
> +				 pmc->soc->regs->override_divn_shift);
> +			val |= divn << pmc->soc->regs->override_divn_shift;
> +			tegra_pmc_writel(pmc, val, divnm_reg);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(tegra_pmc_set_pllm_wb0_mnp_overrides);

Hello Sowjanya,

The exporting isn't needed because both PMC and CaR drivers are
built-in. Same for the other patches.

[snip]
