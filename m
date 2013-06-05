From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 2/7] usb: phy: add MODULE_LICENSE to phy-tegra-usb.c
Date: Wed,  5 Jun 2013 14:03:04 -0600
Message-ID: <1370462589-3090-3-git-send-email-swarren@wwwdotorg.org>
References: <1370462589-3090-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370462589-3090-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When this file is built as a module, it needs a MODULE_LICENSE in order
to access many exported symbols.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
v3: No change.
v2: No change.
---
 drivers/usb/phy/phy-tegra-usb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 5d9af11..f0727f2 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
@@ -869,3 +870,6 @@ struct usb_phy *tegra_usb_get_phy(struct device_node *dn)
 	return &tegra_phy->u_phy;
 }
 EXPORT_SYMBOL_GPL(tegra_usb_get_phy);
+
+MODULE_DESCRIPTION("Tegra USB PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
