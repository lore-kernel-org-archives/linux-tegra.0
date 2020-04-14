From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] drm/tegra: output: rgb: Don't register connector if bridge is used
Date: Wed, 15 Apr 2020 01:20:07 +0300
Message-ID: <20200414222007.31306-3-digetx@gmail.com>
References: <20200414222007.31306-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200414222007.31306-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

We rely on the connector that is created by the bridge, and thus, the
Tegra's output connector is not needed in this case because it will be
an unused connector.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/rgb.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 4be4dfd4a68a..6e6b3fee1d87 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -275,21 +275,32 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	if (!dc->rgb)
 		return -ENODEV;
 
+	drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
+			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_helper_add(&output->encoder,
+			       &tegra_rgb_encoder_helper_funcs);
+
+	/*
+	 * We don't create a parent "output bridge" that sets the
+	 * DRM_BRIDGE_ATTACH_NO_CONNECTOR flag for drm_bridge_attach(),
+	 * and thus, the bridge creates connector for us in this case.
+	 * The output's connector is unused and not needed if bridge is
+	 * used, so skip the connector's registration in this case.
+	 */
+	if (output->bridge)
+		goto init_output;
+
 	drm_connector_init(drm, &output->connector, &tegra_rgb_connector_funcs,
 			   DRM_MODE_CONNECTOR_LVDS);
 	drm_connector_helper_add(&output->connector,
 				 &tegra_rgb_connector_helper_funcs);
 	output->connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
-	drm_encoder_helper_add(&output->encoder,
-			       &tegra_rgb_encoder_helper_funcs);
-
 	drm_connector_attach_encoder(&output->connector,
 					  &output->encoder);
 	drm_connector_register(&output->connector);
 
+init_output:
 	err = tegra_output_init(drm, output);
 	if (err < 0) {
 		dev_err(output->dev, "failed to initialize output: %d\n", err);
-- 
2.26.0
