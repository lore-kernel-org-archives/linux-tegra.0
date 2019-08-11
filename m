From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 13/21] clk: tegra210: Use fence_udelay during PLLU init
Date: Sun, 11 Aug 2019 21:02:02 +0300
Message-ID: <1d09a2c5-4973-340f-fdfc-d4e665c8b55d@gmail.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-14-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565308020-31952-14-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

09.08.2019 2:46, Sowjanya Komatineni пишет:
> This patch uses fence_udelay rather than udelay during PLLU
> initialization to ensure writes to clock registers happens before
> waiting for specified delay.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 4721ee030d1c..998bf60b219a 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -2841,7 +2841,7 @@ static int tegra210_enable_pllu(void)
>  	reg = readl_relaxed(clk_base + pllu.params->ext_misc_reg[0]);
>  	reg &= ~BIT(pllu.params->iddq_bit_idx);
>  	writel_relaxed(reg, clk_base + pllu.params->ext_misc_reg[0]);
> -	udelay(5);
> +	fence_udelay(5, clk_base);
>  
>  	reg = readl_relaxed(clk_base + PLLU_BASE);
>  	reg &= ~GENMASK(20, 0);
> @@ -2849,7 +2849,7 @@ static int tegra210_enable_pllu(void)
>  	reg |= fentry->n << 8;
>  	reg |= fentry->p << 16;
>  	writel(reg, clk_base + PLLU_BASE);
> -	udelay(1);
> +	fence_udelay(1, clk_base);
>  	reg |= PLL_ENABLE;
>  	writel(reg, clk_base + PLLU_BASE);
>  
> @@ -2895,12 +2895,12 @@ static int tegra210_init_pllu(void)
>  		reg = readl_relaxed(clk_base + XUSB_PLL_CFG0);
>  		reg &= ~XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK;
>  		writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
> -		udelay(1);
> +		fence_udelay(1, clk_base);
>  
>  		reg = readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
>  		reg |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
>  		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
> -		udelay(1);
> +		fence_udelay(1, clk_base);
>  
>  		reg = readl_relaxed(clk_base + PLLU_BASE);
>  		reg &= ~PLLU_BASE_CLKENABLE_USB;
> 

The clk_base corresponds to the RESET controller's part of Clock-and-Reset hardware, is it
okay to read-back the RST register and not the clock for the fencing?
