From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 22/22] drm/radeon: Provide ddc symlink in connector sysfs
 directory
Date: Fri, 28 Jun 2019 18:01:36 +0200
Message-ID: <dd1312ee84adef0161ebeaaf3c0448b1a1371919.1561735433.git.andrzej.p@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1561735433.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <cover.1561735433.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <cover.1561735433.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>David
List-Id: linux-tegra@vger.kernel.org

Use the ddc pointer provided by the generic connector.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/gpu/drm/radeon/radeon_connectors.c | 82 +++++++++++++++++-----
 1 file changed, 63 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index c60d1a44d22a..a876e51d275a 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -1946,11 +1946,15 @@ radeon_add_atom_connector(struct drm_device *dev,
 		radeon_dig_connector->igp_lane_info = igp_lane_info;
 		radeon_connector->con_priv = radeon_dig_connector;
 		if (i2c_bus->valid) {
-			radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
-			if (radeon_connector->ddc_bus)
+			struct radeon_connector *rcn = radeon_connector;
+
+			rcn->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
+			if (rcn->ddc_bus) {
 				has_aux = true;
-			else
+				connector->ddc = &rcn->ddc_bus->adapter;
+			} else {
 				DRM_ERROR("DP: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+			}
 		}
 		switch (connector_type) {
 		case DRM_MODE_CONNECTOR_VGA:
@@ -2045,9 +2049,13 @@ radeon_add_atom_connector(struct drm_device *dev,
 			drm_connector_init(dev, &radeon_connector->base, &radeon_vga_connector_funcs, connector_type);
 			drm_connector_helper_add(&radeon_connector->base, &radeon_vga_connector_helper_funcs);
 			if (i2c_bus->valid) {
-				radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
-				if (!radeon_connector->ddc_bus)
+				struct radeon_connector *rcn = radeon_connector;
+
+				rcn->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
+				if (!rcn->ddc_bus)
 					DRM_ERROR("VGA: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				else
+					connector->ddc = &rcn->ddc_bus->adapter;
 			}
 			radeon_connector->dac_load_detect = true;
 			drm_object_attach_property(&radeon_connector->base.base,
@@ -2070,9 +2078,13 @@ radeon_add_atom_connector(struct drm_device *dev,
 			drm_connector_init(dev, &radeon_connector->base, &radeon_vga_connector_funcs, connector_type);
 			drm_connector_helper_add(&radeon_connector->base, &radeon_vga_connector_helper_funcs);
 			if (i2c_bus->valid) {
-				radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
-				if (!radeon_connector->ddc_bus)
+				struct radeon_connector *rcn = radeon_connector;
+
+				rcn->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
+				if (!rcn->ddc_bus)
 					DRM_ERROR("DVIA: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				else
+					connector->ddc = &rcn->ddc_bus->adapter;
 			}
 			radeon_connector->dac_load_detect = true;
 			drm_object_attach_property(&radeon_connector->base.base,
@@ -2101,9 +2113,13 @@ radeon_add_atom_connector(struct drm_device *dev,
 			drm_connector_init(dev, &radeon_connector->base, &radeon_dvi_connector_funcs, connector_type);
 			drm_connector_helper_add(&radeon_connector->base, &radeon_dvi_connector_helper_funcs);
 			if (i2c_bus->valid) {
-				radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
-				if (!radeon_connector->ddc_bus)
+				struct radeon_connector *rcn = radeon_connector;
+
+				rcn->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
+				if (!rcn->ddc_bus)
 					DRM_ERROR("DVI: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				else
+					connector->ddc = &rcn->ddc_bus->adapter;
 			}
 			subpixel_order = SubPixelHorizontalRGB;
 			drm_object_attach_property(&radeon_connector->base.base,
@@ -2158,9 +2174,13 @@ radeon_add_atom_connector(struct drm_device *dev,
 			drm_connector_init(dev, &radeon_connector->base, &radeon_dvi_connector_funcs, connector_type);
 			drm_connector_helper_add(&radeon_connector->base, &radeon_dvi_connector_helper_funcs);
 			if (i2c_bus->valid) {
-				radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
-				if (!radeon_connector->ddc_bus)
+				struct radeon_connector *rcn = radeon_connector;
+
+				rcn->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
+				if (!rcn->ddc_bus)
 					DRM_ERROR("HDMI: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				else
+					connector->ddc = &rcn->ddc_bus->adapter;
 			}
 			drm_object_attach_property(&radeon_connector->base.base,
 						      rdev->mode_info.coherent_mode_property,
@@ -2208,11 +2228,15 @@ radeon_add_atom_connector(struct drm_device *dev,
 			drm_connector_init(dev, &radeon_connector->base, &radeon_dp_connector_funcs, connector_type);
 			drm_connector_helper_add(&radeon_connector->base, &radeon_dp_connector_helper_funcs);
 			if (i2c_bus->valid) {
-				radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
-				if (radeon_connector->ddc_bus)
+				struct radeon_connector *rcn = radeon_connector;
+
+				rcn->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
+				if (rcn->ddc_bus) {
 					has_aux = true;
-				else
+					connector->ddc = &rcn->ddc_bus->adapter;
+				} else {
 					DRM_ERROR("DP: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				}
 			}
 			subpixel_order = SubPixelHorizontalRGB;
 			drm_object_attach_property(&radeon_connector->base.base,
@@ -2258,11 +2282,15 @@ radeon_add_atom_connector(struct drm_device *dev,
 			drm_connector_init(dev, &radeon_connector->base, &radeon_edp_connector_funcs, connector_type);
 			drm_connector_helper_add(&radeon_connector->base, &radeon_dp_connector_helper_funcs);
 			if (i2c_bus->valid) {
-				radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
-				if (radeon_connector->ddc_bus)
+				struct radeon_connector *rcn = radeon_connector;
+
+				rcn->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
+				if (rcn->ddc_bus) {
 					has_aux = true;
-				else
+					connector->ddc = &rcn->ddc_bus->adapter;
+				} else {
 					DRM_ERROR("DP: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				}
 			}
 			drm_object_attach_property(&radeon_connector->base.base,
 						      dev->mode_config.scaling_mode_property,
@@ -2297,9 +2325,13 @@ radeon_add_atom_connector(struct drm_device *dev,
 			drm_connector_init(dev, &radeon_connector->base, &radeon_lvds_connector_funcs, connector_type);
 			drm_connector_helper_add(&radeon_connector->base, &radeon_lvds_connector_helper_funcs);
 			if (i2c_bus->valid) {
-				radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
-				if (!radeon_connector->ddc_bus)
+				struct radeon_connector *rcn = radeon_connector;
+
+				rcn->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
+				if (!rcn->ddc_bus)
 					DRM_ERROR("LVDS: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				else
+					connector->ddc = &rcn->ddc_bus->adapter;
 			}
 			drm_object_attach_property(&radeon_connector->base.base,
 						      dev->mode_config.scaling_mode_property,
@@ -2384,6 +2416,9 @@ radeon_add_legacy_connector(struct drm_device *dev,
 			radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
 			if (!radeon_connector->ddc_bus)
 				DRM_ERROR("VGA: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+			else
+				connector->ddc =
+					&radeon_connector->ddc_bus->adapter;
 		}
 		radeon_connector->dac_load_detect = true;
 		drm_object_attach_property(&radeon_connector->base.base,
@@ -2401,6 +2436,9 @@ radeon_add_legacy_connector(struct drm_device *dev,
 			radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
 			if (!radeon_connector->ddc_bus)
 				DRM_ERROR("DVIA: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+			else
+				connector->ddc =
+					&radeon_connector->ddc_bus->adapter;
 		}
 		radeon_connector->dac_load_detect = true;
 		drm_object_attach_property(&radeon_connector->base.base,
@@ -2419,6 +2457,9 @@ radeon_add_legacy_connector(struct drm_device *dev,
 			radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
 			if (!radeon_connector->ddc_bus)
 				DRM_ERROR("DVI: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+			else
+				connector->ddc =
+					&radeon_connector->ddc_bus->adapter;
 		}
 		if (connector_type == DRM_MODE_CONNECTOR_DVII) {
 			radeon_connector->dac_load_detect = true;
@@ -2464,6 +2505,9 @@ radeon_add_legacy_connector(struct drm_device *dev,
 			radeon_connector->ddc_bus = radeon_i2c_lookup(rdev, i2c_bus);
 			if (!radeon_connector->ddc_bus)
 				DRM_ERROR("LVDS: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+			else
+				connector->ddc =
+					&radeon_connector->ddc_bus->adapter;
 		}
 		drm_object_attach_property(&radeon_connector->base.base,
 					      dev->mode_config.scaling_mode_property,
-- 
2.17.1
