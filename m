From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] pinctrl: tegra: move Tegra pinctrl drivers to sub-directory
Date: Sun, 24 Jan 2016 00:30:08 +0900
Message-ID: <1453563008-30106-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra has several pinctrl drivers.  Now it is reasonable enough to
move them into drivers/pinctrl/tegra/.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 drivers/pinctrl/Kconfig                          | 32 +-----------------------
 drivers/pinctrl/Makefile                         |  8 +-----
 drivers/pinctrl/tegra/Kconfig                    | 30 ++++++++++++++++++++++
 drivers/pinctrl/tegra/Makefile                   |  7 ++++++
 drivers/pinctrl/{ => tegra}/pinctrl-tegra-xusb.c |  4 +--
 drivers/pinctrl/{ => tegra}/pinctrl-tegra.c      |  4 +--
 drivers/pinctrl/{ => tegra}/pinctrl-tegra.h      |  0
 drivers/pinctrl/{ => tegra}/pinctrl-tegra114.c   |  0
 drivers/pinctrl/{ => tegra}/pinctrl-tegra124.c   |  0
 drivers/pinctrl/{ => tegra}/pinctrl-tegra20.c    |  0
 drivers/pinctrl/{ => tegra}/pinctrl-tegra210.c   |  0
 drivers/pinctrl/{ => tegra}/pinctrl-tegra30.c    |  0
 12 files changed, 43 insertions(+), 42 deletions(-)
 create mode 100644 drivers/pinctrl/tegra/Kconfig
 create mode 100644 drivers/pinctrl/tegra/Makefile
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra-xusb.c (99%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra.c (99%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra.h (100%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra114.c (100%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra124.c (100%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra20.c (100%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra210.c (100%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra30.c (100%)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 99a4c10..7f41f0b 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -168,37 +168,6 @@ config PINCTRL_ST
 	select PINCONF
 	select GPIOLIB_IRQCHIP
 
-config PINCTRL_TEGRA
-	bool
-	select PINMUX
-	select PINCONF
-
-config PINCTRL_TEGRA20
-	bool
-	select PINCTRL_TEGRA
-
-config PINCTRL_TEGRA30
-	bool
-	select PINCTRL_TEGRA
-
-config PINCTRL_TEGRA114
-	bool
-	select PINCTRL_TEGRA
-
-config PINCTRL_TEGRA124
-	bool
-	select PINCTRL_TEGRA
-
-config PINCTRL_TEGRA210
-	bool
-	select PINCTRL_TEGRA
-
-config PINCTRL_TEGRA_XUSB
-	def_bool y if ARCH_TEGRA
-	select GENERIC_PHY
-	select PINCONF
-	select PINMUX
-
 config PINCTRL_TZ1090
 	bool "Toumaz Xenif TZ1090 pin control driver"
 	depends on SOC_TZ1090
@@ -258,6 +227,7 @@ source "drivers/pinctrl/samsung/Kconfig"
 source "drivers/pinctrl/sh-pfc/Kconfig"
 source "drivers/pinctrl/spear/Kconfig"
 source "drivers/pinctrl/sunxi/Kconfig"
+source "drivers/pinctrl/tegra/Kconfig"
 source "drivers/pinctrl/uniphier/Kconfig"
 source "drivers/pinctrl/vt8500/Kconfig"
 source "drivers/pinctrl/mediatek/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index bf1b5ca..b7b456a 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -22,13 +22,7 @@ obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_SIRF)	+= sirf/
-obj-$(CONFIG_PINCTRL_TEGRA)	+= pinctrl-tegra.o
-obj-$(CONFIG_PINCTRL_TEGRA20)	+= pinctrl-tegra20.o
-obj-$(CONFIG_PINCTRL_TEGRA30)	+= pinctrl-tegra30.o
-obj-$(CONFIG_PINCTRL_TEGRA114)	+= pinctrl-tegra114.o
-obj-$(CONFIG_PINCTRL_TEGRA124)	+= pinctrl-tegra124.o
-obj-$(CONFIG_PINCTRL_TEGRA210)	+= pinctrl-tegra210.o
-obj-$(CONFIG_PINCTRL_TEGRA_XUSB)	+= pinctrl-tegra-xusb.o
+obj-$(CONFIG_PINCTRL_TEGRA)	+= tegra/
 obj-$(CONFIG_PINCTRL_TZ1090)	+= pinctrl-tz1090.o
 obj-$(CONFIG_PINCTRL_TZ1090_PDC)	+= pinctrl-tz1090-pdc.o
 obj-$(CONFIG_PINCTRL_U300)	+= pinctrl-u300.o
diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
new file mode 100644
index 0000000..24e20cc
--- /dev/null
+++ b/drivers/pinctrl/tegra/Kconfig
@@ -0,0 +1,30 @@
+config PINCTRL_TEGRA
+	bool
+	select PINMUX
+	select PINCONF
+
+config PINCTRL_TEGRA20
+	bool
+	select PINCTRL_TEGRA
+
+config PINCTRL_TEGRA30
+	bool
+	select PINCTRL_TEGRA
+
+config PINCTRL_TEGRA114
+	bool
+	select PINCTRL_TEGRA
+
+config PINCTRL_TEGRA124
+	bool
+	select PINCTRL_TEGRA
+
+config PINCTRL_TEGRA210
+	bool
+	select PINCTRL_TEGRA
+
+config PINCTRL_TEGRA_XUSB
+	def_bool y if ARCH_TEGRA
+	select GENERIC_PHY
+	select PINCONF
+	select PINMUX
diff --git a/drivers/pinctrl/tegra/Makefile b/drivers/pinctrl/tegra/Makefile
new file mode 100644
index 0000000..a927379
--- /dev/null
+++ b/drivers/pinctrl/tegra/Makefile
@@ -0,0 +1,7 @@
+obj-y					+= pinctrl-tegra.o
+obj-$(CONFIG_PINCTRL_TEGRA20)		+= pinctrl-tegra20.o
+obj-$(CONFIG_PINCTRL_TEGRA30)		+= pinctrl-tegra30.o
+obj-$(CONFIG_PINCTRL_TEGRA114)		+= pinctrl-tegra114.o
+obj-$(CONFIG_PINCTRL_TEGRA124)		+= pinctrl-tegra124.o
+obj-$(CONFIG_PINCTRL_TEGRA210)		+= pinctrl-tegra210.o
+obj-$(CONFIG_PINCTRL_TEGRA_XUSB)	+= pinctrl-tegra-xusb.o
diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
similarity index 99%
rename from drivers/pinctrl/pinctrl-tegra-xusb.c
rename to drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index bd3aa5a..2f06029 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -24,8 +24,8 @@
 
 #include <dt-bindings/pinctrl/pinctrl-tegra-xusb.h>
 
-#include "core.h"
-#include "pinctrl-utils.h"
+#include "../core.h"
+#include "../pinctrl-utils.h"
 
 #define XUSB_PADCTL_ELPG_PROGRAM 0x01c
 #define XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN (1 << 26)
diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
similarity index 99%
rename from drivers/pinctrl/pinctrl-tegra.c
rename to drivers/pinctrl/tegra/pinctrl-tegra.c
index 9da4da2..4938882 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -30,9 +30,9 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/slab.h>
 
-#include "core.h"
+#include "../core.h"
+#include "../pinctrl-utils.h"
 #include "pinctrl-tegra.h"
-#include "pinctrl-utils.h"
 
 struct tegra_pmx {
 	struct device *dev;
diff --git a/drivers/pinctrl/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
similarity index 100%
rename from drivers/pinctrl/pinctrl-tegra.h
rename to drivers/pinctrl/tegra/pinctrl-tegra.h
diff --git a/drivers/pinctrl/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
similarity index 100%
rename from drivers/pinctrl/pinctrl-tegra114.c
rename to drivers/pinctrl/tegra/pinctrl-tegra114.c
diff --git a/drivers/pinctrl/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
similarity index 100%
rename from drivers/pinctrl/pinctrl-tegra124.c
rename to drivers/pinctrl/tegra/pinctrl-tegra124.c
diff --git a/drivers/pinctrl/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
similarity index 100%
rename from drivers/pinctrl/pinctrl-tegra20.c
rename to drivers/pinctrl/tegra/pinctrl-tegra20.c
diff --git a/drivers/pinctrl/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
similarity index 100%
rename from drivers/pinctrl/pinctrl-tegra210.c
rename to drivers/pinctrl/tegra/pinctrl-tegra210.c
diff --git a/drivers/pinctrl/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
similarity index 100%
rename from drivers/pinctrl/pinctrl-tegra30.c
rename to drivers/pinctrl/tegra/pinctrl-tegra30.c
-- 
1.9.1
