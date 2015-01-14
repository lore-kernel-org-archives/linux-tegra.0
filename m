From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 7/9] drm/tegra: dc: remove the power sequence from driver
Date: Wed, 14 Jan 2015 14:19:30 +0800
Message-ID: <1421216372-8025-8-git-send-email-vinceh@nvidia.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421216372-8025-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

We have the generic PM domain support for Tegra SoCs now. So remove the
duplicated power sequence here.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 46 +++++++++++-----------------------------------
 1 file changed, 11 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index ae26cc054fff..078373336977 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -25,7 +25,6 @@ struct tegra_dc_soc_info {
 	bool supports_cursor;
 	bool supports_block_linear;
 	unsigned int pitch_align;
-	bool has_powergate;
 };
 
 struct tegra_plane {
@@ -1575,7 +1574,6 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.supports_cursor = false,
 	.supports_block_linear = false,
 	.pitch_align = 8,
-	.has_powergate = false,
 };
 
 static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
@@ -1583,7 +1581,6 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.supports_cursor = false,
 	.supports_block_linear = false,
 	.pitch_align = 8,
-	.has_powergate = false,
 };
 
 static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
@@ -1591,7 +1588,6 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.supports_cursor = false,
 	.supports_block_linear = false,
 	.pitch_align = 64,
-	.has_powergate = true,
 };
 
 static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
@@ -1599,7 +1595,6 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.supports_cursor = true,
 	.supports_block_linear = true,
 	.pitch_align = 64,
-	.has_powergate = true,
 };
 
 static const struct of_device_id tegra_dc_of_match[] = {
@@ -1692,33 +1687,18 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->rst);
 	}
 
-	if (dc->soc->has_powergate) {
-		if (dc->pipe == 0)
-			dc->powergate = TEGRA_POWERGATE_DIS;
-		else
-			dc->powergate = TEGRA_POWERGATE_DISB;
-
-		err = tegra_powergate_sequence_power_up(dc->powergate, dc->clk,
-							dc->rst);
-		if (err < 0) {
-			dev_err(&pdev->dev, "failed to power partition: %d\n",
-				err);
-			return err;
-		}
-	} else {
-		err = clk_prepare_enable(dc->clk);
-		if (err < 0) {
-			dev_err(&pdev->dev, "failed to enable clock: %d\n",
-				err);
-			return err;
-		}
+	err = clk_prepare_enable(dc->clk);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to enable clock: %d\n",
+			err);
+		return err;
+	}
 
-		err = reset_control_deassert(dc->rst);
-		if (err < 0) {
-			dev_err(&pdev->dev, "failed to deassert reset: %d\n",
-				err);
-			return err;
-		}
+	err = reset_control_deassert(dc->rst);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to deassert reset: %d\n",
+			err);
+		return err;
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1773,10 +1753,6 @@ static int tegra_dc_remove(struct platform_device *pdev)
 	}
 
 	reset_control_assert(dc->rst);
-
-	if (dc->soc->has_powergate)
-		tegra_powergate_power_off(dc->powergate);
-
 	clk_disable_unprepare(dc->clk);
 
 	return 0;
-- 
1.9.1
