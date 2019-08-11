From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 04/21] clk: tegra: pllout: Save and restore pllout
 context
Date: Sun, 11 Aug 2019 21:04:24 +0300
Message-ID: <3bc1cdc5-c8e7-a210-67ae-2a3f6f01660f@gmail.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-5-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565308020-31952-5-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

09.08.2019 2:46, Sowjanya Komatineni пишет:
> This patch implements save and restore of pllout context.
> 
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
> 
> So during suspend entry the state of pllout is saved and on resume
> it is restored back to have pllout in same state as before suspend.
> 
> pllout rate is saved and restore in clock divider so it will be at
> same rate as before suspend when pllout state is restored.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll-out.c  | 9 +++++++++
>  drivers/clk/tegra/clk-tegra210.c | 3 ++-
>  drivers/clk/tegra/clk.h          | 6 ++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll-out.c b/drivers/clk/tegra/clk-pll-out.c
> index 35f2bf00e1e6..d8bf89a81e6d 100644
> --- a/drivers/clk/tegra/clk-pll-out.c
> +++ b/drivers/clk/tegra/clk-pll-out.c
> @@ -69,10 +69,19 @@ static void clk_pll_out_disable(struct clk_hw *hw)
>  		spin_unlock_irqrestore(pll_out->lock, flags);
>  }
>  
> +static void tegra_clk_pll_out_restore_context(struct clk_hw *hw)
> +{
> +	if (!__clk_get_enable_count(hw->clk))
> +		clk_pll_out_disable(hw);
> +	else
> +		clk_pll_out_enable(hw);
> +}
> +
>  const struct clk_ops tegra_clk_pll_out_ops = {
>  	.is_enabled = clk_pll_out_is_enabled,
>  	.enable = clk_pll_out_enable,
>  	.disable = clk_pll_out_disable,
> +	.restore_context = tegra_clk_pll_out_restore_context,
>  };
>  
>  struct clk *tegra_clk_register_pll_out(const char *name,
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index df172d5772d7..4721ee030d1c 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -3200,7 +3200,8 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
>  					 8, 8, 1, NULL);
>  	clk = tegra_clk_register_pll_out("pll_re_out1", "pll_re_out1_div",
>  					 clk_base + PLLRE_OUT1, 1, 0,
> -					 CLK_SET_RATE_PARENT, 0, NULL);
> +					 CLK_SET_RATE_PARENT, TEGRA_PLLRE_OUT,
> +					 NULL);
>  	clks[TEGRA210_CLK_PLL_RE_OUT1] = clk;
>  
>  	/* PLLE */
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 905bf1096558..a464524fbc90 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -437,6 +437,10 @@ struct clk *tegra_clk_register_pllu_tegra210(const char *name,
>   * @rst_bit_idx:	bit to reset PLL divider
>   * @lock:		register lock
>   * @flags:		hardware-specific flags
> + *
> + * Flags:
> + * TEGRA_PLLRE_OUT - This flag indicates that it is PLLRE_OUT and is used to
> + *		     identify PLLRE_OUT during clk_pll_out save and restore.
>   */
>  struct tegra_clk_pll_out {
>  	struct clk_hw	hw;
> @@ -447,6 +451,8 @@ struct tegra_clk_pll_out {
>  	u8		flags;
>  };
>  
> +#define TEGRA_PLLRE_OUT BIT(0)
> +
>  #define to_clk_pll_out(_hw) container_of(_hw, struct tegra_clk_pll_out, hw)
>  
>  extern const struct clk_ops tegra_clk_pll_out_ops;
> 

Looks like the TEGRA_PLLRE_OUT flag is unused.
