From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 23/27] drm/tegra: Implement panel support
Date: Mon,  7 Oct 2013 10:34:40 +0200
Message-ID: <1381134884-5816-24-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Use the DRM panel framework to attach a panel to an output.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/Kconfig  |  1 +
 drivers/gpu/drm/tegra/drm.h    |  1 +
 drivers/gpu/drm/tegra/output.c | 32 ++++++++++++++++++++++++++++++--
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 7759eea..d1dde2b 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -2,6 +2,7 @@ config DRM_TEGRA
 	bool "NVIDIA Tegra DRM"
 	depends on DRM
 	select DRM_KMS_HELPER
+	select DRM_PANEL
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 25522e2..a8ba13c 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -176,6 +176,7 @@ struct tegra_output {
 	const struct tegra_output_ops *ops;
 	enum tegra_output_type type;
 
+	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
 	const struct edid *edid;
 	unsigned int hpd_irq;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 8f40fa6..be6ef34 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -9,6 +9,7 @@
 
 #include <linux/of_gpio.h>
 
+#include <drm/drm_panel.h>
 #include "drm.h"
 
 static int tegra_connector_get_modes(struct drm_connector *connector)
@@ -17,6 +18,9 @@ static int tegra_connector_get_modes(struct drm_connector *connector)
 	struct edid *edid = NULL;
 	int err = 0;
 
+	if (output->panel)
+		return output->panel->funcs->get_modes(output->panel);
+
 	if (output->edid)
 		edid = kmemdup(output->edid, sizeof(*edid), GFP_KERNEL);
 	else if (output->ddc)
@@ -72,6 +76,9 @@ tegra_connector_detect(struct drm_connector *connector, bool force)
 		else
 			status = connector_status_connected;
 	} else {
+		if (output->panel)
+			status = connector_status_connected;
+
 		if (connector->connector_type == DRM_MODE_CONNECTOR_LVDS)
 			status = connector_status_connected;
 	}
@@ -103,6 +110,15 @@ static const struct drm_encoder_funcs encoder_funcs = {
 
 static void tegra_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
+	struct tegra_output *output = encoder_to_output(encoder);
+	struct drm_panel *panel = output->panel;
+
+	if (panel && panel->funcs) {
+		if (mode != DRM_MODE_DPMS_ON)
+			drm_panel_disable(panel);
+		else
+			drm_panel_enable(panel);
+	}
 }
 
 static bool tegra_encoder_mode_fixup(struct drm_encoder *encoder,
@@ -151,14 +167,23 @@ static irqreturn_t hpd_irq(int irq, void *data)
 
 int tegra_output_parse_dt(struct tegra_output *output)
 {
+	struct device_node *ddc, *panel;
 	enum of_gpio_flags flags;
-	struct device_node *ddc;
 	size_t size;
 	int err;
 
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
+	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
+	if (panel) {
+		output->panel = of_drm_find_panel(panel);
+		if (!output->panel)
+			return -EPROBE_DEFER;
+
+		of_node_put(panel);
+	}
+
 	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
 
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
@@ -173,7 +198,7 @@ int tegra_output_parse_dt(struct tegra_output *output)
 		of_node_put(ddc);
 	}
 
-	if (!output->edid && !output->ddc)
+	if (!output->panel && !output->edid && !output->ddc)
 		return -ENODEV;
 
 	output->hpd_gpio = of_get_named_gpio_flags(output->of_node,
@@ -240,6 +265,9 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 			   connector);
 	drm_connector_helper_add(&output->connector, &connector_helper_funcs);
 
+	if (output->panel)
+		drm_panel_attach(output->panel, &output->connector);
+
 	drm_encoder_init(drm, &output->encoder, &encoder_funcs, encoder);
 	drm_encoder_helper_add(&output->encoder, &encoder_helper_funcs);
 
-- 
1.8.4
