From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] USB: ehci-tegra: remove PORT_RWC_BITS when setting USB_PORT_FEAT_ENABLE
Date: Wed, 25 Apr 2012 12:31:10 -0600
Message-ID: <1335378670-26860-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In the SetPortFeature/USB_PORT_FEAT_ENABLE case, ehci_hub_control()
would read from status_reg, modify the value, and write the result back to
status_reg. This would clear any bits in PORT_RWC_BITS that were set in
the register. Fix this by masking these bits off before the write.

This is logically the same change as 6d5f89c "USB: EHCI: remove
PORT_RWC_BITS when clearing USB_PORT_FEAT_ENABLE", but applied to the
Tegra driver rather than the USB core.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 5baf8a2..a6e9b2c 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -164,7 +164,7 @@ static int tegra_ehci_hub_control(
 			goto done;
 		}
 
-		temp &= ~PORT_WKCONN_E;
+		temp &= ~(PORT_RWC_BITS | PORT_WKCONN_E);
 		temp |= PORT_WKDISC_E | PORT_WKOC_E;
 		ehci_writel(ehci, temp | PORT_SUSPEND, status_reg);
 
-- 
1.7.0.4
