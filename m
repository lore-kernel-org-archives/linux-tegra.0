From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/6] usb: host: xhci-tegra: Selectively program IPFS
Date: Mon,  1 Apr 2019 12:40:46 +0200
Message-ID: <20190401104050.31355-3-thierry.reding@gmail.com>
References: <20190401104050.31355-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401104050.31355-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
List-Id: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

Starting with Tegra186, the XUSB controller no longer has the IPFS
wrapper. This commit adds a "has_ipfs" field to struct tegra_xusb_soc
that can be used to declare the existence of the IPFS wrapper.

For the existing chips (i.e. Tegra124 and Tegra210), the new field is
set to true. A future patch adding support for Tegra186 will set it to
false.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 43 +++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index efb0cad8710e..4d133bbabdda 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -161,6 +161,7 @@ struct tegra_xusb_soc {
 	} ports;
 
 	bool scale_ss_clock;
+	bool has_ipfs;
 };
 
 struct tegra_xusb {
@@ -637,16 +638,18 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void tegra_xusb_ipfs_config(struct tegra_xusb *tegra,
-				   struct resource *regs)
+static void tegra_xusb_config(struct tegra_xusb *tegra,
+			      struct resource *regs)
 {
 	u32 value;
 
-	value = ipfs_readl(tegra, IPFS_XUSB_HOST_CONFIGURATION_0);
-	value |= IPFS_EN_FPCI;
-	ipfs_writel(tegra, value, IPFS_XUSB_HOST_CONFIGURATION_0);
+	if (tegra->soc->has_ipfs) {
+		value = ipfs_readl(tegra, IPFS_XUSB_HOST_CONFIGURATION_0);
+		value |= IPFS_EN_FPCI;
+		ipfs_writel(tegra, value, IPFS_XUSB_HOST_CONFIGURATION_0);
 
-	usleep_range(10, 20);
+		usleep_range(10, 20);
+	}
 
 	/* Program BAR0 space */
 	value = fpci_readl(tegra, XUSB_CFG_4);
@@ -661,13 +664,15 @@ static void tegra_xusb_ipfs_config(struct tegra_xusb *tegra,
 	value |= XUSB_IO_SPACE_EN | XUSB_MEM_SPACE_EN | XUSB_BUS_MASTER_EN;
 	fpci_writel(tegra, value, XUSB_CFG_1);
 
-	/* Enable interrupt assertion */
-	value = ipfs_readl(tegra, IPFS_XUSB_HOST_INTR_MASK_0);
-	value |= IPFS_IP_INT_MASK;
-	ipfs_writel(tegra, value, IPFS_XUSB_HOST_INTR_MASK_0);
+	if (tegra->soc->has_ipfs) {
+		/* Enable interrupt assertion */
+		value = ipfs_readl(tegra, IPFS_XUSB_HOST_INTR_MASK_0);
+		value |= IPFS_IP_INT_MASK;
+		ipfs_writel(tegra, value, IPFS_XUSB_HOST_INTR_MASK_0);
 
-	/* Set hysteresis */
-	ipfs_writel(tegra, 0x80, IPFS_XUSB_HOST_CLKGATE_HYSTERESIS_0);
+		/* Set hysteresis */
+		ipfs_writel(tegra, 0x80, IPFS_XUSB_HOST_CLKGATE_HYSTERESIS_0);
+	}
 }
 
 static int tegra_xusb_clk_enable(struct tegra_xusb *tegra)
@@ -1015,10 +1020,12 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	if (IS_ERR(tegra->fpci_base))
 		return PTR_ERR(tegra->fpci_base);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	tegra->ipfs_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(tegra->ipfs_base))
-		return PTR_ERR(tegra->ipfs_base);
+	if (tegra->soc->has_ipfs) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
+		tegra->ipfs_base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(tegra->ipfs_base))
+			return PTR_ERR(tegra->ipfs_base);
+	}
 
 	tegra->xhci_irq = platform_get_irq(pdev, 0);
 	if (tegra->xhci_irq < 0)
@@ -1208,7 +1215,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto disable_rpm;
 	}
 
-	tegra_xusb_ipfs_config(tegra, regs);
+	tegra_xusb_config(tegra, regs);
 
 	err = tegra_xusb_load_firmware(tegra);
 	if (err < 0) {
@@ -1380,6 +1387,7 @@ static const struct tegra_xusb_soc tegra124_soc = {
 		.usb3 = { .offset = 0, .count = 2, },
 	},
 	.scale_ss_clock = true,
+	.has_ipfs = true,
 };
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
 
@@ -1411,6 +1419,7 @@ static const struct tegra_xusb_soc tegra210_soc = {
 		.usb3 = { .offset = 0, .count = 4, },
 	},
 	.scale_ss_clock = false,
+	.has_ipfs = true,
 };
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
 
-- 
2.21.0
