From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 06/20] drm/tegra: dc: Avoid reset asserts on Tegra20
Date: Thu, 15 Jun 2017 02:18:29 +0300
Message-ID: <d54a60e6308e00f86583a875beafce8f825e0d7e.1497480756.git.digetx@gmail.com>
References: <cover.1497480751.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 33a8eb8 ("Implement runtime PM") introduced HW reset control. It
causes a hang on Tegra20 if both display controllers are utilized (RGB
panel and HDMI). The TRM suggests that each display controller has its own
reset control, apparently it is not correct.

Fixes: 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM")
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 95b373f739f2..98ee6abb056c 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -30,6 +30,7 @@ struct tegra_dc_soc_info {
 	bool supports_block_linear;
 	unsigned int pitch_align;
 	bool has_powergate;
+	bool broken_reset;
 };
 
 struct tegra_plane {
@@ -1856,6 +1857,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.supports_block_linear = false,
 	.pitch_align = 8,
 	.has_powergate = false,
+	.broken_reset = true,
 };
 
 static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
@@ -1865,6 +1867,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.supports_block_linear = false,
 	.pitch_align = 8,
 	.has_powergate = false,
+	.broken_reset = false,
 };
 
 static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
@@ -1874,6 +1877,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.supports_block_linear = false,
 	.pitch_align = 64,
 	.has_powergate = true,
+	.broken_reset = false,
 };
 
 static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
@@ -1883,6 +1887,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.supports_block_linear = true,
 	.pitch_align = 64,
 	.has_powergate = true,
+	.broken_reset = false,
 };
 
 static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
@@ -1892,6 +1897,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.supports_block_linear = true,
 	.pitch_align = 64,
 	.has_powergate = true,
+	.broken_reset = false,
 };
 
 static const struct of_device_id tegra_dc_of_match[] = {
@@ -1989,7 +1995,8 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->rst);
 	}
 
-	reset_control_assert(dc->rst);
+	if (!dc->soc->broken_reset)
+		reset_control_assert(dc->rst);
 
 	if (dc->soc->has_powergate) {
 		if (dc->pipe == 0)
@@ -2063,10 +2070,12 @@ static int tegra_dc_suspend(struct device *dev)
 	struct tegra_dc *dc = dev_get_drvdata(dev);
 	int err;
 
-	err = reset_control_assert(dc->rst);
-	if (err < 0) {
-		dev_err(dev, "failed to assert reset: %d\n", err);
-		return err;
+	if (!dc->soc->broken_reset) {
+		err = reset_control_assert(dc->rst);
+		if (err < 0) {
+			dev_err(dev, "failed to assert reset: %d\n", err);
+			return err;
+		}
 	}
 
 	if (dc->soc->has_powergate)
@@ -2096,10 +2105,13 @@ static int tegra_dc_resume(struct device *dev)
 			return err;
 		}
 
-		err = reset_control_deassert(dc->rst);
-		if (err < 0) {
-			dev_err(dev, "failed to deassert reset: %d\n", err);
-			return err;
+		if (!dc->soc->broken_reset) {
+			err = reset_control_deassert(dc->rst);
+			if (err < 0) {
+				dev_err(dev,
+					"failed to deassert reset: %d\n", err);
+				return err;
+			}
 		}
 	}
 
-- 
2.13.0
