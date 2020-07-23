From: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 7/7] i2c: tegra: dump I2C registers on timeout
Date: Thu, 23 Jul 2020 17:48:53 +0530
Message-ID: <1595506733-10307-7-git-send-email-kyarlagadda@nvidia.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595506733-10307-1-git-send-email-kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Rajesh Gumasta <rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Dump I2C regsiters for debug when transfer timeout occurs.

Signed-off-by: Rajesh Gumasta <rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 77198fc..cdc8664 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -126,6 +126,8 @@
 #define  I2C_HS_INTERFACE_TIMING_THD_STA	GENMASK(13, 8)
 #define  I2C_HS_INTERFACE_TIMING_TSU_STA	GENMASK(5, 0)
 
+#define I2C_MST_PACKET_TRANSFER_CNT_STATUS	0x0b0
+
 #define I2C_MST_FIFO_CONTROL			0x0b4
 #define I2C_MST_FIFO_CONTROL_RX_FLUSH		BIT(0)
 #define I2C_MST_FIFO_CONTROL_TX_FLUSH		BIT(1)
@@ -1178,6 +1180,33 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	return -EAGAIN;
 }
 
+static void tegra_i2c_reg_dump(struct tegra_i2c_dev *i2c_dev)
+{
+	dev_dbg(i2c_dev->dev, "--- register dump for debugging ----\n");
+	dev_dbg(i2c_dev->dev, "I2C_CNFG - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_CNFG));
+	dev_dbg(i2c_dev->dev, "I2C_PACKET_TRANSFER_STATUS - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS));
+	dev_dbg(i2c_dev->dev, "I2C_FIFO_CONTROL - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_FIFO_CONTROL));
+	dev_dbg(i2c_dev->dev, "I2C_FIFO_STATUS - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_FIFO_STATUS));
+
+	if (i2c_dev->hw->has_mst_fifo) {
+		dev_dbg(i2c_dev->dev, "I2C_MST_FIFO_CONTROL - 0x%x\n",
+			i2c_readl(i2c_dev, I2C_MST_FIFO_CONTROL));
+		dev_dbg(i2c_dev->dev, "I2C_MST_FIFO_STATUS - 0x%x\n",
+			i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS));
+		dev_dbg(i2c_dev->dev, "I2C_MST_PACKET_TRANSFER_CNT - 0x%x\n",
+			i2c_readl(i2c_dev,
+				  I2C_MST_PACKET_TRANSFER_CNT_STATUS));
+	}
+	dev_dbg(i2c_dev->dev, "I2C_INT_MASK - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_INT_MASK));
+	dev_dbg(i2c_dev->dev, "I2C_INT_STATUS - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_INT_STATUS));
+}
+
 static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			      struct i2c_msg *msg,
 			      enum msg_end_type end_state)
@@ -1331,6 +1360,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
+			tegra_i2c_reg_dump(i2c_dev);
 			tegra_i2c_init(i2c_dev, true);
 			return -ETIMEDOUT;
 		}
@@ -1352,6 +1382,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
+		tegra_i2c_reg_dump(i2c_dev);
 		tegra_i2c_init(i2c_dev, true);
 		return -ETIMEDOUT;
 	}
-- 
2.7.4
