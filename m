From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 00/20] NVIDIA Tegra USB2 drivers clean up
Date: Mon,  6 Jan 2020 04:33:56 +0300
Message-ID: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This patch series brings the NVIDIA Tegra USB2 PHY driver into a better
shape by refactoring code to match upstream standards, the ChipIdea/Tegra UDC
driver also gets a minor update. Please review and apply, thanks in advance!

Changelog:

v4: - Dropped the request_module() from "Add USB_TEGRA_PHY to driver's
      dependencies" because it resulted in a bit too many questions during
      review and since it won't be needed once Tegra EHCI driver will be
      squashed into the CI anyways.

    - Factored out clean up of ulpi_phy_power_off into a separate patch and
      improved it a bit move by disabling clock *after* asserting reset:

        usb: phy: tegra: Clean up ulpi_phy_power_off

    - Cleaned up ULPI reset-GPIO changes that were messed up a tad in v3,
      thanks to Michał Mirosław for reviewing it in v3.

    - Dropped the "Assert reset on ULPI close instead of deasserting it"
      patch because turned out that the problem was introduced by an earlier
      patch in this series, which is fixed now.

    - Added missed tegra_usb_phy_power_off to tegra_usb_phy_shutdown() in
      the "Hook up init/shutdown callbacks" patch.

    - I found out that PHY-enable refcount is broken after drivers reloading,
      added these new patches in a result:

        usb: phy: tegra: Keep track of power on-off state
        usb: host: ehci-tegra: Stop managing PHY's power

    - Added patch to clean up included headers in the PHY driver:

        usb: phy: tegra: Clean up included headers

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

Dmitry Osipenko (20):
  dt-binding: usb: ci-hdrc-usb2: Document NVIDIA Tegra support
  usb: host: ehci-tegra: Correct teardown order of driver's removal
  usb: phy: tegra: Clean up ulpi_phy_power_off
  usb: phy: tegra: Keep track of power on-off state
  usb: phy: tegra: Hook up init/shutdown callbacks
  usb: phy: tegra: Perform general clean up of the code
  usb: phy: tegra: Clean up included headers
  usb: phy: tegra: Use relaxed versions of readl/writel
  usb: phy: tegra: Use generic stub for a missing VBUS regulator
  usb: ulpi: Add resource-managed variant of otg_ulpi_create()
  usb: phy: tegra: Use devm_otg_ulpi_create()
  usb: phy: tegra: Use u32 for hardware register variables
  usb: phy: tegra: Use device-tree notion of reset-GPIO's active-state
  usb: phy: tegra: Disable VBUS regulator on tegra_usb_phy_init failure
  usb: phy: tegra: Move utmip_pad_count checking under lock
  usb: phy: tegra: Keep CPU interrupts enabled
  usb: chipidea: tegra: Stop managing PHY's power
  usb: chipidea: tegra: Add USB_TEGRA_PHY to driver's dependencies
  usb: host: ehci-tegra: Stop managing PHY's power
  usb: host: ehci-tegra: Remove unused fields from tegra_ehci_hcd

 .../devicetree/bindings/usb/ci-hdrc-usb2.txt  |   4 +
 drivers/usb/chipidea/Kconfig                  |   1 +
 drivers/usb/chipidea/ci_hdrc_tegra.c          |   9 -
 drivers/usb/host/ehci-tegra.c                 |  16 +-
 drivers/usb/phy/phy-tegra-usb.c               | 896 +++++++++---------
 drivers/usb/phy/phy-ulpi.c                    |  48 +-
 include/linux/usb/tegra_usb_phy.h             |   4 +-
 include/linux/usb/ulpi.h                      |  11 +
 8 files changed, 530 insertions(+), 459 deletions(-)

-- 
2.24.0
