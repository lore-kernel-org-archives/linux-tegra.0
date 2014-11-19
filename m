From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] drm/tegra: Select root window for event dispatch
Date: Wed, 19 Nov 2014 13:04:49 -0500
Message-ID: <1416420289-4112-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In finish pageflip, the driver was not selecting the root
window when dispatching events. This exposed a race where
a plane update would change the window selection and cause
tegra_dc_finish_page_flip to check the wrong base address.

This patch also protects access to the window selection register
as well as the registers affected by it.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b957908..a3b41ea 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -168,7 +168,7 @@ static int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 				 const struct tegra_dc_window *window)
 {
 	unsigned h_offset, v_offset, h_size, v_size, h_dda, v_dda, bpp;
-	unsigned long value;
+	unsigned long value, flags;
 	bool yuv, planar;
 
 	/*
@@ -181,6 +181,8 @@ static int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 	else
 		bpp = planar ? 1 : 2;
 
+	spin_lock_irqsave(&dc->lock, flags);
+
 	value = WINDOW_A_SELECT << index;
 	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
 
@@ -273,6 +275,7 @@ static int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 
 		case TEGRA_BO_TILING_MODE_BLOCK:
 			DRM_ERROR("hardware doesn't support block linear mode\n");
+			spin_unlock_irqrestore(&dc->lock, flags);
 			return -EINVAL;
 		}
 
@@ -330,6 +333,7 @@ static int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 	}
 
 	tegra_dc_window_commit(dc, index);
+	spin_unlock_irqrestore(&dc->lock, flags);
 
 	return 0;
 }
@@ -339,10 +343,12 @@ static int tegra_window_plane_disable(struct drm_plane *plane)
 	struct tegra_dc *dc = to_tegra_dc(plane->crtc);
 	struct tegra_plane *p = to_tegra_plane(plane);
 	u32 value;
+	unsigned long flags;
 
 	if (!plane->crtc)
 		return 0;
 
+	spin_lock_irqsave(&dc->lock, flags);
 	value = WINDOW_A_SELECT << p->index;
 	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
 
@@ -351,6 +357,7 @@ static int tegra_window_plane_disable(struct drm_plane *plane)
 	tegra_dc_writel(dc, value, DC_WIN_WIN_OPTIONS);
 
 	tegra_dc_window_commit(dc, p->index);
+	spin_unlock_irqrestore(&dc->lock, flags);
 
 	return 0;
 }
@@ -700,13 +707,14 @@ static int tegra_dc_set_base(struct tegra_dc *dc, int x, int y,
 	unsigned int h_offset = 0, v_offset = 0;
 	struct tegra_bo_tiling tiling;
 	unsigned int format, swap;
-	unsigned long value;
+	unsigned long value, flags;
 	int err;
 
 	err = tegra_fb_get_tiling(fb, &tiling);
 	if (err < 0)
 		return err;
 
+	spin_lock_irqsave(&dc->lock, flags);
 	tegra_dc_writel(dc, WINDOW_A_SELECT, DC_CMD_DISPLAY_WINDOW_HEADER);
 
 	value = fb->offsets[0] + y * fb->pitches[0] +
@@ -752,6 +760,7 @@ static int tegra_dc_set_base(struct tegra_dc *dc, int x, int y,
 
 		case TEGRA_BO_TILING_MODE_BLOCK:
 			DRM_ERROR("hardware doesn't support block linear mode\n");
+			spin_unlock_irqrestore(&dc->lock, flags);
 			return -EINVAL;
 		}
 
@@ -777,6 +786,7 @@ static int tegra_dc_set_base(struct tegra_dc *dc, int x, int y,
 	value = GENERAL_ACT_REQ | WIN_A_ACT_REQ;
 	tegra_dc_writel(dc, value << 8, DC_CMD_STATE_CONTROL);
 	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
+	spin_unlock_irqrestore(&dc->lock, flags);
 
 	return 0;
 }
@@ -790,7 +800,6 @@ void tegra_dc_enable_vblank(struct tegra_dc *dc)
 	value = tegra_dc_readl(dc, DC_CMD_INT_MASK);
 	value |= VBLANK_INT;
 	tegra_dc_writel(dc, value, DC_CMD_INT_MASK);
-
 	spin_unlock_irqrestore(&dc->lock, flags);
 }
 
@@ -819,11 +828,16 @@ static void tegra_dc_finish_page_flip(struct tegra_dc *dc)
 
 	bo = tegra_fb_get_plane(crtc->primary->fb, 0);
 
+	spin_lock_irqsave(&dc->lock, flags);
+
 	/* check if new start address has been latched */
+	tegra_dc_writel(dc, WINDOW_A_SELECT, DC_CMD_DISPLAY_WINDOW_HEADER);
 	tegra_dc_writel(dc, READ_MUX, DC_CMD_STATE_ACCESS);
 	base = tegra_dc_readl(dc, DC_WINBUF_START_ADDR);
 	tegra_dc_writel(dc, 0, DC_CMD_STATE_ACCESS);
 
+	spin_unlock_irqrestore(&dc->lock, flags);
+
 	if (base == bo->paddr + crtc->primary->fb->offsets[0]) {
 		spin_lock_irqsave(&drm->event_lock, flags);
 		drm_send_vblank_event(drm, dc->pipe, dc->event);
-- 
2.1.1
