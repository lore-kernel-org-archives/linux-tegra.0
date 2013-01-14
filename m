From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2 1/5] drm: Allow vblank support without DRIVER_HAVE_IRQ
Date: Mon, 14 Jan 2013 17:05:56 +0100
Message-ID: <1358179560-26799-2-git-send-email-thierry.reding@avionic-design.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358179560-26799-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Drivers that register interrupt handlers without the DRM core helpers
don't initialize the .irq_enabled field and drm_dev_to_irq() may fail
when called on them. This shouldn't preclude them from implementing
the vblank IOCTL.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/drm/drm_irq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 19c01ca..71f8205 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -1218,8 +1218,9 @@ int drm_wait_vblank(struct drm_device *dev, void *data,
 	int ret;
 	unsigned int flags, seq, crtc, high_crtc;
 
-	if ((!drm_dev_to_irq(dev)) || (!dev->irq_enabled))
-		return -EINVAL;
+	if (drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
+		if ((!drm_dev_to_irq(dev)) || (!dev->irq_enabled))
+			return -EINVAL;
 
 	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
 		return -EINVAL;
-- 
1.8.1
