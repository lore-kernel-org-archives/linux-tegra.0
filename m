From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 05/21] clk: tegra: pll: Save and restore pll context
Date: Fri, 9 Aug 2019 14:33:18 +0300
Message-ID: <68f65db6-44b7-1c75-2633-4a2fffd62a92@gmail.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-6-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565308020-31952-6-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

09.08.2019 2:46, Sowjanya Komatineni пишет:
> This patch implements save and restore of PLL context.
> 
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
> 
> So during suspend entry pll context is stored and on resume it is
> restored back along with its state.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 88 ++++++++++++++++++++++++++++-----------------
>  drivers/clk/tegra/clk.h     |  2 ++
>  2 files changed, 58 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 1583f5fc992f..e52add2bbdbb 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1008,6 +1008,28 @@ static unsigned long clk_plle_recalc_rate(struct clk_hw *hw,
>  	return rate;
>  }
>  
> +static void tegra_clk_pll_restore_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_pll *pll = to_clk_pll(hw);
> +	struct clk_hw *parent = clk_hw_get_parent(hw);
> +	unsigned long parent_rate = clk_hw_get_rate(parent);
> +	unsigned long rate = clk_hw_get_rate(hw);
> +	u32 val;
> +
> +	if (clk_pll_is_enabled(hw))
> +		return;
> +
> +	if (pll->params->set_defaults)
> +		pll->params->set_defaults(pll);
> +
> +	clk_pll_set_rate(hw, rate, parent_rate);
> +
> +	if (!__clk_get_enable_count(hw->clk))

What about orphaned clocks? Is enable_count > 0 for them?

> +		clk_pll_disable(hw);
> +	else
> +		clk_pll_enable(hw);
> +}

[snip]
