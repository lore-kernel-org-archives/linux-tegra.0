From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] i2c: tegra: Enable new slave mode.
Date: Mon, 25 Apr 2011 12:29:54 -0600
Message-ID: <1303756194-6253-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kenneth Waters <kwaters-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable <stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Kenneth Waters <kwaters-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

For Tegra i2c controller to function properly new slave mode must be
enabled.

swarren notes:

In particular, I found this was needed when working on enabling the
Tegra audio driver on the Seaboard board. There are two different PCB
layouts for this board; a "clamshell" version, which works just fine
without this change, and the original non-clamshell version, which needs
this change in order for I2C to operate correctly. Without it, I2C
probing fails for some devices, e.g. with:

wm8903 0-001a: Device with ID register 0 is not a WM8903
wm8903 0-001a: asoc: failed to probe CODEC wm8903.0-001a: -19
asoc: failed to instantiate card tegra-wm8903: -19
ALSA device list:
  No soundcards found.

Signed-off-by: Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: stable <stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b4ab39b..5f1b92c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -330,6 +330,11 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
 	clk_set_rate(i2c_dev->clk, i2c_dev->bus_clk_rate * 8);
 
+	if (!i2c_dev->is_dvc) {
+		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
+		i2c_writel(i2c_dev, sl_cfg | I2C_SL_CNFG_NEWSL, I2C_SL_CNFG);
+	}
+
 	val = 7 << I2C_FIFO_CONTROL_TX_TRIG_SHIFT |
 		0 << I2C_FIFO_CONTROL_RX_TRIG_SHIFT;
 	i2c_writel(i2c_dev, val, I2C_FIFO_CONTROL);
-- 
1.7.0.4
