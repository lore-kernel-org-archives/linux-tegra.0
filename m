From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] PCI: tegra: Remove PLL power supplies
Date: Tue, 23 Jun 2020 16:55:28 +0200
Message-ID: <20200623145528.1658337-2-thierry.reding@gmail.com>
References: <20200623145528.1658337-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200623145528.1658337-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra PCI controller driver doesn't need to control the PLL power
supplies directly, but rather uses the pads provided by the XUSB pad
controller, which in turn is responsible for supplying power to the
PLLs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/controller/pci-tegra.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 235b456698fc..f87a09d21eb0 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2025,7 +2025,7 @@ static int tegra_pcie_get_regulators(struct tegra_pcie *pcie, u32 lane_mask)
 		pcie->supplies[i++].supply = "hvdd-pex";
 		pcie->supplies[i++].supply = "vddio-pexctl-aud";
 	} else if (of_device_is_compatible(np, "nvidia,tegra210-pcie")) {
-		pcie->num_supplies = 6;
+		pcie->num_supplies = 3;
 
 		pcie->supplies = devm_kcalloc(pcie->dev, pcie->num_supplies,
 					      sizeof(*pcie->supplies),
@@ -2033,14 +2033,11 @@ static int tegra_pcie_get_regulators(struct tegra_pcie *pcie, u32 lane_mask)
 		if (!pcie->supplies)
 			return -ENOMEM;
 
-		pcie->supplies[i++].supply = "avdd-pll-uerefe";
 		pcie->supplies[i++].supply = "hvddio-pex";
 		pcie->supplies[i++].supply = "dvddio-pex";
-		pcie->supplies[i++].supply = "dvdd-pex-pll";
-		pcie->supplies[i++].supply = "hvdd-pex-pll-e";
 		pcie->supplies[i++].supply = "vddio-pex-ctl";
 	} else if (of_device_is_compatible(np, "nvidia,tegra124-pcie")) {
-		pcie->num_supplies = 7;
+		pcie->num_supplies = 4;
 
 		pcie->supplies = devm_kcalloc(dev, pcie->num_supplies,
 					      sizeof(*pcie->supplies),
@@ -2050,11 +2047,8 @@ static int tegra_pcie_get_regulators(struct tegra_pcie *pcie, u32 lane_mask)
 
 		pcie->supplies[i++].supply = "avddio-pex";
 		pcie->supplies[i++].supply = "dvddio-pex";
-		pcie->supplies[i++].supply = "avdd-pex-pll";
 		pcie->supplies[i++].supply = "hvdd-pex";
-		pcie->supplies[i++].supply = "hvdd-pex-pll-e";
 		pcie->supplies[i++].supply = "vddio-pex-ctl";
-		pcie->supplies[i++].supply = "avdd-pll-erefe";
 	} else if (of_device_is_compatible(np, "nvidia,tegra30-pcie")) {
 		bool need_pexa = false, need_pexb = false;
 
-- 
2.27.0
