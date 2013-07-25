From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 7/9] usb: phy: tegra: Remove custom PHY locating APIs
Date: Thu, 25 Jul 2013 21:38:07 +0300
Message-ID: <1374777489-13093-8-git-send-email-ttynkkynen@nvidia.com>
References: <1374777489-13093-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374777489-13093-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra EHCI driver is no longer using these custom functions, so they
can be removed.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c   | 24 ------------------------
 include/linux/usb/tegra_usb_phy.h |  2 --
 2 files changed, 26 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 441c306..fb5bc8c 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -968,29 +968,5 @@ static struct platform_driver tegra_usb_phy_driver = {
 };
 module_platform_driver(tegra_usb_phy_driver);
 
-static int tegra_usb_phy_match(struct device *dev, void *data)
-{
-	struct tegra_usb_phy *tegra_phy = dev_get_drvdata(dev);
-	struct device_node *dn = data;
-
-	return (tegra_phy->u_phy.dev->of_node == dn) ? 1 : 0;
-}
-
-struct usb_phy *tegra_usb_get_phy(struct device_node *dn)
-{
-	struct device *dev;
-	struct tegra_usb_phy *tegra_phy;
-
-	dev = driver_find_device(&tegra_usb_phy_driver.driver, NULL, dn,
-				 tegra_usb_phy_match);
-	if (!dev)
-		return ERR_PTR(-EPROBE_DEFER);
-
-	tegra_phy = dev_get_drvdata(dev);
-
-	return &tegra_phy->u_phy;
-}
-EXPORT_SYMBOL_GPL(tegra_usb_get_phy);
-
 MODULE_DESCRIPTION("Tegra USB PHY driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 8474153..a095c98 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -60,8 +60,6 @@ struct tegra_usb_phy {
 	int reset_gpio;
 };
 
-struct usb_phy *tegra_usb_get_phy(struct device_node *dn);
