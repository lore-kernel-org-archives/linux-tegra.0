From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 06/27] gpu: host1x: Cleanup includes
Date: Mon,  7 Oct 2013 10:34:23 +0200
Message-ID: <1381134884-5816-7-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Most of the included files are either not required or already included
by some other header file.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/dc.c      |  5 +----
 drivers/gpu/host1x/drm/drm.c     | 10 ----------
 drivers/gpu/host1x/drm/fb.c      |  2 --
 drivers/gpu/host1x/drm/gem.c     |  9 ---------
 drivers/gpu/host1x/drm/gr2d.c    |  7 -------
 drivers/gpu/host1x/drm/hdmi.c    |  8 +-------
 drivers/gpu/host1x/drm/output.c  |  2 --
 drivers/gpu/host1x/drm/rgb.c     |  3 ---
 drivers/gpu/host1x/hw/debug_hw.c |  7 -------
 9 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/host1x/drm/dc.c b/drivers/gpu/host1x/drm/dc.c
index c4765b3..e11aec7 100644
--- a/drivers/gpu/host1x/drm/dc.c
+++ b/drivers/gpu/host1x/drm/dc.c
@@ -8,11 +8,8 @@
  */
 
 #include <linux/clk.h>
-#include <linux/debugfs.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/clk/tegra.h>
+#include <linux/debugfs.h>
 
 #include "host1x_client.h"
 #include "dc.h"
diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index 7f8f419..90a1f3d 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -7,16 +7,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
-
-#include <linux/dma-mapping.h>
-#include <asm/dma-iommu.h>
-
-#include <drm/drm.h>
-#include <drm/drmP.h>
-
 #include "host1x_client.h"
 #include "dev.h"
 #include "drm.h"
diff --git a/drivers/gpu/host1x/drm/fb.c b/drivers/gpu/host1x/drm/fb.c
index 7dcd796..1fd4e19 100644
--- a/drivers/gpu/host1x/drm/fb.c
+++ b/drivers/gpu/host1x/drm/fb.c
@@ -10,8 +10,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/module.h>
-
 #include "drm.h"
 #include "gem.h"
 
diff --git a/drivers/gpu/host1x/drm/gem.c b/drivers/gpu/host1x/drm/gem.c
index 59623de..4a21378 100644
--- a/drivers/gpu/host1x/drm/gem.c
+++ b/drivers/gpu/host1x/drm/gem.c
@@ -18,15 +18,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/mutex.h>
-#include <linux/export.h>
-#include <linux/dma-mapping.h>
-
-#include <drm/drmP.h>
-#include <drm/drm.h>
-
 #include "gem.h"
 
 static inline struct tegra_bo *host1x_to_drm_bo(struct host1x_bo *bo)
diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index 06507c8..8d9a10f 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -1,8 +1,4 @@
 /*
- * drivers/video/tegra/host/gr2d/gr2d.c
- *
- * Tegra Graphics 2D
- *
  * Copyright (c) 2012-2013, NVIDIA Corporation.
  *
  * This program is free software; you can redistribute it and/or modify it
@@ -18,9 +14,6 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <linux/export.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/clk.h>
 
 #include "channel.h"
diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
index e7fb9d9..5d8c41c 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -8,16 +8,10 @@
  */
 
 #include <linux/clk.h>
+#include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
-#include <linux/gpio.h>
 #include <linux/hdmi.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
-#include <linux/clk/tegra.h>
-
-#include <drm/drm_edid.h>
 
 #include "hdmi.h"
 #include "drm.h"
diff --git a/drivers/gpu/host1x/drm/output.c b/drivers/gpu/host1x/drm/output.c
index 137ae81..8f40fa6 100644
--- a/drivers/gpu/host1x/drm/output.c
+++ b/drivers/gpu/host1x/drm/output.c
@@ -7,9 +7,7 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/module.h>
 #include <linux/of_gpio.h>
-#include <linux/i2c.h>
 
 #include "drm.h"
 
diff --git a/drivers/gpu/host1x/drm/rgb.c b/drivers/gpu/host1x/drm/rgb.c
index 5aa66ef..e4d2841 100644
--- a/drivers/gpu/host1x/drm/rgb.c
+++ b/drivers/gpu/host1x/drm/rgb.c
@@ -8,9 +8,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
 
 #include "drm.h"
 #include "dc.h"
diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index 334c038..dfad663 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -15,13 +15,6 @@
  *
  */
 
-#include <linux/debugfs.h>
-#include <linux/seq_file.h>
-#include <linux/mm.h>
-#include <linux/scatterlist.h>
-
-#include <linux/io.h>
-
 #include "dev.h"
 #include "debug.h"
 #include "cdma.h"
-- 
1.8.4
