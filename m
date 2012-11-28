From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] drm: tegra: Add maintainers entry
Date: Wed, 28 Nov 2012 12:10:17 +0100
Message-ID: <1354101017-31844-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add myself as the maintainer of the NVIDIA Tegra DRM driver.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f503405..27c89b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2504,6 +2504,14 @@ S:	Supported
 F:	drivers/gpu/drm/exynos
 F:	include/drm/exynos*
 
+NVIDIA TEGRA DRM DRIVER
+M:	Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
+L:	dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
+T:	git://gitorious.org/thierryreding/linux.git
+S:	Maintained
+F:	drivers/gpu/drm/tegra
+F:	Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
+
 DSCC4 DRIVER
 M:	Francois Romieu <romieu-W8zweXLXuWQS+FvcfC7Uqw@public.gmane.org>
 L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
1.8.0.1
