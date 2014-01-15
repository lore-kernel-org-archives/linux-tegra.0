From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: Obtain head number from DT
Date: Wed, 15 Jan 2014 16:18:02 +0100
Message-ID: <1389799082-12897-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The head number of a given display controller is fixed in hardware and
required to program outputs appropriately. Relying on the driver probe
order to determine this number will not work, since that could yield a
situation where the second head was probed first and would be assigned
head number 0 instead of 1.

By explicitly specifying the head number in the device tree, it is no
longer necessary to rely on these assumptions. As a fallback, if the
property isn't available, derive the head number from the display
controller node's position in the device tree. That's somewhat more
reliable than the previous default but not a proper solution.

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- if the nvidia,head property isn't present, find the position of the
  display controller within the DT and derive the head number from it

 .../bindings/gpu/nvidia,tegra20-host1x.txt         |  3 ++
 drivers/gpu/drm/tegra/dc.c                         | 41 ++++++++++++++++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
index 9e9008f8fa32..efaeec8961b6 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
@@ -118,6 +118,9 @@ of the following host1x client modules:
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
     - dc
+  - nvidia,head: The number of the display controller head. This is used to
+    setup the various types of output to receive video data from the given
+    head.
 
   Each display controller node has a child node, named "rgb", that represents
   the RGB output associated with the controller. It can take the following
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 386f3b4b0094..9336006b475d 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1100,8 +1100,6 @@ static int tegra_dc_init(struct host1x_client *client)
 	struct tegra_dc *dc = host1x_client_to_dc(client);
 	int err;
 
-	dc->pipe = tegra->drm->mode_config.num_crtc;
-
 	drm_crtc_init(tegra->drm, &dc->base, &tegra_crtc_funcs);
 	drm_mode_crtc_set_gamma_size(&dc->base, 256);
 	drm_crtc_helper_add(&dc->base, &tegra_crtc_helper_funcs);
@@ -1187,6 +1185,41 @@ static const struct of_device_id tegra_dc_of_match[] = {
 	}
 };
 
+static int tegra_dc_parse_dt(struct tegra_dc *dc)
+{
+	struct device_node *np;
+	u32 value = 0;
+	int err;
+
+	err = of_property_read_u32(dc->dev->of_node, "nvidia,head", &value);
+	if (err < 0) {
+		dev_err(dc->dev, "missing \"nvidia,head\" property\n");
+
+		/*
+		 * If the nvidia,head property isn't present, try to find the
+		 * correct head number by looking up the position of this
+		 * display controller's node within the device tree. Assuming
+		 * that the nodes are ordered properly in the DTS file and
+		 * that the translation into a flattened device tree blob
+		 * preserves that ordering this will actually yield the right
+		 * head number.
+		 *
+		 * If those assumptions don't hold, this will still work for
+		 * cases where only a single display controller is used.
+		 */
+		for_each_matching_node(np, tegra_dc_of_match) {
+			if (np == dc->dev->of_node)
+				break;
+
+			value++;
+		}
+	}
+
+	dc->pipe = value;
+
+	return 0;
+}
+
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
@@ -1207,6 +1240,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	dc->dev = &pdev->dev;
 	dc->soc = id->data;
 
+	err = tegra_dc_parse_dt(dc);
+	if (err < 0)
+		return err;
+
 	dc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(dc->clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
-- 
1.8.4.2
