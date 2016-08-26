From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 2/9] i2c: tegra: Use BIT macro
Date: Fri, 26 Aug 2016 14:08:58 +0100
Message-ID: <1472216945-11818-3-git-send-email-jonathanh@nvidia.com>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Checkpatch warns about spacing around the '<<' operator in the Tegra I2C
driver and so fix these by converting the bit definitions that are using
this operator to use the BIT macro.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 66 +++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b90bc326907d..98d13437eb42 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -36,21 +36,21 @@
 
 #define I2C_CNFG				0x000
 #define I2C_CNFG_DEBOUNCE_CNT_SHIFT		12
-#define I2C_CNFG_PACKET_MODE_EN			(1<<10)
-#define I2C_CNFG_NEW_MASTER_FSM			(1<<11)
-#define I2C_CNFG_MULTI_MASTER_MODE		(1<<17)
+#define I2C_CNFG_PACKET_MODE_EN			BIT(10)
+#define I2C_CNFG_NEW_MASTER_FSM			BIT(11)
+#define I2C_CNFG_MULTI_MASTER_MODE		BIT(17)
 #define I2C_STATUS				0x01C
 #define I2C_SL_CNFG				0x020
-#define I2C_SL_CNFG_NACK			(1<<1)
-#define I2C_SL_CNFG_NEWSL			(1<<2)
+#define I2C_SL_CNFG_NACK			BIT(1)
+#define I2C_SL_CNFG_NEWSL			BIT(2)
 #define I2C_SL_ADDR1				0x02c
 #define I2C_SL_ADDR2				0x030
 #define I2C_TX_FIFO				0x050
 #define I2C_RX_FIFO				0x054
 #define I2C_PACKET_TRANSFER_STATUS		0x058
 #define I2C_FIFO_CONTROL			0x05c
-#define I2C_FIFO_CONTROL_TX_FLUSH		(1<<1)
-#define I2C_FIFO_CONTROL_RX_FLUSH		(1<<0)
+#define I2C_FIFO_CONTROL_TX_FLUSH		BIT(1)
+#define I2C_FIFO_CONTROL_RX_FLUSH		BIT(0)
 #define I2C_FIFO_CONTROL_TX_TRIG_SHIFT		5
 #define I2C_FIFO_CONTROL_RX_TRIG_SHIFT		2
 #define I2C_FIFO_STATUS				0x060
@@ -60,26 +60,26 @@
 #define I2C_FIFO_STATUS_RX_SHIFT		0
 #define I2C_INT_MASK				0x064
 #define I2C_INT_STATUS				0x068
-#define I2C_INT_PACKET_XFER_COMPLETE		(1<<7)
-#define I2C_INT_ALL_PACKETS_XFER_COMPLETE	(1<<6)
-#define I2C_INT_TX_FIFO_OVERFLOW		(1<<5)
-#define I2C_INT_RX_FIFO_UNDERFLOW		(1<<4)
-#define I2C_INT_NO_ACK				(1<<3)
-#define I2C_INT_ARBITRATION_LOST		(1<<2)
-#define I2C_INT_TX_FIFO_DATA_REQ		(1<<1)
-#define I2C_INT_RX_FIFO_DATA_REQ		(1<<0)
+#define I2C_INT_PACKET_XFER_COMPLETE		BIT(7)
+#define I2C_INT_ALL_PACKETS_XFER_COMPLETE	BIT(6)
+#define I2C_INT_TX_FIFO_OVERFLOW		BIT(5)
+#define I2C_INT_RX_FIFO_UNDERFLOW		BIT(4)
+#define I2C_INT_NO_ACK				BIT(3)
+#define I2C_INT_ARBITRATION_LOST		BIT(2)
+#define I2C_INT_TX_FIFO_DATA_REQ		BIT(1)
+#define I2C_INT_RX_FIFO_DATA_REQ		BIT(0)
 #define I2C_CLK_DIVISOR				0x06c
 #define I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT	16
 #define I2C_CLK_MULTIPLIER_STD_FAST_MODE	8
 
 #define DVC_CTRL_REG1				0x000
-#define DVC_CTRL_REG1_INTR_EN			(1<<10)
+#define DVC_CTRL_REG1_INTR_EN			BIT(10)
 #define DVC_CTRL_REG2				0x004
 #define DVC_CTRL_REG3				0x008
-#define DVC_CTRL_REG3_SW_PROG			(1<<26)
-#define DVC_CTRL_REG3_I2C_DONE_INTR_EN		(1<<30)
+#define DVC_CTRL_REG3_SW_PROG			BIT(26)
+#define DVC_CTRL_REG3_I2C_DONE_INTR_EN		BIT(30)
 #define DVC_STATUS				0x00c
-#define DVC_STATUS_I2C_DONE_INTR		(1<<30)
+#define DVC_STATUS_I2C_DONE_INTR		BIT(30)
 
 #define I2C_ERR_NONE				0x00
 #define I2C_ERR_NO_ACK				0x01
@@ -89,26 +89,26 @@
 #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
 #define PACKET_HEADER0_PACKET_ID_SHIFT		16
 #define PACKET_HEADER0_CONT_ID_SHIFT		12
-#define PACKET_HEADER0_PROTOCOL_I2C		(1<<4)
-
-#define I2C_HEADER_HIGHSPEED_MODE		(1<<22)
-#define I2C_HEADER_CONT_ON_NAK			(1<<21)
-#define I2C_HEADER_SEND_START_BYTE		(1<<20)
-#define I2C_HEADER_READ				(1<<19)
-#define I2C_HEADER_10BIT_ADDR			(1<<18)
-#define I2C_HEADER_IE_ENABLE			(1<<17)
-#define I2C_HEADER_REPEAT_START			(1<<16)
-#define I2C_HEADER_CONTINUE_XFER		(1<<15)
+#define PACKET_HEADER0_PROTOCOL_I2C		BIT(4)
+
+#define I2C_HEADER_HIGHSPEED_MODE		BIT(22)
+#define I2C_HEADER_CONT_ON_NAK			BIT(21)
+#define I2C_HEADER_SEND_START_BYTE		BIT(20)
+#define I2C_HEADER_READ				BIT(19)
+#define I2C_HEADER_10BIT_ADDR			BIT(18)
+#define I2C_HEADER_IE_ENABLE			BIT(17)
+#define I2C_HEADER_REPEAT_START			BIT(16)
+#define I2C_HEADER_CONTINUE_XFER		BIT(15)
 #define I2C_HEADER_MASTER_ADDR_SHIFT		12
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_CONFIG_LOAD				0x08C
-#define I2C_MSTR_CONFIG_LOAD			(1 << 0)
-#define I2C_SLV_CONFIG_LOAD			(1 << 1)
-#define I2C_TIMEOUT_CONFIG_LOAD			(1 << 2)
+#define I2C_MSTR_CONFIG_LOAD			BIT(0)
+#define I2C_SLV_CONFIG_LOAD			BIT(1)
+#define I2C_TIMEOUT_CONFIG_LOAD			BIT(2)
 
 #define I2C_CLKEN_OVERRIDE			0x090
-#define I2C_MST_CORE_CLKEN_OVR			(1 << 0)
+#define I2C_MST_CORE_CLKEN_OVR			BIT(0)
 
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
-- 
2.1.4
