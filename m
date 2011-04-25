From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] i2c: tegra: fix repeated start handling
Date: Mon, 25 Apr 2011 15:32:26 -0600
Message-ID: <1303767147-17493-3-git-send-email-swarren@nvidia.com>
References: <1303767147-17493-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303767147-17493-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>

A repeated start should be used for all but the last msg in an xfer.  The
NOSTART flag is for skipping the START frame (addr/rw)

Signed-off-by: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c0b9aa7..6b69b70 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -451,12 +451,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	packet_header = msg->addr << I2C_HEADER_SLAVE_ADDR_SHIFT;
 	packet_header |= I2C_HEADER_IE_ENABLE;
+	if (!stop)
+		packet_header |= I2C_HEADER_REPEAT_START;
 	if (msg->flags & I2C_M_TEN)
 		packet_header |= I2C_HEADER_10BIT_ADDR;
 	if (msg->flags & I2C_M_IGNORE_NAK)
 		packet_header |= I2C_HEADER_CONT_ON_NAK;
-	if (msg->flags & I2C_M_NOSTART)
-		packet_header |= I2C_HEADER_REPEAT_START;
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 	i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
-- 
1.7.0.4
