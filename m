From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v4 2/9] drm/tegra: Remove bogus tegra_framebuffer structure
Date: Thu, 21 Feb 2013 15:35:54 +0100
Message-ID: <1361457361-13838-3-git-send-email-thierry.reding@avionic-design.de>
References: <1361457361-13838-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361457361-13838-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra uses the CMA FB helpers so framebuffers passed to the driver need
to use the corresponding functions to access the underlying GEM objects.

This used to work because struct tegra_framebuffer was sufficiently
similar to struct drm_fb_cma but that isn't guaranteed to stay that way.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c  |  2 +-
 drivers/gpu/drm/tegra/drm.h | 11 -----------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 656b2e3..d35ff8b 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -158,7 +158,7 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
 			       struct drm_display_mode *adjusted,
 			       int x, int y, struct drm_framebuffer *old_fb)
 {
-	struct tegra_framebuffer *fb = to_tegra_fb(crtc->fb);
+	struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(crtc->fb, 0);
 	struct tegra_dc *dc = to_tegra_dc(crtc);
 	unsigned int h_dda, v_dda, bpp;
 	struct tegra_dc_window win;
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 741b5dc..3c61aab 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -18,16 +18,6 @@
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fixed.h>
 
-struct tegra_framebuffer {
-	struct drm_framebuffer base;
-	struct drm_gem_cma_object *obj;
-};
-
-static inline struct tegra_framebuffer *to_tegra_fb(struct drm_framebuffer *fb)
-{
-	return container_of(fb, struct tegra_framebuffer, base);
-}
-
 struct host1x {
 	struct drm_device *drm;
 	struct device *dev;
@@ -44,7 +34,6 @@ struct host1x {
 	struct list_head clients;
 
 	struct drm_fbdev_cma *fbdev;
-	struct tegra_framebuffer fb;
 };
 
 struct host1x_client;
-- 
1.8.1.2
