From: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] pinctrl: tegra: add suspend/resume support
Date: Mon, 5 Nov 2012 14:36:43 +0530
Message-ID: <509781A3.90905@nvidia.com>
References: <5092EB25.5020404@wwwdotorg.org> <1351902619-911-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351902619-911-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 03 November 2012 06:00 AM, Dmitry Osipenko wrote:
> Added suspend/resume support using pm ops. We need to store current regs vals on
> suspend and restore them on resume. Platform driver registering function moved to
> core init level to ensure that device driver will be in the end of suspend and in
> the beginning of resume lists.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> I pondered a moment with suspend/resume level bit more and decided that there is
> no real necessity in syscore_ops. If registering function left on arch init level,
> then i2c devices will be after pinctrl on suspend. Also cleaned up code a bit based
> on Pritesh's patch.
> 
> Here is suspend/resume sequence from my dmesg log with this patch applied:
> 
> .....
> <7>[  399.651179] tegra-i2c tegra-i2c.0: noirq driver suspend
> <7>[  399.651627] tegra20-pinctrl tegra20-pinctrl: noirq driver suspend
> <7>[  399.652482] power power.0: noirq driver suspend
> <6>[  399.652951] PM: noirq suspend of devices complete after 23.677 msecs
> <4>[  399.653694] Disabling non-boot CPUs ...
> <5>[  399.661492] CPU1: shutdown
> <6>[  399.668317] PM: Calling timekeeping_suspend+0x0/0x190
> <6>[  399.669282] PM: Calling suspend_time_syscore_suspend+0x0/0x28
> <6>[  399.669831] PM: Calling sched_clock_suspend+0x0/0x3c
> <6>[  399.670697] PM: Calling fw_suspend+0x0/0x2c
> <6>[  399.671135] PM: Calling tegra_pm_irq_syscore_suspend+0x0/0x11c
> <6>[  399.671963] Wake[31-0] level=0x880192
> <6>[  399.672693] Wake[31-0] enable=0x800c0180
> <6>[  399.673156] PM: Calling tegra_legacy_irq_suspend+0x0/0xe0
> <6>[  399.673961] PM: Calling cpufreq_bp_suspend+0x0/0x7c
> <6>[  399.674441] PM: Calling cpu_pm_suspend+0x0/0x28
> <6>[  399.674929] PM: Calling tegra_timer_suspend+0x0/0x4c
> <6>[  399.675648] PM: Calling tegra_clk_suspend+0x0/0x2ec
> <6>[  399.675648] PM: Calling tegra_gpio_suspend+0x0/0x124
> <6>[  399.675648] PM: Calling tegra_gpio_resume+0x0/0x11c
> <6>[  399.675648] PM: Calling tegra_clk_resume+0x0/0x3f8
> <6>[  399.675648] PM: Calling tegra_timer_resume+0x0/0x48
> <6>[  399.675675] PM: Calling cpu_pm_resume+0x0/0x20
> <6>[  399.675978] PM: Calling cpufreq_bp_resume+0x0/0x70
> <6>[  399.676531] PM: Calling tegra_legacy_irq_resume+0x0/0x134
> <6>[  399.676895] PM: Calling tegra_pm_irq_syscore_resume+0x0/0x110
> <6>[  399.677362]  legacy wake status=0x40000
> <6>[  399.677628] Resume caused by WAKE18, tps6586x
> <6>[  399.677937] PM: Calling sched_clock_resume+0x0/0x4c
> <6>[  399.678441] PM: Calling suspend_time_syscore_resume+0x0/0xa0
> <6>[  399.678710] Suspended for 5.870 seconds
> <6>[  399.679185] PM: Calling timekeeping_resume+0x0/0x130
> <6>[  399.679532] PM: Calling irq_pm_syscore_resume+0x0/0x20
> <6>[  399.680301] Enabling non-boot CPUs ...
> <4>[  399.693910] CPU1: Booted secondary processor
> <6>[  399.695858] CPU1 is up
> <7>[  399.696236] tegra20-pinctrl tegra20-pinctrl: noirq driver resume
> <7>[  399.696932] tegra-i2c tegra-i2c.0: noirq driver resume
> .....
> 
>  drivers/pinctrl/pinctrl-tegra.c   | 72 ++++++++++++++++++++++++++++++++++++---
>  drivers/pinctrl/pinctrl-tegra.h   |  7 ++++
>  drivers/pinctrl/pinctrl-tegra20.c |  3 +-
>  drivers/pinctrl/pinctrl-tegra30.c |  3 +-
>  4 files changed, 79 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
> index 7da0b37..de3ba4f 100644
> --- a/drivers/pinctrl/pinctrl-tegra.c
> +++ b/drivers/pinctrl/pinctrl-tegra.c
> @@ -41,6 +41,9 @@ struct tegra_pmx {
>  
>  	int nbanks;
>  	void __iomem **regs;
> +
> +	int *bank_size;
> +	u32 *regs_storage;
>  };
>  
>  static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
> @@ -685,12 +688,51 @@ static struct pinctrl_desc tegra_pinctrl_desc = {
>  	.owner = THIS_MODULE,
>  };
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int tegra_pinctrl_suspend_noirq(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *regs_storage = pmx->regs_storage;
> +	u32 *regs;
> +	int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->bank_size[i] / 4; j++)
> +			*regs_storage++ = readl(regs++);
> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra_pinctrl_resume_noirq(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *regs_storage = pmx->regs_storage;
> +	u32 *regs;
> +	int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->bank_size[i] / 4; j++)
> +			writel(*regs_storage++, regs++);
> +	}
> +
> +	return 0;
> +}
> +
> +const struct dev_pm_ops tegra_pinctrl_pm_ops = {
> +	.suspend_noirq = tegra_pinctrl_suspend_noirq,
> +	.resume_noirq = tegra_pinctrl_resume_noirq,
> +};
> +#endif
> +
>  int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
>  			const struct tegra_pinctrl_soc_data *soc_data)
>  {
>  	struct tegra_pmx *pmx;
>  	struct resource *res;
> -	int i;
> +	int i, regs_storage_sz = 0;
>  
>  	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
>  	if (!pmx) {
> @@ -712,6 +754,13 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
>  	}
>  	pmx->nbanks = i;
>  
> +	pmx->bank_size = devm_kzalloc(&pdev->dev, pmx->nbanks * sizeof(int),

Use sizeof(*(pmx->bank_size)) instead of sizeof(int) and enclose this
inside #ifdef CONFIG_PM_SLEEP

> +				      GFP_KERNEL);
> +	if (!pmx->bank_size) {
> +		dev_err(&pdev->dev, "Can't alloc banks sizes pointer\n");
> +		return -ENODEV;
> +	}
> +
>  	pmx->regs = devm_kzalloc(&pdev->dev, pmx->nbanks * sizeof(*pmx->regs),
>  				 GFP_KERNEL);
>  	if (!pmx->regs) {
> @@ -726,22 +775,37 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
>  			return -ENODEV;
>  		}
>  
> +		pmx->bank_size[i] = resource_size(res);
> +
>  		if (!devm_request_mem_region(&pdev->dev, res->start,
> -					    resource_size(res),
> -					    dev_name(&pdev->dev))) {
> +					     pmx->bank_size[i],
> +					     dev_name(&pdev->dev))) {
>  			dev_err(&pdev->dev,
>  				"Couldn't request MEM resource %d\n", i);
>  			return -ENODEV;
>  		}
>  
>  		pmx->regs[i] = devm_ioremap(&pdev->dev, res->start,
> -					    resource_size(res));
> +					    pmx->bank_size[i]);
>  		if (!pmx->regs[i]) {
>  			dev_err(&pdev->dev, "Couldn't ioremap regs %d\n", i);
>  			return -ENODEV;
>  		}
> +
> +		regs_storage_sz += pmx->bank_size[i];
>  	}
>  
> +#ifdef CONFIG_PM_SLEEP
> +	pmx->regs_storage = devm_kzalloc(&pdev->dev, regs_storage_sz,
> +					 GFP_KERNEL);
> +	if (!pmx->regs_storage) {
> +		dev_err(&pdev->dev, "Can't alloc regs storage pointer\n");
> +		return -ENODEV;
> +	}
> +#else
> +	devm_kfree(&pdev->dev, pmx->bank_size);
> +#endif
> +
>  	pmx->pctl = pinctrl_register(&tegra_pinctrl_desc, &pdev->dev, pmx);
>  	if (!pmx->pctl) {
>  		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
> diff --git a/drivers/pinctrl/pinctrl-tegra.h b/drivers/pinctrl/pinctrl-tegra.h
> index 62e3809..bbe27cd 100644
> --- a/drivers/pinctrl/pinctrl-tegra.h
> +++ b/drivers/pinctrl/pinctrl-tegra.h
> @@ -187,4 +187,11 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  			const struct tegra_pinctrl_soc_data *soc_data);
>  int tegra_pinctrl_remove(struct platform_device *pdev);
>  
> +#ifdef CONFIG_PM_SLEEP
> +extern const struct dev_pm_ops tegra_pinctrl_pm_ops;
> +#define TEGRA_PINCTRL_PM	(&tegra_pinctrl_pm_ops)
> +#else
> +#define TEGRA_PINCTRL_PM	NULL
> +#endif
> +
>  #endif
> diff --git a/drivers/pinctrl/pinctrl-tegra20.c b/drivers/pinctrl/pinctrl-tegra20.c
> index a74f9a5..6f09023 100644
> --- a/drivers/pinctrl/pinctrl-tegra20.c
> +++ b/drivers/pinctrl/pinctrl-tegra20.c
> @@ -2871,6 +2871,7 @@ static struct platform_driver tegra20_pinctrl_driver = {
>  		.name = "tegra20-pinctrl",
>  		.owner = THIS_MODULE,
>  		.of_match_table = tegra20_pinctrl_of_match,
> +		.pm = TEGRA_PINCTRL_PM,
>  	},
>  	.probe = tegra20_pinctrl_probe,
>  	.remove = __devexit_p(tegra_pinctrl_remove),
> @@ -2880,7 +2881,7 @@ static int __init tegra20_pinctrl_init(void)
>  {
>  	return platform_driver_register(&tegra20_pinctrl_driver);
>  }
> -arch_initcall(tegra20_pinctrl_init);
> +core_initcall(tegra20_pinctrl_init);
>  
>  static void __exit tegra20_pinctrl_exit(void)
>  {
> diff --git a/drivers/pinctrl/pinctrl-tegra30.c b/drivers/pinctrl/pinctrl-tegra30.c
> index 7894f14..2e90632 100644
> --- a/drivers/pinctrl/pinctrl-tegra30.c
> +++ b/drivers/pinctrl/pinctrl-tegra30.c
> @@ -3737,6 +3737,7 @@ static struct platform_driver tegra30_pinctrl_driver = {
>  		.name = "tegra30-pinctrl",
>  		.owner = THIS_MODULE,
>  		.of_match_table = tegra30_pinctrl_of_match,
> +		.pm = TEGRA_PINCTRL_PM,
>  	},
>  	.probe = tegra30_pinctrl_probe,
>  	.remove = __devexit_p(tegra_pinctrl_remove),
> @@ -3746,7 +3747,7 @@ static int __init tegra30_pinctrl_init(void)
>  {
>  	return platform_driver_register(&tegra30_pinctrl_driver);
>  }
> -arch_initcall(tegra30_pinctrl_init);
> +core_initcall(tegra30_pinctrl_init);
>  
>  static void __exit tegra30_pinctrl_exit(void)
>  {

I would suggest to make tagra_pinctrl_probe function as follow:
(rest looks fine with me)

 int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 			const struct tegra_pinctrl_soc_data *soc_data)
 	{
 	struct tegra_pmx *pmx;
 	struct resource *res;
-	int i;
+	int i, bank_size, regs_storage_sz = 0;

 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
 	if (!pmx) {
@@ -711,6 +751,7 @@ int __devinit tegra_pinctrl_probe(struct
platform_device *pdev,
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		if (!res)
 			break;
+		regs_storage_sz += resource_size(res);
 	}
 	pmx->nbanks = i;

@@ -721,6 +762,23 @@ int __devinit tegra_pinctrl_probe(struct
platform_device *pdev,
 		return -ENODEV;
 	}

+#ifdef CONFIG_PM_SLEEP
+	pmx->bank_size = devm_kzalloc(&pdev->dev,
+					pmx->nbanks * sizeof(*(pmx->bank_size)),
+					GFP_KERNEL);
+	if (!pmx->bank_size) {
+		dev_err(&pdev->dev, "Can't alloc banks sizes pointer\n");
+		return -ENODEV;
+	}
+
+	pmx->regs_storage = devm_kzalloc(&pdev->dev, regs_storage_sz,
+					 GFP_KERNEL);
+	if (!pmx->regs_storage) {
+		dev_err(&pdev->dev, "Can't alloc regs storage pointer\n");
+		return -ENODEV;
+	}
+#endif
+
 	for (i = 0; i < pmx->nbanks; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		if (!res) {
@@ -728,20 +786,26 @@ int __devinit tegra_pinctrl_probe(struct
platform_device *pdev,
 			return -ENODEV;
 		}

+		bank_size = resource_size(res);
+
 		if (!devm_request_mem_region(&pdev->dev, res->start,
-					    resource_size(res),
-					    dev_name(&pdev->dev))) {
+					    	bank_size,
+					    	dev_name(&pdev->dev))) {
 			dev_err(&pdev->dev,
 				"Couldn't request MEM resource %d\n", i);
 			return -ENODEV;
 		}

 		pmx->regs[i] = devm_ioremap(&pdev->dev, res->start,
-					    resource_size(res));
+					    	bank_size);
 		if (!pmx->regs[i]) {
 			dev_err(&pdev->dev, "Couldn't ioremap regs %d\n", i);
 			return -ENODEV;
 		}
+
+#ifdef CONFIG_PM_SLEEP
+		pmx->bank_size[i] = bank_size;
+#endif
 	}

 	pmx->pctl = pinctrl_register(&tegra_pinctrl_desc, &pdev->dev, pmx);
