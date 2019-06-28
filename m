From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
Date: Fri, 28 Jun 2019 14:56:32 +0300
Message-ID: <0409f478-e425-4e7f-5fff-8c3a94f47ee8@gmail.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> This patch adds support for Tegra pinctrl driver suspend and resume.
> 
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>  drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 34596b246578..e7c0a1011cba 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -621,6 +621,43 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>  	}
>  }
>  
> +static int tegra_pinctrl_suspend(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	unsigned int i, j;

In general it's better not to use "j" in conjunction with "i" because they look
similar and I seen quite a lot of bugs caused by unnoticed typos like that. So I'm
suggesting to use "i, k" for clarity.

> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			*backup_regs++ = readl(regs++);

Please use readl_relaxed(), we don't need memory barriers here.

> +	}
> +
> +	return pinctrl_force_sleep(pmx->pctl);
> +}
> +
> +static int tegra_pinctrl_resume(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			writel(*backup_regs++, regs++);

Same for writel_relaxed(), memory barrier is inserted *before* the write to ensure
that all previous memory stores are completed. IOREMAP'ed memory is strongly-ordered,
memory barriers are not needed here.

> +	}
> +
> +	return 0;
> +}
> +
> +const struct dev_pm_ops tegra_pinctrl_pm = {
> +	.suspend = &tegra_pinctrl_suspend,
> +	.resume = &tegra_pinctrl_resume
> +};
> +
>  static bool gpio_node_has_range(const char *compatible)
>  {
>  	struct device_node *np;
> @@ -645,6 +682,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  	int i;
>  	const char **group_pins;
>  	int fn, gn, gfn;
> +	unsigned long backup_regs_size = 0;
>  
>  	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
>  	if (!pmx)
> @@ -697,6 +735,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>  		if (!res)
>  			break;
> +		backup_regs_size += resource_size(res);
>  	}
>  	pmx->nbanks = i;
>  
> @@ -705,11 +744,24 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  	if (!pmx->regs)
>  		return -ENOMEM;
>  
> +	pmx->reg_bank_size = devm_kcalloc(&pdev->dev, pmx->nbanks,
> +					  sizeof(*pmx->reg_bank_size),
> +					  GFP_KERNEL);
> +	if (!pmx->reg_bank_size)
> +		return -ENOMEM;

It looks to me that we don't really need to churn with this allocation because the
bank sizes are already a part of the platform driver's description.

We could add a simple helper function that retrieves the bank sizes, like this:

static unsigned int tegra_pinctrl_bank_size(struct device *dev,
					    unsigned int bank_id)
{
	struct platform_device *pdev;
	struct resource *res;

	pdev = to_platform_device(dev);
	res = platform_get_resource(pdev, IORESOURCE_MEM, bank_id);

	return resource_size(res) / 4;
}

> +	pmx->backup_regs = devm_kzalloc(&pdev->dev, backup_regs_size,
> +					GFP_KERNEL);
> +	if (!pmx->backup_regs)
> +		return -ENOMEM;
> +
>  	for (i = 0; i < pmx->nbanks; i++) {
>  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>  		pmx->regs[i] = devm_ioremap_resource(&pdev->dev, res);
>  		if (IS_ERR(pmx->regs[i]))
>  			return PTR_ERR(pmx->regs[i]);
> +
> +		pmx->reg_bank_size[i] = resource_size(res);
>  	}
>  
>  	pmx->pctl = devm_pinctrl_register(&pdev->dev, &tegra_pinctrl_desc, pmx);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
> index 287702660783..55456f8d44cf 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
> @@ -17,6 +17,8 @@ struct tegra_pmx {
>  
>  	int nbanks;
>  	void __iomem **regs;
> +	size_t *reg_bank_size;
> +	u32 *backup_regs;
>  };
>  
>  enum tegra_pinconf_param {
> @@ -193,6 +195,7 @@ struct tegra_pinctrl_soc_data {
>  	bool drvtype_in_mux;
>  };
>  
> +extern const struct dev_pm_ops tegra_pinctrl_pm;

Please add a newline here.

>  int tegra_pinctrl_probe(struct platform_device *pdev,
>  			const struct tegra_pinctrl_soc_data *soc_data);
>  #endif
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> index 0b56ad5c9c1c..edd3f4606cdb 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> @@ -1571,6 +1571,7 @@ static struct platform_driver tegra210_pinctrl_driver = {
>  	.driver = {
>  		.name = "tegra210-pinctrl",
>  		.of_match_table = tegra210_pinctrl_of_match,
> +		.pm = &tegra_pinctrl_pm,
>  	},
>  	.probe = tegra210_pinctrl_probe,
>  };
> 

Could you please address my comments in the next revision if there will be one?
