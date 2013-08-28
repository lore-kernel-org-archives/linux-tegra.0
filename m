From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/5] host1x: hdmi: Detect whether display is connected with HDMI or DVI
Date: Wed, 28 Aug 2013 13:40:56 +0300
Message-ID: <1377686459-16634-3-git-send-email-mperttunen@nvidia.com>
References: <1377686459-16634-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377686459-16634-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use EDID data to determine whether the display supports HDMI or just DVI.
This used to be hardcoded to be HDMI, which broke support for DVI displays
that couldn't understand the interspersed audio/other data.

If the EDID data isn't available, default to DVI, which should be a safer
choice.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/hdmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
index d81fac8..140339b 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -702,6 +702,14 @@ static int tegra_output_hdmi_enable(struct tegra_output *output)
 	unsigned long value;
 	int retries = 1000;
 	int err;
+	struct drm_property_blob *edid_blob = output->connector.edid_blob_ptr;
+
+	if (edid_blob && edid_blob->data &&
+		drm_detect_hdmi_monitor((struct edid *)edid_blob->data)) {
+		hdmi->dvi = false;
+	} else {
+		hdmi->dvi = true;
+	}
 
 	pclk = mode->clock * 1000;
 	h_sync_width = mode->hsync_end - mode->hsync_start;
-- 
1.8.1.5
