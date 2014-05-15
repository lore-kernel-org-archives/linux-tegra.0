From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [RFC PATCH 00/10] Tegra XHCI support
Date: Wed, 14 May 2014 17:32:56 -0700
Message-ID: <1400113986-339-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is a first pass at the host and PHY drivers necessary for USB3.0
support on Tegra114 and Tegra124.  The Tegra XHCI host controller requires
external firmware [1] which must be loaded before using any USB ports owned
by the controller.  The XUSB PHY driver handles mapping and enabling of
the UTMI, HSIC, and SuperSpeed pads to the XHCI controller.

Tested on a Venice2 with a variety of USB2.0 and USB3.0 memory sticks
and ethernet dongles.  

Notes:
 - I've included support for Tegra114, but since I don't have Tegra114-based
   hardware, it is completely untested.
 - The PCIe and SATA PHYs also are programmed using the XUSB_PADCTL space
   as well.  At least some of the code can be re-used, specifically with
   respect to lane programming.  I believe Thierry is working on the PCIe
   parts of this.
 - HSIC support is mostly untested and I think there are still some issues
   to work out there.  I do have a Tegra124 board with a HSIC hub so I'll
   try to sort those out.
 - The DT bindings are rough, comments/suggestions very welcome.
 - The XUSB PHY driver doesn't play nice with the existing Tegra USB2.0
   PHY driver, so I've assinged all USB ports to XUSB in the DT for now.
 - Patch 5 is a temporary hack to get to the fuse data.  Internally we
   have this based on Peter's fuse driver series [2], but I haven't seen
   any activity on that upstream lately.

Based on work by:
  a lot of people, but from what I can tell from the L4T tree [3], the
  original authors of the Tegra XHCI driver are:
    Ajay Gupta <ajayg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
    Bharath Yadav <byadav-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

[1] http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/xhci-firmware-2014.05.09.00.00.tbz2
[2] http://patchwork.ozlabs.org/patch/314883/
[3] git://nv-tegra.nvidia.com/linux-3.10.git

Andrew Bresticker (8):
  clk: tegra: Fix xusb_hs_src clock hierarchy
  clk: tegra: Initialize xusb clocks
  ARM: tegra: Export function to read USB calibration data
  usb: xhci: Add Tegra XHCI host-controller driver
  phy: Add Tegra XUSB PHY driver
  ARM: tegra124: Bind CAR to syscon device
  ARM: tegra124: Add XHCI controller and PHY
  ARM: tegra124: Enable XHCI on Venice2

Jim Lin (2):
  clk: tegra: Enable hardware control of PLLE
  clk: tegra: Fix xusb_fs_src mux

 .../bindings/phy/nvidia,tegra-xusb-phy.txt         |   76 ++
 .../devicetree/bindings/usb/nvidia,tegra-xhci.txt  |   42 +
 arch/arm/boot/dts/tegra124-venice2.dts             |   46 +-
 arch/arm/boot/dts/tegra124.dtsi                    |   39 +-
 arch/arm/mach-tegra/fuse.c                         |   13 +
 drivers/clk/tegra/clk-id.h                         |    1 +
 drivers/clk/tegra/clk-pll.c                        |   33 +-
 drivers/clk/tegra/clk-tegra-periph.c               |   10 +-
 drivers/clk/tegra/clk-tegra114.c                   |   22 +-
 drivers/clk/tegra/clk-tegra124.c                   |   21 +-
 drivers/phy/Kconfig                                |   11 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/phy-tegra-xusb.c                       | 1171 ++++++++++++++++++++
 drivers/phy/phy-tegra-xusb.h                       |  270 +++++
 drivers/usb/host/Kconfig                           |   12 +
 drivers/usb/host/Makefile                          |    2 +
 drivers/usb/host/xhci-tegra.c                      |  796 +++++++++++++
 drivers/usb/host/xhci-tegra.h                      |  131 +++
 include/dt-bindings/clock/tegra114-car.h           |    3 +-
 include/dt-bindings/clock/tegra124-car.h           |    3 +-
 include/linux/tegra-soc.h                          |    1 +
 include/linux/usb/tegra_xusb.h                     |   66 ++
 22 files changed, 2717 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-phy.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.txt
 create mode 100644 drivers/phy/phy-tegra-xusb.c
 create mode 100644 drivers/phy/phy-tegra-xusb.h
 create mode 100644 drivers/usb/host/xhci-tegra.c
 create mode 100644 drivers/usb/host/xhci-tegra.h
 create mode 100644 include/linux/usb/tegra_xusb.h

-- 
1.9.1.423.g4596e3a

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
