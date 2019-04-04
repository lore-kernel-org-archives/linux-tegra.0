From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH V2 05/16] PCI: dwc: Move config space capability search API
Date: Fri, 5 Apr 2019 01:24:32 +0530
Message-ID: <1554407683-31580-6-git-send-email-vidyas@nvidia.com>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

move PCIe config space capability search API to common designware file
as this can be used by both host and ep mode codes.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1554407724; bh=jQR9nFs/LVuU16O+4g9VUt8D0FYqHU7ch/l131xrbHM=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
	 Content-Type;
	b=UQuc2NpvbrIMAshj2IXJEkV3wFJq0l81Jo3mwW0lXy/2z4n8L/QCv6hleUg+PSjLJ
	 cZKmeQw9F+O8e7lzmOJy+RJCmB/eLuwUx6yl/Fhxas0mTeGgJBKfO0MZB/IaXJ6SVx
	 EmFpH475a02Q6jGpCNYyRw8K5TWqhu4u3Iionn7cXnxXOFTdrxWa08djN3kqhI5mXq
	 y43RdlUolSXGCAgYy1kY9ATl8ULBi61dj9ELsR+51Y6w8ImtJt41f8ClEXq+cErRl/
	 Zl7l/7GlEBEiFFydE4GHStH3xtWUgNiC3kNtHzSxtlhIouO0Jhwd7ICYIYyEyzRBV+
	 XQ0NU8oh5uPZg==

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
Changes from [v1]:
* Removed dw_pcie_find_next_ext_capability() API from here and made a
  separate patch for that

 drivers/pci/controller/dwc/pcie-designware-ep.c | 37 ++-----------------------
 drivers/pci/controller/dwc/pcie-designware.c    | 33 ++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h    |  2 ++
 3 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 24f5a775ad34..b9d9c9a4ba6d 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -40,39 +40,6 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
 	__dw_pcie_ep_reset_bar(pci, bar, 0);
 }
 
-static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie *pci, u8 cap_ptr,
-			      u8 cap)
-{
-	u8 cap_id, next_cap_ptr;
-	u16 reg;
-
-	reg = dw_pcie_readw_dbi(pci, cap_ptr);
-	next_cap_ptr = (reg & 0xff00) >> 8;
-	cap_id = (reg & 0x00ff);
-
-	if (!next_cap_ptr || cap_id > PCI_CAP_ID_MAX)
-		return 0;
-
-	if (cap_id == cap)
-		return cap_ptr;
-
-	return __dw_pcie_ep_find_next_cap(pci, next_cap_ptr, cap);
-}
-
-static u8 dw_pcie_ep_find_capability(struct dw_pcie *pci, u8 cap)
-{
-	u8 next_cap_ptr;
-	u16 reg;
-
-	reg = dw_pcie_readw_dbi(pci, PCI_CAPABILITY_LIST);
-	next_cap_ptr = (reg & 0x00ff);
-
-	if (!next_cap_ptr)
-		return 0;
-
-	return __dw_pcie_ep_find_next_cap(pci, next_cap_ptr, cap);
-}
-
 static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
 				   struct pci_epf_header *hdr)
 {
@@ -591,9 +558,9 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 		dev_err(dev, "Failed to reserve memory for MSI/MSI-X\n");
 		return -ENOMEM;
 	}
-	ep->msi_cap = dw_pcie_ep_find_capability(pci, PCI_CAP_ID_MSI);
+	ep->msi_cap = dw_pcie_find_capability(pci, PCI_CAP_ID_MSI);
 
-	ep->msix_cap = dw_pcie_ep_find_capability(pci, PCI_CAP_ID_MSIX);
+	ep->msix_cap = dw_pcie_find_capability(pci, PCI_CAP_ID_MSIX);
 
 	dw_pcie_setup(pci);
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index f98e2f284ae1..d68c123e409c 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -20,6 +20,39 @@
 #define PCIE_PHY_DEBUG_R1_LINK_UP	(0x1 << 4)
 #define PCIE_PHY_DEBUG_R1_LINK_IN_TRAINING	(0x1 << 29)
 
+static u8 __dw_pcie_find_next_cap(struct dw_pcie *pci, u8 cap_ptr,
+				  u8 cap)
+{
+	u8 cap_id, next_cap_ptr;
+	u16 reg;
+
+	reg = dw_pcie_readw_dbi(pci, cap_ptr);
+	next_cap_ptr = (reg & 0xff00) >> 8;
+	cap_id = (reg & 0x00ff);
+
+	if (!next_cap_ptr || cap_id > PCI_CAP_ID_MAX)
+		return 0;
+
+	if (cap_id == cap)
+		return cap_ptr;
+
+	return __dw_pcie_find_next_cap(pci, next_cap_ptr, cap);
+}
+
+u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap)
+{
+	u8 next_cap_ptr;
+	u16 reg;
+
+	reg = dw_pcie_readw_dbi(pci, PCI_CAPABILITY_LIST);
+	next_cap_ptr = (reg & 0x00ff);
+
+	if (!next_cap_ptr)
+		return 0;
+
+	return __dw_pcie_find_next_cap(pci, next_cap_ptr, cap);
+}
+
 int dw_pcie_read(void __iomem *addr, int size, u32 *val)
 {
 	if (!IS_ALIGNED((uintptr_t)addr, size)) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 86df36701a37..4ccd4c706ddb 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -247,6 +247,8 @@ struct dw_pcie {
 #define to_dw_pcie_from_ep(endpoint)   \
 		container_of((endpoint), struct dw_pcie, ep)
 
+u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
+
 int dw_pcie_read(void __iomem *addr, int size, u32 *val);
 int dw_pcie_write(void __iomem *addr, int size, u32 val);
 
-- 
2.7.4
