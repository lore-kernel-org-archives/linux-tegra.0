From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] firmware: Move Trusted Foundations support
Date: Wed, 10 Apr 2019 10:57:08 +0200
Message-ID: <20190410085708.10798-2-thierry.reding@gmail.com>
References: <20190410085708.10798-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190410085708.10798-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Move the Trusted Foundations support out of arch/arm/firmware and into
drivers/firmware where most other firmware support implementations are
located.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/Kconfig                              |  2 --
 arch/arm/Makefile                             |  1 -
 arch/arm/firmware/Kconfig                     | 29 -------------------
 arch/arm/firmware/Makefile                    |  4 ---
 arch/arm/mach-tegra/Kconfig                   |  2 +-
 arch/arm/mach-tegra/cpuidle-tegra114.c        |  3 +-
 arch/arm/mach-tegra/pm.c                      |  3 +-
 arch/arm/mach-tegra/reset.c                   |  3 +-
 arch/arm/mach-tegra/tegra.c                   |  3 +-
 drivers/firmware/Kconfig                      | 15 ++++++++++
 drivers/firmware/Makefile                     |  1 +
 .../firmware/trusted_foundations.c            |  4 ++-
 .../linux/firmware}/trusted_foundations.h     |  4 +--
 13 files changed, 30 insertions(+), 44 deletions(-)
 delete mode 100644 arch/arm/firmware/Kconfig
 delete mode 100644 arch/arm/firmware/Makefile
 rename {arch/arm => drivers}/firmware/trusted_foundations.c (98%)
 rename {arch/arm/include/asm => include/linux/firmware}/trusted_foundations.h (97%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 054ead960f98..f006b3c69247 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -899,8 +899,6 @@ config PLAT_PXA
 config PLAT_VERSATILE
 	bool
 
-source "arch/arm/firmware/Kconfig"
-
 source "arch/arm/mm/Kconfig"
 
 config IWMMXT
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 807a7d06c2a0..05ecc004de86 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -290,7 +290,6 @@ core-y				+= arch/arm/kernel/ arch/arm/mm/ arch/arm/common/
 core-y				+= arch/arm/probes/
 core-y				+= arch/arm/net/
 core-y				+= arch/arm/crypto/
-core-y				+= arch/arm/firmware/
 core-y				+= $(machdirs) $(platdirs)
 
 drivers-$(CONFIG_OPROFILE)      += arch/arm/oprofile/
diff --git a/arch/arm/firmware/Kconfig b/arch/arm/firmware/Kconfig
deleted file mode 100644
index ad396af68e47..000000000000
--- a/arch/arm/firmware/Kconfig
+++ /dev/null
@@ -1,29 +0,0 @@
-config ARCH_SUPPORTS_FIRMWARE
-	bool
-
-config ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
-	bool
-	select ARCH_SUPPORTS_FIRMWARE
-
-menu "Firmware options"
-	depends on ARCH_SUPPORTS_FIRMWARE
-
-config TRUSTED_FOUNDATIONS
-	bool "Trusted Foundations secure monitor support"
-	depends on ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
-	default y
-	help
-	  Some devices (including most Tegra-based consumer devices on the
-	  market) are booted with the Trusted Foundations secure monitor
-	  active, requiring some core operations to be performed by the secure
-	  monitor instead of the kernel.
-
-	  This option allows the kernel to invoke the secure monitor whenever
-	  required on devices using Trusted Foundations. See
-	  arch/arm/include/asm/trusted_foundations.h or the
-	  tlm,trusted-foundations device tree binding documentation for details
-	  on how to use it.
-
-	  Say n if you don't know what this is about.
-
-endmenu
diff --git a/arch/arm/firmware/Makefile b/arch/arm/firmware/Makefile
deleted file mode 100644
index 6e41336b0bc4..000000000000
--- a/arch/arm/firmware/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-obj-$(CONFIG_TRUSTED_FOUNDATIONS)	+= trusted_foundations.o
-
-# tf_generic_smc() fails to build with -fsanitize-coverage=trace-pc
-KCOV_INSTRUMENT                := n
diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 7b3fd0995a16..cbad7823f602 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -3,7 +3,6 @@ menuconfig ARCH_TEGRA
 	bool "NVIDIA Tegra"
 	depends on ARCH_MULTI_V7
 	select ARCH_HAS_RESET_CONTROLLER
-	select ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
 	select ARM_AMBA
 	select ARM_GIC
 	select CLKSRC_MMIO
@@ -14,6 +13,7 @@ menuconfig ARCH_TEGRA
 	select PM_OPP
 	select RESET_CONTROLLER
 	select SOC_BUS
+	select TRUSTED_FOUNDATIONS
 	select ZONE_DMA if ARM_LPAE
 	help
 	  This enables support for NVIDIA Tegra based systems.
diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-tegra/cpuidle-tegra114.c
index 3b9af4766cdf..43c695d83f03 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra114.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra114.c
@@ -21,10 +21,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+#include <linux/firmware/trusted_foundations.h>
+
 #include <asm/cpuidle.h>
 #include <asm/smp_plat.h>
 #include <asm/suspend.h>
-#include <asm/trusted_foundations.h>
 #include <asm/psci.h>
 
 #include "cpuidle.h"
diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index abf5f88778f4..1b0ade06f204 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -27,6 +27,8 @@
 #include <linux/spinlock.h>
 #include <linux/suspend.h>
 
+#include <linux/firmware/trusted_foundations.h>
+
 #include <soc/tegra/flowctrl.h>
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pm.h>
@@ -39,7 +41,6 @@
 #include <asm/smp_plat.h>
 #include <asm/suspend.h>
 #include <asm/tlbflush.h>
-#include <asm/trusted_foundations.h>
 
 #include "iomap.h"
 #include "pm.h"
diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
index b02ae7699842..35dc5d419b6f 100644
--- a/arch/arm/mach-tegra/reset.c
+++ b/arch/arm/mach-tegra/reset.c
@@ -19,12 +19,13 @@
 #include <linux/init.h>
 #include <linux/io.h>
 
+#include <linux/firmware/trusted_foundations.h>
+
 #include <soc/tegra/fuse.h>
 
 #include <asm/cacheflush.h>
 #include <asm/firmware.h>
 #include <asm/hardware/cache-l2x0.h>
-#include <asm/trusted_foundations.h>
 
 #include "iomap.h"
 #include "irammap.h"
diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 1e89cfefbf68..3e88f67dd521 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -35,6 +35,8 @@
 #include <linux/sys_soc.h>
 #include <linux/usb/tegra_usb_phy.h>
 
+#include <linux/firmware/trusted_foundations.h>
+
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
 
@@ -44,7 +46,6 @@
 #include <asm/mach/time.h>
 #include <asm/mach-types.h>
 #include <asm/setup.h>
-#include <asm/trusted_foundations.h>
 
 #include "board.h"
 #include "common.h"
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index cac16c4b0df3..d1b1108aee72 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -267,6 +267,21 @@ config TI_SCI_PROTOCOL
 	  This protocol library is used by client drivers to use the features
 	  provided by the system controller.
 
+config TRUSTED_FOUNDATIONS
+	bool "Trusted Foundations secure monitor support"
+	help
+	  Some devices (including most early Tegra-based consumer devices on
+	  the market) are booted with the Trusted Foundations secure monitor
+	  active, requiring some core operations to be performed by the secure
+	  monitor instead of the kernel.
+
+	  This option allows the kernel to invoke the secure monitor whenever
+	  required on devices using Trusted Foundations. See the functions and
+	  comments in linux/firmware/trusted_foundations.h or the device tree
+	  bindings for "tlm,trusted-foundations" for details on how to use it.
+
+	  Choose N if you don't know what this is about.
+
 config HAVE_ARM_SMCCC
 	bool
 
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 80feb635120f..745f4907e69b 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_QCOM_SCM_64)	+= qcom_scm-64.o
 obj-$(CONFIG_QCOM_SCM_32)	+= qcom_scm-32.o
 CFLAGS_qcom_scm-32.o :=$(call as-instr,.arch armv7-a\n.arch_extension sec,-DREQUIRES_SEC=1) -march=armv7-a
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
+obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL)	+= arm_scmi/
 obj-y				+= broadcom/
diff --git a/arch/arm/firmware/trusted_foundations.c b/drivers/firmware/trusted_foundations.c
similarity index 98%
rename from arch/arm/firmware/trusted_foundations.c
rename to drivers/firmware/trusted_foundations.c
index bb2ee73d9e02..fd4999388ff1 100644
--- a/arch/arm/firmware/trusted_foundations.c
+++ b/drivers/firmware/trusted_foundations.c
@@ -17,10 +17,12 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/of.h>
+
+#include <linux/firmware/trusted_foundations.h>
+
 #include <asm/firmware.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/outercache.h>
-#include <asm/trusted_foundations.h>
 
 #define TF_CACHE_MAINT		0xfffff100
 
diff --git a/arch/arm/include/asm/trusted_foundations.h b/include/linux/firmware/trusted_foundations.h
similarity index 97%
rename from arch/arm/include/asm/trusted_foundations.h
rename to include/linux/firmware/trusted_foundations.h
index 54513c533811..4064e7c74715 100644
--- a/arch/arm/include/asm/trusted_foundations.h
+++ b/include/linux/firmware/trusted_foundations.h
@@ -23,8 +23,8 @@
  * PSCI standard.
  */
 
-#ifndef __ASM_ARM_TRUSTED_FOUNDATIONS_H
-#define __ASM_ARM_TRUSTED_FOUNDATIONS_H
+#ifndef __FIRMWARE_TRUSTED_FOUNDATIONS_H
+#define __FIRMWARE_TRUSTED_FOUNDATIONS_H
 
 #include <linux/printk.h>
 #include <linux/bug.h>
-- 
2.21.0
