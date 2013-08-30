From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 3/3] drm/tegra: Implement panel support
Date: Fri, 30 Aug 2013 17:25:21 +0200
Message-ID: <1377876321-26835-4-git-send-email-treding@nvidia.com>
References: <1377876321-26835-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377876321-26835-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Use the DRM panel framework to attach a panel to an output.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/Kconfig  |  1 +
 drivers/gpu/host1x/drm/drm.h    |  1 +
 drivers/gpu/host1x/drm/output.c | 28 ++++++++++++++++++++++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/drm/Kconfig b/drivers/gpu/host1x/drm/Kconfig
index 69853a4..01b036d 100644
--- a/drivers/gpu/host1x/drm/Kconfig
+++ b/drivers/gpu/host1x/drm/Kconfig
@@ -2,6 +2,7 @@ config DRM_TEGRA
 	bool "NVIDIA Tegra DRM"
 	depends on DRM
 	select DRM_KMS_HELPER
+	select DRM_PANEL
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/host1x/drm/drm.h
index 02ce020..a30276c 100644
--- a/drivers/gpu/host1x/drm/drm.h
+++ b/drivers/gpu/host1x/drm/drm.h
@@ -195,6 +195,7 @@ struct tegra_output {
 	const struct tegra_output_ops *ops;
 	enum tegra_output_type type;
 
+	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
 	const struct edid *edid;
 	unsigned int hpd_irq;
diff --git a/drivers/gpu/host1x/drm/output.c b/drivers/gpu/host1x/drm/output.c
index 137ae81..2ce03c1 100644
--- a/drivers/gpu/host1x/drm/output.c
+++ b/drivers/gpu/host1x/drm/output.c
@@ -11,6 +11,7 @@
 #include <linux/of_gpio.h>
 #include <linux/i2c.h>
 
+#include <drm/drm_panel.h>
 #include "drm.h"
 
 static int tegra_connector_get_modes(struct drm_connector *connector)
@@ -19,6 +20,9 @@ static int tegra_connector_get_modes(struct drm_connector *connector)
 	struct edid *edid = NULL;
 	int err = 0;
 
+	if (output->panel)
+		return output->panel->funcs->get_modes(output->panel);
+
 	if (output->edid)
 		edid = kmemdup(output->edid, sizeof(*edid), GFP_KERNEL);
 	else if (output->ddc)
@@ -74,6 +78,9 @@ tegra_connector_detect(struct drm_connector *connector, bool force)
 		else
 			status = connector_status_connected;
 	} else {
+		if (output->panel)
+			status = connector_status_connected;
+
 		if (connector->connector_type == DRM_MODE_CONNECTOR_LVDS)
 			status = connector_status_connected;
 	}
@@ -105,6 +112,11 @@ static const struct drm_encoder_funcs encoder_funcs = {
 
 static void tegra_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
+	struct tegra_output *output = encoder_to_output(encoder);
+	struct drm_panel *panel = output->panel;
+
+	if (panel && panel->funcs && panel->funcs->dpms)
+		panel->funcs->dpms(panel, mode);
 }
 
 static bool tegra_encoder_mode_fixup(struct drm_encoder *encoder,
@@ -153,14 +165,23 @@ static irqreturn_t hpd_irq(int irq, void *data)
 
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
@@ -175,7 +196,7 @@ int tegra_output_parse_dt(struct tegra_output *output)
 		of_node_put(ddc);
 	}
 
-	if (!output->edid && !output->ddc)
+	if (!output->panel && !output->edid && !output->ddc)
 		return -ENODEV;
 
 	output->hpd_gpio = of_get_named_gpio_flags(output->of_node,
@@ -242,6 +263,9 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 			   connector);
 	drm_connector_helper_add(&output->connector, &connector_helper_funcs);
 
+	if (output->panel)
+		drm_panel_attach(output->panel, &output->connector);
+
 	drm_encoder_init(drm, &output->encoder, &encoder_funcs, encoder);
 	drm_encoder_helper_add(&output->encoder, &encoder_helper_funcs);
 
-- 
1.8.4
