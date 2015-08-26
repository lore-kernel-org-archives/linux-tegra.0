From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH resend] PCI: tegra: use __pgprot() around static pgprot_t initializer
Date: Wed, 26 Aug 2015 10:49:34 +0200
Message-ID: <1440578974-26527-1-git-send-email-ard.biesheuvel@linaro.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In order to comply with the rules that apply when STRICT_MM_TYPECHECKS
is defined, wrap the initializer for a pgprot_t in __pgprot().

Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 10c05718dbfd..0d3e6cb0c459 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -382,8 +382,8 @@ static unsigned long tegra_pcie_conf_offset(unsigned int devfn, int where)
 static struct tegra_pcie_bus *tegra_pcie_bus_alloc(struct tegra_pcie *pcie,
 						   unsigned int busnr)
 {
-	pgprot_t prot = L_PTE_PRESENT | L_PTE_YOUNG | L_PTE_DIRTY | L_PTE_XN |
-			L_PTE_MT_DEV_SHARED | L_PTE_SHARED;
+	pgprot_t prot = __pgprot(L_PTE_PRESENT | L_PTE_YOUNG | L_PTE_DIRTY |
+				 L_PTE_XN | L_PTE_MT_DEV_SHARED | L_PTE_SHARED);
 	phys_addr_t cs = pcie->cs->start;
 	struct tegra_pcie_bus *bus;
 	unsigned int i;
-- 
1.9.1
