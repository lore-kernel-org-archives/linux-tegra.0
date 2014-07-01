From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] USB: PHY: tegra: Call tegra_usb_phy_close only on device removal
Date: Wed, 2 Jul 2014 00:08:43 +0300
Message-ID: <1404248923-21086-4-git-send-email-ttynkkynen@nvidia.com>
References: <1404248923-21086-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404248923-21086-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tegra_usb_phy_close() is supposed to undo the effects of
tegra_usb_phy_init(). It is also currently added as the USB PHY shutdown
callback, which is wrong, since tegra_usb_phy_init() is only called
during probing wheras the shutdown callback can get called multiple
times. This then leads to warnings about unbalanced regulator_disable if
the EHCI driver is unbound and bound again at runtime.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index bbe4f8e..72e04a9 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -686,10 +686,8 @@ static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 	return gpio_direction_output(phy->reset_gpio, 0);
 }
 
-static void tegra_usb_phy_close(struct usb_phy *x)
+static void tegra_usb_phy_close(struct tegra_usb_phy *phy)
 {
-	struct tegra_usb_phy *phy = container_of(x, struct tegra_usb_phy, u_phy);
-
 	if (!IS_ERR(phy->vbus))
 		regulator_disable(phy->vbus);
 
@@ -1061,14 +1059,13 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	tegra_phy->u_phy.shutdown = tegra_usb_phy_close;
 	tegra_phy->u_phy.set_suspend = tegra_usb_phy_suspend;
 
 	platform_set_drvdata(pdev, tegra_phy);
 
 	err = usb_add_phy_dev(&tegra_phy->u_phy);
 	if (err < 0) {
-		tegra_usb_phy_close(&tegra_phy->u_phy);
+		tegra_usb_phy_close(tegra_phy);
 		return err;
 	}
 
@@ -1080,6 +1077,7 @@ static int tegra_usb_phy_remove(struct platform_device *pdev)
 	struct tegra_usb_phy *tegra_phy = platform_get_drvdata(pdev);
 
 	usb_remove_phy(&tegra_phy->u_phy);
+	tegra_usb_phy_close(tegra_phy);
 
 	return 0;
 }
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
