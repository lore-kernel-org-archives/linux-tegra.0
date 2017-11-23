From: Ville Syrjala <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH 12/15] drm/tegra/dc: Use drm_mode_get_hv_timing() to populate plane clip rectangle
Date: Thu, 23 Nov 2017 21:04:59 +0200
Message-ID: <20171123190502.28449-13-ville.syrjala@linux.intel.com>
References: <20171123190502.28449-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171123190502.28449-1-ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Ville Syrjälä <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Use drm_mode_get_hv_timing() to fill out the plane clip rectangle.

No functional changes as the code already uses crtc_state->mode
to populate the clip, which is also what drm_mode_get_hv_timing()
uses.

Once everyone agrees on this we can move the clip handling into
drm_atomic_helper_check_plane_state().

Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Ville Syrjälä <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index fc70351b9017..93b47e0e038b 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -477,7 +477,7 @@ static int tegra_plane_state_add(struct tegra_plane *plane,
 {
 	struct drm_crtc_state *crtc_state;
 	struct tegra_dc_state *tegra;
-	struct drm_rect clip;
+	struct drm_rect clip = {};
 	int err;
 
 	/* Propagate errors from allocation or locking failures. */
@@ -485,10 +485,9 @@ static int tegra_plane_state_add(struct tegra_plane *plane,
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
-	clip.x1 = 0;
-	clip.y1 = 0;
-	clip.x2 = crtc_state->mode.hdisplay;
-	clip.y2 = crtc_state->mode.vdisplay;
+	if (crtc_state->enable)
+		drm_mode_get_hv_timing(&crtc_state->mode,
+				       &clip.x2, &clip.y2);
 
 	/* Check plane state for visibility and calculate clipping bounds */
 	err = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
-- 
2.13.6
