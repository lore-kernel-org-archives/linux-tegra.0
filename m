From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] USB: ehci-tegra: don't call set_irq_flags(IRQF_VALID)
Date: Wed, 18 Apr 2012 14:43:40 -0600
Message-ID: <1334781820-27105-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This call is not needed; the IRQ controller should (and does) set up
interrupts correctly. set_irq_flags() isn't exported to modules, to
this also fixes compilation of ehci-tegra.c as a module.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 14532fe..10bb3ea 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -733,7 +733,6 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		err = -ENODEV;
 		goto fail;
 	}
-	set_irq_flags(irq, IRQF_VALID);
 
 #ifdef CONFIG_USB_OTG_UTILS
 	if (pdata->operating_mode == TEGRA_USB_OTG) {
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
