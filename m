From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/4] xhci: Export symbols used by host-controller drivers
Date: Wed,  9 Jul 2014 18:05:49 -0700
Message-ID: <1404954350-26343-4-git-send-email-abrestic@chromium.org>
References: <1404954350-26343-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404954350-26343-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In preparation for allowing the xHCI host controller drivers to be built
as separate modules, export symbols from the xHCI core that may be used
by the host controller drivers.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/usb/host/xhci-dbg.c | 1 +
 drivers/usb/host/xhci.c     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-dbg.c b/drivers/usb/host/xhci-dbg.c
index eb009a4..bb89175 100644
--- a/drivers/usb/host/xhci-dbg.c
+++ b/drivers/usb/host/xhci-dbg.c
@@ -594,3 +594,4 @@ void xhci_dbg_trace(struct xhci_hcd *xhci, void (*trace)(struct va_format *),
 	trace(&vaf);
 	va_end(args);
 }
+EXPORT_SYMBOL_GPL(xhci_dbg_trace);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f681087..4958a60 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -927,6 +927,7 @@ int xhci_suspend(struct xhci_hcd *xhci)
 
 	return rc;
 }
+EXPORT_SYMBOL_GPL(xhci_suspend);
 
 /*
  * start xHC (not bus-specific)
@@ -1078,6 +1079,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 	return retval;
 }
+EXPORT_SYMBOL_GPL(xhci_resume);
 #endif	/* CONFIG_PM */
 
 /*-------------------------------------------------------------------------*/
@@ -4872,6 +4874,7 @@ error:
 	kfree(xhci);
 	return retval;
 }
+EXPORT_SYMBOL_GPL(xhci_gen_setup);
 
 static const struct hc_driver xhci_hc_driver = {
 	.description =		"xhci-hcd",
-- 
2.0.0.526.g5318336
