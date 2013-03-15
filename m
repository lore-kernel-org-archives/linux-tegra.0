From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/9] usb: gadget: mv_udc_core: fix PHY error handling
Date: Fri, 15 Mar 2013 11:12:03 +0200
Message-ID: <1363338730-14581-3-git-send-email-balbi@ti.com>
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
 drivers/usb/gadget/mv_udc_core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/mv_udc_core.c b/drivers/usb/gadget/mv_udc_core.c
index d550b21..9a68c05 100644
--- a/drivers/usb/gadget/mv_udc_core.c
+++ b/drivers/usb/gadget/mv_udc_core.c
@@ -2127,16 +2127,19 @@ static int mv_udc_probe(struct platform_device *pdev)
 
 	udc->dev = pdev;
 
-#if IS_ENABLED(CONFIG_USB_PHY)
 	if (pdata->mode == MV_USB_MODE_OTG) {
 		udc->transceiver = devm_usb_get_phy(&pdev->dev,
 					USB_PHY_TYPE_USB2);
-		if (IS_ERR_OR_NULL(udc->transceiver)) {
+		if (IS_ERR(udc->transceiver)) {
+			retval = PTR_ERR(udc->transceiver);
+
+			if (retval == -ENXIO)
+				return retval;
+
 			udc->transceiver = NULL;
-			return -ENODEV;
+			return -EPROBE_DEFER;
 		}
 	}
-#endif
 
 	udc->clknum = pdata->clknum;
 	for (clk_i = 0; clk_i < udc->clknum; clk_i++) {
-- 
1.8.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
