From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v3] drm: tegra: Add maintainers entry
Date: Wed, 28 Nov 2012 20:45:28 +0100
Message-ID: <1354131928-25497-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add myself as the maintainer of the NVIDIA Tegra DRM driver.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- add linux-tegra mailing list

Changes in v2:
- insert entry in alphabetical order
- fix reference to driver directory
- fix reference to git tree

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cfc0f1..84062c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2549,6 +2549,15 @@ S:	Supported
 F:	drivers/gpu/drm/exynos
 F:	include/drm/exynos*
 
+DRM DRIVERS FOR NVIDIA TEGRA
+M:	Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
+L:	dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
+L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+T:	git git://gitorious.org/thierryreding/linux.git
+S:	Maintained
+F:	drivers/gpu/drm/tegra/
+F:	Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
+
 DSCC4 DRIVER
 M:	Francois Romieu <romieu-W8zweXLXuWQS+FvcfC7Uqw@public.gmane.org>
 L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
1.8.0.1
