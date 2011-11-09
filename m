From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] arm/tegra: fix variable formatting in makefile
Date: Wed,  9 Nov 2011 10:34:51 -0800
Message-ID: <1320863691-22922-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

For some reason it started out using {} instead of (), and it's
proliferated from there. Switch back to ().

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/Makefile |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 91a07e1..5be8e9e 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -18,20 +18,20 @@ obj-$(CONFIG_CPU_FREQ)                  += cpu-tegra.o
 obj-$(CONFIG_TEGRA_PCI)			+= pcie.o
 obj-$(CONFIG_USB_SUPPORT)		+= usb_phy.o
 
-obj-${CONFIG_MACH_HARMONY}              += board-harmony.o
-obj-${CONFIG_MACH_HARMONY}              += board-harmony-pinmux.o
-obj-${CONFIG_MACH_HARMONY}              += board-harmony-pcie.o
-obj-${CONFIG_MACH_HARMONY}              += board-harmony-power.o
+obj-$(CONFIG_MACH_HARMONY)              += board-harmony.o
+obj-$(CONFIG_MACH_HARMONY)              += board-harmony-pinmux.o
+obj-$(CONFIG_MACH_HARMONY)              += board-harmony-pcie.o
+obj-$(CONFIG_MACH_HARMONY)              += board-harmony-power.o
 
-obj-${CONFIG_MACH_PAZ00}		+= board-paz00.o
-obj-${CONFIG_MACH_PAZ00}		+= board-paz00-pinmux.o
+obj-$(CONFIG_MACH_PAZ00)		+= board-paz00.o
+obj-$(CONFIG_MACH_PAZ00)		+= board-paz00-pinmux.o
 
-obj-${CONFIG_MACH_SEABOARD}             += board-seaboard.o
-obj-${CONFIG_MACH_SEABOARD}             += board-seaboard-pinmux.o
+obj-$(CONFIG_MACH_SEABOARD)             += board-seaboard.o
+obj-$(CONFIG_MACH_SEABOARD)             += board-seaboard-pinmux.o
 
-obj-${CONFIG_MACH_TEGRA_DT}             += board-dt.o
-obj-${CONFIG_MACH_TEGRA_DT}             += board-harmony-pinmux.o
-obj-${CONFIG_MACH_TEGRA_DT}             += board-seaboard-pinmux.o
+obj-$(CONFIG_MACH_TEGRA_DT)             += board-dt.o
+obj-$(CONFIG_MACH_TEGRA_DT)             += board-harmony-pinmux.o
+obj-$(CONFIG_MACH_TEGRA_DT)             += board-seaboard-pinmux.o
 
-obj-${CONFIG_MACH_TRIMSLICE}            += board-trimslice.o
-obj-${CONFIG_MACH_TRIMSLICE}            += board-trimslice-pinmux.o
+obj-$(CONFIG_MACH_TRIMSLICE)            += board-trimslice.o
+obj-$(CONFIG_MACH_TRIMSLICE)            += board-trimslice-pinmux.o
-- 
1.7.5.4
