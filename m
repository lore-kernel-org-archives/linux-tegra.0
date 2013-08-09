From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 12/14] ARM: tegra: Update default configuration (PCIe)
Date: Fri,  9 Aug 2013 16:49:30 +0200
Message-ID: <1376059772-16669-13-git-send-email-treding@nvidia.com>
References: <1376059772-16669-1-git-send-email-treding@nvidia.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1376059772-16669-1-git-send-email-treding@nvidia.com>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Enable PCI and MSI support as well as the new Tegra PCIe controller
driver.

Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
- enable PCI Express support (CONFIG_PCIEPORTBUS)

 arch/arm/configs/tegra_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 36ad70c..1586dda 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -27,8 +27,11 @@ CONFIG_ARCH_TEGRA=y
 CONFIG_ARCH_TEGRA_2x_SOC=y
 CONFIG_ARCH_TEGRA_3x_SOC=y
 CONFIG_ARCH_TEGRA_114_SOC=y
-CONFIG_TEGRA_PCI=y
 CONFIG_TEGRA_EMC_SCALING_ENABLE=y
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCI_TEGRA=y
+CONFIG_PCIEPORTBUS=y
 CONFIG_SMP=y
 CONFIG_PREEMPT=y
 CONFIG_AEABI=y
-- 
1.8.3.4
