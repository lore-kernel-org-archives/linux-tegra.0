From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 13/13] drm/tegra: dc: Support background color
Date: Mon, 27 Nov 2017 11:07:58 +0100
Message-ID: <20171127100758.22149-14-thierry.reding@gmail.com>
References: <20171127100758.22149-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127100758.22149-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Starting with Tegra124, the interface to set the background color (the
value generated for pixels that are not sourced from any window) is via
a different register. Earlier generations called this the border color.
Reverse the feature flag and assume that IP revisions that don't have
support for background color will support border color instead.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 14 ++++++++------
 drivers/gpu/drm/tegra/dc.h |  8 +++++++-
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 69d98bf84ceb..954bf92f21fd 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1572,7 +1572,9 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 		WIN_A_OF_INT | WIN_B_OF_INT | WIN_C_OF_INT;
 	tegra_dc_writel(dc, value, DC_CMD_INT_MASK);
 
-	if (dc->soc->supports_border_color)
+	if (dc->soc->supports_background_color)
+		tegra_dc_writel(dc, 0, DC_DISP_BLEND_BACKGROUND_COLOR);
+	else
 		tegra_dc_writel(dc, 0, DC_DISP_BORDER_COLOR);
 
 	/* apply PLL and pixel clock changes */
@@ -1835,7 +1837,7 @@ static const struct host1x_client_ops dc_client_ops = {
 };
 
 static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
-	.supports_border_color = true,
+	.supports_background_color = false,
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
@@ -1845,7 +1847,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 };
 
 static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
-	.supports_border_color = true,
+	.supports_background_color = false,
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
@@ -1855,7 +1857,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 };
 
 static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
-	.supports_border_color = true,
+	.supports_background_color = false,
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
@@ -1865,7 +1867,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 };
 
 static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
-	.supports_border_color = false,
+	.supports_background_color = true,
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
@@ -1875,7 +1877,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 };
 
 static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
-	.supports_border_color = false,
+	.supports_background_color = true,
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 032c734dd470..571a6c78619f 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -26,7 +26,7 @@ struct tegra_dc_stats {
 };
 
 struct tegra_dc_soc_info {
-	bool supports_border_color;
+	bool supports_background_color;
 	bool supports_interlacing;
 	bool supports_cursor;
 	bool supports_block_linear;
@@ -447,6 +447,12 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_SD_HW_K_VALUES			0x4dd
 #define DC_DISP_SD_MAN_K_VALUES			0x4de
 
+#define DC_DISP_BLEND_BACKGROUND_COLOR		0x4e4
+#define  BACKGROUND_COLOR_ALPHA(x) (((x) & 0xff) << 24)
+#define  BACKGROUND_COLOR_BLUE(x)  (((x) & 0xff) << 16)
+#define  BACKGROUND_COLOR_GREEN(x) (((x) & 0xff) << 8)
+#define  BACKGROUND_COLOR_RED(x)   (((x) & 0xff) << 0)
+
 #define DC_DISP_INTERLACE_CONTROL		0x4e5
 #define  INTERLACE_STATUS (1 << 2)
 #define  INTERLACE_START  (1 << 1)
-- 
2.15.0
