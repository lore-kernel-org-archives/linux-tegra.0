From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/3] ARM: tegra: remove CONFIG_MACH_TEGRA_DT
Date: Mon, 21 May 2012 15:44:49 -0600
Message-ID: <1337636690-28211-2-git-send-email-swarren@wwwdotorg.org>
References: <1337636690-28211-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337636690-28211-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

* Make ARCH_TEGRA select USE_OF; DT is the way forward.
* Build board-dt-tegra*.c when the relevant Tegra SoC support is enabled,
  rather than requiring a specific config option for this.
* The board-specific config options already build board-*-pinmux.o, and
  when booting from device tree these files are no longer needed, so we
  can remove some Makefile commands related to those files.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/Kconfig             |    1 +
 arch/arm/mach-tegra/Kconfig  |    7 -------
 arch/arm/mach-tegra/Makefile |   10 +++-------
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8a045ec..dd17f34 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -658,6 +658,7 @@ config ARCH_TEGRA
 	select MIGHT_HAVE_CACHE_L2X0
 	select NEED_MACH_IO_H if PCI
 	select ARCH_HAS_CPUFREQ
+	select USE_OF
 	help
 	  This enables support for NVIDIA Tegra based systems (Tegra APX,
 	  Tegra 6xx and Tegra 2 series).
diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 5b9b116..621466a 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -87,13 +87,6 @@ config MACH_SEABOARD
 	 also be included for some of the derivative boards that
 	 have large similarities with the seaboard design.
 
-config MACH_TEGRA_DT
-	bool "Generic Tegra20 board (FDT support)"
-	depends on ARCH_TEGRA_2x_SOC
-	select USE_OF
-	help
-	  Support for generic NVIDIA Tegra20 boards using Flattened Device Tree
-
 config MACH_TRIMSLICE
        bool "TrimSlice board"
        depends on ARCH_TEGRA_2x_SOC
diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 2eb4445..60a0213 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -13,7 +13,6 @@ obj-$(CONFIG_CPU_IDLE)			+= sleep.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= powergate.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += tegra2_clocks.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= tegra2_emc.o
-obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= board-dt-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= tegra30_clocks.o
 obj-$(CONFIG_SMP)			+= platsmp.o headsmp.o
 obj-$(CONFIG_SMP)                       += reset.o
@@ -23,6 +22,9 @@ obj-$(CONFIG_CPU_FREQ)                  += cpu-tegra.o
 obj-$(CONFIG_TEGRA_PCI)			+= pcie.o
 obj-$(CONFIG_USB_SUPPORT)		+= usb_phy.o
 
+obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= board-dt-tegra20.o
+obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= board-dt-tegra30.o
+
 obj-$(CONFIG_MACH_HARMONY)              += board-harmony.o
 obj-$(CONFIG_MACH_HARMONY)              += board-harmony-pinmux.o
 obj-$(CONFIG_MACH_HARMONY)              += board-harmony-pcie.o
@@ -34,11 +36,5 @@ obj-$(CONFIG_MACH_PAZ00)		+= board-paz00-pinmux.o
 obj-$(CONFIG_MACH_SEABOARD)             += board-seaboard.o
 obj-$(CONFIG_MACH_SEABOARD)             += board-seaboard-pinmux.o
 
-obj-$(CONFIG_MACH_TEGRA_DT)             += board-dt-tegra20.o
-obj-$(CONFIG_MACH_TEGRA_DT)             += board-harmony-pinmux.o
-obj-$(CONFIG_MACH_TEGRA_DT)             += board-seaboard-pinmux.o
-obj-$(CONFIG_MACH_TEGRA_DT)             += board-paz00-pinmux.o
-obj-$(CONFIG_MACH_TEGRA_DT)             += board-trimslice-pinmux.o
-
 obj-$(CONFIG_MACH_TRIMSLICE)            += board-trimslice.o
 obj-$(CONFIG_MACH_TRIMSLICE)            += board-trimslice-pinmux.o
-- 
1.7.0.4
