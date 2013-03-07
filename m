From: Felipe Balbi <balbi@ti.com>
Subject: [PATCH 07/10] usb: gadget: mv_udc_core: check against CONFIG_USB_PHY
Date: Thu, 7 Mar 2013 11:36:06 +0200
Message-ID: <1362648969-13737-8-git-send-email-balbi@ti.com>
References: <1362648969-13737-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1362648969-13737-1-git-send-email-balbi@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Linux USB Mailing List <linux-usb@vger.kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, cbou@mail.ru, dwmw2@infradead.org, stern@rowland.harvard.edu, swarren@wwwdotorg.org, arnd@arndb.de, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Felipe Balbi <balbi@ti.com>
List-Id: linux-tegra@vger.kernel.org

CONFIG_USB_OTG_UTILS will be removed very
soon, so we should check CONFIG_USB_PHY
instead.

Signed-off-by: Felipe Balbi <balbi@ti.com>
---
 drivers/usb/gadget/mv_udc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/mv_udc_core.c b/drivers/usb/gadget/mv_udc_core.c
index d278e8f..d550b21 100644
--- a/drivers/usb/gadget/mv_udc_core.c
+++ b/drivers/usb/gadget/mv_udc_core.c
@@ -2127,7 +2127,7 @@ static int mv_udc_probe(struct platform_device *pdev)
 
 	udc->dev = pdev;
 
-#ifdef CONFIG_USB_OTG_UTILS
+#if IS_ENABLED(CONFIG_USB_PHY)
 	if (pdata->mode == MV_USB_MODE_OTG) {
 		udc->transceiver = devm_usb_get_phy(&pdev->dev,
 					USB_PHY_TYPE_USB2);
-- 
1.8.1.rc1.5.g7e0651a

