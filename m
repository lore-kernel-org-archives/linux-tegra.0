From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v11 2/4] drm/panel: Read panel orientation for BOE TV101WUM-NL6
Date: Thu, 18 Jun 2020 02:18:40 +0300
Message-ID: <20200617231842.30671-3-digetx@gmail.com>
References: <20200617231842.30671-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200617231842.30671-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Emil Velikov <emil.l.velikov@gmail.com>, Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Derek Basehore <dbasehore@chromium.org>

This reads the DT setting for the panel rotation to set the panel
orientation in the get_modes callback.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Derek Basehore <dbasehore@chromium.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index db5b866357f2..4bd9397972e8 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -11,6 +11,7 @@
 #include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
@@ -43,6 +44,7 @@ struct boe_panel {
 
 	const struct panel_desc *desc;
 
+	enum drm_panel_orientation orientation;
 	struct regulator *pp1800;
 	struct regulator *avee;
 	struct regulator *avdd;
@@ -740,6 +742,7 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = boe->desc->size.width_mm;
 	connector->display_info.height_mm = boe->desc->size.height_mm;
 	connector->display_info.bpc = boe->desc->bpc;
+	drm_connector_set_panel_orientation(connector, boe->orientation);
 
 	return 1;
 }
@@ -779,6 +782,9 @@ static int boe_panel_add(struct boe_panel *boe)
 
 	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	err = of_drm_get_panel_orientation(dev->of_node, &boe->orientation);
+	if (err < 0)
+		return err;
 
 	err = drm_panel_of_backlight(&boe->base);
 	if (err)
-- 
2.26.0
