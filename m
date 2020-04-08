From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] drm/tegra: output: Support DRM bridges
Date: Wed,  8 Apr 2020 23:49:20 +0300
Message-ID: <20200408204920.19142-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Newer Tegra device-trees will define a video output graph which involves
a bridge. This patch adds support for the DRM bridges to the Tegra's DRM
output.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 25 ++++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index ed99b67deb29..9ca11989679c 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -16,6 +16,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fixed.h>
+#include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <uapi/drm/tegra_drm.h>
 
@@ -116,6 +117,7 @@ struct tegra_output {
 	struct device_node *of_node;
 	struct device *dev;
 
+	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
 	const struct edid *edid;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a264259b97a2..6b8fae4659b4 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -96,13 +96,28 @@ static irqreturn_t hpd_irq(int irq, void *data)
 
 int tegra_output_probe(struct tegra_output *output)
 {
-	struct device_node *ddc, *panel;
+	struct device_node *ddc, *panel, *port;
 	unsigned long flags;
 	int err, size;
 
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
+	/* newer device-trees may utilize output graph */
+	port = of_get_child_by_name(output->of_node, "port");
+	if (port) {
+		err = drm_of_find_panel_or_bridge(output->of_node, 0, 0,
+						  &output->panel,
+						  &output->bridge);
+		of_node_put(port);
+		if (err)
+			return err;
+	}
+
+	if (output->panel || output->bridge)
+		goto edid_property;
+
+	/* for older device-trees we fall back to nvidia,panel */
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
 		output->panel = of_drm_find_panel(panel);
@@ -112,6 +127,7 @@ int tegra_output_probe(struct tegra_output *output)
 		of_node_put(panel);
 	}
 
+edid_property:
 	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
 
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
@@ -189,6 +205,13 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 		err = drm_panel_attach(output->panel, &output->connector);
 		if (err < 0)
 			return err;
+	} else if (output->bridge) {
+		err = drm_bridge_attach(&output->encoder, output->bridge,
+					NULL, 0);
+		if (err) {
+			dev_err(drm->dev, "cannot connect bridge: %d\n", err);
+			return err;
+		}
 	}
 
 	/*
-- 
2.25.1
