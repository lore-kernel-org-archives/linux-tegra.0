From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 1/6] usb: phy: export ulpi_viewport_access_ops
Date: Tue,  4 Jun 2013 17:53:29 -0600
Message-ID: <1370390014-25452-2-git-send-email-swarren@wwwdotorg.org>
References: <1370390014-25452-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370390014-25452-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
v2: Include export.h not module.h
---
 drivers/usb/phy/phy-ulpi-viewport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/phy/phy-ulpi-viewport.c b/drivers/usb/phy/phy-ulpi-viewport.c
index c5ba7e5..7c22a539 100644
--- a/drivers/usb/phy/phy-ulpi-viewport.c
+++ b/drivers/usb/phy/phy-ulpi-viewport.c
@@ -12,6 +12,7 @@
  *
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/usb.h>
 #include <linux/io.h>
@@ -78,3 +79,4 @@ struct usb_phy_io_ops ulpi_viewport_access_ops = {
 	.read	= ulpi_viewport_read,
 	.write	= ulpi_viewport_write,
 };
+EXPORT_SYMBOL_GPL(ulpi_viewport_access_ops);
-- 
1.8.1.5
