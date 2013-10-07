From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 10/27] gpu: host1x: Make host1x header file public
Date: Mon,  7 Oct 2013 10:34:27 +0200
Message-ID: <1381134884-5816-11-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In preparation to support host1x clients other than DRM, move this
header into a public location.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS                                    | 1 +
 drivers/gpu/host1x/drm/drm.h                   | 6 +++---
 drivers/gpu/host1x/drm/gr2d.c                  | 1 -
 drivers/gpu/host1x/hw/channel_hw.c             | 3 ++-
 {drivers/gpu/host1x => include/linux}/host1x.h | 8 +++-----
 5 files changed, 9 insertions(+), 10 deletions(-)
 rename {drivers/gpu/host1x => include/linux}/host1x.h (88%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0df0af2..a1a4c7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2812,6 +2812,7 @@ L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 T:	git git://anongit.freedesktop.org/tegra/linux.git
 S:	Supported
 F:	drivers/gpu/host1x/
+F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
 F:	Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
 
diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/host1x/drm/drm.h
index dd6b98b..78754f6 100644
--- a/drivers/gpu/host1x/drm/drm.h
+++ b/drivers/gpu/host1x/drm/drm.h
@@ -10,14 +10,14 @@
 #ifndef HOST1X_DRM_H
 #define HOST1X_DRM_H 1
 
+#include <uapi/drm/tegra_drm.h>
+#include <linux/host1x.h>
+
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fixed.h>
-#include <uapi/drm/tegra_drm.h>
-
-#include "host1x.h"
 
 struct tegra_fb {
 	struct drm_framebuffer base;
diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index 07f0425..fc4476d 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -20,7 +20,6 @@
 #include "drm.h"
 #include "gem.h"
 #include "job.h"
-#include "host1x.h"
 #include "host1x_bo.h"
 #include "host1x_client.h"
 #include "syncpt.h"
diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index ee19962..c950bc6 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -16,10 +16,11 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/host1x.h>
 #include <linux/slab.h>
+
 #include <trace/events/host1x.h>
 
-#include "host1x.h"
 #include "host1x_bo.h"
 #include "channel.h"
 #include "dev.h"
diff --git a/drivers/gpu/host1x/host1x.h b/include/linux/host1x.h
similarity index 88%
rename from drivers/gpu/host1x/host1x.h
rename to include/linux/host1x.h
index a2bc1e6..fe09939 100644
--- a/drivers/gpu/host1x/host1x.h
+++ b/include/linux/host1x.h
@@ -1,6 +1,4 @@
 /*
- * Tegra host1x driver
- *
  * Copyright (c) 2009-2013, NVIDIA Corporation. All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -22,9 +20,9 @@
 #define __LINUX_HOST1X_H
 
 enum host1x_class {
-	HOST1X_CLASS_HOST1X	= 0x1,
-	HOST1X_CLASS_GR2D	= 0x51,
-	HOST1X_CLASS_GR2D_SB    = 0x52
+	HOST1X_CLASS_HOST1X = 0x1,
+	HOST1X_CLASS_GR2D = 0x51,
+	HOST1X_CLASS_GR2D_SB = 0x52,
 };
 
 #endif
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
