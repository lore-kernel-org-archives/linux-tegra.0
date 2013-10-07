From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 19/27] host1x: hdmi: Enable VDD earlier for hotplug/DDC
Date: Mon,  7 Oct 2013 10:34:36 +0200
Message-ID: <1381134884-5816-20-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The VDD regulator used to be enabled only at tegra_output_hdmi_enable,
which is called after a sink is detected. However, the HDMI hotplug pin
works by returning the voltage supplied by the VDD pin, so this meant
that the hotplug pin was never asserted and the sink was not detected
unless the VDD regulator was set to be always on.

This patch moves the enable to the tegra_hdmi_init() function to make
sure the regulator will get enabled and therefore ensure proper hotplug
detection.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/hdmi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 3808226..9bd912c 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -699,12 +699,6 @@ static int tegra_output_hdmi_enable(struct tegra_output *output)
 	h_back_porch = mode->htotal - mode->hsync_end;
 	h_front_porch = mode->hsync_start - mode->hdisplay;
 
-	err = regulator_enable(hdmi->vdd);
-	if (err < 0) {
-		dev_err(hdmi->dev, "failed to enable VDD regulator: %d\n", err);
-		return err;
-	}
-
 	err = regulator_enable(hdmi->pll);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable PLL regulator: %d\n", err);
@@ -926,7 +920,6 @@ static int tegra_output_hdmi_disable(struct tegra_output *output)
 	tegra_periph_reset_assert(hdmi->clk);
 	clk_disable(hdmi->clk);
 	regulator_disable(hdmi->pll);
-	regulator_disable(hdmi->vdd);
 
 	return 0;
 }
@@ -1231,6 +1224,13 @@ static int tegra_hdmi_init(struct host1x_client *client)
 	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
 	int err;
 
+	err = regulator_enable(hdmi->vdd);
+	if (err < 0) {
+		dev_err(client->dev, "failed to enable VDD regulator: %d\n",
+			err);
+		return err;
+	}
+
 	hdmi->output.type = TEGRA_OUTPUT_HDMI;
 	hdmi->output.dev = client->dev;
 	hdmi->output.ops = &hdmi_ops;
@@ -1274,6 +1274,8 @@ static int tegra_hdmi_exit(struct host1x_client *client)
 		return err;
 	}
 
+	regulator_disable(hdmi->vdd);
+
 	return 0;
 }
 
-- 
1.8.4
