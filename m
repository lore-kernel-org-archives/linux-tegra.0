From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2] usb: phy: tegra: Increase PHY clock stabilization timeout
Date: Sun, 17 Dec 2017 20:02:39 +0300
Message-ID: <11fbb780b9478b3b379b6e01c7eb5462cfbedf64.1513530136.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This fixes "utmi_phy_clk_enable: timeout waiting for phy to stabilize"
error message.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Change log:
v2:	Increased delay for the poll retry from 1us to 2000ms, thanks to
	Thierry Reding for the suggestion.

 drivers/usb/phy/phy-tegra-usb.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index f668bfb708d3..0e8d23e51732 100644
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
@@ -305,14 +305,10 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 
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
+	return readl_poll_timeout(reg, tmp, (tmp & mask) == result,
+				  2000, 6000);
 }
 
 static void utmi_phy_clk_disable(struct tegra_usb_phy *phy)
-- 
2.15.1
