From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH V6 00/12] Tegra xHCI support
Date: Mon, 24 Nov 2014 16:17:12 -0800
Message-ID: <1416874644-12070-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series adds support for xHCI on NVIDIA Tegra SoCs.  This includes:
 - patches 1, 2, and 3: minor cleanups for mailbox framework and xHCI,
 - patches 4 and 5: adding a driver for the mailbox used to communicate
   with the xHCI controller's firmware,
 - patches 6 and 7: extending the XUSB pad controller driver to support
   the USB PHY types (UTMI, HSIC, and USB3),
 - patches 8 and 9: adding a xHCI host-controller driver, and
 - patches 10, 11, and 12: updating the relevant DT files.

The mailbox driver (patch 5) has a compile-time dependency on patch 2 and
a run-time dependency on patch 3.  Both the PHY (patch 7) and host (patch 9)
drivers have compile-time dependencies on the mailbox driver.  The host
driver also has a run-time dependency on patch 1.  Because of this, this
entire series should probably go through the Tegra tree.  Patches 11 and 12
should probably not be merged until the controller firmware [0] lands in
linux-firmware since they disable the EHCI controllers.

Tested on Venice2, Jetson TK1, and Big with a variety of USB2.0 and
USB3.0 memory sticks and ethernet dongles.  This has also been tested,
with additional out-of-tree patches, on a Tegra132-based board.

Based on v3.18-rc6.  A branch with the entire series is available at:
  https://github.com/abrestic/linux/tree/tegra-xhci-v6

Notes:
 - HSIC support is mostly untested and I think there are still some issues
   to work out there.  I do have a Tegra124 board with a HSIC hub so I'll
   try to sort those out later.
 - The XUSB padctl driver doesn't play nice with the existing Tegra USB2.0
   PHY driver, so all ports should be assigned to the XHCI controller.

Based on work by:
  a lot of people, but from what I can tell from the L4T tree [1], the
  original authors of the Tegra xHCI driver are:
    Ajay Gupta <ajayg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
    Bharath Yadav <byadav-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

[0] https://patchwork.ozlabs.org/patch/400110/
[1] git://nv-tegra.nvidia.com/linux-3.10.git

Changes from v5:
 - Addressed review comments from Jassi and Felipe.

Changes from v4:
 - Made USB support optional in padctl driver.
 - Made usb3-port a pinconfig property again.
 - Cleaned up mbox_request_channel() error handling and allowed it to defer
   probing (patch 3).
 - Minor xHCI (patch 1) and mailbox framework (patch 2) cleanups suggested
   by Thierry.
 - Addressed Thierry's review comments.

Changes from v3:
 - Fixed USB2.0 flakiness on Jetson-TK1.
 - Switched to 32-bit DMA mask for host.
 - Addressed Stephen's review comments.

Chagnes from v2:
 - Dropped mailbox channel specifier.  The mailbox driver allocates virtual
   channels backed by the single physical channel.
 - Added support for HS_CURR_LEVEL adjustment pinconfig property, which
   will be required for the Blaze board.
 - Addressed Stephen's review comments.

Changes from v1:
 - Converted mailbox driver to use the common mailbox framework.
 - Fixed up host driver so that it can now be built and used as a module.
 - Addressed Stephen's review comments.
 - Misc. cleanups.

Andrew Bresticker (11):
  xhci: Set shared HCD's hcd_priv in xhci_gen_setup
  mailbox: Make struct mbox_controller's ops field const
  of: Add NVIDIA Tegra XUSB mailbox binding
  mailbox: Add NVIDIA Tegra XUSB mailbox driver
  of: Update Tegra XUSB pad controller binding for USB
  pinctrl: tegra-xusb: Add USB PHY support
  of: Add NVIDIA Tegra xHCI controller binding
  usb: xhci: Add NVIDIA Tegra xHCI host-controller driver
  ARM: tegra: jetson-tk1: Add xHCI support
  ARM: tegra: Add Tegra124 XUSB mailbox and xHCI controller
  ARM: tegra: venice2: Add xHCI support

Benson Leung (1):
  mailbox: Fix up error handling in mbox_request_channel()

 .../bindings/mailbox/nvidia,tegra124-xusb-mbox.txt |   32 +
 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |   63 +-
 .../bindings/usb/nvidia,tegra124-xhci.txt          |  104 ++
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   46 +-
 arch/arm/boot/dts/tegra124-venice2.dts             |   79 +-
 arch/arm/boot/dts/tegra124.dtsi                    |   41 +
 drivers/mailbox/Kconfig                            |    3 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/mailbox.c                          |   11 +-
 drivers/mailbox/tegra-xusb-mailbox.c               |  278 +++++
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/pinctrl-tegra-xusb.c               | 1262 +++++++++++++++++++-
 drivers/usb/host/Kconfig                           |   10 +
 drivers/usb/host/Makefile                          |    1 +
 drivers/usb/host/xhci-pci.c                        |    5 -
 drivers/usb/host/xhci-plat.c                       |    5 -
 drivers/usb/host/xhci-tegra.c                      |  931 +++++++++++++++
 drivers/usb/host/xhci.c                            |    6 +-
 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h   |    7 +
 include/linux/mailbox_controller.h                 |    2 +-
 include/soc/tegra/xusb.h                           |   50 +
 21 files changed, 2852 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra124-xusb-mbox.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xhci.txt
 create mode 100644 drivers/mailbox/tegra-xusb-mailbox.c
 create mode 100644 drivers/usb/host/xhci-tegra.c
 create mode 100644 include/soc/tegra/xusb.h

-- 
2.1.0.rc2.206.gedb03e5
