From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: tegra: fix compile-testing PCI host driver
Date: Mon, 28 May 2018 17:55:29 +0200
Message-ID: <20180528155603.2897776-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>
Cc: arm@kernel.org, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The tegra_cpuidle_pcie_irqs_in_use() function is stubbed out for non-ARM
builds, but now we can compile-test the Tegra pci driver on non-Tegra
ARM platforms as well, which results in a new link error:

drivers/pci/host/pci-tegra.o: In function `tegra_pcie_map_irq':
pci-tegra.c:(.text+0x288): undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
drivers/pci/host/pci-tegra.o: In function `tegra_msi_map':
pci-tegra.c:(.text+0xba0): undefined reference to `tegra_cpuidle_pcie_irqs_in_use'

This adapts the #ifdef statement to match the exact condition under which
the function can be called.

Fixes: 51bc085d6454 ("PCI: Improve host drivers compile test coverage")
Cc: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/soc/tegra/cpuidle.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/tegra/cpuidle.h b/include/soc/tegra/cpuidle.h
index 1fae9c7800d1..b6cf32211520 100644
--- a/include/soc/tegra/cpuidle.h
+++ b/include/soc/tegra/cpuidle.h
@@ -14,7 +14,7 @@
 #ifndef __SOC_TEGRA_CPUIDLE_H__
 #define __SOC_TEGRA_CPUIDLE_H__
 
-#if defined(CONFIG_ARM) && defined(CONFIG_CPU_IDLE)
+#if defined(CONFIG_ARM) && defined(CONFIG_ARCH_TEGRA) && defined(CONFIG_CPU_IDLE)
 void tegra_cpuidle_pcie_irqs_in_use(void);
 #else
 static inline void tegra_cpuidle_pcie_irqs_in_use(void)
-- 
2.9.0
