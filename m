From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2 2/2] drm: tegra: check HDMI sink capability
Date: Wed, 16 Jan 2013 15:36:42 +0100
Message-ID: <1358347002-10999-2-git-send-email-dev@lynxeye.de>
References: <1358347002-10999-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358347002-10999-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Check if sink is HDMI capable when enabling an output. This disables
HDMI audio/infoframes if we are talking to a plain DVI sink. All things
except this check are already in place.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/tegra/hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e060c7e..3405313 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -660,6 +660,9 @@ static int tegra_output_hdmi_enable(struct tegra_output *output)
 	usleep_range(1000, 2000);
 	tegra_periph_reset_deassert(hdmi->clk);
 
+	/* if the connected sink is not HDMI capable fall back to plain DVI */
+	hdmi->dvi = !drm_detect_hdmi_monitor(output->edid);
+
 	tegra_dc_writel(dc, VSYNC_H_POSITION(1),
 			DC_DISP_DISP_TIMING_OPTIONS);
 	tegra_dc_writel(dc, DITHER_CONTROL_DISABLE | BASE_COLOR_SIZE888,
-- 
1.8.0.2
