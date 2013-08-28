From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Drop ARCH_SUPPORTS_MSI and sort list
Date: Wed, 28 Aug 2013 22:05:34 +0200
Message-ID: <1377720334-30718-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The ARCH_SUPPORTS_MSI symbol was removed during the recent patches that
introduce the MSI chip infrastructure. Drop it from the list of selected
symbols. While at it, move the MIGHT_HAVE_PCI symbol so the list stays
sorted alphabetically.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This should be applied on top of whatever branch carries the Tegra
for-3.12/soc branch (that'd be next/soc if I'm not mistaken).

 arch/arm/mach-tegra/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index b693680..67a76f2 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -14,6 +14,7 @@ config ARCH_TEGRA
 	select HAVE_CLK
 	select HAVE_SMP
 	select MIGHT_HAVE_CACHE_L2X0
+	select MIGHT_HAVE_PCI
 	select PINCTRL
 	select SOC_BUS
 	select SPARSE_IRQ
@@ -21,8 +22,6 @@ config ARCH_TEGRA
 	select USB_ULPI if USB_PHY
 	select USB_ULPI_VIEWPORT if USB_PHY
 	select USE_OF
-	select MIGHT_HAVE_PCI
-	select ARCH_SUPPORTS_MSI
 	help
 	  This enables support for NVIDIA Tegra based systems.
 
-- 
1.8.4
