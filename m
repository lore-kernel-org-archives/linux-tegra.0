From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 0/7] USB: make ehci-tegra its own module
Date: Wed,  5 Jun 2013 14:03:02 -0600
Message-ID: <1370462589-3090-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

ehci-tegra is currently built into the main ehci-hcd driver, rather than
being a separate module. This causes issues with multi-platform ARM
kernels. This series separates ehci-tegra into its own module to avoid
those problems.

Manjunath Goudar originally wrote most of this series. I've since cleaned
it up, rebased it on Venu's recent changes to the Tegra USB driver, and
tested it.

Note that I expect this series will need to go through the USB PHY tree,
since it builds upon Venu's recent changes to the Tegra USB driver, which
were applied there.

Manjunath Goudar (3):
  usb: phy: export ulpi_viewport_access_ops
  USB: EHCI: export ehci_handshake for ehci-hcd sub-drivers
  USB: EHCI: make ehci-tegra a separate driver

Stephen Warren (4):
  usb: phy: add MODULE_LICENSE to phy-tegra-usb.c
  USB: EHCI: tegra: remove all power management
  USB: EHCI: tegra: fix circular module dependencies
  USB: EHCI: tegra: make use of ehci->priv

 drivers/usb/host/Kconfig            |   2 +-
 drivers/usb/host/Makefile           |   1 +
 drivers/usb/host/ehci-hcd.c         |  22 +-
 drivers/usb/host/ehci-hub.c         |   4 +-
 drivers/usb/host/ehci-tegra.c       | 474 ++++++++----------------------------
 drivers/usb/host/ehci.h             |   2 +
 drivers/usb/phy/phy-tegra-usb.c     |  43 +++-
 drivers/usb/phy/phy-ulpi-viewport.c |   2 +
 include/linux/usb/tegra_usb_phy.h   |   4 -
 9 files changed, 165 insertions(+), 389 deletions(-)

-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
