From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/3] drm/tegra: plane: Fix RGB565 plane format on older Tegra's
Date: Thu, 15 Mar 2018 04:00:23 +0300
Message-ID: <8d9c7220b1d2cf126bd2030e5d232ec06f761440.1521075485.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Simplify opaque format adjustment by removing format checking. There are
only 4 formats that require the adjustment and so this way is less error
prone, avoiding mishandling native formats, like in this case RGB565 is
the format that was erroneously treated as invalid.

Fixes: ebae8d07435a ("drm/tegra: dc: Implement legacy blending")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c    | 11 ++---------
 drivers/gpu/drm/tegra/plane.c | 21 ++++++---------------
 drivers/gpu/drm/tegra/plane.h |  2 +-
 3 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 49df2db2ad46..22bf513612d1 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -456,15 +456,8 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	 * be emulated by disabling alpha blending for the plane.
 	 */
 	if (!dc->soc->supports_blending) {
-		if (!tegra_plane_format_has_alpha(format)) {
-			err = tegra_plane_format_get_alpha(format, &format);
-			if (err < 0)
-				return err;
-
-			plane_state->opaque = true;
-		} else {
-			plane_state->opaque = false;
-		}
+		plane_state->opaque = !tegra_plane_format_has_alpha(format);
+		format = tegra_plane_format_adjust(format);
 
 		tegra_plane_check_dependent(tegra, plane_state);
 	}
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index a056fbf83b53..fc37dcf8c458 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -268,32 +268,23 @@ bool tegra_plane_format_has_alpha(unsigned int format)
 	return false;
 }
 
-int tegra_plane_format_get_alpha(unsigned int opaque, unsigned int *alpha)
+unsigned int tegra_plane_format_adjust(unsigned int opaque)
 {
-	if (tegra_plane_format_is_yuv(opaque, NULL)) {
-		*alpha = opaque;
-		return 0;
-	}
-
 	switch (opaque) {
 	case WIN_COLOR_DEPTH_B5G5R5X1:
-		*alpha = WIN_COLOR_DEPTH_B5G5R5A1;
-		return 0;
+		return WIN_COLOR_DEPTH_B5G5R5A1;
 
 	case WIN_COLOR_DEPTH_X1B5G5R5:
-		*alpha = WIN_COLOR_DEPTH_A1B5G5R5;
-		return 0;
+		return WIN_COLOR_DEPTH_A1B5G5R5;
 
 	case WIN_COLOR_DEPTH_R8G8B8X8:
-		*alpha = WIN_COLOR_DEPTH_R8G8B8A8;
-		return 0;
+		return WIN_COLOR_DEPTH_R8G8B8A8;
 
 	case WIN_COLOR_DEPTH_B8G8R8X8:
-		*alpha = WIN_COLOR_DEPTH_B8G8R8A8;
-		return 0;
+		return WIN_COLOR_DEPTH_B8G8R8A8;
 	}
 
-	return -EINVAL;
+	return opaque;
 }
 
 unsigned int tegra_plane_get_overlap_index(struct tegra_plane *plane,
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index 6938719e7e5d..9fda841564cd 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -63,7 +63,7 @@ int tegra_plane_state_add(struct tegra_plane *plane,
 int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
 bool tegra_plane_format_is_yuv(unsigned int format, bool *planar);
 bool tegra_plane_format_has_alpha(unsigned int format);
-int tegra_plane_format_get_alpha(unsigned int opaque, unsigned int *alpha);
+unsigned int tegra_plane_format_adjust(unsigned int opaque);
 void tegra_plane_check_dependent(struct tegra_plane *tegra,
 				 struct tegra_plane_state *state);
 
-- 
2.16.1
