From: Venkat Reddy Talla <vreddytalla@nvidia.com>
Subject: [PATCH 3/3] drm/tegra: sor: change io pad power state using new pmc api
Date: Thu, 2 Aug 2018 17:29:03 +0530
Message-ID: <1533211143-17517-3-git-send-email-vreddytalla@nvidia.com>
References: <1533211143-17517-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533211143-17517-1-git-send-email-vreddytalla@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, pdeschrijver@nvidia.com, vivek.gautam@codeaurora.org, p.zabel@pengutronix.de, thierry.reding@gmail.com, mperttunen@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: avienamo@nvidia.com, talho@nvidia.com, ldewangan@nvidia.com, vreddytalla@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Added support in PMC driver to configure the power state and voltage level
of the IO pads from client driver via pincontrol framework, because of this
tegra_io_pad_power_disable() and tegra_io_pad_power_enable() deprecated,
to change power state of SOR io pads using new pmc apis.

Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index d7fe9f1..6ede923 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2013 NVIDIA Corporation
+ * Copyright (C) 2013-2018, NVIDIA Corporation.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -342,7 +342,6 @@ struct tegra_sor {
 	struct drm_info_list *debugfs_files;
 
 	const struct tegra_sor_ops *ops;
-	enum tegra_io_pad pad;
 
 	/* for HDMI 2.0 */
 	struct tegra_sor_hdmi_settings *settings;
@@ -1547,7 +1546,7 @@ static void tegra_sor_edp_disable(struct drm_encoder *encoder)
 			dev_err(sor->dev, "failed to disable DP: %d\n", err);
 	}
 
-	err = tegra_io_pad_power_disable(sor->pad);
+	err = tegra_io_rail_power_off(TEGRA_IO_RAIL_LVDS);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power off I/O pad: %d\n", err);
 
@@ -1707,7 +1706,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	/* step 2 */
-	err = tegra_io_pad_power_enable(sor->pad);
+	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_LVDS);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power on I/O pad: %d\n", err);
 
@@ -2189,7 +2188,7 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed to power down SOR: %d\n", err);
 
-	err = tegra_io_pad_power_disable(sor->pad);
+	err = tegra_io_rail_power_off(TEGRA_IO_RAIL_HDMI);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power off I/O pad: %d\n", err);
 
@@ -2225,7 +2224,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 
 	div = clk_get_rate(sor->clk) / 1000000 * 4;
 
-	err = tegra_io_pad_power_enable(sor->pad);
+	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_HDMI);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power on I/O pad: %d\n", err);
 
@@ -2921,7 +2920,6 @@ static int tegra_sor_parse_dt(struct tegra_sor *sor)
 		 * override the default that we already set for Tegra210 and
 		 * earlier
 		 */
-		sor->pad = TEGRA_IO_PAD_HDMI_DP0 + sor->index;
 	}
 
 	return 0;
@@ -2962,7 +2960,6 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (!sor->aux) {
 		if (sor->soc->supports_hdmi) {
 			sor->ops = &tegra_sor_hdmi_ops;
-			sor->pad = TEGRA_IO_PAD_HDMI;
 		} else if (sor->soc->supports_lvds) {
 			dev_err(&pdev->dev, "LVDS not supported yet\n");
 			return -ENODEV;
@@ -2973,7 +2970,6 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	} else {
 		if (sor->soc->supports_edp) {
 			sor->ops = &tegra_sor_edp_ops;
-			sor->pad = TEGRA_IO_PAD_LVDS;
 		} else if (sor->soc->supports_dp) {
 			dev_err(&pdev->dev, "DisplayPort not supported yet\n");
 			return -ENODEV;
-- 
2.1.4
