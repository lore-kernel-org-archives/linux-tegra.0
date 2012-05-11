From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM: tegra20: Make MC optional in Kconfig
Date: Fri, 11 May 2012 09:56:24 +0300
Message-ID: <1336719389-28506-1-git-send-email-hdoyu@nvidia.com>
References: <20120511095012.57f737d1b0d2536e0d367a9b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120511095012.57f737d1b0d2536e0d367a9b-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Benoit Cousson <b-cousson-l0cyMroinI0@public.gmane.org>, Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

For bare minimal system.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/Kconfig |    2 --
 drivers/memory/Kconfig      |    8 +++++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 16fe065..8b6b181 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -20,8 +20,6 @@ config ARCH_TEGRA_2x_SOC
 	select PL310_ERRATA_727915 if CACHE_L2X0
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select CPU_FREQ_TABLE if CPU_FREQ
-	select MEMORY
-	select TEGRA20_MC
 	help
 	  Support for NVIDIA Tegra AP20 and T20 processors, based on the
 	  ARM CortexA9MP CPU and the ARM PL310 L2 cache controller
diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 42e6d66..efc6b36 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -21,8 +21,14 @@ config TI_EMIF
 	  temperature changes
 
 config TEGRA20_MC
-	bool
+	bool "Tegra20 Memory Controller(MC) driver"
+	default y
 	depends on ARCH_TEGRA_2x_SOC
+	help
+	  This driver is for the Memory Controller(MC) module available
+	  in Tegra20 SoCs, mainly for a address translation fault
+	  analysis, especially for IOMMU/GART(Graphics Address
+	  Relocation Table) module.
 
 config TEGRA30_MC
 	bool
-- 
1.7.5.4
