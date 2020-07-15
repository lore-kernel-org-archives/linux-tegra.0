From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v3 15/18] gpu: host1x: mipi: Use readl_relaxed_poll_timeout in tegra_mipi_wait
Date: Tue, 14 Jul 2020 21:20:52 -0700
Message-ID: <1594786855-26506-16-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use readl_relaxed_poll_timeout() in tegra_mipi_wait() to simplify
the code.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpu/host1x/mipi.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 762d349..259e70c 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -21,9 +21,9 @@
  */
 
 #include <linux/clk.h>
-#include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -295,19 +295,15 @@ EXPORT_SYMBOL(tegra_mipi_disable);
 
 static int tegra_mipi_wait(struct tegra_mipi *mipi)
 {
-	unsigned long timeout = jiffies + msecs_to_jiffies(250);
+	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
 	u32 value;
+	int err;
 
-	while (time_before(jiffies, timeout)) {
-		value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
-		if ((value & MIPI_CAL_STATUS_ACTIVE) == 0 &&
-		    (value & MIPI_CAL_STATUS_DONE) != 0)
-			return 0;
-
-		usleep_range(10, 50);
-	}
-
-	return -ETIMEDOUT;
+	err = readl_relaxed_poll_timeout(status_reg, value,
+					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
+					 (value & MIPI_CAL_STATUS_DONE), 50,
+					 250000);
+	return err;
 }
 
 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
-- 
2.7.4
