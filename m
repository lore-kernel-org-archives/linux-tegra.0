From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] drm/plane: Make ->atomic_update() mandatory
Date: Fri, 23 Jan 2015 10:26:37 +0100
Message-ID: <1422005197-10964-1-git-send-email-thierry.reding@gmail.com>
References: <1421750935-4023-3-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421750935-4023-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

There is no use-case where it would be useful for drivers not to
implement this function and the transitional plane helpers already
require drivers to provide an implementation.

v2: add new requirement to kerneldoc

Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 2 +-
 include/drm/drm_plane_helper.h      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d467185f7942..010661f23035 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1108,7 +1108,7 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 
 		funcs = plane->helper_private;
 
-		if (!funcs || !funcs->atomic_update)
+		if (!funcs)
 			continue;
 
 		old_plane_state = old_state->plane_states[i];
diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index 0f2230311aa8..a44139abbd5e 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -51,7 +51,7 @@ int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
  * @prepare_fb: prepare a framebuffer for use by the plane
  * @cleanup_fb: cleanup a framebuffer when it's no longer used by the plane
  * @atomic_check: check that a given atomic state is valid and can be applied
- * @atomic_update: apply an atomic state to the plane
+ * @atomic_update: apply an atomic state to the plane (mandatory)
  *
  * The helper operations are called by the mid-layer CRTC helper.
  */
-- 
2.1.3
