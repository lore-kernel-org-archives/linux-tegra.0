From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH v6 24/30] PCI/tegra: Remove redundant tegra_pcie_scan_bus()
Date: Mon, 9 Mar 2015 10:34:21 +0800
Message-ID: <1425868467-9667-25-git-send-email-wangyijing@huawei.com>
References: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: linux-ia64@vger.kernel.org, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@gmail.com>, Yijing Wang <wangyijing@huawei.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-m68k@lists.linux-m68k.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Yinghai Lu <yinghai@kernel.org>, linux-arm-kernel@lists.infradead.org, Liviu Dudau <liviu@dudau.co.uk>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, linux-alpha@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
List-Id: linux-tegra@vger.kernel.org

Now pci_scan_root_bus() is almost similar to
pci_create_root_bus() + pci_scan_child_bus().
So we could use common pci_scan_root_bus() in
pci_common_init_dev() to scan pci busses.
tegra_pcie_scan_bus() is redundant, remove it.

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: linux-tegra@vger.kernel.org
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pci-tegra.c |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 00e9272..10c0571 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -630,21 +630,6 @@ static int tegra_pcie_map_irq(const struct pci_dev *pdev, u8 slot, u8 pin)
 	return irq;
 }
 
-static struct pci_bus *tegra_pcie_scan_bus(int nr, struct pci_sys_data *sys)
-{
-	struct tegra_pcie *pcie = sys_to_pcie(sys);
-	struct pci_bus *bus;
-
-	bus = pci_create_root_bus(pcie->dev, sys->busnr, &tegra_pcie_ops, sys,
-				  &sys->resources);
-	if (!bus)
-		return NULL;
-
-	pci_scan_child_bus(bus);
-
-	return bus;
-}
-
 static irqreturn_t tegra_pcie_isr(int irq, void *arg)
 {
 	const char *err_msg[] = {
@@ -1831,7 +1816,6 @@ static int tegra_pcie_enable(struct tegra_pcie *pcie)
 	hw.private_data = (void **)&pcie;
 	hw.setup = tegra_pcie_setup;
 	hw.map_irq = tegra_pcie_map_irq;
-	hw.scan = tegra_pcie_scan_bus;
 	hw.ops = &tegra_pcie_ops;
 
 	pci_common_init_dev(pcie->dev, &hw);
-- 
1.7.1
