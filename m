From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] drm: tegra: Use framebuffer pitch as line stride
Date: Thu, 22 Nov 2012 20:37:17 +0100
Message-ID: <1353613037-15808-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Instead of using the stride derived from the display mode, use the pitch
associated with the currently active framebuffer. This fixes a bug where
the LCD display content would be skewed when enabling HDMI with a video
mode different from that of the LCD.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 94686e5..41cde76 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -218,7 +218,7 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
 	}
 
 	bpp = crtc->fb->bits_per_pixel / 8;
-	win.stride = win.outw * bpp;
+	win.stride = crtc->fb->pitches[0];
 
 	/* program window registers */
 	value = tegra_dc_readl(dc, DC_CMD_DISPLAY_WINDOW_HEADER);
-- 
1.8.0
