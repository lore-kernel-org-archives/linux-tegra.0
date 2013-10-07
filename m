From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 14/27] drm/tegra: Move driver to DRM tree
Date: Mon,  7 Oct 2013 10:34:31 +0200
Message-ID: <1381134884-5816-15-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In order to subsystem-wide changes easier, move the Tegra DRM driver
back into the DRM tree.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS                                    |  1 +
 drivers/gpu/drm/Kconfig                        |  2 ++
 drivers/gpu/drm/Makefile                       |  1 +
 drivers/gpu/{host1x/drm => drm/tegra}/Kconfig  | 10 +++++-----
 drivers/gpu/drm/tegra/Makefile                 | 15 +++++++++++++++
 drivers/gpu/{host1x/drm => drm/tegra}/bus.c    |  0
 drivers/gpu/{host1x/drm => drm/tegra}/dc.c     |  0
 drivers/gpu/{host1x/drm => drm/tegra}/dc.h     |  0
 drivers/gpu/{host1x/drm => drm/tegra}/drm.c    |  0
 drivers/gpu/{host1x/drm => drm/tegra}/drm.h    |  0
 drivers/gpu/{host1x/drm => drm/tegra}/fb.c     |  0
 drivers/gpu/{host1x/drm => drm/tegra}/gem.c    |  0
 drivers/gpu/{host1x/drm => drm/tegra}/gem.h    |  0
 drivers/gpu/{host1x/drm => drm/tegra}/gr2d.c   |  0
 drivers/gpu/{host1x/drm => drm/tegra}/hdmi.c   |  0
 drivers/gpu/{host1x/drm => drm/tegra}/hdmi.h   |  0
 drivers/gpu/{host1x/drm => drm/tegra}/output.c |  0
 drivers/gpu/{host1x/drm => drm/tegra}/rgb.c    |  0
 drivers/gpu/host1x/Kconfig                     |  2 --
 drivers/gpu/host1x/Makefile                    |  8 --------
 drivers/video/Kconfig                          |  4 ++--
 21 files changed, 26 insertions(+), 17 deletions(-)
 rename drivers/gpu/{host1x/drm => drm/tegra}/Kconfig (100%)
 create mode 100644 drivers/gpu/drm/tegra/Makefile
 rename drivers/gpu/{host1x/drm => drm/tegra}/bus.c (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/dc.c (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/dc.h (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/drm.c (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/drm.h (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/fb.c (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/gem.c (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/gem.h (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/gr2d.c (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/hdmi.c (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/hdmi.h (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/output.c (100%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/rgb.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a1a4c7c..26ff91a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2811,6 +2811,7 @@ L:	dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 T:	git git://anongit.freedesktop.org/tegra/linux.git
 S:	Supported
+F:	drivers/gpu/drm/tegra/
 F:	drivers/gpu/host1x/
 F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 955555d..290e2ac 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -236,3 +236,5 @@ source "drivers/gpu/drm/tilcdc/Kconfig"
 source "drivers/gpu/drm/qxl/Kconfig"
 
 source "drivers/gpu/drm/msm/Kconfig"
+
+source "drivers/gpu/drm/tegra/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index f089adf..e39cd03 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -55,4 +55,5 @@ obj-$(CONFIG_DRM_OMAP)	+= omapdrm/
 obj-$(CONFIG_DRM_TILCDC)	+= tilcdc/
 obj-$(CONFIG_DRM_QXL) += qxl/
 obj-$(CONFIG_DRM_MSM) += msm/
+obj-$(CONFIG_DRM_TEGRA) += tegra/
 obj-y			+= i2c/
diff --git a/drivers/gpu/host1x/drm/Kconfig b/drivers/gpu/drm/tegra/Kconfig
similarity index 100%
rename from drivers/gpu/host1x/drm/Kconfig
rename to drivers/gpu/drm/tegra/Kconfig
index 69853a4..7759eea 100644
--- a/drivers/gpu/host1x/drm/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -13,6 +13,11 @@ config DRM_TEGRA
 
 if DRM_TEGRA
 
+config DRM_TEGRA_DEBUG
+	bool "NVIDIA Tegra DRM debug support"
+	help
+	  Say yes here to enable debugging support.
+
 config DRM_TEGRA_STAGING
 	bool "Enable HOST1X interface"
 	depends on STAGING
@@ -21,9 +26,4 @@ config DRM_TEGRA_STAGING
 
 	  If unsure, choose N.
 
-config DRM_TEGRA_DEBUG
-	bool "NVIDIA Tegra DRM debug support"
-	help
-	  Say yes here to enable debugging support.
-
 endif
diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
new file mode 100644
index 0000000..abb267c
--- /dev/null
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -0,0 +1,15 @@
+ccflags-y += -Iinclude/drm
+ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
+
+tegra-drm-y := \
+	bus.o \
+	drm.o \
+	gem.o \
+	fb.o \
+	dc.o \
+	output.o \
+	rgb.o \
+	hdmi.o \
+	gr2d.o
+
+obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
diff --git a/drivers/gpu/host1x/drm/bus.c b/drivers/gpu/drm/tegra/bus.c
similarity index 100%
rename from drivers/gpu/host1x/drm/bus.c
rename to drivers/gpu/drm/tegra/bus.c
diff --git a/drivers/gpu/host1x/drm/dc.c b/drivers/gpu/drm/tegra/dc.c
similarity index 100%
rename from drivers/gpu/host1x/drm/dc.c
rename to drivers/gpu/drm/tegra/dc.c
diff --git a/drivers/gpu/host1x/drm/dc.h b/drivers/gpu/drm/tegra/dc.h
similarity index 100%
rename from drivers/gpu/host1x/drm/dc.h
rename to drivers/gpu/drm/tegra/dc.h
diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/drm/tegra/drm.c
similarity index 100%
rename from drivers/gpu/host1x/drm/drm.c
rename to drivers/gpu/drm/tegra/drm.c
diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/drm/tegra/drm.h
similarity index 100%
rename from drivers/gpu/host1x/drm/drm.h
rename to drivers/gpu/drm/tegra/drm.h
diff --git a/drivers/gpu/host1x/drm/fb.c b/drivers/gpu/drm/tegra/fb.c
similarity index 100%
rename from drivers/gpu/host1x/drm/fb.c
rename to drivers/gpu/drm/tegra/fb.c
diff --git a/drivers/gpu/host1x/drm/gem.c b/drivers/gpu/drm/tegra/gem.c
similarity index 100%
rename from drivers/gpu/host1x/drm/gem.c
rename to drivers/gpu/drm/tegra/gem.c
diff --git a/drivers/gpu/host1x/drm/gem.h b/drivers/gpu/drm/tegra/gem.h
similarity index 100%
rename from drivers/gpu/host1x/drm/gem.h
rename to drivers/gpu/drm/tegra/gem.h
diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
similarity index 100%
rename from drivers/gpu/host1x/drm/gr2d.c
rename to drivers/gpu/drm/tegra/gr2d.c
diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
similarity index 100%
rename from drivers/gpu/host1x/drm/hdmi.c
rename to drivers/gpu/drm/tegra/hdmi.c
diff --git a/drivers/gpu/host1x/drm/hdmi.h b/drivers/gpu/drm/tegra/hdmi.h
similarity index 100%
rename from drivers/gpu/host1x/drm/hdmi.h
rename to drivers/gpu/drm/tegra/hdmi.h
diff --git a/drivers/gpu/host1x/drm/output.c b/drivers/gpu/drm/tegra/output.c
similarity index 100%
rename from drivers/gpu/host1x/drm/output.c
rename to drivers/gpu/drm/tegra/output.c
diff --git a/drivers/gpu/host1x/drm/rgb.c b/drivers/gpu/drm/tegra/rgb.c
similarity index 100%
rename from drivers/gpu/host1x/drm/rgb.c
rename to drivers/gpu/drm/tegra/rgb.c
diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index ccfd42b..7d6bed2 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -19,6 +19,4 @@ config TEGRA_HOST1X_FIREWALL
 
 	  If unsure, choose Y.
 
-source "drivers/gpu/host1x/drm/Kconfig"
-
 endif
diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 616fe82..889217c 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -9,12 +9,4 @@ host1x-y = \
 	debug.o \
 	hw/host1x01.o
 
-ccflags-y += -Iinclude/drm
-ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
-
-host1x-$(CONFIG_DRM_TEGRA) += drm/drm.o drm/fb.o drm/dc.o
-host1x-$(CONFIG_DRM_TEGRA) += drm/output.o drm/rgb.o drm/hdmi.o
-host1x-$(CONFIG_DRM_TEGRA) += drm/gem.o
-host1x-$(CONFIG_DRM_TEGRA) += drm/gr2d.o
-host1x-$(CONFIG_DRM_TEGRA) += drm/bus.o
 obj-$(CONFIG_TEGRA_HOST1X) += host1x.o
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 14317b7..4f2e1b3 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -19,10 +19,10 @@ source "drivers/char/agp/Kconfig"
 
 source "drivers/gpu/vga/Kconfig"
 
-source "drivers/gpu/drm/Kconfig"
-
 source "drivers/gpu/host1x/Kconfig"
 
+source "drivers/gpu/drm/Kconfig"
+
 config VGASTATE
        tristate
        default n
-- 
1.8.4
