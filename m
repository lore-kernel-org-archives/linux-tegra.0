From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 1/2] usb: phy: Add Kconfig entry for Tegra's PHY driver
Date: Mon, 11 Dec 2017 02:09:59 +0300
Message-ID: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add Kconfig entry so that other drivers other than ehci-tegra
(like ChipIdea) could add Tegra's PHY to build dependencies.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/host/Kconfig | 2 +-
 drivers/usb/phy/Kconfig  | 8 ++++++++
 drivers/usb/phy/Makefile | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index b80a94e632af..f19072f1f519 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -226,7 +226,7 @@ config USB_EHCI_TEGRA
        tristate "NVIDIA Tegra HCD support"
        depends on ARCH_TEGRA
        select USB_EHCI_ROOT_HUB_TT
-       select USB_PHY
+	select USB_TEGRA_PHY
 	select USB_ULPI
 	select USB_ULPI_VIEWPORT
        help
diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 0f8ab981d572..2a50576e1a2a 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -159,6 +159,14 @@ config USB_MXS_PHY
 
 	  MXS Phy is used by some of the i.MX SoCs, for example imx23/28/6x.
 
+config USB_TEGRA_PHY
+	tristate "NVIDIA Tegra USB PHY Driver"
+	depends on ARCH_TEGRA
+	select USB_PHY
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
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
