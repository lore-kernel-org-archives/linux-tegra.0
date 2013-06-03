From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/6] usb: phy: export ulpi_viewport_access_ops
Date: Mon,  3 Jun 2013 13:21:25 -0600
Message-ID: <1370287290-21579-2-git-send-email-swarren@wwwdotorg.org>
References: <1370287290-21579-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370287290-21579-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

In order to build a ULPI PHY driver as a module, this symbol needs to
be exported.

Signed-off-by: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[swarren, reworked Manjunath's patches to split them more logically]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-ulpi-viewport.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/phy/phy-ulpi-viewport.c b/drivers/usb/phy/phy-ulpi-viewport.c
index c5ba7e5..4442425 100644
--- a/drivers/usb/phy/phy-ulpi-viewport.c
+++ b/drivers/usb/phy/phy-ulpi-viewport.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/usb.h>
 #include <linux/io.h>
 #include <linux/usb/otg.h>
@@ -78,3 +79,4 @@ struct usb_phy_io_ops ulpi_viewport_access_ops = {
 	.read	= ulpi_viewport_read,
 	.write	= ulpi_viewport_write,
 };
+EXPORT_SYMBOL_GPL(ulpi_viewport_access_ops);
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
