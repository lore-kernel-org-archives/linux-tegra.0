From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 3/4] xhci: Export symbols used by host-controller drivers
Date: Tue, 19 Aug 2014 10:01:51 -0700
Message-ID: <1408467712-27497-4-git-send-email-abrestic@chromium.org>
References: <1408467712-27497-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408467712-27497-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In preparation for allowing the xHCI host controller drivers to be built
as separate modules, export symbols from the xHCI core that may be used
by the host controller drivers.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes from v2:
 - exported xhci_dbg_quirks tracepoint
Changes from v1:
 - exported xhci_run()
---
 drivers/usb/host/xhci-dbg.c   | 1 +
 drivers/usb/host/xhci-trace.c | 2 ++
 drivers/usb/host/xhci.c       | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/drivers/usb/host/xhci-dbg.c b/drivers/usb/host/xhci-dbg.c
index eb009a4..bb89175 100644
--- a/drivers/usb/host/xhci-dbg.c
+++ b/drivers/usb/host/xhci-dbg.c
@@ -594,3 +594,4 @@ void xhci_dbg_trace(struct xhci_hcd *xhci, void (*trace)(struct va_format *),
 	trace(&vaf);
 	va_end(args);
 }
+EXPORT_SYMBOL_GPL(xhci_dbg_trace);
diff --git a/drivers/usb/host/xhci-trace.c b/drivers/usb/host/xhci-trace.c
index 7cf30c8..367b630 100644
--- a/drivers/usb/host/xhci-trace.c
+++ b/drivers/usb/host/xhci-trace.c
@@ -13,3 +13,5 @@
 
 #define CREATE_TRACE_POINTS
 #include "xhci-trace.h"
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(xhci_dbg_quirks);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a5cd831..edfc96f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -653,6 +653,7 @@ int xhci_run(struct usb_hcd *hcd)
 			"Finished xhci_run for USB2 roothub");
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xhci_run);
 
 static void xhci_only_stop_hcd(struct usb_hcd *hcd)
 {
@@ -927,6 +928,7 @@ int xhci_suspend(struct xhci_hcd *xhci)
 
 	return rc;
 }
+EXPORT_SYMBOL_GPL(xhci_suspend);
 
 /*
  * start xHC (not bus-specific)
@@ -1078,6 +1080,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 	return retval;
 }
+EXPORT_SYMBOL_GPL(xhci_resume);
 #endif	/* CONFIG_PM */
 
 /*-------------------------------------------------------------------------*/
@@ -4892,6 +4895,7 @@ error:
 	kfree(xhci);
 	return retval;
 }
+EXPORT_SYMBOL_GPL(xhci_gen_setup);
 
 static const struct hc_driver xhci_hc_driver = {
 	.description =		"xhci-hcd",
-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
