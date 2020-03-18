From: Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] phy: tegra: should select USB_PHY
Date: Wed, 18 Mar 2020 15:23:33 +0000
Message-ID: <1584545013-19859-1-git-send-email-clabbe@baylibre.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I have hit the following build error:
armv7a-hardfloat-linux-gnueabi-ld: drivers/phy/tegra/xusb.o: in function `tegra_xusb_port_unregister':
xusb.c:(.text+0x2ac): undefined reference to `usb_remove_phy'
armv7a-hardfloat-linux-gnueabi-ld: drivers/phy/tegra/xusb.o: in function `tegra_xusb_setup_ports':
xusb.c:(.text+0xf30): undefined reference to `usb_add_phy_dev'

PHY_TEGRA_XUSB should select USB_PHY

Fixes: 23babe30fb45d ("phy: tegra: xusb: Add usb-phy support")
Cc: stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 drivers/phy/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index df07c4dea059..a208aca4ba7b 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -3,6 +3,7 @@ config PHY_TEGRA_XUSB
 	tristate "NVIDIA Tegra XUSB pad controller driver"
 	depends on ARCH_TEGRA
 	select USB_CONN_GPIO
+	select USB_PHY
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
 
-- 
2.24.1
