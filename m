From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Thu, 7 Mar 2013 17:45:26 +0200
Message-ID: <1362671126-24571-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

this will make sure that we have sensible names
for all phy drivers. Current situation was already
quite bad with too generic names being used.

Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/phy/Makefile                           | 42 +++++++++++-----------
 drivers/usb/phy/{ab8500-usb.c => phy-ab8500.c}     |  0
 drivers/usb/phy/{fsl_otg.c => phy-fsl.c}           |  2 +-
 drivers/usb/phy/{fsl_otg.h => phy-fsl.h}           |  0
 drivers/usb/phy/{gpio_vbus.c => phy-gpio-vbus.c}   |  0
 .../usb/phy/{isp1301_omap.c => phy-isp1301-omap.c} |  0
 drivers/usb/phy/{isp1301.c => phy-isp1301.c}       |  0
 drivers/usb/phy/{msm_otg.c => phy-msm.c}           |  0
 drivers/usb/phy/{mv_u3d_phy.c => phy-mv-u3d.c}     |  2 +-
 drivers/usb/phy/{mv_u3d_phy.h => phy-mv-u3d.h}     |  0
 drivers/usb/phy/{mv_otg.c => phy-mv.c}             |  2 +-
 drivers/usb/phy/{mv_otg.h => phy-mv.h}             |  0
 drivers/usb/phy/{mxs-phy.c => phy-mxs.c}           |  0
 drivers/usb/phy/{nop-usb-xceiv.c => phy-nop.c}     |  0
 .../phy/{omap-control-usb.c => phy-omap-control.c} |  0
 drivers/usb/phy/{omap-usb2.c => phy-omap-usb2.c}   |  0
 drivers/usb/phy/{omap-usb3.c => phy-omap-usb3.c}   |  0
 drivers/usb/phy/{otg_fsm.c => phy-otg-fsm.c}       |  2 +-
 drivers/usb/phy/{otg_fsm.h => phy-otg-fsm.h}       |  0
 drivers/usb/phy/{rcar-phy.c => phy-rcar.c}         |  0
 .../usb/phy/{samsung-usbphy.c => phy-samsung.c}    |  0
 drivers/usb/phy/{tegra_usb_phy.c => phy-tegra.c}   |  0
 drivers/usb/phy/{twl4030-usb.c => phy-twl4030.c}   |  0
 drivers/usb/phy/{twl6030-usb.c => phy-twl6030.c}   |  0
 .../phy/{ulpi_viewport.c => phy-ulpi-viewport.c}   |  0
 drivers/usb/phy/{ulpi.c => phy-ulpi.c}             |  0
 26 files changed, 25 insertions(+), 25 deletions(-)
 rename drivers/usb/phy/{ab8500-usb.c => phy-ab8500.c} (100%)
 rename drivers/usb/phy/{fsl_otg.c => phy-fsl.c} (99%)
 rename drivers/usb/phy/{fsl_otg.h => phy-fsl.h} (100%)
 rename drivers/usb/phy/{gpio_vbus.c => phy-gpio-vbus.c} (100%)
 rename drivers/usb/phy/{isp1301_omap.c => phy-isp1301-omap.c} (100%)
 rename drivers/usb/phy/{isp1301.c => phy-isp1301.c} (100%)
 rename drivers/usb/phy/{msm_otg.c => phy-msm.c} (100%)
 rename drivers/usb/phy/{mv_u3d_phy.c => phy-mv-u3d.c} (99%)
 rename drivers/usb/phy/{mv_u3d_phy.h => phy-mv-u3d.h} (100%)
 rename drivers/usb/phy/{mv_otg.c => phy-mv.c} (99%)
 rename drivers/usb/phy/{mv_otg.h => phy-mv.h} (100%)
 rename drivers/usb/phy/{mxs-phy.c => phy-mxs.c} (100%)
 rename drivers/usb/phy/{nop-usb-xceiv.c => phy-nop.c} (100%)
 rename drivers/usb/phy/{omap-control-usb.c => phy-omap-control.c} (100%)
 rename drivers/usb/phy/{omap-usb2.c => phy-omap-usb2.c} (100%)
 rename drivers/usb/phy/{omap-usb3.c => phy-omap-usb3.c} (100%)
 rename drivers/usb/phy/{otg_fsm.c => phy-otg-fsm.c} (99%)
 rename drivers/usb/phy/{otg_fsm.h => phy-otg-fsm.h} (100%)
 rename drivers/usb/phy/{rcar-phy.c => phy-rcar.c} (100%)
 rename drivers/usb/phy/{samsung-usbphy.c => phy-samsung.c} (100%)
 rename drivers/usb/phy/{tegra_usb_phy.c => phy-tegra.c} (100%)
 rename drivers/usb/phy/{twl4030-usb.c => phy-twl4030.c} (100%)
 rename drivers/usb/phy/{twl6030-usb.c => phy-twl6030.c} (100%)
 rename drivers/usb/phy/{ulpi_viewport.c => phy-ulpi-viewport.c} (100%)
 rename drivers/usb/phy/{ulpi.c => phy-ulpi.c} (100%)

diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
index d10a8b3..32db575 100644
--- a/drivers/usb/phy/Makefile
+++ b/drivers/usb/phy/Makefile
@@ -8,24 +8,24 @@ obj-$(CONFIG_USB_PHY)			+= phy.o
 
 # transceiver drivers, keep the list sorted
 
-obj-$(CONFIG_AB8500_USB)		+= ab8500-usb.o
-fsl_usb2_otg-objs			:= fsl_otg.o otg_fsm.o
-obj-$(CONFIG_FSL_USB2_OTG)		+= fsl_usb2_otg.o
-obj-$(CONFIG_ISP1301_OMAP)		+= isp1301_omap.o
-obj-$(CONFIG_MV_U3D_PHY)		+= mv_u3d_phy.o
-obj-$(CONFIG_NOP_USB_XCEIV)		+= nop-usb-xceiv.o
-obj-$(CONFIG_OMAP_CONTROL_USB)		+= omap-control-usb.o
-obj-$(CONFIG_OMAP_USB2)			+= omap-usb2.o
-obj-$(CONFIG_OMAP_USB3)			+= omap-usb3.o
-obj-$(CONFIG_SAMSUNG_USBPHY)		+= samsung-usbphy.o
-obj-$(CONFIG_TWL4030_USB)		+= twl4030-usb.o
-obj-$(CONFIG_TWL6030_USB)		+= twl6030-usb.o
-obj-$(CONFIG_USB_EHCI_TEGRA)		+= tegra_usb_phy.o
-obj-$(CONFIG_USB_GPIO_VBUS)		+= gpio_vbus.o
-obj-$(CONFIG_USB_ISP1301)		+= isp1301.o
-obj-$(CONFIG_USB_MSM_OTG)		+= msm_otg.o
-obj-$(CONFIG_USB_MV_OTG)		+= mv_otg.o
-obj-$(CONFIG_USB_MXS_PHY)		+= mxs-phy.o
-obj-$(CONFIG_USB_RCAR_PHY)		+= rcar-phy.o
-obj-$(CONFIG_USB_ULPI)			+= ulpi.o
-obj-$(CONFIG_USB_ULPI_VIEWPORT)		+= ulpi_viewport.o
+obj-$(CONFIG_AB8500_USB)		+= phy-ab8500.o
+phy-fsl-usb2-objs			:= phy-fsl.o phy-otg-fsm.o
+obj-$(CONFIG_FSL_USB2_OTG)		+= phy-fsl-usb2.o
+obj-$(CONFIG_ISP1301_OMAP)		+= phy-isp1301.omap.o
+obj-$(CONFIG_MV_U3D_PHY)		+= phy-mv-u3d.o
+obj-$(CONFIG_NOP_USB_XCEIV)		+= phy-nop.o
+obj-$(CONFIG_OMAP_CONTROL_USB)		+= phy-omap-control.o
+obj-$(CONFIG_OMAP_USB2)			+= phy-omap-usb2.o
+obj-$(CONFIG_OMAP_USB3)			+= phy-omap-usb3.o
+obj-$(CONFIG_SAMSUNG_USBPHY)		+= phy-samsung.o
+obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030.o
+obj-$(CONFIG_TWL6030_USB)		+= phy-twl6030.o
+obj-$(CONFIG_USB_EHCI_TEGRA)		+= phy-tegra.o
+obj-$(CONFIG_USB_GPIO_VBUS)		+= phy-gpio-vbus.o
+obj-$(CONFIG_USB_ISP1301)		+= phy-isp1301.o
+obj-$(CONFIG_USB_MSM_OTG)		+= phy-msm.o
+obj-$(CONFIG_USB_MV_OTG)		+= phy-mv.o
+obj-$(CONFIG_USB_MXS_PHY)		+= phy-mxs.o
+obj-$(CONFIG_USB_RCAR_PHY)		+= phy-rcar.o
+obj-$(CONFIG_USB_ULPI)			+= phy-ulpi.o
+obj-$(CONFIG_USB_ULPI_VIEWPORT)		+= phy-ulpi-viewport.o
diff --git a/drivers/usb/phy/ab8500-usb.c b/drivers/usb/phy/phy-ab8500.c
similarity index 100%
rename from drivers/usb/phy/ab8500-usb.c
rename to drivers/usb/phy/phy-ab8500.c
diff --git a/drivers/usb/phy/fsl_otg.c b/drivers/usb/phy/phy-fsl.c
similarity index 99%
rename from drivers/usb/phy/fsl_otg.c
rename to drivers/usb/phy/phy-fsl.c
index 72a2a00..bca345b 100644
--- a/drivers/usb/phy/fsl_otg.c
+++ b/drivers/usb/phy/phy-fsl.c
@@ -43,7 +43,7 @@
 
 #include <asm/unaligned.h>
 
-#include "fsl_otg.h"
+#include "phy-fsl.h"
 
 #define DRIVER_VERSION "Rev. 1.55"
 #define DRIVER_AUTHOR "Jerry Huang/Li Yang"
diff --git a/drivers/usb/phy/fsl_otg.h b/drivers/usb/phy/phy-fsl.h
similarity index 100%
rename from drivers/usb/phy/fsl_otg.h
rename to drivers/usb/phy/phy-fsl.h
diff --git a/drivers/usb/phy/gpio_vbus.c b/drivers/usb/phy/phy-gpio-vbus.c
similarity index 100%
rename from drivers/usb/phy/gpio_vbus.c
rename to drivers/usb/phy/phy-gpio-vbus.c
diff --git a/drivers/usb/phy/isp1301_omap.c b/drivers/usb/phy/phy-isp1301-omap.c
similarity index 100%
rename from drivers/usb/phy/isp1301_omap.c
rename to drivers/usb/phy/phy-isp1301-omap.c
diff --git a/drivers/usb/phy/isp1301.c b/drivers/usb/phy/phy-isp1301.c
similarity index 100%
rename from drivers/usb/phy/isp1301.c
rename to drivers/usb/phy/phy-isp1301.c
diff --git a/drivers/usb/phy/msm_otg.c b/drivers/usb/phy/phy-msm.c
similarity index 100%
rename from drivers/usb/phy/msm_otg.c
rename to drivers/usb/phy/phy-msm.c
diff --git a/drivers/usb/phy/mv_u3d_phy.c b/drivers/usb/phy/phy-mv-u3d.c
similarity index 99%
rename from drivers/usb/phy/mv_u3d_phy.c
rename to drivers/usb/phy/phy-mv-u3d.c
index 9d85991..f94e441 100644
--- a/drivers/usb/phy/mv_u3d_phy.c
+++ b/drivers/usb/phy/phy-mv-u3d.c
@@ -15,7 +15,7 @@
 #include <linux/usb/otg.h>
 #include <linux/platform_data/mv_usb.h>
 
-#include "mv_u3d_phy.h"
+#include "phy-mv-u3d.h"
 
 /*
  * struct mv_u3d_phy - transceiver driver state
diff --git a/drivers/usb/phy/mv_u3d_phy.h b/drivers/usb/phy/phy-mv-u3d.h
similarity index 100%
rename from drivers/usb/phy/mv_u3d_phy.h
rename to drivers/usb/phy/phy-mv-u3d.h
diff --git a/drivers/usb/phy/mv_otg.c b/drivers/usb/phy/phy-mv.c
similarity index 99%
rename from drivers/usb/phy/mv_otg.c
rename to drivers/usb/phy/phy-mv.c
index b6a9be3..043fdd2 100644
--- a/drivers/usb/phy/mv_otg.c
+++ b/drivers/usb/phy/phy-mv.c
@@ -27,7 +27,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/platform_data/mv_usb.h>
 
-#include "mv_otg.h"
+#include "phy-mv.h"
 
 #define	DRIVER_DESC	"Marvell USB OTG transceiver driver"
 #define	DRIVER_VERSION	"Jan 20, 2010"
diff --git a/drivers/usb/phy/mv_otg.h b/drivers/usb/phy/phy-mv.h
similarity index 100%
rename from drivers/usb/phy/mv_otg.h
rename to drivers/usb/phy/phy-mv.h
diff --git a/drivers/usb/phy/mxs-phy.c b/drivers/usb/phy/phy-mxs.c
similarity index 100%
rename from drivers/usb/phy/mxs-phy.c
rename to drivers/usb/phy/phy-mxs.c
diff --git a/drivers/usb/phy/nop-usb-xceiv.c b/drivers/usb/phy/phy-nop.c
similarity index 100%
rename from drivers/usb/phy/nop-usb-xceiv.c
rename to drivers/usb/phy/phy-nop.c
diff --git a/drivers/usb/phy/omap-control-usb.c b/drivers/usb/phy/phy-omap-control.c
similarity index 100%
rename from drivers/usb/phy/omap-control-usb.c
rename to drivers/usb/phy/phy-omap-control.c
diff --git a/drivers/usb/phy/omap-usb2.c b/drivers/usb/phy/phy-omap-usb2.c
similarity index 100%
rename from drivers/usb/phy/omap-usb2.c
rename to drivers/usb/phy/phy-omap-usb2.c
diff --git a/drivers/usb/phy/omap-usb3.c b/drivers/usb/phy/phy-omap-usb3.c
similarity index 100%
rename from drivers/usb/phy/omap-usb3.c
rename to drivers/usb/phy/phy-omap-usb3.c
diff --git a/drivers/usb/phy/otg_fsm.c b/drivers/usb/phy/phy-otg-fsm.c
similarity index 99%
rename from drivers/usb/phy/otg_fsm.c
rename to drivers/usb/phy/phy-otg-fsm.c
index 1f729a1..c520b35 100644
--- a/drivers/usb/phy/otg_fsm.c
+++ b/drivers/usb/phy/phy-otg-fsm.c
@@ -29,7 +29,7 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/otg.h>
 
-#include "otg_fsm.h"
+#include "phy-otg-fsm.h"
 
 /* Change USB protocol when there is a protocol change */
 static int otg_set_protocol(struct otg_fsm *fsm, int protocol)
diff --git a/drivers/usb/phy/otg_fsm.h b/drivers/usb/phy/phy-otg-fsm.h
similarity index 100%
rename from drivers/usb/phy/otg_fsm.h
rename to drivers/usb/phy/phy-otg-fsm.h
diff --git a/drivers/usb/phy/rcar-phy.c b/drivers/usb/phy/phy-rcar.c
similarity index 100%
rename from drivers/usb/phy/rcar-phy.c
rename to drivers/usb/phy/phy-rcar.c
diff --git a/drivers/usb/phy/samsung-usbphy.c b/drivers/usb/phy/phy-samsung.c
similarity index 100%
rename from drivers/usb/phy/samsung-usbphy.c
rename to drivers/usb/phy/phy-samsung.c
diff --git a/drivers/usb/phy/tegra_usb_phy.c b/drivers/usb/phy/phy-tegra.c
similarity index 100%
rename from drivers/usb/phy/tegra_usb_phy.c
rename to drivers/usb/phy/phy-tegra.c
diff --git a/drivers/usb/phy/twl4030-usb.c b/drivers/usb/phy/phy-twl4030.c
similarity index 100%
rename from drivers/usb/phy/twl4030-usb.c
rename to drivers/usb/phy/phy-twl4030.c
diff --git a/drivers/usb/phy/twl6030-usb.c b/drivers/usb/phy/phy-twl6030.c
similarity index 100%
rename from drivers/usb/phy/twl6030-usb.c
rename to drivers/usb/phy/phy-twl6030.c
diff --git a/drivers/usb/phy/ulpi_viewport.c b/drivers/usb/phy/phy-ulpi-viewport.c
similarity index 100%
rename from drivers/usb/phy/ulpi_viewport.c
rename to drivers/usb/phy/phy-ulpi-viewport.c
diff --git a/drivers/usb/phy/ulpi.c b/drivers/usb/phy/phy-ulpi.c
similarity index 100%
rename from drivers/usb/phy/ulpi.c
rename to drivers/usb/phy/phy-ulpi.c
-- 
1.8.1.rc1.5.g7e0651a

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
