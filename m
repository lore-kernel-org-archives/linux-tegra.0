From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] drm/tegra: Obtain head number from DT
Date: Mon, 13 Jan 2014 15:21:34 +0100
Message-ID: <1389622894-9574-3-git-send-email-treding@nvidia.com>
References: <1389622894-9574-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389622894-9574-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The head number of a given display controller is fixed in hardware and
required to program outputs appropriately. Relying on the driver probe
order to determine this number will not work, since that could yield a
situation where the second head was probed first and would be assigned
head number 0 instead of 1.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/gpu/nvidia,tegra20-host1x.txt           |  3 +++
 drivers/gpu/drm/tegra/dc.c                           | 20 ++++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

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
index 386f3b4b0094..ce0d2c2c7aac 100644
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
@@ -1160,6 +1158,20 @@ static const struct host1x_client_ops dc_client_ops = {
 	.exit = tegra_dc_exit,
 };
 
+static int tegra_dc_parse_dt(struct tegra_dc *dc)
+{
+	u32 value;
+	int err;
+
+	err = of_property_read_u32(dc->dev->of_node, "nvidia,head", &value);
+	if (err < 0)
+		return err;
+
+	dc->pipe = value;
+
+	return 0;
+}
+
 static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.supports_interlacing = false,
 };
@@ -1207,6 +1219,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
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
