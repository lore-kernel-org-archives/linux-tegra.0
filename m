From: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: [PATCH] gpu/host1x: Remove DRIVER_BUS_PLATFORM from driver_features
Date: Wed, 29 May 2013 07:44:34 +0200
Message-ID: <1369806274-19046-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

DRIVER_BUS_PLATFORM is not a DRM driver feature flag, it must not be set
in the driver's driver_features field.

Signed-off-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 drivers/gpu/host1x/drm/drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index 2b561c9..e658a2a 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -605,7 +605,7 @@ static void tegra_debugfs_cleanup(struct drm_minor *minor)
 #endif
 
 struct drm_driver tegra_drm_driver = {
-	.driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM,
 	.load = tegra_drm_load,
 	.unload = tegra_drm_unload,
 	.open = tegra_drm_open,
-- 
Regards,

Laurent Pinchart
