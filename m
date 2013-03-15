From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 4/9] usb: musb: omap2430: fix PHY error handling
Date: Fri, 15 Mar 2013 11:12:05 +0200
Message-ID: <1363338730-14581-5-git-send-email-balbi@ti.com>
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
 drivers/usb/musb/omap2430.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index ec460ea..798e029 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -353,7 +353,12 @@ static int omap2430_musb_init(struct musb *musb)
 	else
 		musb->xceiv = devm_usb_get_phy_dev(dev, 0);
 
-	if (IS_ERR_OR_NULL(musb->xceiv)) {
+	if (IS_ERR(musb->xceiv)) {
+		status = PTR_ERR(musb->xceiv);
+
+		if (status == -ENXIO)
+			return status;
+
 		pr_err("HS USB OTG: no transceiver configured\n");
 		return -EPROBE_DEFER;
 	}
-- 
1.8.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
