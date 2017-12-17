From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/4] usb: phy: Add Kconfig entry for Tegra PHY driver
Date: Sun, 17 Dec 2017 20:07:05 +0300
Message-ID: <11a5e4f2690ea3052df884b831821e2fdf85634e.1513528011.git.digetx@gmail.com>
References: <36f2956bd89de80d798cdf7317cc58a6a8c0fa36.1513528011.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36f2956bd89de80d798cdf7317cc58a6a8c0fa36.1513528011.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <36f2956bd89de80d798cdf7317cc58a6a8c0fa36.1513528011.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <36f2956bd89de80d798cdf7317cc58a6a8c0fa36.1513528011.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Currently tegra-phy driver is built only when ehci-tegra is. Add own
Kconfig entry for tegra-phy so that drivers other than ehci-tegra (like
ChipIdea) could work without ehci-tegra.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Change log:
v2:	Added missed USB_ULPI dependency to USB_TEGRA_PHY.

 drivers/usb/phy/Kconfig  | 9 +++++++++
 drivers/usb/phy/Makefile | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

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
2.15.1
