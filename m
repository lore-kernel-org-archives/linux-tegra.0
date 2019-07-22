From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V6 07/21] clk: tegra: Support for OSC context save and
 restore
Date: Mon, 22 Jul 2019 13:12:00 +0300
Message-ID: <5d521102-83a5-ff5d-2301-4c6669bd7327@gmail.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-8-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563738060-30213-8-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> X-NVConfidentiality: public

What's that?

> This patch adds support for saving OSC clock frequency and the
> drive-strength during OSC clock init and creates an API to restore
> OSC control register value from the saved context.
> 
> This API is invoked by Tegra210 clock driver during system resume
> to restore the  OSC clock settings.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-fixed.c | 15 +++++++++++++++
>  drivers/clk/tegra/clk.h             |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
> index 8d91b2b191cf..7c6c8abfcde6 100644
> --- a/drivers/clk/tegra/clk-tegra-fixed.c
> +++ b/drivers/clk/tegra/clk-tegra-fixed.c
> @@ -17,6 +17,10 @@
>  #define OSC_CTRL			0x50
>  #define OSC_CTRL_OSC_FREQ_SHIFT		28
>  #define OSC_CTRL_PLL_REF_DIV_SHIFT	26
> +#define OSC_CTRL_MASK			(0x3f2 |	\
> +					(0xf << OSC_CTRL_OSC_FREQ_SHIFT))
> +
> +static u32 osc_ctrl_ctx;
>  
>  int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
>  			      unsigned long *input_freqs, unsigned int num,
> @@ -29,6 +33,7 @@ int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
>  	unsigned osc_idx;
>  
>  	val = readl_relaxed(clk_base + OSC_CTRL);
> +	osc_ctrl_ctx = val & OSC_CTRL_MASK;
>  	osc_idx = val >> OSC_CTRL_OSC_FREQ_SHIFT;
>  
>  	if (osc_idx < num)
> @@ -96,3 +101,13 @@ void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)
>  		*dt_clk = clk;
>  	}
>  }
> +
> +void tegra_clk_osc_resume(void __iomem *clk_base)
> +{
> +	u32 val;
> +
> +	val = readl_relaxed(clk_base + OSC_CTRL) & ~OSC_CTRL_MASK;
> +	val |= osc_ctrl_ctx;
> +	writel_relaxed(val, clk_base + OSC_CTRL);
> +	fence_udelay(2, clk_base);
> +}
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 8532f5150091..3cd003b7512a 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -849,6 +849,7 @@ int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>  int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>  		 u8 frac_width, u8 flags);
>  void tegra_clk_sync_state_pll(struct clk_hw *hw);
> +void tegra_clk_osc_resume(void __iomem *clk_base);
>  
>  /* Combined read fence with delay */
>  #define fence_udelay(delay, reg)	\
> 
