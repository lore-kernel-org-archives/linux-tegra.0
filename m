From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder bridge
Date: Thu, 16 Apr 2020 20:24:05 +0300
Message-ID: <20200416172405.5051-3-digetx@gmail.com>
References: <20200416172405.5051-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200416172405.5051-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Newer Tegra device-trees will specify a video output graph that involves
LVDS encoder bridge, This patch adds support for the LVDS encoder bridge
to the RGB output, allowing us to model display hardware properly.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 10 ++++++++++
 drivers/gpu/drm/tegra/rgb.c    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 804869799305..cccd368b6752 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -12,6 +12,7 @@
 #include <linux/of_gpio.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
@@ -116,6 +117,7 @@ struct tegra_output {
 	struct device_node *of_node;
 	struct device *dev;
 
+	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
 	const struct edid *edid;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a6a711d54e88..37fc6b8c173f 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -180,6 +180,16 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 	int connector_type;
 	int err;
 
+	if (output->bridge) {
+		err = drm_bridge_attach(&output->encoder, output->bridge,
+					NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (err) {
+			dev_err(output->dev, "cannot connect bridge: %d\n",
+				err);
+			return err;
+		}
+	}
+
 	if (output->panel) {
 		err = drm_panel_attach(output->panel, &output->connector);
 		if (err < 0)
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 0562a7eb793f..0df213e92664 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_panel.h>
@@ -210,6 +211,7 @@ static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 
 int tegra_dc_rgb_probe(struct tegra_dc *dc)
 {
+	const unsigned int encoder_port = 0, panel_port = 1;
 	struct device_node *np;
 	struct tegra_rgb *rgb;
 	int err;
@@ -226,6 +228,38 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	rgb->output.of_node = np;
 	rgb->dc = dc;
 
+	/*
+	 * Tegra devices that have LVDS panel utilize LVDS-encoder bridge
+	 * for converting 24/18 RGB data-lanes into 8 lanes. Encoder usually
+	 * have a powerdown control which needs to be enabled in order to
+	 * transfer data to the panel. Historically devices that use an older
+	 * device-tree version didn't model the bridge, assuming that encoder
+	 * is turned ON by default, while today's DRM allows us to model LVDS
+	 * encoder properly.
+	 *
+	 * Newer device-trees may utilize output->encoder->panel graph.
+	 *
+	 * For older device-trees we fall back to use nvidia,panel phandle.
+	 */
+	np = of_graph_get_remote_node(rgb->output.of_node, encoder_port, -1);
+	if (np) {
+		rgb->output.bridge = of_drm_find_bridge(np);
+		of_node_put(np);
+
+		if (!rgb->output.bridge)
+			return -EPROBE_DEFER;
+
+		np = of_graph_get_remote_node(rgb->output.bridge->of_node,
+					      panel_port, -1);
+		if (np) {
+			rgb->output.panel = of_drm_find_panel(np);
+			of_node_put(np);
+
+			if (IS_ERR(rgb->output.panel))
+				return PTR_ERR(rgb->output.panel);
+		}
+	}
+
 	err = tegra_output_probe(&rgb->output);
 	if (err < 0)
 		return err;
-- 
2.26.0
