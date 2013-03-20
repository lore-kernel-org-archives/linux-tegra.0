From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] USB: EHCI: have USB_EHCI_TEGRA select USB_PHY
Date: Wed, 20 Mar 2013 11:10:38 -0600
Message-ID: <1363799438-24665-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

ehci-tegra.c calls functions in phy-usb-tegra.c. Hence, that file must
be built if ehci-tegra.c is. To ensure this, drivers/usb/phy/Makefile
always builds phy-usb-tegra.c under the same Kconfig option that builds
ehci-tegra.c. However, after the following commits:

1c20888 usb: Makefile: fix drivers/usb/phy/ Makefile entry
a0e6312 usb: phy: move all PHY drivers to drivers/usb/phy/
fd89149 usb: phy: remove CONFIG_USB_OTG_UTILS

drivers/usb/Makefile requires USB_PHY to be enabled in order to process
drivers/usb/phy/Makefile at all. To solve this, have USB_EHCI_TEGRA
select USB_PHY.

The long-term solution is to either/both:

a) Create a separate Kconfig option for phy-usb-tegra.c, update
   USB_EHCI_TEGRA to depend on that.

b) Have ehci-tegra.c access phy-usb-tegra.c using standardized APIs, and
   hence avoid the direct dependency. Part of this will be resolved by
   Venu's forthcoming Tegra USB cleanup series. Other aspects may rely
   on Kishon's generic PHY framework APIs.

In either case, the changes will require some updates to tegra_defconfig.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 8e1bca3..f7af098 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -180,6 +180,7 @@ config USB_EHCI_TEGRA
        boolean "NVIDIA Tegra HCD support"
        depends on USB_EHCI_HCD && ARCH_TEGRA
        select USB_EHCI_ROOT_HUB_TT
+       select USB_PHY
        help
          This driver enables support for the internal USB Host Controllers
          found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
