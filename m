From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 2/9] usb: host: tegra: Remove leftover code
Date: Thu, 25 Jul 2013 21:38:02 +0300
Message-ID: <1374777489-13093-3-git-send-email-ttynkkynen@nvidia.com>
References: <1374777489-13093-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374777489-13093-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

ehci-tegra calls devm_usb_get_phy, which will never succeed since the Tegra
PHY does not register itself with the PHY subsystem. It is also completely
redundant since the code has already located a PHY via an internal API.

Call otg_set_host unconditionally to simplify the code since it should
be safe to do so.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 14c1f35..06e8feb 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -58,7 +58,6 @@ static int (*orig_hub_control)(struct usb_hcd *hcd,
 struct tegra_ehci_hcd {
 	struct tegra_usb_phy *phy;
 	struct clk *clk;
-	struct usb_phy *transceiver;
 	int port_resuming;
 	bool needs_double_reset;
 	enum tegra_usb_phy_port_speed port_speed;
@@ -436,26 +435,18 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		goto cleanup_phy;
 	}
 
-	if (pdata->operating_mode == TEGRA_USB_OTG) {
-		tegra->transceiver =
-			devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
-		if (!IS_ERR(tegra->transceiver))
-			otg_set_host(tegra->transceiver->otg, &hcd->self);
-	} else {
-		tegra->transceiver = ERR_PTR(-ENODEV);
-	}
+	otg_set_host(u_phy->otg, &hcd->self);
 
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to add USB HCD\n");
-		goto cleanup_transceiver;
+		goto cleanup_otg_set_host;
 	}
 
 	return err;
 
-cleanup_transceiver:
-	if (!IS_ERR(tegra->transceiver))
-		otg_set_host(tegra->transceiver->otg, NULL);
+cleanup_otg_set_host:
+	otg_set_host(u_phy->otg, NULL);
 cleanup_phy:
 	usb_phy_shutdown(hcd->phy);
 cleanup_clk_en:
@@ -473,8 +464,7 @@ static int tegra_ehci_remove(struct platform_device *pdev)
 	struct tegra_ehci_hcd *tegra =
 		(struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
 
-	if (!IS_ERR(tegra->transceiver))
-		otg_set_host(tegra->transceiver->otg, NULL);
+	otg_set_host(hcd->phy->otg, NULL);
 
 	usb_phy_shutdown(hcd->phy);
 	usb_remove_hcd(hcd);
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
