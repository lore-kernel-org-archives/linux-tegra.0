From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: [PATCH v3 05/10] resource: add PCI configuration space support
Date: Thu, 26 Jul 2012 21:55:07 +0200
Message-ID: <1343332512-28762-6-git-send-email-thierry.reding@avionic-design.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-pci-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Mitch Bradley <wmb@firmworks.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

This commit adds a new flag that allows marking resources as PCI
configuration space.

Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
---
Changes in v3:
- new patch

 include/linux/ioport.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 589e0e7..3314843 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -102,7 +102,7 @@ struct resource {
 
 /* PCI control bits.  Shares IORESOURCE_BITS with above PCI ROM.  */
 #define IORESOURCE_PCI_FIXED		(1<<4)	/* Do not move resource */
-
+#define IORESOURCE_PCI_CS		(1<<5)	/* PCI configuration space */
 
 /* helpers to define resources */
 #define DEFINE_RES_NAMED(_start, _size, _name, _flags)			\
-- 
1.7.11.2
