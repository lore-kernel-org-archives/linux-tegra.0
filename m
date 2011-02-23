From: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 0/4] Tegra EHCI driver
Date: Tue, 22 Feb 2011 20:07:30 -0800
Message-ID: <1298434054-23274-1-git-send-email-benoit@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch series adds support for EHCI compliant USB host
controllers found in Tegra SoCs. The EHCI driver depends on
the Tegra PHY configuration interface that is used by both
tegra ehci driver and gadget driver. Tested on 2.6.38rc5.

v2 changes:
* Add ulpi_viewport.c for controllers with a viewport register
* Update tegra usb_phy interface
* Remove tegra_ehci_reset and use ehci_reset or tdi_reset instead
* Select USB_ARCH_HAS_EHCI in tegra/Kconfig instead of usb/Kconfig

v3 changes:
* Remove remaining Change-Id from commit messages

v4 change:
* Fix GPL headers
* Remove CONFIG_ULPI_VIEWPORT prompt, fix ulpi_viewport_wait

v5 change:
* ulpi_viewport cleanup


Benoit Goby (3):
  usb: otg: Add ulpi viewport access ops
  ARM: tegra: Add support for Tegra USB PHYs
  usb: host: Add EHCI driver for NVIDIA Tegra SoCs

Robert Morell (1):
  USB: ehci: tegra: Align DMA transfers to 32 bytes

 arch/arm/mach-tegra/Kconfig                |    3 +
 arch/arm/mach-tegra/Makefile               |    1 +
 arch/arm/mach-tegra/include/mach/usb_phy.h |   86 +++
 arch/arm/mach-tegra/usb_phy.c              |  795 ++++++++++++++++++++++++++++
 drivers/usb/host/Kconfig                   |    8 +
 drivers/usb/host/ehci-hcd.c                |    5 +
 drivers/usb/host/ehci-tegra.c              |  715 +++++++++++++++++++++++++
 drivers/usb/otg/Kconfig                    |    7 +
 drivers/usb/otg/Makefile                   |    1 +
 drivers/usb/otg/ulpi_viewport.c            |   80 +++
 include/linux/tegra_usb.h                  |   31 ++
 include/linux/usb/ehci_def.h               |    4 +-
 include/linux/usb/ulpi.h                   |    5 +
 13 files changed, 1740 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-tegra/include/mach/usb_phy.h
 create mode 100644 arch/arm/mach-tegra/usb_phy.c
 create mode 100644 drivers/usb/host/ehci-tegra.c
 create mode 100644 drivers/usb/otg/ulpi_viewport.c
 create mode 100644 include/linux/tegra_usb.h

-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
