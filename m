From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] i2c: tegra: Add de-bounce cycles.
Date: Mon, 25 Apr 2011 15:32:27 -0600
Message-ID: <1303767147-17493-4-git-send-email-swarren@nvidia.com>
References: <1303767147-17493-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303767147-17493-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jay Cheng <jacheng-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Radtke <kradtke-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Jay Cheng <jacheng-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This enables debouncing of the I2C lines. The debounce period is
2 * the debounce register field value, in terms of the I2C block's main
clock. The Tegra TRM indicates that a setting yielding >50nS is
desirable. Hence, a setting of 2 => 4 clocks @ 72MHz => ~55nS.

Signed-off-by: Ken Radtke <kradtke-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[swarren: Added commit description body,
 Fixed 80-column limit, Reverted file permission change]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6b69b70..4d93196 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -35,6 +35,7 @@
 #define BYTES_PER_FIFO_WORD 4
 
 #define I2C_CNFG				0x000
+#define I2C_CNFG_DEBOUNCE_CNT_SHIFT		12
 #define I2C_CNFG_PACKET_MODE_EN			(1<<10)
 #define I2C_CNFG_NEW_MASTER_FSM			(1<<11)
 #define I2C_STATUS				0x01C
@@ -328,7 +329,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->is_dvc)
 		tegra_dvc_init(i2c_dev);
 
-	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN;
+	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
+		(0x2 << I2C_CNFG_DEBOUNCE_CNT_SHIFT);
 	i2c_writel(i2c_dev, val, I2C_CNFG);
 	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
 	clk_set_rate(i2c_dev->clk, i2c_dev->bus_clk_rate * 8);
-- 
1.7.0.4
