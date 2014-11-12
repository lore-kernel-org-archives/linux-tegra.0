From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] PCI: tegra: Add Kconfig help text
Date: Wed, 12 Nov 2014 14:53:38 +0100
Message-ID: <1415800418-22957-2-git-send-email-thierry.reding@gmail.com>
References: <1415800418-22957-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415800418-22957-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add a standard help text to the Kconfig entry for the Tegra PCIe host
controller driver.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
index 9c56137e5e5e..9dbb1fc68bc9 100644
--- a/drivers/pci/host/Kconfig
+++ b/drivers/pci/host/Kconfig
@@ -33,6 +33,9 @@ config PCI_IMX6
 config PCI_TEGRA
 	bool "NVIDIA Tegra PCIe controller"
 	depends on ARCH_TEGRA && !ARM64
+	help
+	  Say Y here if you want support for the PCIe host controller found
+	  on NVIDIA Tegra SoCs.
 
 config PCI_RCAR_GEN2
 	bool "Renesas R-Car Gen2 Internal PCI controller"
-- 
2.1.3
