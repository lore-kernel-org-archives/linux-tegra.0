From: Jiang Liu <liuj97@gmail.com>
Subject: [PATCH v3 12/32] PCI/ARM: use PCIe capabilities access functions to simplify implementation
Date: Wed,  1 Aug 2012 23:54:17 +0800
Message-ID: <1343836477-7287-13-git-send-email-jiang.liu@huawei.com>
References: <1343836477-7287-1-git-send-email-jiang.liu@huawei.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1343836477-7287-1-git-send-email-jiang.liu@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Don Dutile <ddutile@redhat.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Jiang Liu <jiang.liu@huawei.com>, Yinghai Lu <yinghai@kernel.org>, Taku Izumi <izumi.taku@jp.fujitsu.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>, Yijing Wang <wangyijing@huawei.com>, Russell King <linux@arm.linux.org.uk>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Jiang Liu <liuj97@gmail.com>
List-Id: linux-tegra@vger.kernel.org

From: Jiang Liu <jiang.liu@huawei.com>

Use PCIe capabilities access functions to simplify PCIe ARM implementation.

Signed-off-by: Jiang Liu <liuj97@gmail.com>
---
 arch/arm/mach-tegra/pcie.c |   13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
index 0e09137..5f99d33 100644
--- a/arch/arm/mach-tegra/pcie.c
+++ b/arch/arm/mach-tegra/pcie.c
@@ -367,17 +367,8 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0bf1, tegra_pcie_fixup_class);
 /* Tegra PCIE requires relaxed ordering */
 static void __devinit tegra_pcie_relax_enable(struct pci_dev *dev)
 {
-	u16 val16;
-	int pos = pci_find_capability(dev, PCI_CAP_ID_EXP);
-
-	if (pos <= 0) {
-		dev_err(&dev->dev, "skipping relaxed ordering fixup\n");
-		return;
-	}
-
-	pci_read_config_word(dev, pos + PCI_EXP_DEVCTL, &val16);
-	val16 |= PCI_EXP_DEVCTL_RELAX_EN;
-	pci_write_config_word(dev, pos + PCI_EXP_DEVCTL, val16);
+	pci_pcie_capability_change_word(dev, PCI_EXP_DEVCTL,
+					PCI_EXP_DEVCTL_RELAX_EN, 0);
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID, PCI_ANY_ID, tegra_pcie_relax_enable);
 
-- 
1.7.9.5
