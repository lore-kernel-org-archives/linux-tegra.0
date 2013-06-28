From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/9] usb: phy: tegra: Register as an USB PHY.
Date: Sat, 29 Jun 2013 00:37:03 +0300
Message-ID: <1372455427-20898-6-git-send-email-ttynkkynen@nvidia.com>
References: <1372455427-20898-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372455427-20898-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Register the Tegra PHY device instances with the PHY subsystem so that
the Tegra EHCI driver can locate a PHY via the standard APIs.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index ddcac0b..b81310d 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -927,6 +927,12 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
+	err = usb_add_phy_dev(&tegra_phy->u_phy);
+	if (err < 0) {
+		tegra_usb_phy_close(&tegra_phy->u_phy);
+		return err;
+	}
+
 	tegra_phy->u_phy.shutdown = tegra_usb_phy_close;
 	tegra_phy->u_phy.set_suspend = tegra_usb_phy_suspend;
 
@@ -934,6 +940,14 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int tegra_usb_phy_remove(struct platform_device *pdev)
+{
+	struct tegra_usb_phy *tegra_phy = platform_get_drvdata(pdev);
+
+	usb_remove_phy(&tegra_phy->u_phy);
+	return 0;
+}
+
 static struct of_device_id tegra_usb_phy_id_table[] = {
 	{ .compatible = "nvidia,tegra20-usb-phy", },
 	{ },
@@ -942,6 +956,7 @@ MODULE_DEVICE_TABLE(of, tegra_usb_phy_id_table);
 
 static struct platform_driver tegra_usb_phy_driver = {
 	.probe		= tegra_usb_phy_probe,
+	.remove		= tegra_usb_phy_remove,
 	.driver		= {
 		.name	= "tegra-phy",
 		.owner	= THIS_MODULE,
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
