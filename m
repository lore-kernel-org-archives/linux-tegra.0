From: Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V4 1/6] i2c: tegra: clean up macros
Date: Mon, 10 Jun 2019 10:08:30 -0700
Message-ID: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Clean up macros by:
1) removing unused macros
2) replace constants by macro BIT()

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1dbba39..00692d8 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -54,20 +54,15 @@
 #define I2C_INT_STATUS				0x068
 #define I2C_INT_BUS_CLR_DONE			BIT(11)
 #define I2C_INT_PACKET_XFER_COMPLETE		BIT(7)
-#define I2C_INT_ALL_PACKETS_XFER_COMPLETE	BIT(6)
-#define I2C_INT_TX_FIFO_OVERFLOW		BIT(5)
-#define I2C_INT_RX_FIFO_UNDERFLOW		BIT(4)
 #define I2C_INT_NO_ACK				BIT(3)
 #define I2C_INT_ARBITRATION_LOST		BIT(2)
 #define I2C_INT_TX_FIFO_DATA_REQ		BIT(1)
 #define I2C_INT_RX_FIFO_DATA_REQ		BIT(0)
 #define I2C_CLK_DIVISOR				0x06c
 #define I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT	16
-#define I2C_CLK_MULTIPLIER_STD_FAST_MODE	8
 
 #define DVC_CTRL_REG1				0x000
 #define DVC_CTRL_REG1_INTR_EN			BIT(10)
-#define DVC_CTRL_REG2				0x004
 #define DVC_CTRL_REG3				0x008
 #define DVC_CTRL_REG3_SW_PROG			BIT(26)
 #define DVC_CTRL_REG3_I2C_DONE_INTR_EN		BIT(30)
@@ -75,24 +70,21 @@
 #define DVC_STATUS_I2C_DONE_INTR		BIT(30)
 
 #define I2C_ERR_NONE				0x00
-#define I2C_ERR_NO_ACK				0x01
-#define I2C_ERR_ARBITRATION_LOST		0x02
-#define I2C_ERR_UNKNOWN_INTERRUPT		0x04
+#define I2C_ERR_NO_ACK				BIT(0)
+#define I2C_ERR_ARBITRATION_LOST		BIT(1)
+#define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
 
 #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
 #define PACKET_HEADER0_PACKET_ID_SHIFT		16
 #define PACKET_HEADER0_CONT_ID_SHIFT		12
 #define PACKET_HEADER0_PROTOCOL_I2C		BIT(4)
 
-#define I2C_HEADER_HIGHSPEED_MODE		BIT(22)
 #define I2C_HEADER_CONT_ON_NAK			BIT(21)
-#define I2C_HEADER_SEND_START_BYTE		BIT(20)
 #define I2C_HEADER_READ				BIT(19)
 #define I2C_HEADER_10BIT_ADDR			BIT(18)
 #define I2C_HEADER_IE_ENABLE			BIT(17)
 #define I2C_HEADER_REPEAT_START			BIT(16)
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
-#define I2C_HEADER_MASTER_ADDR_SHIFT		12
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_BUS_CLEAR_CNFG			0x084
@@ -106,8 +98,6 @@
 
 #define I2C_CONFIG_LOAD				0x08C
 #define I2C_MSTR_CONFIG_LOAD			BIT(0)
-#define I2C_SLV_CONFIG_LOAD			BIT(1)
-#define I2C_TIMEOUT_CONFIG_LOAD			BIT(2)
 
 #define I2C_CLKEN_OVERRIDE			0x090
 #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
@@ -133,7 +123,6 @@
 #define I2C_STANDARD_MODE			100000
 #define I2C_FAST_MODE				400000
 #define I2C_FAST_PLUS_MODE			1000000
-#define I2C_HS_MODE				3500000
 
 /* Packet header size in bytes */
 #define I2C_PACKET_HEADER_SIZE			12
-- 
2.7.4
