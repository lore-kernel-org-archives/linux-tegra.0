From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
Date: Tue, 18 Jun 2019 00:46:16 -0700
Message-ID: <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch adds suspend and resume support for Tegra pinctrl driver
and registers them to syscore so the pinmux settings are restored
before the devices resume.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 62 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +++
 drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
 drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
 drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
 drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
 drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
 7 files changed, 84 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 34596b246578..ceced30d8bd1 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -20,11 +20,16 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/slab.h>
+#include <linux/syscore_ops.h>
 
 #include "../core.h"
 #include "../pinctrl-utils.h"
 #include "pinctrl-tegra.h"
 
+#define EMMC2_PAD_CFGPADCTRL_0			0x1c8
+#define EMMC4_PAD_CFGPADCTRL_0			0x1e0
+#define EMMC_DPD_PARKING			(0x1fff << 14)
+
 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
 {
 	return readl(pmx->regs[bank] + reg);
@@ -619,6 +624,48 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
 			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
 		}
 	}
+
+	if (pmx->soc->has_park_padcfg) {
+		val = pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
+		val &= ~EMMC_DPD_PARKING;
+		pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
+
+		val = pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
+		val &= ~EMMC_DPD_PARKING;
+		pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
+	}
+}
+
+int __maybe_unused tegra_pinctrl_suspend(struct device *dev)
+{
+	struct tegra_pmx *pmx = dev_get_drvdata(dev);
+	u32 *backup_regs = pmx->backup_regs;
+	u32 *regs;
+	int i, j;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		regs = pmx->regs[i];
+		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
+			*backup_regs++ = readl(regs++);
+	}
+
+	return pinctrl_force_sleep(pmx->pctl);
+}
+
+int __maybe_unused tegra_pinctrl_resume(struct device *dev)
+{
+	struct tegra_pmx *pmx = dev_get_drvdata(dev);
+	u32 *backup_regs = pmx->backup_regs;
+	u32 *regs;
+	int i, j;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		regs = pmx->regs[i];
+		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
+			writel(*backup_regs++, regs++);
+	}
+
+	return 0;
 }
 
 static bool gpio_node_has_range(const char *compatible)
@@ -645,6 +692,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	int i;
 	const char **group_pins;
 	int fn, gn, gfn;
+	unsigned long backup_regs_size = 0;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
 	if (!pmx)
@@ -697,6 +745,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		if (!res)
 			break;
+		backup_regs_size += resource_size(res);
 	}
 	pmx->nbanks = i;
 
@@ -705,11 +754,24 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	if (!pmx->regs)
 		return -ENOMEM;
 
+	pmx->reg_bank_size = devm_kcalloc(&pdev->dev, pmx->nbanks,
+					  sizeof(*pmx->reg_bank_size),
+					  GFP_KERNEL);
+	if (!pmx->reg_bank_size)
+		return -ENOMEM;
+
+	pmx->backup_regs = devm_kzalloc(&pdev->dev, backup_regs_size,
+					GFP_KERNEL);
+	if (!pmx->backup_regs)
+		return -ENOMEM;
+
 	for (i = 0; i < pmx->nbanks; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		pmx->regs[i] = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(pmx->regs[i]))
 			return PTR_ERR(pmx->regs[i]);
+
+		pmx->reg_bank_size[i] = resource_size(res);
 	}
 
 	pmx->pctl = devm_pinctrl_register(&pdev->dev, &tegra_pinctrl_desc, pmx);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 287702660783..d63e472ee0e1 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -17,6 +17,8 @@ struct tegra_pmx {
 
 	int nbanks;
 	void __iomem **regs;
+	size_t *reg_bank_size;
+	u32 *backup_regs;
 };
 
 enum tegra_pinconf_param {
@@ -191,8 +193,11 @@ struct tegra_pinctrl_soc_data {
 	bool hsm_in_mux;
 	bool schmitt_in_mux;
 	bool drvtype_in_mux;
+	bool has_park_padcfg;
 };
 
 int tegra_pinctrl_probe(struct platform_device *pdev,
 			const struct tegra_pinctrl_soc_data *soc_data);
+int __maybe_unused tegra_pinctrl_suspend(struct device *dev);
+int __maybe_unused tegra_pinctrl_resume(struct device *dev);
 #endif
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
index 762151f17a88..06ea8164df9d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
@@ -1841,6 +1841,7 @@ static const struct tegra_pinctrl_soc_data tegra114_pinctrl = {
 	.hsm_in_mux = false,
 	.schmitt_in_mux = false,
 	.drvtype_in_mux = false,
+	.has_park_padcfg = false,
 };
 
 static int tegra114_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
index 930c43758c92..abc8fe92d154 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
@@ -2053,6 +2053,7 @@ static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
 	.hsm_in_mux = false,
 	.schmitt_in_mux = false,
 	.drvtype_in_mux = false,
+	.has_park_padcfg = false,
 };
 
 static int tegra124_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 4b7837e38fb5..993b82cbfba7 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -2223,6 +2223,7 @@ static const struct tegra_pinctrl_soc_data tegra20_pinctrl = {
 	.hsm_in_mux = false,
 	.schmitt_in_mux = false,
 	.drvtype_in_mux = false,
+	.has_park_padcfg = false,
 };
 
 static const char *cdev1_parents[] = {
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index 0b56ad5c9c1c..10e8a2ec8094 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1555,6 +1555,7 @@ static const struct tegra_pinctrl_soc_data tegra210_pinctrl = {
 	.hsm_in_mux = true,
 	.schmitt_in_mux = true,
 	.drvtype_in_mux = true,
+	.has_park_padcfg = true,
 };
 
 static int tegra210_pinctrl_probe(struct platform_device *pdev)
@@ -1562,6 +1563,17 @@ static int tegra210_pinctrl_probe(struct platform_device *pdev)
 	return tegra_pinctrl_probe(pdev, &tegra210_pinctrl);
 }
 
+#ifdef CONFIG_PM_SLEEP
+static const struct dev_pm_ops tegra_pinctrl_pm = {
+	.suspend = &tegra_pinctrl_suspend,
+	.resume = &tegra_pinctrl_resume
+};
+
+#define TEGRA_PINCTRL_PM	(&tegra_pinctrl_pm)
+#else
+#define TEGRA_PINCTRL_PM	NULL
+#endif
+
 static const struct of_device_id tegra210_pinctrl_of_match[] = {
 	{ .compatible = "nvidia,tegra210-pinmux", },
 	{ },
@@ -1571,6 +1583,7 @@ static struct platform_driver tegra210_pinctrl_driver = {
 	.driver = {
 		.name = "tegra210-pinctrl",
 		.of_match_table = tegra210_pinctrl_of_match,
+		.pm    = TEGRA_PINCTRL_PM,
 	},
 	.probe = tegra210_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
index 610124c3d192..779ee40e5f21 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
@@ -2476,6 +2476,7 @@ static const struct tegra_pinctrl_soc_data tegra30_pinctrl = {
 	.hsm_in_mux = false,
 	.schmitt_in_mux = false,
 	.drvtype_in_mux = false,
+	.has_park_padcfg = false,
 };
 
 static int tegra30_pinctrl_probe(struct platform_device *pdev)
-- 
2.7.4
