From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH V2 08/16] PCI: dwc: Add support to enable CDM register check
Date: Fri, 5 Apr 2019 01:24:35 +0530
Message-ID: <1554407683-31580-9-git-send-email-vidyas@nvidia.com>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Add support to enable CDM (Configuration Dependent Module) register check
for any data corruption based on the device-tree flag 'cdm-check'.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1554407755; bh=2r+BgN7djIZIxyR3cmeJ0J62WCNAe33ly16bcMnz9q8=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
	 Content-Type;
	b=jLHEUHlBamovZNPYATDeG+mAEhwsN0zLWWiCGweGfpraYOnfqL+E3D69AK5kFiAib
	 budyFZtqm4w+diWOItNQ1pmUxDm0mvr8imgg5GLOEf43l8SBeBSmJRfb+YCam456lV
	 OOUxY/jpKfotvgE47iQO4T80Bl7btqoSbWr5LunATdEQoDneSA1tZZNbw6U20+npyd
	 hGegs9NrJxHGun6RN+jpp8YvzjpWa2Z45d48SAyapr2p83H4LLXUczSQ5DfwDjhTHh
	 5AIajG4i4gaNhKBTymVygdSaOL0FCtN0702w0dRjviWmtxKfpUuJW0V7Xx7L3cwyOn
	 Wn5g5OlZa2hLg==

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
Changes since [v1]:
* This is a new patch in v2 series

 drivers/pci/controller/dwc/pcie-designware.c | 7 +++++++
 drivers/pci/controller/dwc/pcie-designware.h | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 44c0ba078452..cbab88302989 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -503,4 +503,11 @@ void dw_pcie_setup(struct dw_pcie *pci)
 		break;
 	}
 	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
+
+	if (of_property_read_bool(np, "cdm-check")) {
+		val = dw_pcie_readl_dbi(pci, PCIE_PL_CHK_REG_CONTROL_STATUS);
+		val |= PCIE_PL_CHK_REG_CHK_REG_CONTINUOUS |
+		       PCIE_PL_CHK_REG_CHK_REG_START;
+		dw_pcie_writel_dbi(pci, PCIE_PL_CHK_REG_CONTROL_STATUS, val);
+	}
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index fa41d675c48f..7f57fe019fbf 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -83,6 +83,15 @@
 #define PCIE_MISC_CONTROL_1_OFF		0x8BC
 #define PCIE_DBI_RO_WR_EN		BIT(0)
 
+#define PCIE_PL_CHK_REG_CONTROL_STATUS			0xB20
+#define PCIE_PL_CHK_REG_CHK_REG_START			BIT(0)
+#define PCIE_PL_CHK_REG_CHK_REG_CONTINUOUS		BIT(1)
+#define PCIE_PL_CHK_REG_CHK_REG_COMPARISON_ERROR	BIT(16)
+#define PCIE_PL_CHK_REG_CHK_REG_LOGIC_ERROR		BIT(17)
+#define PCIE_PL_CHK_REG_CHK_REG_COMPLETE		BIT(18)
+
+#define PCIE_PL_CHK_REG_ERR_ADDR			0xB28
+
 /*
  * iATU Unroll-specific register definitions
  * From 4.80 core version the address translation will be made by unroll
-- 
2.7.4
