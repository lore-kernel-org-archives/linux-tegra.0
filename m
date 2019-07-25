From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v2 1/2] soc/tegra: pmc: Query PCLK clock rate at probe
 time
Date: Thu, 25 Jul 2019 12:36:45 +0300
Message-ID: <20190725093644.GJ12715@pdeschrijver-desktop.Nvidia.com>
References: <20190723023511.24542-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723023511.24542-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 23, 2019 at 05:35:10AM +0300, Dmitry Osipenko wrote:
> The PCLK clock is running off SCLK, which is a critical clock that is
> very unlikely to randomly change its rate. It's also a bit clumsy (and
> apparently incorrect) to query the clock's rate with interrupts being
> disabled because clk_get_rate() takes a mutex and that's the case during
> suspend/cpuidle entering.
> 

SCLK and PCLK certainly can change rate at runtime, although the code to
handle this hasn't reached upstream yet.

Peter.

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Changelog:
> 
> v2: Addressed review comments that were made by Jon Hunter to v1 by
>     not moving the memory barrier, replacing one missed clk_get_rate()
>     with pmc->rate, handling possible clk_get_rate() error on probe and
>     slightly adjusting the commits message.
> 
>  drivers/soc/tegra/pmc.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 9f9c1c677cf4..aba3396b2e73 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1192,7 +1192,7 @@ static int tegra_io_pad_prepare(struct tegra_pmc *pmc, enum tegra_io_pad id,
>  		return err;
>  
>  	if (pmc->clk) {
> -		rate = clk_get_rate(pmc->clk);
> +		rate = pmc->rate;
>  		if (!rate) {
>  			dev_err(pmc->dev, "failed to get clock rate\n");
>  			return -ENODEV;
> @@ -1433,6 +1433,7 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
>  void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>  {
>  	unsigned long long rate = 0;
> +	u64 ticks;
>  	u32 value;
>  
>  	switch (mode) {
> @@ -1441,31 +1442,22 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>  		break;
>  
>  	case TEGRA_SUSPEND_LP2:
> -		rate = clk_get_rate(pmc->clk);
> +		rate = pmc->rate;
>  		break;
>  
>  	default:
>  		break;
>  	}
>  
> -	if (WARN_ON_ONCE(rate == 0))
> -		rate = 100000000;
> +	ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
> +	do_div(ticks, USEC_PER_SEC);
> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
>  
> -	if (rate != pmc->rate) {
> -		u64 ticks;
> +	ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
> +	do_div(ticks, USEC_PER_SEC);
> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>  
> -		ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
> -		do_div(ticks, USEC_PER_SEC);
> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
> -
> -		ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
> -		do_div(ticks, USEC_PER_SEC);
> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
> -
> -		wmb();
> -
> -		pmc->rate = rate;
> -	}
> +	wmb();
>  
>  	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>  	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
> @@ -2082,8 +2074,14 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>  		pmc->clk = NULL;
>  	}
>  
> +	pmc->rate = clk_get_rate(pmc->clk);
>  	pmc->dev = &pdev->dev;
>  
> +	if (!pmc->rate) {
> +		dev_err(&pdev->dev, "failed to get pclk rate\n");
> +		pmc->rate = 100000000;
> +	}
> +
>  	tegra_pmc_init(pmc);
>  
>  	tegra_pmc_init_tsense_reset(pmc);
> -- 
> 2.22.0
> 
