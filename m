From: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] video: tegra: Add dc color dithering support
Date: Fri, 15 Apr 2011 20:18:58 -0700
Message-ID: <1302923939-374-1-git-send-email-rmorell@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This change adds support for display color dithering configuration in
the display control structure.  Two dithering modes are possible:
ordered and error-diffusion mode.  Error-diffusion dithering is usually
considered higher quality, but can only be used when the active region
is less than 640 pixels wide.

This is based on patches from Chao Jiang <chaoj-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/dc.h |    7 +++++++
 drivers/video/tegra/dc/dc.c           |   24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/dc.h b/arch/arm/mach-tegra/include/mach/dc.h
index 254b732..696e6ed 100644
--- a/arch/arm/mach-tegra/include/mach/dc.h
+++ b/arch/arm/mach-tegra/include/mach/dc.h
@@ -44,6 +44,12 @@ enum {
 	TEGRA_DC_OUT_HDMI,
 };
 
+enum {
+	TEGRA_DC_DISABLE_DITHER = 1,
+	TEGRA_DC_ORDERED_DITHER,
+	TEGRA_DC_ERRDIFF_DITHER,
+};
+
 struct tegra_dc_out {
 	int			type;
 	unsigned		flags;
@@ -58,6 +64,7 @@ struct tegra_dc_out {
 	unsigned		order;
 	unsigned		align;
 	unsigned		depth;
+	unsigned		dither;
 
 	struct tegra_dc_mode	*modes;
 	int			n_modes;
diff --git a/drivers/video/tegra/dc/dc.c b/drivers/video/tegra/dc/dc.c
index 16789c2..4241a24 100644
--- a/drivers/video/tegra/dc/dc.c
+++ b/drivers/video/tegra/dc/dc.c
@@ -890,6 +890,30 @@ static void tegra_dc_set_color_control(struct tegra_dc *dc)
 		break;
 	}
 
+	/*
+	 * The line buffer for error-diffusion dither is limited to 640 pixels
+	 * per line, so we can't use it if the active region is larger than 640
+	 * pixels.  Be nice and fall back to ordered dithering, but warn so the
+	 * platform data can be corrected.
+	 */
+	if (WARN_ON(dc->out->dither == TEGRA_DC_ERRDIFF_DITHER &&
+		    dc->mode.h_active > 640)) {
+		dc->out->dither = TEGRA_DC_ORDERED_DITHER;
+	}
+
+	switch (dc->out->dither) {
+	case TEGRA_DC_DISABLE_DITHER:
+		color_control |= DITHER_CONTROL_DISABLE;
+		break;
+	case TEGRA_DC_ORDERED_DITHER:
+		color_control |= DITHER_CONTROL_ORDERED;
+		break;
+	case TEGRA_DC_ERRDIFF_DITHER:
+		BUG_ON(dc->mode.h_active > 640);
+		color_control |= DITHER_CONTROL_ERRDIFF;
+		break;
+	}
+
 	tegra_dc_writel(dc, color_control, DC_DISP_DISP_COLOR_CONTROL);
 }
 
-- 
1.7.3.4
