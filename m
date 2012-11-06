From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V3] pinctrl: tegra: add suspend/resume support
Date: Tue,  6 Nov 2012 05:37:24 +0400
Message-ID: <1352165844-4837-1-git-send-email-digetx@gmail.com>
References: <5097F013.8070002@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5097F013.8070002-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Added suspend/resume support using pm ops. We need to store current regs vals on
suspend and restore them on resume. Platform driver registering function moved to
core init level to ensure that device driver will be in the end of suspend and in
the beginning of resume lists.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Pritesh, what do you think about this patch?

> BTW, can you please post a link to the source for your downstream kernel
> that this came from - I'd be very interested in seeing what work has
> been done there. Thanks.

I have sent invitation to you on bitbucket.

 drivers/pinctrl/pinctrl-tegra.c   | 98 ++++++++++++++++++++++++++++++++++-----
 drivers/pinctrl/pinctrl-tegra.h   |  7 +++
 drivers/pinctrl/pinctrl-tegra20.c |  3 +-
 drivers/pinctrl/pinctrl-tegra30.c |  3 +-
 4 files changed, 98 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index 7da0b37..69c08d5 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -41,6 +41,11 @@ struct tegra_pmx {
 
 	int nbanks;
 	void __iomem **regs;
+
+#ifdef CONFIG_PM_SLEEP
+	int *bank_nregs;
+	u32 *regs_storage;
+#endif
 };
 
 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
@@ -685,12 +690,83 @@ static struct pinctrl_desc tegra_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+#ifdef CONFIG_PM_SLEEP
+static int tegra_pinctrl_suspend_noirq(struct device *dev)
+{
+	struct tegra_pmx *pmx = dev_get_drvdata(dev);
+	u32 *regs_storage = pmx->regs_storage;
+	u32 *regs;
+	int i, j;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		regs = pmx->regs[i];
+		for (j = 0; j < pmx->bank_nregs[i]; j++)
+			*regs_storage++ = readl(regs++);
+	}
+
+	return 0;
+}
+
+static int tegra_pinctrl_resume_noirq(struct device *dev)
+{
+	struct tegra_pmx *pmx = dev_get_drvdata(dev);
+	u32 *regs_storage = pmx->regs_storage;
+	u32 *regs;
+	int i, j;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		regs = pmx->regs[i];
+		for (j = 0; j < pmx->bank_nregs[i]; j++)
+			writel(*regs_storage++, regs++);
+	}
+
+	return 0;
+}
+
+const struct dev_pm_ops tegra_pinctrl_pm_ops = {
+	.suspend_noirq = tegra_pinctrl_suspend_noirq,
+	.resume_noirq = tegra_pinctrl_resume_noirq,
+};
+
+static int __devinit tegra_pinctrl_pm_init(struct tegra_pmx *pmx)
+{
+	struct platform_device *pdev = to_platform_device(pmx->dev);
+	struct resource *res;
+	int i, bank_size, total_banks_size = 0;
+
+	pmx->bank_nregs = devm_kzalloc(&pdev->dev,
+				       pmx->nbanks * sizeof(*pmx->bank_nregs),
+				       GFP_KERNEL);
+	if (!pmx->bank_nregs) {
+		dev_err(&pdev->dev, "Can't alloc bank_nregs pointer\n");
+		return -ENODEV;
+	}
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		bank_size = resource_size(res);
+
+		pmx->bank_nregs[i] = bank_size / 4;
+		total_banks_size += bank_size;
+	}
+
+	pmx->regs_storage = devm_kzalloc(&pdev->dev, total_banks_size,
+					 GFP_KERNEL);
+	if (!pmx->regs_storage) {
+		dev_err(&pdev->dev, "Can't alloc regs_storage pointer\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+#endif
+
 int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 			const struct tegra_pinctrl_soc_data *soc_data)
 {
 	struct tegra_pmx *pmx;
 	struct resource *res;
-	int i;
+	int i, ret = 0;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
 	if (!pmx) {
@@ -699,19 +775,13 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 	}
 	pmx->dev = &pdev->dev;
 	pmx->soc = soc_data;
+	pmx->nbanks = pdev->num_resources;
 
 	tegra_pinctrl_gpio_range.npins = pmx->soc->ngpios;
 	tegra_pinctrl_desc.name = dev_name(&pdev->dev);
 	tegra_pinctrl_desc.pins = pmx->soc->pins;
 	tegra_pinctrl_desc.npins = pmx->soc->npins;
 
-	for (i = 0; ; i++) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res)
-			break;
-	}
-	pmx->nbanks = i;
-
 	pmx->regs = devm_kzalloc(&pdev->dev, pmx->nbanks * sizeof(*pmx->regs),
 				 GFP_KERNEL);
 	if (!pmx->regs) {
@@ -727,8 +797,8 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 		}
 
 		if (!devm_request_mem_region(&pdev->dev, res->start,
-					    resource_size(res),
-					    dev_name(&pdev->dev))) {
+					     resource_size(res),
+					     dev_name(&pdev->dev))) {
 			dev_err(&pdev->dev,
 				"Couldn't request MEM resource %d\n", i);
 			return -ENODEV;
@@ -742,6 +812,12 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 		}
 	}
 
+#ifdef CONFIG_PM_SLEEP
+	ret = tegra_pinctrl_pm_init(pmx);
+	if (ret)
+		return ret;
+#endif
+
 	pmx->pctl = pinctrl_register(&tegra_pinctrl_desc, &pdev->dev, pmx);
 	if (!pmx->pctl) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
@@ -754,7 +830,7 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 
 	dev_dbg(&pdev->dev, "Probed Tegra pinctrl driver\n");
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(tegra_pinctrl_probe);
 
diff --git a/drivers/pinctrl/pinctrl-tegra.h b/drivers/pinctrl/pinctrl-tegra.h
index 62e3809..bbe27cd 100644
--- a/drivers/pinctrl/pinctrl-tegra.h
+++ b/drivers/pinctrl/pinctrl-tegra.h
@@ -187,4 +187,11 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 			const struct tegra_pinctrl_soc_data *soc_data);
 int tegra_pinctrl_remove(struct platform_device *pdev);
 
+#ifdef CONFIG_PM_SLEEP
+extern const struct dev_pm_ops tegra_pinctrl_pm_ops;
+#define TEGRA_PINCTRL_PM	(&tegra_pinctrl_pm_ops)
+#else
+#define TEGRA_PINCTRL_PM	NULL
+#endif
+
 #endif
diff --git a/drivers/pinctrl/pinctrl-tegra20.c b/drivers/pinctrl/pinctrl-tegra20.c
index a74f9a5..6f09023 100644
--- a/drivers/pinctrl/pinctrl-tegra20.c
+++ b/drivers/pinctrl/pinctrl-tegra20.c
@@ -2871,6 +2871,7 @@ static struct platform_driver tegra20_pinctrl_driver = {
 		.name = "tegra20-pinctrl",
 		.owner = THIS_MODULE,
 		.of_match_table = tegra20_pinctrl_of_match,
+		.pm = TEGRA_PINCTRL_PM,
 	},
 	.probe = tegra20_pinctrl_probe,
 	.remove = __devexit_p(tegra_pinctrl_remove),
@@ -2880,7 +2881,7 @@ static int __init tegra20_pinctrl_init(void)
 {
 	return platform_driver_register(&tegra20_pinctrl_driver);
 }
-arch_initcall(tegra20_pinctrl_init);
+core_initcall(tegra20_pinctrl_init);
 
 static void __exit tegra20_pinctrl_exit(void)
 {
diff --git a/drivers/pinctrl/pinctrl-tegra30.c b/drivers/pinctrl/pinctrl-tegra30.c
index 7894f14..2e90632 100644
--- a/drivers/pinctrl/pinctrl-tegra30.c
+++ b/drivers/pinctrl/pinctrl-tegra30.c
@@ -3737,6 +3737,7 @@ static struct platform_driver tegra30_pinctrl_driver = {
 		.name = "tegra30-pinctrl",
 		.owner = THIS_MODULE,
 		.of_match_table = tegra30_pinctrl_of_match,
+		.pm = TEGRA_PINCTRL_PM,
 	},
 	.probe = tegra30_pinctrl_probe,
 	.remove = __devexit_p(tegra_pinctrl_remove),
@@ -3746,7 +3747,7 @@ static int __init tegra30_pinctrl_init(void)
 {
 	return platform_driver_register(&tegra30_pinctrl_driver);
 }
-arch_initcall(tegra30_pinctrl_init);
+core_initcall(tegra30_pinctrl_init);
 
 static void __exit tegra30_pinctrl_exit(void)
 {
-- 
1.7.12
