From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 1/1] drm/tegra: Add guard to avoid double disable/enable of RGB outputs
Date: Tue, 11 Feb 2014 21:12:27 +0400
Message-ID: <1392138747-18198-1-git-send-email-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, tbergstrom@nvidia.com, airlied@linux.ie, swarren@wwwdotorg.org
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Add guard to check whether RGB output is already enabled in the way it's
done for HDMI output. Fixes possible hang on trying to disable output twice
(first time during driver probe and second on fb registering).

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 338f7f6..0266fb4 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -15,6 +15,7 @@
 struct tegra_rgb {
 	struct tegra_output output;
 	struct tegra_dc *dc;
+	bool enabled;
 
 	struct clk *clk_parent;
 	struct clk *clk;
@@ -89,6 +90,9 @@ static int tegra_output_rgb_enable(struct tegra_output *output)
 	struct tegra_rgb *rgb = to_rgb(output);
 	unsigned long value;
 
+	if (rgb->enabled)
+		return 0;
+
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
@@ -122,6 +126,8 @@ static int tegra_output_rgb_enable(struct tegra_output *output)
 	tegra_dc_writel(rgb->dc, GENERAL_ACT_REQ << 8, DC_CMD_STATE_CONTROL);
 	tegra_dc_writel(rgb->dc, GENERAL_ACT_REQ, DC_CMD_STATE_CONTROL);
 
+	rgb->enabled = true;
+
 	return 0;
 }
 
@@ -130,6 +136,9 @@ static int tegra_output_rgb_disable(struct tegra_output *output)
 	struct tegra_rgb *rgb = to_rgb(output);
 	unsigned long value;
 
+	if (!rgb->enabled)
+		return 0;
+
 	value = tegra_dc_readl(rgb->dc, DC_CMD_DISPLAY_POWER_CONTROL);
 	value &= ~(PW0_ENABLE | PW1_ENABLE | PW2_ENABLE | PW3_ENABLE |
 		   PW4_ENABLE | PM0_ENABLE | PM1_ENABLE);
@@ -144,6 +153,8 @@ static int tegra_output_rgb_disable(struct tegra_output *output)
 
 	tegra_dc_write_regs(rgb->dc, rgb_disable, ARRAY_SIZE(rgb_disable));
 
+	rgb->enabled = false;
+
 	return 0;
 }
 
-- 
1.8.5.3
