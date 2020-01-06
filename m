From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 11/20] usb: phy: tegra: Use devm_otg_ulpi_create()
Date: Mon,  6 Jan 2020 04:34:07 +0300
Message-ID: <20200106013416.9604-12-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The resource-managed variant removes the necessity for the driver to care
about freeing ULPI resources.

Suggested-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 5b9f031619c5..9adbcdf8d3a1 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -1100,6 +1100,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	enum usb_phy_interface phy_type;
 	struct reset_control *reset;
 	struct resource *res;
+	struct usb_phy *phy;
 	int err;
 
 	tegra_phy = devm_kzalloc(&pdev->dev, sizeof(*tegra_phy), GFP_KERNEL);
@@ -1200,12 +1201,14 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
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
 
@@ -1224,17 +1227,9 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 
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
@@ -1243,11 +1238,6 @@ static int tegra_usb_phy_remove(struct platform_device *pdev)
 
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
