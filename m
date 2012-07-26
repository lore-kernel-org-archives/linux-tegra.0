From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: [PATCH v3 01/10] PCI: Keep pci_fixup_irqs() around after init
Date: Thu, 26 Jul 2012 21:55:03 +0200
Message-ID: <1343332512-28762-2-git-send-email-thierry.reding@avionic-design.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-pci-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Mitch Bradley <wmb@firmworks.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

When using deferred driver probing, PCI host controller drivers may
actually require this function after the init stage.

Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
---
Changes in v3:
- none

Changes in v2:
- use __devinit annotations

 drivers/pci/setup-irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/setup-irq.c b/drivers/pci/setup-irq.c
index eb219a1..f0bcd56 100644
--- a/drivers/pci/setup-irq.c
+++ b/drivers/pci/setup-irq.c
@@ -18,7 +18,7 @@
 #include <linux/cache.h>
 
 
-static void __init
+static void __devinit
 pdev_fixup_irq(struct pci_dev *dev,
 	       u8 (*swizzle)(struct pci_dev *, u8 *),
 	       int (*map_irq)(const struct pci_dev *, u8, u8))
@@ -54,7 +54,7 @@ pdev_fixup_irq(struct pci_dev *dev,
 	pcibios_update_irq(dev, irq);
 }
 
-void __init
+void __devinit
 pci_fixup_irqs(u8 (*swizzle)(struct pci_dev *, u8 *),
 	       int (*map_irq)(const struct pci_dev *, u8, u8))
 {
-- 
1.7.11.2
