From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 21/22] drm/amdgpu: Provide ddc symlink in connector sysfs
 directory
Date: Fri, 28 Jun 2019 18:01:35 +0200
Message-ID: <5e355b8bec8fb3907566a741db8cc3e356246a32.1561735433.git.andrzej.p@collabora.com>
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
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan
List-Id: linux-tegra@vger.kernel.org

Use the ddc pointer provided by the generic connector.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 70 ++++++++++++++-----
 1 file changed, 51 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 73b2ede773d3..5f8a7e3818b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -1573,11 +1573,15 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 			goto failed;
 		amdgpu_connector->con_priv = amdgpu_dig_connector;
 		if (i2c_bus->valid) {
-			amdgpu_connector->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
-			if (amdgpu_connector->ddc_bus)
+			struct amdgpu_connector *acn = amdgpu_connector;
+
+			acn->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
+			if (acn->ddc_bus) {
 				has_aux = true;
-			else
+				connector->ddc = &acn->ddc_bus->adapter;
+			} else {
 				DRM_ERROR("DP: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+			}
 		}
 		switch (connector_type) {
 		case DRM_MODE_CONNECTOR_VGA:
@@ -1662,9 +1666,13 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 			drm_connector_init(dev, &amdgpu_connector->base, &amdgpu_connector_vga_funcs, connector_type);
 			drm_connector_helper_add(&amdgpu_connector->base, &amdgpu_connector_vga_helper_funcs);
 			if (i2c_bus->valid) {
-				amdgpu_connector->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
-				if (!amdgpu_connector->ddc_bus)
+				struct amdgpu_connector *acn = amdgpu_connector;
+
+				acn->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
+				if (!acn->ddc_bus)
 					DRM_ERROR("VGA: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				else
+					connector->ddc = &acn->ddc_bus->adapter;
 			}
 			amdgpu_connector->dac_load_detect = true;
 			drm_object_attach_property(&amdgpu_connector->base.base,
@@ -1682,9 +1690,13 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 			drm_connector_init(dev, &amdgpu_connector->base, &amdgpu_connector_vga_funcs, connector_type);
 			drm_connector_helper_add(&amdgpu_connector->base, &amdgpu_connector_vga_helper_funcs);
 			if (i2c_bus->valid) {
-				amdgpu_connector->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
-				if (!amdgpu_connector->ddc_bus)
+				struct amdgpu_connector *acn = amdgpu_connector;
+
+				acn->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
+				if (!acn->ddc_bus)
 					DRM_ERROR("DVIA: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				else
+					connector->ddc = &acn->ddc_bus->adapter;
 			}
 			amdgpu_connector->dac_load_detect = true;
 			drm_object_attach_property(&amdgpu_connector->base.base,
@@ -1707,9 +1719,13 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 			drm_connector_init(dev, &amdgpu_connector->base, &amdgpu_connector_dvi_funcs, connector_type);
 			drm_connector_helper_add(&amdgpu_connector->base, &amdgpu_connector_dvi_helper_funcs);
 			if (i2c_bus->valid) {
-				amdgpu_connector->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
-				if (!amdgpu_connector->ddc_bus)
+				struct amdgpu_connector *acn = amdgpu_connector;
+
+				acn->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
+				if (!acn->ddc_bus)
 					DRM_ERROR("DVI: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				else
+					connector->ddc = &acn->ddc_bus->adapter;
 			}
 			subpixel_order = SubPixelHorizontalRGB;
 			drm_object_attach_property(&amdgpu_connector->base.base,
@@ -1757,9 +1773,13 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 			drm_connector_init(dev, &amdgpu_connector->base, &amdgpu_connector_dvi_funcs, connector_type);
 			drm_connector_helper_add(&amdgpu_connector->base, &amdgpu_connector_dvi_helper_funcs);
 			if (i2c_bus->valid) {
-				amdgpu_connector->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
-				if (!amdgpu_connector->ddc_bus)
+				struct amdgpu_connector *acn = amdgpu_connector;
+
+				acn->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
+				if (!acn->ddc_bus)
 					DRM_ERROR("HDMI: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				else
+					connector->ddc = &acn->ddc_bus->adapter;
 			}
 			drm_object_attach_property(&amdgpu_connector->base.base,
 						      adev->mode_info.coherent_mode_property,
@@ -1799,11 +1819,15 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 			drm_connector_init(dev, &amdgpu_connector->base, &amdgpu_connector_dp_funcs, connector_type);
 			drm_connector_helper_add(&amdgpu_connector->base, &amdgpu_connector_dp_helper_funcs);
 			if (i2c_bus->valid) {
-				amdgpu_connector->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
-				if (amdgpu_connector->ddc_bus)
+				struct amdgpu_connector *acn = amdgpu_connector;
+
+				acn->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
+				if (acn->ddc_bus) {
 					has_aux = true;
-				else
+					connector->ddc = &acn->ddc_bus->adapter;
+				} else {
 					DRM_ERROR("DP: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				}
 			}
 			subpixel_order = SubPixelHorizontalRGB;
 			drm_object_attach_property(&amdgpu_connector->base.base,
@@ -1841,11 +1865,15 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 			drm_connector_init(dev, &amdgpu_connector->base, &amdgpu_connector_edp_funcs, connector_type);
 			drm_connector_helper_add(&amdgpu_connector->base, &amdgpu_connector_dp_helper_funcs);
 			if (i2c_bus->valid) {
-				amdgpu_connector->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
-				if (amdgpu_connector->ddc_bus)
+				struct amdgpu_connector *acn = amdgpu_connector;
+
+				acn->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
+				if (acn->ddc_bus) {
 					has_aux = true;
-				else
+					connector->ddc = &acn->ddc_bus->adapter;
+				} else {
 					DRM_ERROR("DP: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				}
 			}
 			drm_object_attach_property(&amdgpu_connector->base.base,
 						      dev->mode_config.scaling_mode_property,
@@ -1862,9 +1890,13 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 			drm_connector_init(dev, &amdgpu_connector->base, &amdgpu_connector_lvds_funcs, connector_type);
 			drm_connector_helper_add(&amdgpu_connector->base, &amdgpu_connector_lvds_helper_funcs);
 			if (i2c_bus->valid) {
-				amdgpu_connector->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
-				if (!amdgpu_connector->ddc_bus)
+				struct amdgpu_connector *acn = amdgpu_connector;
+
+				acn->ddc_bus = amdgpu_i2c_lookup(adev, i2c_bus);
+				if (!acn->ddc_bus)
 					DRM_ERROR("LVDS: Failed to assign ddc bus! Check dmesg for i2c errors.\n");
+				else
+					connector->ddc = &acn->ddc_bus->adapter;
 			}
 			drm_object_attach_property(&amdgpu_connector->base.base,
 						      dev->mode_config.scaling_mode_property,
-- 
2.17.1
