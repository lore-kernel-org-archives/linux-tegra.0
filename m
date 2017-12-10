From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] usb: phy: tegra: Increase PHY clock stabilization timeout
Date: Mon, 11 Dec 2017 01:55:35 +0300
Message-ID: <20171210225535.8532-1-digetx@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This fixes "utmi_phy_clk_enable: timeout waiting for phy to stabilize"
error message.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index f668bfb708d3..7d5db625f800 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -16,7 +16,7 @@
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/gpio.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -305,14 +305,9 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 
 static int utmi_wait_register(void __iomem *reg, u32 mask, u32 result)
 {
-	unsigned long timeout = 2000;
-	do {
-		if ((readl(reg) & mask) == result)
-			return 0;
-		udelay(1);
-		timeout--;
-	} while (timeout);
-	return -1;
+	u32 tmp;
+
+	return readl_poll_timeout(reg, tmp, (tmp & mask) == result, 1, 5000);
 }
 
 static void utmi_phy_clk_disable(struct tegra_usb_phy *phy)
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
