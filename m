From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v7 01/20] pinctrl: tegra: Add suspend and resume support
Date: Tue, 30 Jul 2019 17:20:05 -0700
Message-ID: <1564532424-10449-2-git-send-email-skomatineni@nvidia.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch adds support for Tegra pinctrl driver suspend and resume.

During suspend, context of all pinctrl registers are stored and
on resume they are all restored to have all the pinmux and pad
configuration for normal operation.

Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 59 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h |  3 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 186ef98e7b2b..e3a237534281 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -631,6 +631,58 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
 	}
 }
 
+static size_t tegra_pinctrl_get_bank_size(struct device *dev,
+					  unsigned int bank_id)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, bank_id);
+
+	return resource_size(res) / 4;
+}
+
+static int tegra_pinctrl_suspend(struct device *dev)
+{
+	struct tegra_pmx *pmx = dev_get_drvdata(dev);
+	u32 *backup_regs = pmx->backup_regs;
+	u32 *regs;
+	size_t bank_size;
+	unsigned int i, k;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		bank_size = tegra_pinctrl_get_bank_size(dev, i);
+		regs = pmx->regs[i];
+		for (k = 0; k < bank_size; k++)
+			*backup_regs++ = readl_relaxed(regs++);
+	}
+
+	return pinctrl_force_sleep(pmx->pctl);
+}
+
+static int tegra_pinctrl_resume(struct device *dev)
+{
+	struct tegra_pmx *pmx = dev_get_drvdata(dev);
+	u32 *backup_regs = pmx->backup_regs;
+	u32 *regs;
+	size_t bank_size;
+	unsigned int i, k;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		bank_size = tegra_pinctrl_get_bank_size(dev, i);
+		regs = pmx->regs[i];
+		for (k = 0; k < bank_size; k++)
+			writel_relaxed(*backup_regs++, regs++);
+	}
+
+	return 0;
+}
+
+const struct dev_pm_ops tegra_pinctrl_pm = {
+	.suspend = &tegra_pinctrl_suspend,
+	.resume = &tegra_pinctrl_resume
+};
+
 static bool gpio_node_has_range(const char *compatible)
 {
 	struct device_node *np;
@@ -655,6 +707,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	int i;
 	const char **group_pins;
 	int fn, gn, gfn;
+	unsigned long backup_regs_size = 0;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
 	if (!pmx)
@@ -707,6 +760,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		if (!res)
 			break;
+		backup_regs_size += resource_size(res);
 	}
 	pmx->nbanks = i;
 
@@ -715,6 +769,11 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	if (!pmx->regs)
 		return -ENOMEM;
 
+	pmx->backup_regs = devm_kzalloc(&pdev->dev, backup_regs_size,
+					GFP_KERNEL);
+	if (!pmx->backup_regs)
+		return -ENOMEM;
+
 	for (i = 0; i < pmx->nbanks; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		pmx->regs[i] = devm_ioremap_resource(&pdev->dev, res);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 105309774079..0fc82eea9cf1 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -17,6 +17,7 @@ struct tegra_pmx {
 
 	int nbanks;
 	void __iomem **regs;
+	u32 *backup_regs;
 };
 
 enum tegra_pinconf_param {
@@ -193,6 +194,8 @@ struct tegra_pinctrl_soc_data {
 	bool drvtype_in_mux;
 };
 
+extern const struct dev_pm_ops tegra_pinctrl_pm;
+
 int tegra_pinctrl_probe(struct platform_device *pdev,
 			const struct tegra_pinctrl_soc_data *soc_data);
 #endif
-- 
2.7.4
