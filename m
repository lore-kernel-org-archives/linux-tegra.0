From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 2/4] clk: tegra: add fence_delay for clock registers
Date: Wed, 24 Jan 2018 10:20:03 +0000
Message-ID: <79479315-be18-2a24-acbc-395211accc98@nvidia.com>
References: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
 <1516699369-3513-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1516699369-3513-3-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 23/01/18 09:22, Peter De Schrijver wrote:
> To ensure writes to clock registers have properly propagated through the
> clock control logic and state machines, we need to ensure the writes have
> been posted in the registers and wait for 1us after that.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 3b2763d..ba7e20e 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -812,4 +812,11 @@ static inline struct clk *tegra_clk_register_emc(void __iomem *base,
>  u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
>  int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>  
> +/* Combined read fence with delay */
> +#define fence_udelay(delay, reg)	\
> +	do {				\
> +		readl(reg);		\
> +		udelay(delay);		\
> +	} while (0)
> +
>  #endif /* TEGRA_CLK_H */

Not sure we need to pass the delay here if it is always 1us per the
description. But it is fine with me so ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
