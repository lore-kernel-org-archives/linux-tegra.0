From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 07/20] usb: phy: tegra: Clean up included headers
Date: Mon,  6 Jan 2020 04:34:03 +0300
Message-ID: <20200106013416.9604-8-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add "spinlock.h", which was included indirectly, and sort includes in
alphabet order.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index c045f44ea964..aca1413db0ed 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -9,24 +9,26 @@
  *	Venu Byravarasu <vbyravarasu@nvidia.com>
  */
 
-#include <linux/resource.h>
 #include <linux/delay.h>
-#include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/export.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/iopoll.h>
 #include <linux/gpio.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
-#include <linux/usb/otg.h>
-#include <linux/usb/ulpi.h>
-#include <linux/usb/of.h>
+#include <linux/platform_device.h>
+#include <linux/resource.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include <linux/regulator/consumer.h>
+
 #include <linux/usb/ehci_def.h>
+#include <linux/usb/of.h>
 #include <linux/usb/tegra_usb_phy.h>
-#include <linux/regulator/consumer.h>
+#include <linux/usb/ulpi.h>
 
 #define ULPI_VIEWPORT				0x170
 
-- 
2.24.0
