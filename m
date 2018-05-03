From: Satendra Singh Thakur <satendra.t@samsung.com>
Subject: [PATCH 11/13] drm/kms/mode/tegra: using helper func
 drm_display_mode_to_videomode for calculating timing parameters
Date: Thu,  3 May 2018 16:38:16 +0530
Message-ID: <dc9f279708a7b9a363e2705d01ab3347e5336735.1525087679.git.satendra.t@samsung.com>
References: <cover.1525087679.git.satendra.t@samsung.com>
        <CGME20180503110834epcas5p25cf074e5fe2292c8053dfa9ebe9f8dc7@epcas5p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1525087679.git.satendra.t@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Satendra Singh Thakur <satendra.t@samsung.com>, Madhur Verma <madhur.verma@samsung.com>, Hemanshu Srivastava <hemanshu.s@samsung.com>
List-Id: linux-tegra@vger.kernel.org

To avoid duplicate logic for the same

Signed-off-by: Satendra Singh Thakur <satendra.t@samsung.com>
Cc: Madhur Verma <madhur.verma@samsung.com>
Cc: Hemanshu Srivastava <hemanshu.s@samsung.com>
---
 drivers/gpu/drm/tegra/dc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 9f83a65..f1d6f65 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -25,6 +25,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <video/videomode.h>
 
 static void tegra_dc_stats_reset(struct tegra_dc_stats *stats)
 {
@@ -1436,6 +1437,7 @@ static int tegra_dc_set_timings(struct tegra_dc *dc,
 	unsigned int h_ref_to_sync = 1;
 	unsigned int v_ref_to_sync = 1;
 	unsigned long value;
+	struct videomode vm;
 
 	if (!dc->soc->has_nvdisplay) {
 		tegra_dc_writel(dc, 0x0, DC_DISP_DISP_TIMING_OPTIONS);
@@ -1443,20 +1445,17 @@ static int tegra_dc_set_timings(struct tegra_dc *dc,
 		value = (v_ref_to_sync << 16) | h_ref_to_sync;
 		tegra_dc_writel(dc, value, DC_DISP_REF_TO_SYNC);
 	}
-
-	value = ((mode->vsync_end - mode->vsync_start) << 16) |
-		((mode->hsync_end - mode->hsync_start) <<  0);
+	drm_display_mode_to_videomode(mode, &vm);
+	value = (vm.vsync_len << 16) | vm.hsync_len;
 	tegra_dc_writel(dc, value, DC_DISP_SYNC_WIDTH);
 
-	value = ((mode->vtotal - mode->vsync_end) << 16) |
-		((mode->htotal - mode->hsync_end) <<  0);
+	value = (vm.vback_porch << 16) | vm.hback_porch;
 	tegra_dc_writel(dc, value, DC_DISP_BACK_PORCH);
 
-	value = ((mode->vsync_start - mode->vdisplay) << 16) |
-		((mode->hsync_start - mode->hdisplay) <<  0);
+	value = (vm.vfront_porch << 16) | vm.hfront_porch;
 	tegra_dc_writel(dc, value, DC_DISP_FRONT_PORCH);
 
-	value = (mode->vdisplay << 16) | mode->hdisplay;
+	value = (vm.vactive << 16) | vm.hactive;
 	tegra_dc_writel(dc, value, DC_DISP_ACTIVE);
 
 	return 0;
-- 
2.7.4
