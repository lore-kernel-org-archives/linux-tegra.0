From: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] pinctrl: tegra: add suspend-resume support
Date: Fri, 2 Nov 2012 16:42:01 +0530
Message-ID: <1351854721-31295-1-git-send-email-praithatha@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Added suspend/resume with syscore_ops. syscore_ops ensures that the
suspend is called after all non syscore peripheral's suspend and the resume
is called before all non syscore peripheral's resume.
During suspend we need to backup resisters and restore it on resume.

Signed-off-by: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tegra.c |   64 +++++++++++++++++++++++++++++++++++++-
 1 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index ae52e4e..3fd791d 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -29,6 +29,7 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/slab.h>
+#include <linux/syscore_ops.h>
 
 #include <mach/pinconf-tegra.h>
 
@@ -43,7 +44,11 @@ struct tegra_pmx {
 
 	int nbanks;
 	void __iomem **regs;
+	int *bank_size;
+
+	u32 *pg_data;
 };
+static struct tegra_pmx *pmx;
 
 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
 {
@@ -687,12 +692,46 @@ static struct pinctrl_desc tegra_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+#ifdef CONFIG_PM_SLEEP
+
+static int pinctrl_suspend(void)
+{
+	int i, j;
+	u32 *pg_data = pmx->pg_data;
+	u32 *regs;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		regs = pmx->regs[i];
+		for (j = 0; j < pmx->bank_size[i]/4; j++)
+			*pg_data++ = readl(regs++);
+	}
+	return 0;
+}
+
+static void pinctrl_resume(void)
+{
+	int i, j;
+	u32 *pg_data = pmx->pg_data;
+	u32 *regs;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		regs = pmx->regs[i];
+		for (j = 0; j < pmx->bank_size[i]/4; j++)
+			writel(*pg_data++, regs++);
+	}
+}
+
+static struct syscore_ops pinctrl_syscore_ops = {
+	.suspend = pinctrl_suspend,
+	.resume = pinctrl_resume,
+};
+
+#endif
 int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 			const struct tegra_pinctrl_soc_data *soc_data)
 {
-	struct tegra_pmx *pmx;
 	struct resource *res;
-	int i;
+	int i, pg_data_size = 0;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
 	if (!pmx) {
@@ -711,6 +750,7 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		if (!res)
 			break;
+		pg_data_size += resource_size(res);
 	}
 	pmx->nbanks = i;
 
@@ -720,6 +760,20 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 		dev_err(&pdev->dev, "Can't alloc regs pointer\n");
 		return -ENODEV;
 	}
+#ifdef CONFIG_PM_SLEEP
+	pmx->bank_size = devm_kzalloc(&pdev->dev, pmx->nbanks * sizeof(int),
+				 GFP_KERNEL);
+	if (!pmx->bank_size) {
+		dev_err(&pdev->dev, "Can't alloc regs pointer\n");
+		return -ENODEV;
+	}
+
+	pmx->pg_data = devm_kzalloc(&pdev->dev, pg_data_size, GFP_KERNEL);
+	if (!pmx->pg_data) {
+		dev_err(&pdev->dev, "Can't alloc pingroup data pointer\n");
+		return -ENODEV;
+	}
+#endif
 
 	for (i = 0; i < pmx->nbanks; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
@@ -742,6 +796,9 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 			dev_err(&pdev->dev, "Couldn't ioremap regs %d\n", i);
 			return -ENODEV;
 		}
+#ifdef CONFIG_PM_SLEEP
+		pmx->bank_size[i] = resource_size(res);
+#endif
 	}
 
 	pmx->pctl = pinctrl_register(&tegra_pinctrl_desc, &pdev->dev, pmx);
@@ -754,6 +811,9 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
 
 	platform_set_drvdata(pdev, pmx);
 
+#ifdef CONFIG_PM_SLEEP
+	register_syscore_ops(&pinctrl_syscore_ops);
+#endif
 	dev_dbg(&pdev->dev, "Probed Tegra pinctrl driver\n");
 
 	return 0;
-- 
1.7.1
