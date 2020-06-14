From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/6] drm/panel: Set display info in panel attach
Date: Sun, 14 Jun 2020 22:03:44 +0300
Message-ID: <20200614190348.12193-3-digetx@gmail.com>
References: <20200614190348.12193-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200614190348.12193-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Devicetree systems can set panel orientation via a panel binding, but
there's no way, as is, to propagate this setting to the connector,
where the property need to be added.
To address this, this patch sets orientation, as well as other fixed
values for the panel, in the drm_panel_attach function. These values
are stored from probe in the drm_panel struct.

Signed-off-by: Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/drm_panel.c | 13 ++++++++++
 include/drm/drm_panel.h     | 50 +++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 5557c75301f1..9748972f2e7c 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -114,6 +114,19 @@ EXPORT_SYMBOL(drm_panel_remove);
  */
 int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector)
 {
+	struct drm_display_info *info;
+
+	info = &connector->display_info;
+	info->width_mm = panel->width_mm;
+	info->height_mm = panel->height_mm;
+	info->bpc = panel->bpc;
+	info->panel_orientation = panel->orientation;
+	info->bus_flags = panel->bus_flags;
+	if (panel->bus_formats)
+		drm_display_info_set_bus_formats(&connector->display_info,
+						 panel->bus_formats,
+						 panel->num_bus_formats);
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_panel_attach);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 781c735f0f9b..97ac5f12a07c 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -165,6 +165,56 @@ struct drm_panel {
 	 */
 	int connector_type;
 
+	/**
+	 * @width_mm:
+	 *
+	 * Physical width in mm.
+	 */
+	unsigned int width_mm;
+
+	/**
+	 * @height_mm:
+	 *
+	 * Physical height in mm.
+	 */
+	unsigned int height_mm;
+
+	/**
+	 * @bpc:
+	 *
+	 * Maximum bits per color channel. Used by HDMI and DP outputs.
+	 */
+	unsigned int bpc;
+
+	/**
+	 * @orientation
+	 *
+	 * Installation orientation of the panel with respect to the chassis.
+	 */
+	int orientation;
+
+	/**
+	 * @bus_formats
+	 *
+	 * Pixel data format on the wire.
+	 */
+	const u32 *bus_formats;
+
+	/**
+	 * @num_bus_formats:
+	 *
+	 * Number of elements pointed to by @bus_formats
+	 */
+	unsigned int num_bus_formats;
+
+	/**
+	 * @bus_flags:
+	 *
+	 * Additional information (like pixel signal polarity) for the pixel
+	 * data on the bus.
+	 */
+	u32 bus_flags;
+
 	/**
 	 * @list:
 	 *
-- 
2.26.0
