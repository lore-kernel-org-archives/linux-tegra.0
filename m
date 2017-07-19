From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 025/102] drm/tegra: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:25:29 +0200
Message-ID: <20170719152646.25903-26-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/tegra/dc.c    | 2 +-
 drivers/gpu/drm/tegra/dpaux.c | 3 ++-
 drivers/gpu/drm/tegra/dsi.c   | 2 +-
 drivers/gpu/drm/tegra/gr3d.c  | 6 +++---
 drivers/gpu/drm/tegra/hdmi.c  | 2 +-
 drivers/gpu/drm/tegra/sor.c   | 2 +-
 6 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index c875f11786b93..61d476a3006af 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2011,7 +2011,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->clk);
 	}
 
-	dc->rst = devm_reset_control_get(&pdev->dev, "dc");
+	dc->rst = devm_reset_control_get_exclusive(&pdev->dev, "dc");
 	if (IS_ERR(dc->rst)) {
 		dev_err(&pdev->dev, "failed to get reset\n");
 		return PTR_ERR(dc->rst);
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 2fde44c3a1b30..1cf18f4f98f06 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -445,7 +445,8 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	}
 
 	if (!pdev->dev.pm_domain) {
-		dpaux->rst = devm_reset_control_get(&pdev->dev, "dpaux");
+		dpaux->rst = devm_reset_control_get_exclusive(&pdev->dev,
+							      "dpaux");
 		if (IS_ERR(dpaux->rst)) {
 			dev_err(&pdev->dev,
 				"failed to get reset control: %ld\n",
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 3dea1216bafdc..af8850c74abe9 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1518,7 +1518,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	dsi->lanes = 4;
 
 	if (!pdev->dev.pm_domain) {
-		dsi->rst = devm_reset_control_get(&pdev->dev, "dsi");
+		dsi->rst = devm_reset_control_get_exclusive(&pdev->dev, "dsi");
 		if (IS_ERR(dsi->rst))
 			return PTR_ERR(dsi->rst);
 	}
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index cee2ab645cde9..e8dd13e02483d 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -260,7 +260,7 @@ static int gr3d_probe(struct platform_device *pdev)
 		return PTR_ERR(gr3d->clk);
 	}
 
-	gr3d->rst = devm_reset_control_get(&pdev->dev, "3d");
+	gr3d->rst = devm_reset_control_get_exclusive(&pdev->dev, "3d");
 	if (IS_ERR(gr3d->rst)) {
 		dev_err(&pdev->dev, "cannot get reset\n");
 		return PTR_ERR(gr3d->rst);
@@ -273,8 +273,8 @@ static int gr3d_probe(struct platform_device *pdev)
 			return PTR_ERR(gr3d->clk_secondary);
 		}
 
-		gr3d->rst_secondary = devm_reset_control_get(&pdev->dev,
-								"3d2");
+		gr3d->rst_secondary = devm_reset_control_get_exclusive(&pdev->dev,
+								       "3d2");
 		if (IS_ERR(gr3d->rst_secondary)) {
 			dev_err(&pdev->dev, "cannot get secondary reset\n");
 			return PTR_ERR(gr3d->rst_secondary);
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index cda0491ed6bf8..49d1cade94742 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1686,7 +1686,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 		return PTR_ERR(hdmi->clk);
 	}
 
-	hdmi->rst = devm_reset_control_get(&pdev->dev, "hdmi");
+	hdmi->rst = devm_reset_control_get_exclusive(&pdev->dev, "hdmi");
 	if (IS_ERR(hdmi->rst)) {
 		dev_err(&pdev->dev, "failed to get reset\n");
 		return PTR_ERR(hdmi->rst);
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index a8f528925009e..4a4796ceeb541 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2609,7 +2609,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	}
 
 	if (!pdev->dev.pm_domain) {
-		sor->rst = devm_reset_control_get(&pdev->dev, "sor");
+		sor->rst = devm_reset_control_get_exclusive(&pdev->dev, "sor");
 		if (IS_ERR(sor->rst)) {
 			err = PTR_ERR(sor->rst);
 			dev_err(&pdev->dev, "failed to get reset control: %d\n",
-- 
2.11.0
