From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v5 1/2] soc/tegra: pmc: Query PCLK clock rate at probe
 time
Date: Mon, 28 Oct 2019 16:13:35 +0200
Message-ID: <20191028141335.GB27141@pdeschrijver-desktop.Nvidia.com>
References: <20190926191755.27131-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190926191755.27131-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Acked-By  Peter De Schrijver <pdeschrijver@nvidia.com>

On Thu, Sep 26, 2019 at 10:17:54PM +0300, Dmitry Osipenko wrote:
> It is possible to get a lockup if kernel decides to enter LP2 cpuidle
> from some clk-notifier, in that case CCF's "prepare" mutex is kept locked
> and thus clk_get_rate(pclk) blocks on the same mutex with interrupts being
> disabled, hanging machine.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Changelog:
> 
> v5: Clk notifier now takes powergates_lock to avoid potential racing with
>     tegra_io_pad_*().
> 
>     The original fallback to 100MHz when clk_get_rate() fails is preserved
>     now.
> 
> v4: Added clk-notifier to track PCLK rate-changes, which may become useful
>     in the future. That's done in response to v3 review comment from Peter
>     De Schrijver.
> 
>     Now properly handling case where clk pointer is intentionally NULL on
>     the driver's probe.
> 
> v3: Changed commit's message because I actually recalled what was the
>     initial reason for the patch, since the problem reoccurred once again.
> 
> v2: Addressed review comments that were made by Jon Hunter to v1 by
>     not moving the memory barrier, replacing one missed clk_get_rate()
>     with pmc->rate, handling possible clk_get_rate() error on probe and
>     slightly adjusting the commits message.
> 
>  drivers/soc/tegra/pmc.c | 71 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 56 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 9f9c1c677cf4..ee39ded6bc7b 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -309,6 +309,7 @@ static const char * const tegra210_reset_sources[] = {
>   * @pctl_dev: pin controller exposed by the PMC
>   * @domain: IRQ domain provided by the PMC
>   * @irq: chip implementation for the IRQ domain
> + * @clk_nb: pclk clock changes handler
>   */
>  struct tegra_pmc {
>  	struct device *dev;
> @@ -344,6 +345,8 @@ struct tegra_pmc {
>  
>  	struct irq_domain *domain;
>  	struct irq_chip irq;
> +
> +	struct notifier_block clk_nb;
>  };
>  
>  static struct tegra_pmc *pmc = &(struct tegra_pmc) {
> @@ -1192,7 +1195,7 @@ static int tegra_io_pad_prepare(struct tegra_pmc *pmc, enum tegra_io_pad id,
>  		return err;
>  
>  	if (pmc->clk) {
> -		rate = clk_get_rate(pmc->clk);
> +		rate = pmc->rate;
>  		if (!rate) {
>  			dev_err(pmc->dev, "failed to get clock rate\n");
>  			return -ENODEV;
> @@ -1433,6 +1436,7 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
>  void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>  {
>  	unsigned long long rate = 0;
> +	u64 ticks;
>  	u32 value;
>  
>  	switch (mode) {
> @@ -1441,7 +1445,7 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>  		break;
>  
>  	case TEGRA_SUSPEND_LP2:
> -		rate = clk_get_rate(pmc->clk);
> +		rate = pmc->rate;
>  		break;
>  
>  	default:
> @@ -1451,21 +1455,15 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>  	if (WARN_ON_ONCE(rate == 0))
>  		rate = 100000000;
>  
> -	if (rate != pmc->rate) {
> -		u64 ticks;
> -
> -		ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
> -		do_div(ticks, USEC_PER_SEC);
> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
> -
> -		ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
> -		do_div(ticks, USEC_PER_SEC);
> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
> +	ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
> +	do_div(ticks, USEC_PER_SEC);
> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
>  
> -		wmb();
> +	ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
> +	do_div(ticks, USEC_PER_SEC);
> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>  
> -		pmc->rate = rate;
> -	}
> +	wmb();
>  
>  	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>  	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
> @@ -2019,6 +2017,30 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
>  	return 0;
>  }
>  
> +static int tegra_pmc_clk_notify_cb(struct notifier_block *nb,
> +				   unsigned long action, void *ptr)
> +{
> +	struct tegra_pmc *pmc = container_of(nb, struct tegra_pmc, clk_nb);
> +	struct clk_notifier_data *data = ptr;
> +
> +	switch (action) {
> +	case PRE_RATE_CHANGE:
> +		mutex_lock(&pmc->powergates_lock);
> +		break;
> +	case POST_RATE_CHANGE:
> +		pmc->rate = data->new_rate;
> +		/* fall through */
> +	case ABORT_RATE_CHANGE:
> +		mutex_unlock(&pmc->powergates_lock);
> +		break;
> +	default:
> +		WARN_ON_ONCE(1);
> +		return notifier_from_errno(-EINVAL);
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
>  static int tegra_pmc_probe(struct platform_device *pdev)
>  {
>  	void __iomem *base;
> @@ -2082,6 +2104,23 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>  		pmc->clk = NULL;
>  	}
>  
> +	/*
> +	 * PCLK clock rate can't be retrieved using CLK API because it
> +	 * causes lockup if CPU enters LP2 idle state from some other
> +	 * CLK notifier, hence we're caching the rate's value locally.
> +	 */
> +	if (pmc->clk) {
> +		pmc->clk_nb.notifier_call = tegra_pmc_clk_notify_cb;
> +		err = clk_notifier_register(pmc->clk, &pmc->clk_nb);
> +		if (err) {
> +			dev_err(&pdev->dev,
> +				"failed to register clk notifier\n");
> +			return err;
> +		}
> +
> +		pmc->rate = clk_get_rate(pmc->clk);
> +	}
> +
>  	pmc->dev = &pdev->dev;
>  
>  	tegra_pmc_init(pmc);
> @@ -2133,6 +2172,8 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>  cleanup_sysfs:
>  	device_remove_file(&pdev->dev, &dev_attr_reset_reason);
>  	device_remove_file(&pdev->dev, &dev_attr_reset_level);
> +	clk_notifier_unregister(pmc->clk, &pmc->clk_nb);
> +
>  	return err;
>  }
>  
> -- 
> 2.23.0
> 
