From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] usb: phy: tegra: Use switch instead of if-else
Date: Thu, 25 Jul 2013 22:24:09 +0300
Message-ID: <1374780249-22207-1-git-send-email-ttynkkynen@nvidia.com>
References: <20130725191734.GB26858@radagast>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130725191734.GB26858@radagast>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use switch() instead of if-else when checking for the PHY type.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Ah :). Here.

 drivers/usb/phy/phy-tegra-usb.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 01c30ff..49fa2da 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -887,11 +887,14 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		of_property_read_bool(np, "nvidia,has-legacy-mode");
 
 	phy_type = of_usb_get_phy_mode(np);
-	if (phy_type == USBPHY_INTERFACE_MODE_UTMI) {
+	switch (phy_type) {
+	case USBPHY_INTERFACE_MODE_UTMI:
 		err = utmi_phy_probe(tegra_phy, pdev);
 		if (err < 0)
 			return err;
-	} else if (phy_type == USBPHY_INTERFACE_MODE_ULPI) {
+		break;
+
+	case USBPHY_INTERFACE_MODE_ULPI:
 		tegra_phy->is_ulpi_phy = true;
 
 		tegra_phy->reset_gpio =
@@ -902,7 +905,9 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 			return tegra_phy->reset_gpio;
 		}
 		tegra_phy->config = NULL;
-	} else {
+		break;
+
+	default:
 		dev_err(&pdev->dev, "phy_type is invalid or unsupported\n");
 		return -EINVAL;
 	}
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
