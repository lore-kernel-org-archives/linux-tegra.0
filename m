From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 03/20] clk: tegra: divider: Save and restore divider
 rate
Date: Wed, 31 Jul 2019 13:49:04 +0300
Message-ID: <36a7f0a2-89d3-4f7b-7521-eefc61cbfcef@gmail.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564532424-10449-4-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

31.07.2019 3:20, Sowjanya Komatineni пишет:
> This patch implements context restore for clock divider.
> 
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
> 
> So on resume, clock dividers are restored back for normal operation.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-divider.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
> index e76731fb7d69..ca0de5f11f84 100644
> --- a/drivers/clk/tegra/clk-divider.c
> +++ b/drivers/clk/tegra/clk-divider.c
> @@ -109,10 +109,21 @@ static int clk_frac_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  	return 0;
>  }
>  
> +static void clk_divider_restore_context(struct clk_hw *hw)
> +{
> +	struct clk_hw *parent = clk_hw_get_parent(hw);
> +	unsigned long parent_rate = clk_hw_get_rate(parent);
> +	unsigned long rate = clk_hw_get_rate(hw);
> +
> +	if (clk_frac_div_set_rate(hw, rate, parent_rate) < 0)
> +		WARN_ON(1);
> +}
> +
>  const struct clk_ops tegra_clk_frac_div_ops = {
>  	.recalc_rate = clk_frac_div_recalc_rate,
>  	.set_rate = clk_frac_div_set_rate,
>  	.round_rate = clk_frac_div_round_rate,
> +	.restore_context = clk_divider_restore_context,
>  };
>  
>  struct clk *tegra_clk_register_divider(const char *name,
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
