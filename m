From: Hiroshi DOYU <hdoyu@nvidia.com>
Subject: [PATCH 2/3] ARM: tegra30: Make MC optional in Kconfig
Date: Fri, 11 May 2012 09:56:25 +0300
Message-ID: <1336719389-28506-2-git-send-email-hdoyu@nvidia.com>
References: <20120511095012.57f737d1b0d2536e0d367a9b@nvidia.com>
 <1336719389-28506-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336719389-28506-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, Hiroshi DOYU <hdoyu@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Benoit Cousson <b-cousson@ti.com>, Aneesh V <aneesh@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

For bare minimal system.

Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>
---
 arch/arm/mach-tegra/Kconfig |    2 --
 drivers/memory/Kconfig      |    8 +++++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 8b6b181..6a113a9 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -41,8 +41,6 @@ config ARCH_TEGRA_3x_SOC
 	select ARM_ERRATA_764369
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select CPU_FREQ_TABLE if CPU_FREQ
-	select MEMORY
-	select TEGRA30_MC
 	help
 	  Support for NVIDIA Tegra T30 processor family, based on the
 	  ARM CortexA9MP CPU and the ARM PL310 L2 cache controller
diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index efc6b36..067f311 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -31,7 +31,13 @@ config TEGRA20_MC
 	  Relocation Table) module.
 
 config TEGRA30_MC
-	bool
+	bool "Tegra30 Memory Controller(MC) driver"
+	default y
 	depends on ARCH_TEGRA_3x_SOC
+	help
+	  This driver is for the Memory Controller(MC) module available
+	  in Tegra30 SoCs, mainly for a address translation fault
+	  analysis, especially for IOMMU/SMMU(System Memory Management
+	  Unit) module.
 
 endif
-- 
1.7.5.4
