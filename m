From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH] phy: add missing header dependencies
Date: Wed, 31 Aug 2016 16:56:49 +0800
Message-ID: <1472633809-19904-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: linux-tegra@vger.kernel.org

We get 5 warnings when building kernel with W=1:
drivers/phy/tegra/xusb.c:948:27: warning: no previous prototype for 'tegra_xusb_padctl_get' [-Wmissing-prototypes]
drivers/phy/tegra/xusb.c:981:6: warning: no previous prototype for 'tegra_xusb_padctl_put' [-Wmissing-prototypes]
drivers/phy/tegra/xusb.c:988:5: warning: no previous prototype for 'tegra_xusb_padctl_usb3_save_context' [-Wmissing-prototypes]
drivers/phy/tegra/xusb.c:998:5: warning: no previous prototype for 'tegra_xusb_padctl_hsic_set_idle' [-Wmissing-prototypes]
drivers/phy/tegra/xusb.c:1008:5: warning: no previous prototype for 'tegra_xusb_padctl_usb3_set_lfps_detect' [-Wmissing-prototypes]

In fact, these functions are declared in linux/phy/tegra/xusb.h,
so this patch adds missing header dependencies.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/phy/tegra/xusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 0a372d9..873424a 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/phy/phy.h>
+#include <linux/phy/tegra/xusb.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
-- 
2.7.4
