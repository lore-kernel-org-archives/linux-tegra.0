From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] USB: host: tegra: CONFIG_USB_EHCI_TEGRA requires ULPI and
 ULPI viewport support
Date: Thu, 3 Oct 2013 23:02:54 -0700
Message-ID: <alpine.DEB.2.02.1310032300110.32666@tamien>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


Selecting CONFIG_USB_EHCI_TEGRA requires CONFIG_USB_ULPI_VIEWPORT.
Otherwise the build can break with:

drivers/usb/phy/phy-tegra-usb.c: In function 'ulpi_open':
drivers/usb/phy/phy-tegra-usb.c:689:31: error: 'ulpi_viewport_access_ops' undeclared (first use in this function)
drivers/usb/phy/phy-tegra-usb.c:689:31: note: each undeclared identifier is reported only once for each function it appears in

if CONFIG_USB_ULPI_VIEWPORT is not manually selected.

Fix by forcing CONFIG_USB_ULPI_VIEWPORT to be selected when
CONFIG_USB_EHCI_TEGRA is selected.  Then, since CONFIG_USB_ULPI_VIEWPORT
requires CONFIG_USB_ULPI to be selected, add that too.

N.B.: ULPI is deprecated on this controller for T114, so it might make 
sense to split the ULPI support code into a separate file, compiled only 
if a ULPI PHY is selected.

Signed-off-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
---

Observed while building the stable kernels v3.11.[123] with a T114-only 
Kconfig.

  drivers/usb/host/Kconfig | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 4263d01..81b9d34 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -202,6 +202,8 @@ config USB_EHCI_TEGRA
         depends on ARCH_TEGRA
         select USB_EHCI_ROOT_HUB_TT
         select USB_PHY
+       select USB_ULPI
+       select USB_ULPI_VIEWPORT
         help
           This driver enables support for the internal USB Host Controllers
           found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
-- 
1.8.1.5
