From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 2/7] PCI: tegra: use new OF interrupt mapping when possible
Date: Fri, 28 Feb 2014 18:28:38 +0100
Message-ID: <1393608523-17509-3-git-send-email-l.stach@pengutronix.de>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Shawn Guo <shawn.guo@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Jingoo Han <jg1.han@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Tim Harvey <tharvey@gateworks.com>, Richard Zhu <r65037@freescale.com>, Arnd Bergmann <arnd@arndb.de>, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

This is the recommended method of doing the IRQ
mapping. For old devicetrees we fall back to the
previous practice.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/pci/host/pci-tegra.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 330f7e3a32dd..083cf37ca047 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -639,10 +639,15 @@ static int tegra_pcie_setup(int nr, struct pci_sys_data *sys)
 static int tegra_pcie_map_irq(const struct pci_dev *pdev, u8 slot, u8 pin)
 {
 	struct tegra_pcie *pcie = sys_to_pcie(pdev->bus->sysdata);
+	int irq;
 
 	tegra_cpuidle_pcie_irqs_in_use();
 
-	return pcie->irq;
+	irq = of_irq_parse_and_map_pci(pdev, slot, pin);
+	if (!irq)
+		irq = pcie->irq;
+
+	return irq;
 }
 
 static void tegra_pcie_add_bus(struct pci_bus *bus)
-- 
1.8.5.3
