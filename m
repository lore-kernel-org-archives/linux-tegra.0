From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: rgb: Use atomic DPMS helpers
Date: Mon, 18 May 2015 20:06:41 +0300
Message-ID: <1431968804-17182-1-git-send-email-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Panel DPMS got broken after adding support for atomic modesetting.
Fix it by making RGB output use of generic atomic DPMS helpers.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/rgb.c | 49 ++++++++++++++++-----------------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 7cd833f..46cbaf2 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -88,13 +88,8 @@ static void tegra_dc_write_regs(struct tegra_dc *dc,
 		tegra_dc_writel(dc, table[i].value, table[i].offset);
 }
 
-static void tegra_rgb_connector_dpms(struct drm_connector *connector,
-				     int mode)
-{
-}
-
 static const struct drm_connector_funcs tegra_rgb_connector_funcs = {
-	.dpms = tegra_rgb_connector_dpms,
+	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.detect = tegra_output_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -125,21 +120,28 @@ static const struct drm_encoder_funcs tegra_rgb_encoder_funcs = {
 	.destroy = tegra_output_encoder_destroy,
 };
 
-static void tegra_rgb_encoder_dpms(struct drm_encoder *encoder, int mode)
+static void tegra_rgb_encoder_mode_set(struct drm_encoder *encoder,
+				       struct drm_display_mode *mode,
+				       struct drm_display_mode *adjusted)
 {
 }
 
-static void tegra_rgb_encoder_prepare(struct drm_encoder *encoder)
+static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
 {
-}
+	struct tegra_output *output = encoder_to_output(encoder);
+	struct tegra_rgb *rgb = to_rgb(output);
 
-static void tegra_rgb_encoder_commit(struct drm_encoder *encoder)
-{
+	if (output->panel)
+		drm_panel_disable(output->panel);
+
+	tegra_dc_write_regs(rgb->dc, rgb_disable, ARRAY_SIZE(rgb_disable));
+	tegra_dc_commit(rgb->dc);
+
+	if (output->panel)
+		drm_panel_unprepare(output->panel);
 }
 
-static void tegra_rgb_encoder_mode_set(struct drm_encoder *encoder,
-				       struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted)
+static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
@@ -174,21 +176,6 @@ static void tegra_rgb_encoder_mode_set(struct drm_encoder *encoder,
 		drm_panel_enable(output->panel);
 }
 
-static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
-{
-	struct tegra_output *output = encoder_to_output(encoder);
-	struct tegra_rgb *rgb = to_rgb(output);
-
-	if (output->panel)
-		drm_panel_disable(output->panel);
-
-	tegra_dc_write_regs(rgb->dc, rgb_disable, ARRAY_SIZE(rgb_disable));
-	tegra_dc_commit(rgb->dc);
-
-	if (output->panel)
-		drm_panel_unprepare(output->panel);
-}
-
 static int
 tegra_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_crtc_state *crtc_state,
@@ -231,11 +218,9 @@ tegra_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
-	.dpms = tegra_rgb_encoder_dpms,
-	.prepare = tegra_rgb_encoder_prepare,
-	.commit = tegra_rgb_encoder_commit,
 	.mode_set = tegra_rgb_encoder_mode_set,
 	.disable = tegra_rgb_encoder_disable,
+	.enable = tegra_rgb_encoder_enable,
 	.atomic_check = tegra_rgb_encoder_atomic_check,
 };
 
-- 
2.4.0
