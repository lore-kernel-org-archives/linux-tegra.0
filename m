From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] phy: tegra-xusb: add pinctrl dependency
Date: Tue,  3 May 2016 17:24:51 +0200
Message-ID: <1462289101-797073-1-git-send-email-arnd@arndb.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The newly added tegra xusb phy driver fails to link when CONFIG_PINCTRL
is disabled, since that also leaves out the legacy probe function:

ERROR: "tegra_xusb_padctl_legacy_probe" [drivers/phy/tegra/phy-tegra-xusb.ko] undefined!

This adds a Kconfig dependency for it, depending on both
PINCTRL_TEGRA_XUSB (for the driver) and PINCTRL_TEGRA (for the
directory it's in), adding a dependency on just one of the
two does not solve the problem unfortunately.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Fixes: 53d2a715c240 ("phy: Add Tegra XUSB pad controller support")
---
I'm not perfectly happy with this patch, but couldn't think of a better
way to express this.

 drivers/phy/tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index a3b1de953fb7..4e56b83408e1 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -1,6 +1,6 @@
 config PHY_TEGRA_XUSB
 	tristate "NVIDIA Tegra XUSB pad controller driver"
-	depends on ARCH_TEGRA
+	depends on PINCTRL_TEGRA && PINCTRL_TEGRA_XUSB
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
 
-- 
2.7.0
