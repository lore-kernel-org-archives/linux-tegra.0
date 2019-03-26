From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH 01/10] PCI: save pci_bus pointer in pcie_port structure
Date: Tue, 26 Mar 2019 20:43:18 +0530
Message-ID: <1553613207-3988-2-git-send-email-vidyas@nvidia.com>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, vidyas@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com
List-Id: linux-tegra@vger.kernel.org

save pci_bus pointer created by PCIe sub-system's
pci_scan_root_bus_bridge() to be used by host controller drivers for post
processing. Tegra host controller driver needs it for the following
reasons
- to derive pci_host_bridge structure from pci_bus which is used to
configure iATU's outbound regions for different windows accesses
- to traverse and configure downstream hierarchy. One such case is,
configuring all immediate downstream devices to D0 state before transiting
link to L2 state. Saving pci_bus pointer seems the best method compared to
deriving it by other means.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
 drivers/pci/controller/dwc/pcie-designware.h      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 25087d3c9a82..15add3cf3945 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -494,6 +494,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		goto error;
 
 	bus = bridge->bus;
+	pp->bus = bus;
 
 	if (pp->ops->scan_bus)
 		pp->ops->scan_bus(pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 377f4c0b52da..70007276bc93 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -175,6 +175,7 @@ struct pcie_port {
 	struct resource		*busn;
 	int			irq;
 	const struct dw_pcie_host_ops *ops;
+	struct pci_bus		*bus;
 	int			msi_irq;
 	struct irq_domain	*irq_domain;
 	struct irq_domain	*msi_domain;
-- 
2.7.4
