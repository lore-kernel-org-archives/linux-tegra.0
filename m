From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/4] host1x: mipi: Add new parent clock for mipi calibration
Date: Thu,  7 Aug 2014 02:11:44 -0400
Message-ID: <1407391907-19488-2-git-send-email-seanpaul@chromium.org>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407391907-19488-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds a new parent clock to enable/disable the 72MHz
clock required for mipi calibration.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 .../bindings/mipi/nvidia,tegra114-mipi.txt         | 12 ++++--
 drivers/gpu/host1x/mipi.c                          | 44 ++++++++++++++++++----
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mipi/nvidia,tegra114-mipi.txt b/Documentation/devicetree/bindings/mipi/nvidia,tegra114-mipi.txt
index e4a25ce..6e1aad0 100644
--- a/Documentation/devicetree/bindings/mipi/nvidia,tegra114-mipi.txt
+++ b/Documentation/devicetree/bindings/mipi/nvidia,tegra114-mipi.txt
@@ -5,8 +5,11 @@ Required properties:
 - reg: Physical base address and length of the controller's registers.
 - clocks: Must contain an entry for each entry in clock-names.
   See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  - mipi-cal
+- clock-names: Include the following entries:
+  - REQUIRED CLOCKS:
+    - mipi-cal
+  - OPTIONAL CLOCKS:
+    - parent
 - #nvidia,mipi-calibrate-cells: Should be 1. The cell is a bitmask of the pads
   that need to be calibrated for a given device.
 
@@ -19,8 +22,9 @@ Example:
 	mipi: mipi@700e3000 {
 		compatible = "nvidia,tegra114-mipi";
 		reg = <0x700e3000 0x100>;
-		clocks = <&tegra_car TEGRA114_CLK_MIPI_CAL>;
-		clock-names = "mipi-cal";
+		clocks = <&tegra_car TEGRA114_CLK_MIPI_CAL>,
+			 <&tegra_car TEGRA114_CLK_PLL_P_OUT3>;
+		clock-names = "mipi-cal", "parent";
 		#nvidia,mipi-calibrate-cells = <1>;
 	};
 
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 9882ea1..4dd91fd 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -80,7 +80,8 @@ static const struct module {
 struct tegra_mipi {
 	void __iomem *regs;
 	struct mutex lock;
-	struct clk *clk;
+	struct clk *clk_parent;
+	struct clk *clk_mipi_cal;
 };
 
 struct tegra_mipi_device {
@@ -181,10 +182,16 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	unsigned int i;
 	int err;
 
-	err = clk_enable(device->mipi->clk);
+	err = clk_enable(device->mipi->clk_mipi_cal);
 	if (err < 0)
 		return err;
 
+	if (device->mipi->clk_parent) {
+		err = clk_enable(device->mipi->clk_parent);
+		if (err < 0)
+			goto out_clk_mipi_cal;
+	}
+
 	mutex_lock(&device->mipi->lock);
 
 	value = tegra_mipi_readl(device->mipi, MIPI_CAL_BIAS_PAD_CFG0);
@@ -213,7 +220,12 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	err = tegra_mipi_wait(device->mipi);
 
 	mutex_unlock(&device->mipi->lock);
-	clk_disable(device->mipi->clk);
+
+	if (device->mipi->clk_parent)
+		clk_disable(device->mipi->clk_parent);
+
+out_clk_mipi_cal:
+	clk_disable(device->mipi->clk_mipi_cal);
 
 	return err;
 }
@@ -236,26 +248,42 @@ static int tegra_mipi_probe(struct platform_device *pdev)
 
 	mutex_init(&mipi->lock);
 
-	mipi->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(mipi->clk)) {
+	mipi->clk_mipi_cal = devm_clk_get(&pdev->dev, "mipi-cal");
+	if (IS_ERR(mipi->clk_mipi_cal)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
-		return PTR_ERR(mipi->clk);
+		return PTR_ERR(mipi->clk_mipi_cal);
 	}
 
-	err = clk_prepare(mipi->clk);
+	mipi->clk_parent = devm_clk_get(&pdev->dev, "parent");
+	if (IS_ERR(mipi->clk_parent))
+		mipi->clk_parent = NULL;
+
+	err = clk_prepare(mipi->clk_mipi_cal);
 	if (err < 0)
 		return err;
 
+	if (mipi->clk_parent) {
+		err = clk_prepare(mipi->clk_parent);
+		if (err < 0)
+			goto err;
+	}
+
 	platform_set_drvdata(pdev, mipi);
 
 	return 0;
+err:
+	clk_unprepare(mipi->clk_mipi_cal);
+
+	return err;
 }
 
 static int tegra_mipi_remove(struct platform_device *pdev)
 {
 	struct tegra_mipi *mipi = platform_get_drvdata(pdev);
 
-	clk_unprepare(mipi->clk);
+	if (mipi->clk_parent)
+		clk_unprepare(mipi->clk_parent);
+	clk_unprepare(mipi->clk_mipi_cal);
 
 	return 0;
 }
-- 
2.0.0
