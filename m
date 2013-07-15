From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH v2 5/9] usb: phy: tegra: Register as an USB PHY.
Date: Mon, 15 Jul 2013 22:53:45 +0300
Message-ID: <1373918029-28977-6-git-send-email-ttynkkynen@nvidia.com>
References: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, swarren@wwwdotorg.org, gregkh@linuxfoundation.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Register the Tegra PHY device instances with the PHY subsystem so that
the Tegra EHCI driver can locate a PHY via the standard APIs.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index ddcac0b..8397206 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -931,6 +931,22 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	tegra_phy->u_phy.set_suspend = tegra_usb_phy_suspend;
 
 	dev_set_drvdata(&pdev->dev, tegra_phy);
+
+	err = usb_add_phy_dev(&tegra_phy->u_phy);
+	if (err < 0) {
+		tegra_usb_phy_close(&tegra_phy->u_phy);
+		return err;
+	}
+
+	return 0;
+}
+
+static int tegra_usb_phy_remove(struct platform_device *pdev)
+{
+	struct tegra_usb_phy *tegra_phy = platform_get_drvdata(pdev);
+
+	usb_remove_phy(&tegra_phy->u_phy);
+
 	return 0;
 }
 
@@ -942,6 +958,7 @@ MODULE_DEVICE_TABLE(of, tegra_usb_phy_id_table);
 
 static struct platform_driver tegra_usb_phy_driver = {
 	.probe		= tegra_usb_phy_probe,
+	.remove		= tegra_usb_phy_remove,
 	.driver		= {
 		.name	= "tegra-phy",
 		.owner	= THIS_MODULE,
-- 
1.8.1.5
