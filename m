From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH] drm/tegra: Fix Kconfig dependencies
Date: Sun,  5 Jan 2014 10:22:51 -0800
Message-ID: <1388946171-29459-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

arm:allmodconfig fails to build with several undefined drm and host1x symbols.

drivers/gpu/drm/tegra/bus.c:52: undefined reference to `drm_dev_alloc'
drivers/gpu/drm/tegra/bus.c:56: undefined reference to `drm_dev_register'
drivers/gpu/drm/tegra/bus.c:67: undefined reference to `drm_dev_free'
drivers/gpu/drm/tegra/bus.c:75: undefined reference to `drm_put_dev'
drivers/gpu/drm/tegra/drm.c:445: undefined reference to `host1x_syncpt_get_base'
drivers/gpu/drm/tegra/drm.c:449: undefined reference to `host1x_syncpt_base_id'

and so on.

This is caused by DRM=m but DRM_TEGRA=y. DRM_TEGRA is bool while DRM is
tristate. DRM_TEGRA can not be set to tristate because it depends on unexported
host1x symbols (and possibly others). Fix by updating DRM_TEGRA dependency.

Also, the DRM_TEGRA help text states that it can be built as module.
Remove that text since it is not (or no longer) correct.

Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 drivers/gpu/drm/tegra/Kconfig |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 8961ba6..9966547 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -1,7 +1,7 @@
 config DRM_TEGRA
 	bool "NVIDIA Tegra DRM"
 	depends on ARCH_TEGRA || ARCH_MULTIPLATFORM
-	depends on DRM
+	depends on DRM=y
 	select TEGRA_HOST1X
 	select DRM_KMS_HELPER
 	select DRM_KMS_FB_HELPER
@@ -11,9 +11,6 @@ config DRM_TEGRA
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
 
-	  To compile this driver as a module, choose M here: the module
-	  will be called tegra-drm.
-
 if DRM_TEGRA
 
 config DRM_TEGRA_DEBUG
-- 
1.7.9.7
