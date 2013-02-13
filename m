From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v3 3/7] drm/tegra: Implement .mode_set_base()
Date: Wed, 13 Feb 2013 17:05:02 +0100
Message-ID: <1360771506-17849-4-git-send-email-thierry.reding@avionic-design.de>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360771506-17849-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The sequence for replacing the scanout buffer is much shorter than a
full mode change operation so implementing this callback considerably
speeds up cases where only a new framebuffer is to be scanned out.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v3:
- split DC_CMD_STATE_CONTROL writes

 drivers/gpu/drm/tegra/dc.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 8f97b1c..cc4c85e 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -114,6 +114,27 @@ static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_dc *dc)
 	return 0;
 }
 
+static int tegra_dc_set_base(struct tegra_dc *dc, int x, int y,
+			     struct tegra_framebuffer *fb)
+{
+	unsigned long value;
+
+	tegra_dc_writel(dc, WINDOW_A_SELECT, DC_CMD_DISPLAY_WINDOW_HEADER);
+
+	value = fb->base.offsets[0] + y * fb->base.pitches[0] +
+		x * fb->base.bits_per_pixel / 8;
+
+	tegra_dc_writel(dc, fb->obj->paddr + value, DC_WINBUF_START_ADDR);
+
+	value = GENERAL_UPDATE | WIN_A_UPDATE;
+	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
+
+	value = GENERAL_ACT_REQ | WIN_A_ACT_REQ;
+	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs tegra_crtc_funcs = {
 	.set_config = drm_crtc_helper_set_config,
 	.destroy = drm_crtc_cleanup,
@@ -416,6 +437,15 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
 	return 0;
 }
 
+static int tegra_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
+				    struct drm_framebuffer *old_fb)
+{
+	struct tegra_framebuffer *fb = to_tegra_fb(crtc->fb);
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+
+	return tegra_dc_set_base(dc, x, y, fb);
+}
+
 static void tegra_crtc_prepare(struct drm_crtc *crtc)
 {
 	struct tegra_dc *dc = to_tegra_dc(crtc);
@@ -495,6 +525,7 @@ static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
 	.disable = tegra_crtc_disable,
 	.mode_fixup = tegra_crtc_mode_fixup,
 	.mode_set = tegra_crtc_mode_set,
+	.mode_set_base = tegra_crtc_mode_set_base,
 	.prepare = tegra_crtc_prepare,
 	.commit = tegra_crtc_commit,
 	.load_lut = tegra_crtc_load_lut,
-- 
1.8.1.2
