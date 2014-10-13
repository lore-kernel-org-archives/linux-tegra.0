From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 08/14] gpu: host1x: mipi: Calibrate clock lanes
Date: Mon, 13 Oct 2014 12:21:49 +0200
Message-ID: <1413195715-4719-8-git-send-email-thierry.reding@gmail.com>
References: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Include the clock lanes when calibrating the MIPI PHY on Tegra124
compatible devices.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
[treding@nvidia.com: bikeshedding]
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/mipi.c | 124 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 92 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 0d8c3ae8db6a..22e20c2399c5 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -49,11 +49,24 @@
 #define MIPI_CAL_CONFIG_DSIC		0x10
 #define MIPI_CAL_CONFIG_DSID		0x11
 
+#define MIPI_CAL_CONFIG_DSIAB_CLK	0x19
+#define MIPI_CAL_CONFIG_DSICD_CLK	0x1a
+#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
+#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
+#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
+
+/* for data and clock lanes */
 #define MIPI_CAL_CONFIG_SELECT		(1 << 21)
+
+/* for data lanes */
 #define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
 #define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
 #define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
 
+/* for clock lanes */
+#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
+#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
+
 #define MIPI_CAL_BIAS_PAD_CFG0		0x16
 #define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
 #define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
@@ -63,21 +76,19 @@
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
+struct tegra_mipi_pad {
+	unsigned long data;
+	unsigned long clk;
+};
+
+struct tegra_mipi_soc {
+	bool has_clk_lane;
+	const struct tegra_mipi_pad *pads;
+	unsigned int num_pads;
 };
 
 struct tegra_mipi {
+	const struct tegra_mipi_soc *soc;
 	void __iomem *regs;
 	struct mutex lock;
 	struct clk *clk;
@@ -117,36 +128,35 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device)
 
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
 		goto free;
 	}
 
-	of_node_put(args.np);
-
 	dev->mipi = platform_get_drvdata(dev->pdev);
 	if (!dev->mipi) {
 		err = -EPROBE_DEFER;
-		goto pdev_put;
+		goto put;
 	}
 
+	of_node_put(args.np);
+
 	dev->pads = args.args[0];
 	dev->device = device;
 
 	return dev;
 
-pdev_put:
+put:
 	platform_device_put(dev->pdev);
 free:
 	kfree(dev);
 out:
+	of_node_put(args.np);
 	return ERR_PTR(err);
 }
 EXPORT_SYMBOL(tegra_mipi_request);
@@ -177,6 +187,7 @@ static int tegra_mipi_wait(struct tegra_mipi *mipi)
 
 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 {
+	const struct tegra_mipi_soc *soc = device->mipi->soc;
 	unsigned int i;
 	u32 value;
 	int err;
@@ -196,16 +207,23 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
 
-	for (i = 0; i < ARRAY_SIZE(modules); i++) {
-		if (device->pads & BIT(i))
-			value = MIPI_CAL_CONFIG_SELECT |
-				MIPI_CAL_CONFIG_HSPDOS(0) |
-				MIPI_CAL_CONFIG_HSPUOS(4) |
-				MIPI_CAL_CONFIG_TERMOS(5);
-		else
-			value = 0;
+	for (i = 0; i < soc->num_pads; i++) {
+		u32 clk = 0, data = 0;
+
+		if (device->pads & BIT(i)) {
+			data = MIPI_CAL_CONFIG_SELECT |
+			       MIPI_CAL_CONFIG_HSPDOS(0) |
+			       MIPI_CAL_CONFIG_HSPUOS(4) |
+			       MIPI_CAL_CONFIG_TERMOS(5);
+			clk = MIPI_CAL_CONFIG_SELECT |
+			      MIPI_CAL_CONFIG_HSCLKPDOSD(0) |
+			      MIPI_CAL_CONFIG_HSCLKPUOSD(4);
+		}
+
+		tegra_mipi_writel(device->mipi, data, soc->pads[i].data);
 
-		tegra_mipi_writel(device->mipi, value, modules[i].reg);
+		if (soc->has_clk_lane)
+			tegra_mipi_writel(device->mipi, clk, soc->pads[i].clk);
 	}
 
 	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
@@ -221,16 +239,63 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 }
 EXPORT_SYMBOL(tegra_mipi_calibrate);
 
+static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
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
+
+static const struct tegra_mipi_soc tegra114_mipi_soc = {
+	.has_clk_lane = false,
+	.pads = tegra114_mipi_pads,
+	.num_pads = ARRAY_SIZE(tegra114_mipi_pads),
+};
+
+static const struct tegra_mipi_pad tegra124_mipi_pads[] = {
+	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSID, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = MIPI_CAL_CONFIG_CSIE_CLK },
+	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIAB_CLK },
+	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIAB_CLK },
+};
+
+static const struct tegra_mipi_soc tegra124_mipi_soc = {
+	.has_clk_lane = true,
+	.pads = tegra124_mipi_pads,
+	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
+};
+
+static struct of_device_id tegra_mipi_of_match[] = {
+	{ .compatible = "nvidia,tegra114-mipi", .data = &tegra114_mipi_soc },
+	{ .compatible = "nvidia,tegra124-mipi", .data = &tegra124_mipi_soc },
+	{ },
+};
+
 static int tegra_mipi_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *match;
 	struct tegra_mipi *mipi;
 	struct resource *res;
 	int err;
 
+	match = of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
+	if (!match)
+		return -ENODEV;
+
 	mipi = devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
 	if (!mipi)
 		return -ENOMEM;
 
+	mipi->soc = match->data;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mipi->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(mipi->regs))
@@ -262,11 +327,6 @@ static int tegra_mipi_remove(struct platform_device *pdev)
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
2.1.2
