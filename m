From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 3/6] host1x: hdmi: Enable Vdd earlier for hotplug/DDC
Date: Wed, 28 Aug 2013 18:48:39 +0300
Message-ID: <1377704922-2824-4-git-send-email-mperttunen@nvidia.com>
References: <1377704922-2824-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377704922-2824-1-git-send-email-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: tbergstrom@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Vdd regulator used to be enabled only at tegra_output_hdmi_enable,
which is called after a sink is detected. However, the HDMI hotplug pin
works by returning the voltage supplied by the Vdd pin, so this meant
that the hotplug pin was never asserted and the sink was not detected
unless the Vdd regulator was set to be always on.

This patch moves the enable to the tegra_hdmi_drm_init function to make
sure the regulator will get enabled.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/drm/hdmi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
index 140339b..96a6ae1 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -716,12 +716,6 @@ static int tegra_output_hdmi_enable(struct tegra_output *output)
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
@@ -943,7 +937,6 @@ static int tegra_output_hdmi_disable(struct tegra_output *output)
 	tegra_periph_reset_assert(hdmi->clk);
 	clk_disable(hdmi->clk);
 	regulator_disable(hdmi->pll);
-	regulator_disable(hdmi->vdd);
 
 	return 0;
 }
@@ -1240,6 +1233,12 @@ static int tegra_hdmi_drm_init(struct host1x_client *client,
 	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
 	int err;
 
+	err = regulator_enable(hdmi->vdd);
+	if (err < 0) {
+		dev_err(client->dev, "vdd regulator enable failed: %d\n", err);
+		return err;
+	}
+
 	hdmi->output.type = TEGRA_OUTPUT_HDMI;
 	hdmi->output.dev = client->dev;
 	hdmi->output.ops = &hdmi_ops;
@@ -1283,6 +1282,8 @@ static int tegra_hdmi_drm_exit(struct host1x_client *client)
 		return err;
 	}
 
+	regulator_disable(hdmi->vdd);
+
 	return 0;
 }
 
-- 
1.8.1.5
