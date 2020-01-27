From: Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH] usb: phy: tegra: make the code simple by devm_platform_ioremap_resource()
Date: Mon, 27 Jan 2020 21:58:41 +0800
Message-ID: <20200127135841.17935-1-zhengdejin5@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
List-Id: linux-tegra@vger.kernel.org

make the code simple by use devm_platform_ioremap_resource() function
to replace platform_get_resource() and devm_ioremap().

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index ea7ef1dc0b42..8220bb4ce1ed 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -944,20 +944,12 @@ static int read_utmi_param(struct platform_device *pdev, const char *param,
 static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 			  struct platform_device *pdev)
 {
-	struct resource *res;
 	int err;
 	struct tegra_utmip_config *config;
 
 	tegra_phy->is_ulpi_phy = false;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res) {
-		dev_err(&pdev->dev, "Failed to get UTMI pad regs\n");
-		return  -ENXIO;
-	}
-
-	tegra_phy->pad_regs = devm_ioremap(&pdev->dev, res->start,
-		resource_size(res));
+	tegra_phy->pad_regs = devm_platform_ioremap_resource(pdev, 1);
 	if (!tegra_phy->pad_regs) {
 		dev_err(&pdev->dev, "Failed to remap UTMI pad regs\n");
 		return -ENOMEM;
@@ -1054,7 +1046,6 @@ MODULE_DEVICE_TABLE(of, tegra_usb_phy_id_table);
 static int tegra_usb_phy_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
-	struct resource *res;
 	struct tegra_usb_phy *tegra_phy = NULL;
 	struct device_node *np = pdev->dev.of_node;
 	enum usb_phy_interface phy_type;
@@ -1071,14 +1062,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	}
 	tegra_phy->soc_config = match->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Failed to get I/O memory\n");
-		return  -ENXIO;
-	}
-
-	tegra_phy->regs = devm_ioremap(&pdev->dev, res->start,
-		resource_size(res));
+	tegra_phy->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (!tegra_phy->regs) {
 		dev_err(&pdev->dev, "Failed to remap I/O memory\n");
 		return -ENOMEM;
-- 
2.25.0
