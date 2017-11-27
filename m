From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/12] drm/tegra: dc: Remove tegra_primary_plane_destroy()
Date: Mon, 27 Nov 2017 11:09:41 +0100
Message-ID: <20171127100952.22465-2-thierry.reding@gmail.com>
References: <20171127100952.22465-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127100952.22465-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This function is a simple wrapper around tegra_plane_destroy(), so it
can be dropped.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index f825c39888f9..552710f5c386 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -417,11 +417,6 @@ static const u32 tegra_primary_plane_formats[] = {
 	DRM_FORMAT_RGB565,
 };
 
-static void tegra_primary_plane_destroy(struct drm_plane *plane)
-{
-	tegra_plane_destroy(plane);
-}
-
 static void tegra_plane_reset(struct drm_plane *plane)
 {
 	struct tegra_plane_state *state;
@@ -466,7 +461,7 @@ static void tegra_plane_atomic_destroy_state(struct drm_plane *plane,
 static const struct drm_plane_funcs tegra_primary_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = tegra_primary_plane_destroy,
+	.destroy = tegra_plane_destroy,
 	.reset = tegra_plane_reset,
 	.atomic_duplicate_state = tegra_plane_atomic_duplicate_state,
 	.atomic_destroy_state = tegra_plane_atomic_destroy_state,
-- 
2.15.0
