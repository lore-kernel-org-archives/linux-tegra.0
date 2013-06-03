From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/6] USB: EHCI: expand struct ehci_driver_overrides
Date: Mon,  3 Jun 2013 13:21:27 -0600
Message-ID: <1370287290-21579-4-git-send-email-swarren@wwwdotorg.org>
References: <1370287290-21579-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370287290-21579-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Some EHCI HCD drivers may need to override additional fields in struct
hc_driver, such as map_urb_for_dma, unmap_urb_for_dma, hub_control. Add
fields to struct ehci_driver_overrides to allow them to do so.

These new overrides will be used at least by the Tegra EHCI driver.

Signed-off-by: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[swarren, reworked Manjunath's patches to split them more logically]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-hcd.c |    6 ++++++
 drivers/usb/host/ehci.h     |    6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 246e124..da1c224 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1211,6 +1211,12 @@ void ehci_init_driver(struct hc_driver *drv,
 		drv->hcd_priv_size += over->extra_priv_size;
 		if (over->reset)
 			drv->reset = over->reset;
+		if (over->map_urb_for_dma)
+			drv->map_urb_for_dma = over->map_urb_for_dma;
+		if (over->unmap_urb_for_dma)
+			drv->unmap_urb_for_dma = over->unmap_urb_for_dma;
+		if (over->hub_control)
+			drv->hub_control = over->hub_control;
 	}
 }
 EXPORT_SYMBOL_GPL(ehci_init_driver);
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index 7c978b2..918008a 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -795,6 +795,12 @@ static inline u32 hc32_to_cpup (const struct ehci_hcd *ehci, const __hc32 *x)
 struct ehci_driver_overrides {
 	size_t		extra_priv_size;
 	int		(*reset)(struct usb_hcd *hcd);
+	int	(*map_urb_for_dma)(struct usb_hcd *hcd, struct urb *urb,
+				   gfp_t mem_flags);
+	void	(*unmap_urb_for_dma)(struct usb_hcd *hcd, struct urb *urb);
+	int	(*hub_control)(struct usb_hcd *hcd,
+				u16 typeReq, u16 wValue, u16 wIndex,
+				char *buf, u16 wLength);
 };
 
 extern void	ehci_init_driver(struct hc_driver *drv,
-- 
1.7.10.4
