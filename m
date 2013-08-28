From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 2/6] host1x: hdmi: Detect whether display is connected with HDMI or DVI
Date: Wed, 28 Aug 2013 18:48:38 +0300
Message-ID: <1377704922-2824-3-git-send-email-mperttunen@nvidia.com>
References: <1377704922-2824-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377704922-2824-1-git-send-email-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: tbergstrom@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use EDID data to determine whether the display supports HDMI or just DVI.
This used to be hardcoded to be HDMI, which broke support for DVI displays
that couldn't understand the interspersed audio/other data.

If the EDID data isn't available, default to DVI, which should be a safer
choice.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
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
