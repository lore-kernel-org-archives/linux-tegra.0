From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 06/12] drm: panel: Parse "te-polarity" in Sharp lq101r1sx01 driver
Date: Mon, 11 May 2015 09:38:25 +0800
Message-ID: <1431308311-4470-7-git-send-email-markz@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431308311-4470-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index b69f88cd15b2..654575607864 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -27,6 +27,7 @@ struct sharp_panel {
 
 	struct backlight_device *backlight;
 	struct regulator *supply;
+	u32 te_polarity;
 
 	bool prepared;
 	bool enabled;
@@ -280,7 +281,7 @@ static int sharp_panel_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static const struct drm_display_mode default_mode = {
+static struct drm_display_mode default_mode = {
 	.clock = 278000,
 	.hdisplay = 2560,
 	.hsync_start = 2560 + 128,
@@ -297,6 +298,12 @@ static const struct drm_display_mode default_mode = {
 static int sharp_panel_get_modes(struct drm_panel *panel)
 {
 	struct drm_display_mode *mode;
+	struct sharp_panel *sharp = to_sharp_panel(panel);
+
+	if (sharp->te_polarity)
+		default_mode.flags |= DRM_MODE_FLAG_TE_POLARITY_HIGH;
+	else
+		default_mode.flags |= DRM_MODE_FLAG_TE_POLARITY_LOW;
 
 	mode = drm_mode_duplicate(panel->drm, &default_mode);
 	if (!mode) {
@@ -341,6 +348,14 @@ static int sharp_panel_add(struct sharp_panel *sharp)
 	if (IS_ERR(sharp->supply))
 		return PTR_ERR(sharp->supply);
 
+	err = of_property_read_u32(sharp->link1->dev.of_node,
+					"te-polarity", &sharp->te_polarity);
+	if (err < 0) {
+		dev_err(&sharp->link1->dev,
+			"Read te-polarity failed: %d\n", err);
+		return err;
+	}
+
 	np = of_parse_phandle(sharp->link1->dev.of_node, "backlight", 0);
 	if (np) {
 		sharp->backlight = of_find_backlight_by_node(np);
-- 
2.1.4
