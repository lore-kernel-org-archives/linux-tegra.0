From: Ameya Palande <2ameya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] arm: tegra: Rearrange Tegra config options
Date: Fri, 15 Apr 2011 17:14:07 +0300
Message-ID: <1302876847-17078-1-git-send-email-2ameya@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch separates Tegra config options and creates tegra board type as a
separate submenu. Resulting hierarchy looks like:

+- System Type
            |  +- NVIDIA Tegra Options
            |     +- Select Tegra processor family for target system
            |     |  +- Tegra 2 family
            |     +- PCI Express support
            |     .
            |     .
            |     +- Tegra Board Type
            |     |  +- Harmony board
            |     |  +- Kaen board
            |     |  .

Signed-off-by: Ameya Palande <2ameya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-tegra/Kconfig |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 3cdeffc..0bd17db 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -1,6 +1,6 @@
 if ARCH_TEGRA
 
-comment "NVIDIA Tegra options"
+menu "NVIDIA Tegra Options"
 
 choice
 	prompt "Select Tegra processor family for target system"
@@ -23,7 +23,7 @@ config TEGRA_PCI
 	bool "PCI Express support"
 	select PCI
 
-comment "Tegra board type"
+menu "Tegra Board Type"
 
 config MACH_HARMONY
        bool "Harmony board"
@@ -60,6 +60,8 @@ config MACH_WARIO
        help
          Support for the Wario version of Seaboard
 
+endmenu # "Tegra Board Type"
+
 choice
         prompt "Low-level debug console UART"
         default TEGRA_DEBUG_UART_NONE
@@ -94,4 +96,6 @@ config TEGRA_SYSTEM_DMA
 config TEGRA_EMC_SCALING_ENABLE
 	bool "Enable scaling the memory frequency"
 
+endmenu # "NVIDIA Tegra Options"
+
 endif
-- 
1.7.1
