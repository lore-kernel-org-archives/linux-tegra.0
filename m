From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 2/4] clk: tegra: add fence_delay for clock registers
Date: Tue, 19 Dec 2017 23:04:25 +0000
Message-ID: <9026e3d1-26aa-28fc-6098-60484957da48@nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
 <1510842542-16451-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1510842542-16451-3-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 16/11/17 14:29, Peter De Schrijver wrote:
> To ensure writes to clock registers have properly propagated through the
> clock control logic and state machines, we need to ensure the writes have
> been posted in the registers and wait for 1us after that.

Is this is all cases or just for the SLCG?

> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 872f118..d5badbe 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -809,4 +809,11 @@ static inline struct clk *tegra_clk_register_emc(void __iomem *base,
>  u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
>  int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>  
> +/* Combined read fence with delay */
> +#define fence_udelay(delay, reg)	\
> +	do {				\
> +		readl(reg);		\
> +		udelay(delay);		\
> +	} while(0)
> +
>  #endif /* TEGRA_CLK_H */

Do we plan to use this else-where or just for this WAR? I am wondering
if it should just go in the Tegra210 clock file.

Cheers
Jon

-- 
nvpublic
