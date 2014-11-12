From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] PCI: tegra: Do not build on 64-bit ARM
Date: Wed, 12 Nov 2014 14:53:37 +0100
Message-ID: <1415800418-22957-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

32-bit and 64-bit ARM use very different infrastructure to register a
PCI host bridge. The Tegra PCIe host controller driver currently only
supports the 32-bit ARM infrastructure, so prevent it from being built
on 64-bit ARM where it will break.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pci/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
index 3dc25fad490c..9c56137e5e5e 100644
--- a/drivers/pci/host/Kconfig
+++ b/drivers/pci/host/Kconfig
@@ -32,7 +32,7 @@ config PCI_IMX6
 
 config PCI_TEGRA
 	bool "NVIDIA Tegra PCIe controller"
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA && !ARM64
 
 config PCI_RCAR_GEN2
 	bool "Renesas R-Car Gen2 Internal PCI controller"
-- 
2.1.3
