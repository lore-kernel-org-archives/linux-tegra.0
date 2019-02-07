From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V15 3/6] i2c: tegra: fix maximum transfer size
Date: Thu, 7 Feb 2019 13:47:17 -0800
Message-ID: <1549576040-15907-3-git-send-email-skomatineni@nvidia.com>
References: <1549576040-15907-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549576040-15907-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: digetx@gmail.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra194 supports maximum 64K bytes transfer per packet.
Tegra186 and prior supports maximum 4K bytes transfer per packet.
This includes 12 bytes of packet header.

This patch fixes max write length to account for packet header size
for transfers.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 [V15]	: This is new patch in this series.

 drivers/i2c/busses/i2c-tegra.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3758c7a2c781..ab474cc86e0a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -125,6 +125,9 @@
 #define I2C_MST_FIFO_STATUS_TX_MASK		0xff0000
 #define I2C_MST_FIFO_STATUS_TX_SHIFT		16
 
+/* Packet header size in bytes */
+#define I2C_PACKET_HEADER_SIZE			12
+
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
  * @MSG_END_STOP: Send stop pulse at end of transfer.
@@ -900,11 +903,13 @@ static const struct i2c_algorithm tegra_i2c_algo = {
 static const struct i2c_adapter_quirks tegra_i2c_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
 	.max_read_len = 4096,
-	.max_write_len = 4096,
+	.max_write_len = 4096 - I2C_PACKET_HEADER_SIZE,
 };
 
 static const struct i2c_adapter_quirks tegra194_i2c_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
+	.max_read_len = 65535,
+	.max_write_len = 65535 - I2C_PACKET_HEADER_SIZE,
 };
 
 static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
-- 
2.7.4
