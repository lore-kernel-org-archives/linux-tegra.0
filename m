From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 07/12] PCI: tegra: Disable AFI dynamic clock gating
Date: Mon, 30 Oct 2017 19:27:18 +0530
Message-ID: <1509371843-22931-8-git-send-email-mmaddireddy@nvidia.com>
References: <1509371843-22931-1-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509371843-22931-1-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When there are 32 outstanding writes from AFI to memory, the outstanding
write counter overflows and indicates that there are "0" outstanding write
transactions. This outstanding write counter is used to generate IDLE
signal to dynamically gate the AFI clock.

When memory controller is under heavy load, its possible that write
completions will come back to AFI after long delay and AFI write counter
overflows. AFI clock gets gated even when there are outstanding
transactions towards memory controller resutling in system hang.

Disable dynamic clock gating of AFI clock to avoid system hang.

Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V3:
* no change in this patch
V2:
* no change in this patch

 drivers/pci/host/pci-tegra.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 4562b0c113a8..c264037112cb 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -103,8 +103,9 @@
 #define AFI_MSI_EN_VEC6		0xa4
 #define AFI_MSI_EN_VEC7		0xa8
 
-#define AFI_CONFIGURATION		0xac
-#define  AFI_CONFIGURATION_EN_FPCI	(1 << 0)
+#define AFI_CONFIGURATION			0xac
+#define  AFI_CONFIGURATION_EN_FPCI		(1 << 0)
+#define  AFI_CONFIGURATION_CLKEN_OVERRIDE	(1 << 31)
 
 #define AFI_FPCI_ERROR_MASKS	0xb0
 
@@ -1059,9 +1060,10 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
 		}
 	}
 
-	/* finally enable PCIe */
+	/* Disable AFI dynamic clock gating and enable PCIe */
 	value = afi_readl(pcie, AFI_CONFIGURATION);
-	value |= AFI_CONFIGURATION_EN_FPCI;
+	value |= (AFI_CONFIGURATION_EN_FPCI |
+			AFI_CONFIGURATION_CLKEN_OVERRIDE);
 	afi_writel(pcie, value, AFI_CONFIGURATION);
 
 	value = AFI_INTR_EN_INI_SLVERR | AFI_INTR_EN_INI_DECERR |
-- 
2.1.4
