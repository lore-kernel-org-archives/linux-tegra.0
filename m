From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 07/16] usb: phy: tegra: Use devm_otg_ulpi_create()
Date: Sat, 28 Dec 2019 23:33:49 +0300
Message-ID: <20191228203358.23490-8-digetx@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The resource-managed variant removes the necessity for the driver to care
about freeing ULPI resources.

Suggested-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 0a07efc9de06..a3d102f6f81e 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -1080,6 +1080,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	enum usb_phy_interface phy_type;
 	struct reset_control *reset;
 	struct resource *res;
+	struct usb_phy *phy;
 	int err;
 
 	tegra_phy = devm_kzalloc(&pdev->dev, sizeof(*tegra_phy), GFP_KERNEL);
@@ -1180,12 +1181,14 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 			return err;
 		}
 
-		tegra_phy->ulpi = otg_ulpi_create(&ulpi_viewport_access_ops, 0);
-		if (!tegra_phy->ulpi) {
+		phy = devm_otg_ulpi_create(&pdev->dev,
+					   &ulpi_viewport_access_ops, 0);
+		if (!phy) {
 			dev_err(&pdev->dev, "Failed to create ULPI OTG\n");
 			return -ENOMEM;
 		}
 
+		tegra_phy->ulpi = phy;
 		tegra_phy->ulpi->io_priv = tegra_phy->regs + ULPI_VIEWPORT;
 		break;
 
@@ -1204,17 +1207,9 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 
 	err = usb_add_phy_dev(&tegra_phy->u_phy);
 	if (err)
-		goto free_ulpi;
+		return err;
 
 	return 0;
-
-free_ulpi:
-	if (tegra_phy->ulpi) {
-		kfree(tegra_phy->ulpi->otg);
-		kfree(tegra_phy->ulpi);
-	}
-
-	return err;
 }
 
 static int tegra_usb_phy_remove(struct platform_device *pdev)
@@ -1223,11 +1218,6 @@ static int tegra_usb_phy_remove(struct platform_device *pdev)
 
 	usb_remove_phy(&tegra_phy->u_phy);
 
-	if (tegra_phy->ulpi) {
-		kfree(tegra_phy->ulpi->otg);
-		kfree(tegra_phy->ulpi);
-	}
-
 	return 0;
 }
 
-- 
2.24.0
