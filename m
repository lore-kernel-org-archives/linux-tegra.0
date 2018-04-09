From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 3/3] usb: phy: Add Kconfig entry for Tegra PHY driver
Date: Tue, 10 Apr 2018 01:02:59 +0300
Message-ID: <aad79a65528636ee5fd217cfb7273de10147fc13.1523307883.git.digetx@gmail.com>
References: <cover.1523307883.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1523307883.git.digetx@gmail.com>
In-Reply-To: <cover.1523307883.git.digetx@gmail.com>
References: <cover.1523307883.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra's EHCI driver has a build dependency on Tegra's PHY driver and
currently Tegra's PHY driver is built only when Tegra's EHCI driver is
built. Add own Kconfig entry for the Tegra's PHY driver so that drivers
other than ehci-tegra (like ChipIdea UDC) could work with ehci-tegra
driver being disabled in kernels config by allowing user to manually
select the PHY driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/host/Kconfig | 4 +---
 drivers/usb/phy/Kconfig  | 9 +++++++++
 drivers/usb/phy/Makefile | 2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 5d958da8e1bc..9f0aeb068acb 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -234,9 +234,7 @@ config USB_EHCI_TEGRA
        tristate "NVIDIA Tegra HCD support"
        depends on ARCH_TEGRA
        select USB_EHCI_ROOT_HUB_TT
-       select USB_PHY
-	select USB_ULPI
-	select USB_ULPI_VIEWPORT
+       select USB_TEGRA_PHY
        help
          This driver enables support for the internal USB Host Controllers
          found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 0f8ab981d572..b9b0a44be679 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -159,6 +159,15 @@ config USB_MXS_PHY
 
 	  MXS Phy is used by some of the i.MX SoCs, for example imx23/28/6x.
 
+config USB_TEGRA_PHY
+	tristate "NVIDIA Tegra USB PHY Driver"
+	depends on ARCH_TEGRA
+	select USB_PHY
+	select USB_ULPI
+	help
+	  This driver provides PHY support for the USB controllers found
+	  on NVIDIA Tegra SoC's.
+
 config USB_ULPI
 	bool "Generic ULPI Transceiver Driver"
 	depends on ARM || ARM64
diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
index 25e579fb92b8..df1d99010079 100644
--- a/drivers/usb/phy/Makefile
+++ b/drivers/usb/phy/Makefile
@@ -16,7 +16,7 @@ obj-$(CONFIG_AM335X_CONTROL_USB)	+= phy-am335x-control.o
 obj-$(CONFIG_AM335X_PHY_USB)		+= phy-am335x.o
 obj-$(CONFIG_OMAP_OTG)			+= phy-omap-otg.o
 obj-$(CONFIG_TWL6030_USB)		+= phy-twl6030-usb.o
-obj-$(CONFIG_USB_EHCI_TEGRA)		+= phy-tegra-usb.o
+obj-$(CONFIG_USB_TEGRA_PHY)		+= phy-tegra-usb.o
 obj-$(CONFIG_USB_GPIO_VBUS)		+= phy-gpio-vbus-usb.o
 obj-$(CONFIG_USB_ISP1301)		+= phy-isp1301.o
 obj-$(CONFIG_USB_MV_OTG)		+= phy-mv-usb.o
-- 
2.16.3
