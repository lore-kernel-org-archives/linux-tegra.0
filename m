From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 3/4] host1x: MIPI: Include clock lanes in MIPI calibrate
Date: Wed, 10 Sep 2014 10:52:04 -0400
Message-ID: <1410360725-4286-4-git-send-email-seanpaul@chromium.org>
References: <1410360725-4286-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410360725-4286-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When calibrating the MIPI phy on tegra 124 compatible devices,
also include the clock lanes in the calibration.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
	- Don't try to calibrate clock lane on t114

 drivers/gpu/host1x/mipi.c | 111 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 84 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 0f3b77e..e017f7f 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -49,10 +49,18 @@
 #define MIPI_CAL_CONFIG_DSIC		0x10
 #define MIPI_CAL_CONFIG_DSID		0x11
 
+#define MIPI_CAL_CONFIG_DSIAB_CLK	0x19
+#define MIPI_CAL_CONFIG_DSICD_CLK	0x1a
+#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
+#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
+#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
+
 #define MIPI_CAL_CONFIG_SELECT		(1 << 21)
 #define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
 #define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
 #define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
+#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) << 8)
+#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
 
 #define MIPI_CAL_BIAS_PAD_CFG0		0x16
 #define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
@@ -63,18 +71,15 @@
 #define MIPI_CAL_BIAS_PAD_CFG2		0x18
 #define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
 
-static const struct module {
-	unsigned long reg;
-} modules[] = {
-	{ .reg = MIPI_CAL_CONFIG_CSIA },
-	{ .reg = MIPI_CAL_CONFIG_CSIB },
-	{ .reg = MIPI_CAL_CONFIG_CSIC },
-	{ .reg = MIPI_CAL_CONFIG_CSID },
-	{ .reg = MIPI_CAL_CONFIG_CSIE },
-	{ .reg = MIPI_CAL_CONFIG_DSIA },
-	{ .reg = MIPI_CAL_CONFIG_DSIB },
-	{ .reg = MIPI_CAL_CONFIG_DSIC },
-	{ .reg = MIPI_CAL_CONFIG_DSID },
+struct calibration_regs {
+	unsigned long data;
+	unsigned long clk;
+};
+
+struct tegra_mipi_config {
+	bool calibrate_clk_lane;
+	int num_pads;
+	const struct calibration_regs *regs;
 };
 
 struct tegra_mipi {
@@ -87,6 +92,7 @@ struct tegra_mipi_device {
 	struct platform_device *pdev;
 	struct tegra_mipi *mipi;
 	struct device *device;
+	const struct tegra_mipi_config *config;
 	unsigned long pads;
 };
 
@@ -102,9 +108,48 @@ static inline void tegra_mipi_writel(struct tegra_mipi *mipi,
 	writel(value, mipi->regs + (reg << 2));
 }
 
+static const struct calibration_regs tegra114_mipi_calibration_regs[] = {
+	{ .data = MIPI_CAL_CONFIG_CSIA },
+	{ .data = MIPI_CAL_CONFIG_CSIB },
+	{ .data = MIPI_CAL_CONFIG_CSIC },
+	{ .data = MIPI_CAL_CONFIG_CSID },
+	{ .data = MIPI_CAL_CONFIG_CSIE },
+	{ .data = MIPI_CAL_CONFIG_DSIA },
+	{ .data = MIPI_CAL_CONFIG_DSIB },
+	{ .data = MIPI_CAL_CONFIG_DSIC },
+	{ .data = MIPI_CAL_CONFIG_DSID },
+};
+static const struct tegra_mipi_config tegra114_mipi_config = {
+	.calibrate_clk_lane = false,
+	.regs = tegra114_mipi_calibration_regs,
+	.num_pads = ARRAY_SIZE(tegra114_mipi_calibration_regs),
+};
+
+static const struct calibration_regs tegra124_mipi_calibration_regs[] = {
+	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSID, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = MIPI_CAL_CONFIG_CSIE_CLK },
+	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIAB_CLK },
+	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIAB_CLK },
+};
+static const struct tegra_mipi_config tegra124_mipi_config = {
+	.calibrate_clk_lane = true,
+	.regs = tegra124_mipi_calibration_regs,
+	.num_pads = ARRAY_SIZE(tegra124_mipi_calibration_regs),
+};
+
+static struct of_device_id tegra_mipi_of_match[] = {
+	{ .compatible = "nvidia,tegra114-mipi", .data = &tegra114_mipi_config },
+	{ .compatible = "nvidia,tegra124-mipi", .data = &tegra124_mipi_config },
+	{ },
+};
+
 struct tegra_mipi_device *tegra_mipi_request(struct device *device)
 {
 	struct device_node *np = device->of_node;
+	const struct of_device_id *match;
 	struct tegra_mipi_device *dev;
 	struct of_phandle_args args;
 	int err;
@@ -117,19 +162,23 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device)
 
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev) {
-		of_node_put(args.np);
 		err = -ENOMEM;
 		goto out;
 	}
 
 	dev->pdev = of_find_device_by_node(args.np);
 	if (!dev->pdev) {
-		of_node_put(args.np);
 		err = -ENODEV;
-		goto free;
+		goto node_put;
 	}
 
-	of_node_put(args.np);
+	match = of_match_node(tegra_mipi_of_match, dev->pdev->dev.of_node);
+	if (!match) {
+		err = -ENODEV;
+		goto node_put;
+	}
+
+	dev->config = match->data;
 
 	dev->mipi = platform_get_drvdata(dev->pdev);
 	if (!dev->mipi) {
@@ -137,6 +186,8 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device)
 		goto pdev_put;
 	}
 
+	of_node_put(args.np);
+
 	dev->pads = args.args[0];
 	dev->device = device;
 
@@ -144,7 +195,8 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device)
 
 pdev_put:
 	platform_device_put(dev->pdev);
-free:
+node_put:
+	of_node_put(args.np);
 	kfree(dev);
 out:
 	return ERR_PTR(err);
@@ -177,7 +229,8 @@ static int tegra_mipi_wait(struct tegra_mipi *mipi)
 
 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 {
-	unsigned long value;
+	const struct tegra_mipi_config *cfg = device->config;
+	unsigned long value, clk_value;
 	unsigned int i;
 	int err;
 
@@ -196,16 +249,25 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
 
-	for (i = 0; i < ARRAY_SIZE(modules); i++) {
-		if (device->pads & BIT(i))
+	for (i = 0; i < cfg->num_pads; i++) {
+		if (device->pads & BIT(i)) {
 			value = MIPI_CAL_CONFIG_SELECT |
 				MIPI_CAL_CONFIG_HSPDOS(0) |
 				MIPI_CAL_CONFIG_HSPUOS(4) |
 				MIPI_CAL_CONFIG_TERMOS(5);
-		else
+			clk_value = MIPI_CAL_CONFIG_SELECT |
+				    MIPI_CAL_CONFIG_HSCLKPDOSD(0) |
+				    MIPI_CAL_CONFIG_HSCLKPUOSD(4);
+		} else {
 			value = 0;
+			clk_value = 0;
+		}
+
+		tegra_mipi_writel(device->mipi, value, cfg->regs[i].data);
 
-		tegra_mipi_writel(device->mipi, value, modules[i].reg);
+		if (cfg->calibrate_clk_lane)
+			tegra_mipi_writel(device->mipi, clk_value,
+					cfg->regs[i].clk);
 	}
 
 	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
@@ -262,11 +324,6 @@ static int tegra_mipi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct of_device_id tegra_mipi_of_match[] = {
-	{ .compatible = "nvidia,tegra114-mipi", },
-	{ },
-};
-
 struct platform_driver tegra_mipi_driver = {
 	.driver = {
 		.name = "tegra-mipi",
-- 
2.0.0
