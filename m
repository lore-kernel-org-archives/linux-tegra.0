From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 1/5] drm/tegra: dc: Link DC1 to DC0 on Tegra20
Date: Wed, 20 Dec 2017 18:46:10 +0300
Message-ID: <816995caed0e5c0ffdc0a5c02aff57d555707135.1513783738.git.digetx@gmail.com>
References: <cover.1513783738.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1513783738.git.digetx@gmail.com>
In-Reply-To: <cover.1513783738.git.digetx@gmail.com>
References: <cover.1513783738.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

HW reset isn't actually broken on Tegra20, but there is a dependency on
first display controller to be taken out of reset for the second to be
enabled successfully.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Change log:

v2:	Got rid of global variable and now use driver_find_device() instead.

 drivers/gpu/drm/tegra/dc.c | 80 +++++++++++++++++++++++++++++-----------------
 drivers/gpu/drm/tegra/dc.h |  2 +-
 2 files changed, 51 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index e8a0cad5899c..5299185cea2f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1848,7 +1848,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.supports_block_linear = false,
 	.pitch_align = 8,
 	.has_powergate = false,
-	.broken_reset = true,
+	.coupled_pm = true,
 	.has_nvdisplay = false,
 	.num_primary_formats = ARRAY_SIZE(tegra20_primary_formats),
 	.primary_formats = tegra20_primary_formats,
@@ -1863,7 +1863,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.supports_block_linear = false,
 	.pitch_align = 8,
 	.has_powergate = false,
-	.broken_reset = false,
+	.coupled_pm = false,
 	.has_nvdisplay = false,
 	.num_primary_formats = ARRAY_SIZE(tegra20_primary_formats),
 	.primary_formats = tegra20_primary_formats,
@@ -1878,7 +1878,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.supports_block_linear = false,
 	.pitch_align = 64,
 	.has_powergate = true,
-	.broken_reset = false,
+	.coupled_pm = false,
 	.has_nvdisplay = false,
 	.num_primary_formats = ARRAY_SIZE(tegra114_primary_formats),
 	.primary_formats = tegra114_primary_formats,
@@ -1893,7 +1893,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.supports_block_linear = true,
 	.pitch_align = 64,
 	.has_powergate = true,
-	.broken_reset = false,
+	.coupled_pm = false,
 	.has_nvdisplay = false,
 	.num_primary_formats = ARRAY_SIZE(tegra124_primary_formats),
 	.primary_formats = tegra114_primary_formats,
@@ -1908,7 +1908,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.supports_block_linear = true,
 	.pitch_align = 64,
 	.has_powergate = true,
-	.broken_reset = false,
+	.coupled_pm = false,
 	.has_nvdisplay = false,
 	.num_primary_formats = ARRAY_SIZE(tegra114_primary_formats),
 	.primary_formats = tegra114_primary_formats,
@@ -1957,7 +1957,7 @@ static const struct tegra_dc_soc_info tegra186_dc_soc_info = {
 	.supports_block_linear = true,
 	.pitch_align = 64,
 	.has_powergate = false,
-	.broken_reset = false,
+	.coupled_pm = false,
 	.has_nvdisplay = true,
 	.wgrps = tegra186_dc_wgrps,
 	.num_wgrps = ARRAY_SIZE(tegra186_dc_wgrps),
@@ -2025,6 +2025,11 @@ static int tegra_dc_parse_dt(struct tegra_dc *dc)
 	return 0;
 }
 
+static int tegra_dc_match(struct device *dev, void *data)
+{
+	return of_device_is_compatible(dev->of_node, "nvidia,tegra20-dc");
+}
+
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	struct resource *regs;
@@ -2045,6 +2050,28 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
+	/*
+	 * On Tegra20 DC1 requires DC0 to be taken out of reset in order to
+	 * be enabled, otherwise CPU hangs on writing to CMD_DISPLAY_COMMAND /
+	 * POWER_CONTROL registers during CRTC enabling.
+	 */
+	if (dc->pipe == 1 && dc->soc->coupled_pm) {
+		struct device_link *link;
+		struct device *dc0_dev;
+
+		dc0_dev = driver_find_device(pdev->dev.driver, NULL, NULL,
+					     tegra_dc_match);
+		if (!dc0_dev)
+			return -EPROBE_DEFER;
+
+		link = device_link_add(&pdev->dev, dc0_dev,
+				       DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE);
+		if (!link) {
+			dev_err(&pdev->dev, "failed to link to DC0\n");
+			return -EINVAL;
+		}
+	}
+
 	dc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(dc->clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
@@ -2058,21 +2085,19 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	}
 
 	/* assert reset and disable clock */
-	if (!dc->soc->broken_reset) {
-		err = clk_prepare_enable(dc->clk);
-		if (err < 0)
-			return err;
+	err = clk_prepare_enable(dc->clk);
+	if (err < 0)
+		return err;
 
-		usleep_range(2000, 4000);
+	usleep_range(2000, 4000);
 
-		err = reset_control_assert(dc->rst);
-		if (err < 0)
-			return err;
+	err = reset_control_assert(dc->rst);
+	if (err < 0)
+		return err;
 
-		usleep_range(2000, 4000);
+	usleep_range(2000, 4000);
 
-		clk_disable_unprepare(dc->clk);
-	}
+	clk_disable_unprepare(dc->clk);
 
 	if (dc->soc->has_powergate) {
 		if (dc->pipe == 0)
@@ -2146,12 +2171,10 @@ static int tegra_dc_suspend(struct device *dev)
 	struct tegra_dc *dc = dev_get_drvdata(dev);
 	int err;
 
-	if (!dc->soc->broken_reset) {
-		err = reset_control_assert(dc->rst);
-		if (err < 0) {
-			dev_err(dev, "failed to assert reset: %d\n", err);
-			return err;
-		}
+	err = reset_control_assert(dc->rst);
+	if (err < 0) {
+		dev_err(dev, "failed to assert reset: %d\n", err);
+		return err;
 	}
 
 	if (dc->soc->has_powergate)
@@ -2181,13 +2204,10 @@ static int tegra_dc_resume(struct device *dev)
 			return err;
 		}
 
-		if (!dc->soc->broken_reset) {
-			err = reset_control_deassert(dc->rst);
-			if (err < 0) {
-				dev_err(dev,
-					"failed to deassert reset: %d\n", err);
-				return err;
-			}
+		err = reset_control_deassert(dc->rst);
+		if (err < 0) {
+			dev_err(dev, "failed to deassert reset: %d\n", err);
+			return err;
 		}
 	}
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 8d68997e6263..8098f49c0d96 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -57,7 +57,7 @@ struct tegra_dc_soc_info {
 	bool supports_block_linear;
 	unsigned int pitch_align;
 	bool has_powergate;
-	bool broken_reset;
+	bool coupled_pm;
 	bool has_nvdisplay;
 	const struct tegra_windowgroup_soc *wgrps;
 	unsigned int num_wgrps;
-- 
2.15.1
