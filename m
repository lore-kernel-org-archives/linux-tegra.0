From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 1/2] drm/tegra: dc: Link DC1 to DC0 on Tegra20
Date: Mon, 11 Dec 2017 02:19:43 +0300
Message-ID: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

HW reset isn't actually broken on Tegra20, but there is a dependency on
first display controller to be taken out of reset for the second to be
enabled successfully.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 77 +++++++++++++++++++++++++++++-----------------
 drivers/gpu/drm/tegra/dc.h |  4 ++-
 2 files changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index fc70351b9017..6139d3e9cedf 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -24,6 +24,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
 
+static struct tegra_dc *dc0;
+
 struct tegra_plane {
 	struct drm_plane base;
 	unsigned int index;
@@ -1863,7 +1865,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.supports_block_linear = false,
 	.pitch_align = 8,
 	.has_powergate = false,
-	.broken_reset = true,
+	.coupled_pm = true,
 };
 
 static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
@@ -1873,7 +1875,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.supports_block_linear = false,
 	.pitch_align = 8,
 	.has_powergate = false,
-	.broken_reset = false,
+	.coupled_pm = false,
 };
 
 static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
@@ -1883,7 +1885,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.supports_block_linear = false,
 	.pitch_align = 64,
 	.has_powergate = true,
-	.broken_reset = false,
+	.coupled_pm = false,
 };
 
 static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
@@ -1893,7 +1895,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.supports_block_linear = true,
 	.pitch_align = 64,
 	.has_powergate = true,
-	.broken_reset = false,
+	.coupled_pm = false,
 };
 
 static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
@@ -1903,7 +1905,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.supports_block_linear = true,
 	.pitch_align = 64,
 	.has_powergate = true,
-	.broken_reset = false,
+	.coupled_pm = false,
 };
 
 static const struct of_device_id tegra_dc_of_match[] = {
@@ -1985,6 +1987,24 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
+	/*
+	 * On Tegra20 DC1 requires DC0 to be taken out of reset in order to
+	 * be enabled, otherwise CPU hangs on writing to CMD_DISPLAY_COMMAND /
+	 * POWER_CONTROL registers during CRTC enabling.
+	 */
+	if (dc->pipe == 1 && dc->soc->coupled_pm) {
+		int link_flags = DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE;
+
+		if (!dc0)
+			return -EPROBE_DEFER;
+
+		dc->link = device_link_add(&pdev->dev, dc0->dev, link_flags);
+		if (!dc->link) {
+			dev_err(&pdev->dev, "failed to link to DC0\n");
+			return -EINVAL;
+		}
+	}
+
 	dc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(dc->clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
@@ -1998,21 +2018,19 @@ static int tegra_dc_probe(struct platform_device *pdev)
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
@@ -2054,6 +2072,9 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (dc->pipe == 0)
+		dc0 = dc;
+
 	return 0;
 }
 
@@ -2077,6 +2098,9 @@ static int tegra_dc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
+	if (dc == dc0)
+		dc0 = NULL;
+
 	return 0;
 }
 
@@ -2086,12 +2110,10 @@ static int tegra_dc_suspend(struct device *dev)
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
@@ -2121,13 +2143,10 @@ static int tegra_dc_resume(struct device *dev)
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
index cb100b6e3282..1d772ed78301 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -32,7 +32,7 @@ struct tegra_dc_soc_info {
 	bool supports_block_linear;
 	unsigned int pitch_align;
 	bool has_powergate;
-	bool broken_reset;
+	bool coupled_pm;
 };
 
 struct tegra_dc {
@@ -65,6 +65,8 @@ struct tegra_dc {
 	const struct tegra_dc_soc_info *soc;
 
 	struct iommu_domain *domain;
+
+	struct device_link *link;
 };
 
 static inline struct tegra_dc *
-- 
2.15.1
