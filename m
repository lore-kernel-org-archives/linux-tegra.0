From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/2] drm/panel-simple: Add missing BUS descriptions for some panels
Date: Mon, 22 Jun 2020 01:27:42 +0300
Message-ID: <20200621222742.25695-3-digetx@gmail.com>
References: <20200621222742.25695-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200621222742.25695-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch adds missing BUS fields to the display panel descriptions of
the panels which are found on NVIDIA Tegra devices:

  1. AUO B101AW03
  2. Chunghwa CLAA070WP03XG
  3. Chunghwa CLAA101WA01A
  4. Chunghwa CLAA101WB01
  5. Innolux N156BGE L21
  6. Samsung LTN101NT05

Suggested-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 87edd2bdf09a..986df9937650 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -698,6 +698,8 @@ static const struct panel_desc auo_b101aw03 = {
 		.width = 223,
 		.height = 125,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
@@ -1352,6 +1354,8 @@ static const struct panel_desc chunghwa_claa070wp03xg = {
 		.width = 94,
 		.height = 150,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
@@ -1375,6 +1379,8 @@ static const struct panel_desc chunghwa_claa101wa01a = {
 		.width = 220,
 		.height = 120,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
@@ -1398,6 +1404,8 @@ static const struct panel_desc chunghwa_claa101wb01 = {
 		.width = 223,
 		.height = 125,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
@@ -2071,6 +2079,8 @@ static const struct panel_desc innolux_n156bge_l21 = {
 		.width = 344,
 		.height = 193,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
@@ -3018,6 +3028,8 @@ static const struct panel_desc samsung_ltn101nt05 = {
 		.width = 223,
 		.height = 125,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-- 
2.26.0
