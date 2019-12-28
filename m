From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 00/16] NVIDIA Tegra USB2 drivers clean up
Date: Sat, 28 Dec 2019 23:33:42 +0300
Message-ID: <20191228203358.23490-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This patch series brings the NVIDIA Tegra USB2 PHY driver into a better
shape by refactoring code to match upstream standards, the ChipIdea/Tegra UDC
driver also gets a minor update. Please review and apply, thanks in advance!

Changelog:

v3: - The "Perform general clean up of the code" patch now cleans up couple
      more minor crumbs.

    - Added more "clean up" patches:

        usb: phy: tegra: Disable VBUS regulator on tegra_usb_phy_init failure
        usb: phy: tegra: Move utmip_pad_count checking under lock
        usb: phy: tegra: Keep CPU interrupts enabled
        usb: host: ehci-tegra: Remove unused fields from tegra_ehci_hcd

    - I noticed that ULPI's reset is getting erroneously deasserted on
      PHY's shutdown, this is fixed in these new patches:

        usb: phy: tegra: Assert reset on ULPI close instead of deasserting it
        usb: phy: tegra: Use device-tree notion of reset-GPIO's active-state

v2: - The "usb: phy: tegra: Hook up init/shutdown callbacks" patch was
      updated and now it does a better job in regards to checking whether
      PHY is initialized before it is started to be used and whether there
      is a double init/shutdown. This allows to factor out the ChipIdea's
      driver change into a separate patch, which was requested by Peter Chen
      in a review comment to v1. In a result there is this new patch:

        usb: chipidea: tegra: Stop managing PHY's power

    - Added few more new patches:

        usb: phy: tegra: Use generic stub for a missing VBUS regulator

      I noticed that VBUS regulator usage could be cleaned up a tad as well.

        usb: ulpi: Add resource-managed variant of otg_ulpi_create()
        usb: phy: tegra: Use devm_otg_ulpi_create()
        usb: phy: tegra: Use u32 for hardware register variables

      These patches are made in response to review comments that were made
      by Thierry Reding to v1.

      I also noticed that phy_tegra_usb isn't getting auto-loaded while it
      should be. This is fixed in this new patch:

        usb: chipidea: tegra: Add USB_TEGRA_PHY to driver's dependencies

Dmitry Osipenko (16):
  dt-binding: usb: ci-hdrc-usb2: Document NVIDIA Tegra support
  usb: phy: tegra: Hook up init/shutdown callbacks
  usb: phy: tegra: Perform general clean up of the code
  usb: phy: tegra: Use relaxed versions of readl/writel
  usb: phy: tegra: Use generic stub for a missing VBUS regulator
  usb: ulpi: Add resource-managed variant of otg_ulpi_create()
  usb: phy: tegra: Use devm_otg_ulpi_create()
  usb: phy: tegra: Use u32 for hardware register variables
  usb: phy: tegra: Assert reset on ULPI close instead of deasserting it
  usb: phy: tegra: Use device-tree notion of reset-GPIO's active-state
  usb: phy: tegra: Disable VBUS regulator on tegra_usb_phy_init failure
  usb: phy: tegra: Move utmip_pad_count checking under lock
  usb: phy: tegra: Keep CPU interrupts enabled
  usb: chipidea: tegra: Stop managing PHY's power
  usb: chipidea: tegra: Add USB_TEGRA_PHY to driver's dependencies
  usb: host: ehci-tegra: Remove unused fields from tegra_ehci_hcd

 .../devicetree/bindings/usb/ci-hdrc-usb2.txt  |   4 +
 drivers/usb/chipidea/Kconfig                  |   1 +
 drivers/usb/chipidea/ci_hdrc_tegra.c          |  15 +-
 drivers/usb/host/ehci-tegra.c                 |   2 -
 drivers/usb/phy/phy-tegra-usb.c               | 830 +++++++++---------
 drivers/usb/phy/phy-ulpi.c                    |  48 +-
 include/linux/usb/tegra_usb_phy.h             |   3 +-
 include/linux/usb/ulpi.h                      |  11 +
 8 files changed, 496 insertions(+), 418 deletions(-)

-- 
2.24.0
