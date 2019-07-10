From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH V13 01/12] PCI: Add #defines for some of PCIe spec r4.0 features
Date: Wed, 10 Jul 2019 11:52:01 +0530
Message-ID: <20190710062212.1745-2-vidyas@nvidia.com>
References: <20190710062212.1745-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710062212.1745-1-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com
Cc: digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Add #defines only for the Data Link Feature and Physical Layer 16.0 GT/s
features as defined in PCIe spec r4.0, sec 7.7.4 for Data Link Feature and
sec 7.7.5 for Physical Layer 16.0 GT/s.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
---
V13:
* Updated commit message to include references from spec
* Removed unused defines and moved some from pcie-tegra194.c file
* Addressed review comments from Bjorn

V12:
* None

V11:
* None

V10:
* None

V9:
* None

V8:
* None

V7:
* None

V6:
* None

V5:
* None

V4:
* None

V3:
* Updated commit message and description to explicitly mention that defines are
  added only for some of the features and not all.

V2:
* None

 include/uapi/linux/pci_regs.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index f28e562d7ca8..d28d0319d932 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -713,7 +713,9 @@
 #define PCI_EXT_CAP_ID_DPC	0x1D	/* Downstream Port Containment */
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
-#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PTM
+#define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
+#define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
+#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_16GT
 
 #define PCI_EXT_CAP_DSN_SIZEOF	12
 #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
@@ -1053,4 +1055,14 @@
 #define  PCI_L1SS_CTL1_LTR_L12_TH_SCALE	0xe0000000  /* LTR_L1.2_THRESHOLD_Scale */
 #define PCI_L1SS_CTL2		0x0c	/* Control 2 Register */
 
+/* Data Link Feature */
+#define PCI_DLF_CAP		0x04	/* Capabilities Register */
+#define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
+
+/* Physical Layer 16.0 GT/s */
+#define PCI_PL_16GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
+#define  PCI_PL_16GT_LE_CTRL_DSP_TX_PRESET_MASK		0x0000000F
+#define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_MASK		0x000000F0
+#define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_SHIFT	4
+
 #endif /* LINUX_PCI_REGS_H */
-- 
2.17.1
