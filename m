From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 18/27] drm/tegra: hdmi: Detect DVI-only displays
Date: Mon,  7 Oct 2013 10:34:35 +0200
Message-ID: <1381134884-5816-19-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Use EDID data to determine whether the display supports HDMI or DVI
only. The HDMI output used to assume to be connected to HDMI displays,
but that broke support for DVI displays that don't understand the
interspersed audio/other data.

To be on the safe side, default to DVI if no EDID data is available.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org: move detection to separate function]
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/hdmi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 130cb6d..3808226 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -666,6 +666,18 @@ static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,
 	}
 }
 
+static bool tegra_output_is_hdmi(struct tegra_output *output)
+{
+	struct edid *edid;
+
+	if (!output->connector.edid_blob_ptr)
+		return false;
+
+	edid = (struct edid *)output->connector.edid_blob_ptr->data;
+
+	return drm_detect_hdmi_monitor(edid);
+}
+
 static int tegra_output_hdmi_enable(struct tegra_output *output)
 {
 	unsigned int h_sync_width, h_front_porch, h_back_porch, i, rekey;
@@ -680,6 +692,8 @@ static int tegra_output_hdmi_enable(struct tegra_output *output)
 	int retries = 1000;
 	int err;
 
+	hdmi->dvi = !tegra_output_is_hdmi(output);
+
 	pclk = mode->clock * 1000;
 	h_sync_width = mode->hsync_end - mode->hsync_start;
 	h_back_porch = mode->htotal - mode->hsync_end;
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
