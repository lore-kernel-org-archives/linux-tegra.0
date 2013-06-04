From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 0/6] USB: make ehci-tegra its own module
Date: Tue,  4 Jun 2013 17:53:28 -0600
Message-ID: <1370390014-25452-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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

Stephen Warren (3):
  usb: phy: add MODULE_LICENSE to phy-tegra-usb.c
  USB: EHCI: tegra: remove all power management
  USB: EHCI: tegra: fix circular module dependencies

 drivers/usb/host/Kconfig            |   2 +-
 drivers/usb/host/Makefile           |   1 +
 drivers/usb/host/ehci-hcd.c         |  22 +-
 drivers/usb/host/ehci-hub.c         |   4 +-
 drivers/usb/host/ehci-tegra.c       | 397 +++++++-----------------------------
 drivers/usb/host/ehci.h             |   2 +
 drivers/usb/phy/phy-tegra-usb.c     |  43 +++-
 drivers/usb/phy/phy-ulpi-viewport.c |   2 +
 include/linux/usb/tegra_usb_phy.h   |   4 -
 9 files changed, 131 insertions(+), 346 deletions(-)

-- 
1.8.1.5
