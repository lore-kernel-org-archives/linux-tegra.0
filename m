From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/9] usb: dwc3: fix PHY error handling
Date: Fri, 15 Mar 2013 11:12:02 +0200
Message-ID: <1363338730-14581-2-git-send-email-balbi@ti.com>
References: <1363338730-14581-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363338730-14581-1-git-send-email-balbi-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

PHY layer no longer returns NULL. It will
return -ENXIO when PHY layer isn't enabled
and we can use that to bail out instead of
request a probe deferral.

Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/dwc3/core.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c845e70..e2325ad 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -434,12 +434,32 @@ static int dwc3_probe(struct platform_device *pdev)
 		dwc->usb3_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB3);
 	}
 
-	if (IS_ERR_OR_NULL(dwc->usb2_phy)) {
+	if (IS_ERR(dwc->usb2_phy)) {
+		ret = PTR_ERR(dwc->usb2_phy);
+
+		/*
+		 * if -ENXIO is returned, it means PHY layer wasn't
+		 * enabled, so it makes no sense to return -EPROBE_DEFER
+		 * in that case, since no PHY driver will ever probe.
+		 */
+		if (ret == -ENXIO)
+			return ret;
+
 		dev_err(dev, "no usb2 phy configured\n");
 		return -EPROBE_DEFER;
 	}
 
-	if (IS_ERR_OR_NULL(dwc->usb3_phy)) {
+	if (IS_ERR(dwc->usb3_phy)) {
+		ret = PTR_ERR(dwc->usb2_phy);
+
+		/*
+		 * if -ENXIO is returned, it means PHY layer wasn't
+		 * enabled, so it makes no sense to return -EPROBE_DEFER
+		 * in that case, since no PHY driver will ever probe.
+		 */
+		if (ret == -ENXIO)
+			return ret;
+
 		dev_err(dev, "no usb3 phy configured\n");
 		return -EPROBE_DEFER;
 	}
-- 
1.8.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
