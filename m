From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 08/20] drm/tegra: dc: Disable plane if it is invisible
Date: Thu, 15 Jun 2017 02:18:31 +0300
Message-ID: <413bf65cb0ae08b9acbaf4490713ca848a4cf521.1497480757.git.digetx@gmail.com>
References: <cover.1497480751.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tegra20 if plane has width or height equal to 0, it will be infinitely
wide or tall. Let's disable the plane if it is invisible on atomic state
committing to fix the issue. The Rockchip DRM driver does the same.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index a7a7cce1afd0..c875f11786b9 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -559,6 +559,23 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static void tegra_dc_disable_window(struct tegra_dc *dc, int index)
+{
+	unsigned long flags;
+	u32 value;
+
+	spin_lock_irqsave(&dc->lock, flags);
+
+	value = WINDOW_A_SELECT << index;
+	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
+
+	value = tegra_dc_readl(dc, DC_WIN_WIN_OPTIONS);
+	value &= ~WIN_ENABLE;
+	tegra_dc_writel(dc, value, DC_WIN_WIN_OPTIONS);
+
+	spin_unlock_irqrestore(&dc->lock, flags);
+}
+
 static void tegra_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
@@ -573,6 +590,9 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	if (!plane->state->crtc || !plane->state->fb)
 		return;
 
+	if (!plane->state->visible)
+		return tegra_dc_disable_window(dc, p->index);
+
 	memset(&window, 0, sizeof(window));
 	window.src.x = plane->state->src.x1 >> 16;
 	window.src.y = plane->state->src.y1 >> 16;
@@ -612,8 +632,6 @@ static void tegra_plane_atomic_disable(struct drm_plane *plane,
 {
 	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_dc *dc;
-	unsigned long flags;
-	u32 value;
 
 	/* rien ne va plus */
 	if (!old_state || !old_state->crtc)
@@ -621,16 +639,7 @@ static void tegra_plane_atomic_disable(struct drm_plane *plane,
 
 	dc = to_tegra_dc(old_state->crtc);
 
-	spin_lock_irqsave(&dc->lock, flags);
-
-	value = WINDOW_A_SELECT << p->index;
-	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
-
-	value = tegra_dc_readl(dc, DC_WIN_WIN_OPTIONS);
-	value &= ~WIN_ENABLE;
-	tegra_dc_writel(dc, value, DC_WIN_WIN_OPTIONS);
-
-	spin_unlock_irqrestore(&dc->lock, flags);
+	tegra_dc_disable_window(dc, p->index);
 }
 
 static const struct drm_plane_helper_funcs tegra_primary_plane_helper_funcs = {
-- 
2.13.0
