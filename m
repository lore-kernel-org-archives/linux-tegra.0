From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: host: xhci-tegra: use devm_platform_ioremap_resource() to simplify code
Date: Wed, 4 Sep 2019 17:10:04 +0800
Message-ID: <20190904091004.3808-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/host/xhci-tegra.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 2ff7c91..742960a 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -970,7 +970,7 @@ static int tegra_xusb_powerdomain_init(struct device *dev,
 static int tegra_xusb_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb_mbox_msg msg;
-	struct resource *res, *regs;
+	struct resource *regs;
 	struct tegra_xusb *tegra;
 	struct xhci_hcd *xhci;
 	unsigned int i, j, k;
@@ -992,14 +992,12 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	if (IS_ERR(tegra->regs))
 		return PTR_ERR(tegra->regs);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	tegra->fpci_base = devm_ioremap_resource(&pdev->dev, res);
+	tegra->fpci_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(tegra->fpci_base))
 		return PTR_ERR(tegra->fpci_base);
 
 	if (tegra->soc->has_ipfs) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-		tegra->ipfs_base = devm_ioremap_resource(&pdev->dev, res);
+		tegra->ipfs_base = devm_platform_ioremap_resource(pdev, 2);
 		if (IS_ERR(tegra->ipfs_base))
 			return PTR_ERR(tegra->ipfs_base);
 	}
-- 
2.7.4
