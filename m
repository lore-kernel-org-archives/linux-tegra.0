From: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH -next] phy: tegra: Add missing USB_SUPPORT dependency
Date: Mon, 30 Mar 2020 11:46:46 +0800
Message-ID: <20200330034646.30572-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When USB_SUPPORT is not set, we got this warnings:

WARNING: unmet direct dependencies detected for USB_PHY
  Depends on [n]: USB_SUPPORT [=n]
  Selected by [y]:
  - PHY_TEGRA_XUSB [=y] && ARCH_TEGRA [=y]

WARNING: unmet direct dependencies detected for USB_CONN_GPIO
  Depends on [n]: USB_SUPPORT [=n] && GPIOLIB [=y]
  Selected by [y]:
  - PHY_TEGRA_XUSB [=y] && ARCH_TEGRA [=y]

Fix by adding USB_SUPPORT as a dependency.

Fixes: 23babe30fb45d ("phy: tegra: xusb: Add usb-phy support")
Signed-off-by: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/phy/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index a208aca4ba7b..bb86d09a173b 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -2,6 +2,7 @@
 config PHY_TEGRA_XUSB
 	tristate "NVIDIA Tegra XUSB pad controller driver"
 	depends on ARCH_TEGRA
+	depends on USB_SUPPORT
 	select USB_CONN_GPIO
 	select USB_PHY
 	help
-- 
2.17.1
