From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] drm/tegra: plane: Remove format-modifier checking
Date: Sun, 24 Feb 2019 18:34:05 +0300
Message-ID: <20190224153405.8447-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tiling modifier can't be applied to YV12 video overlay because all tiling
modifiers are filtered out for multi-plane formats. AFAIK, all modifiers
should work with all of formats, hence the checking is incorrect and
simply not needed.

Fixes: e90124cb46bdb ("drm/tegra: plane: Support format modifiers")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/plane.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index d068e8aa3553..5a8a3387f5ee 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -72,21 +72,6 @@ static void tegra_plane_atomic_destroy_state(struct drm_plane *plane,
 	kfree(state);
 }
 
-static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
-					     uint32_t format,
-					     uint64_t modifier)
-{
-	const struct drm_format_info *info = drm_format_info(format);
-
-	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		return true;
-
-	if (info->num_planes == 1)
-		return true;
-
-	return false;
-}
-
 const struct drm_plane_funcs tegra_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
@@ -94,7 +79,6 @@ const struct drm_plane_funcs tegra_plane_funcs = {
 	.reset = tegra_plane_reset,
 	.atomic_duplicate_state = tegra_plane_atomic_duplicate_state,
 	.atomic_destroy_state = tegra_plane_atomic_destroy_state,
-	.format_mod_supported = tegra_plane_format_mod_supported,
 };
 
 int tegra_plane_state_add(struct tegra_plane *plane,
-- 
2.20.1
