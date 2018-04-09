From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 0/3] Tegra's USB driver dependency fix
Date: Tue, 10 Apr 2018 01:02:56 +0300
Message-ID: <cover.1523307883.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra uses two different USB drivers for host / device controllers, one is
tegra-ehci (host) and other is ChipIdea (UDC). Currently ChipIdea driver
implicitly (and incorrectly) depends on Tegra's EHCI driver because Tegra's
PHY driver is built only when host driver is built, also host controller
shares HW resets with the device controller and host driver manages the
resets solely. This small series fixes the dependency by moving out reset
controls to the PHY driver and making them shared, then the driver build
dependency is resolved.

Changelog:

v3:
        Fixed Tegra's EHCI driver dependency on functions exported by the
        Tegra's PHY driver (was reported by "kbuild test robot" for v2) by
        making host driver to select the PHY driver in Kconfig.

v2:
        Added missed USB_ULPI dependency to USB_TEGRA_PHY.

        Corrected UTMI pads reset by moving reset assert/deassert to the
        PHY's probe.

        Removed function names as per Thierry's suggestion.

Dmitry Osipenko (3):
  usb: phy: tegra: Cleanup error messages
  usb: tegra: Move utmi-pads reset from ehci-tegra to tegra-phy
  usb: phy: Add Kconfig entry for Tegra PHY driver

 drivers/usb/host/Kconfig          |   4 +-
 drivers/usb/host/ehci-tegra.c     |  87 +++++++++++------------
 drivers/usb/phy/Kconfig           |   9 +++
 drivers/usb/phy/Makefile          |   2 +-
 drivers/usb/phy/phy-tegra-usb.c   | 140 ++++++++++++++++++++++++++++++--------
 include/linux/usb/tegra_usb_phy.h |   2 +
 6 files changed, 163 insertions(+), 81 deletions(-)

-- 
2.16.3
