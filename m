From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V19 4/7] i2c: tegra: update maximum transfer size
Date: Tue, 12 Feb 2019 11:06:45 -0800
Message-ID: <1549998408-9137-4-git-send-email-skomatineni@nvidia.com>
References: <1549998408-9137-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549998408-9137-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com
Cc: wsa@the-dreams.de, peda@axentia.se, digetx@gmail.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra194 supports maximum 64K bytes per packet including 12 bytes of
packet header irrespective of PIO or DMA mode transfer.

This patch updates Tegra194 max write length to account for packet
header size for transfers.

Cc: stable@vger.kernel.org # 4.20+

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 [V19]	: Splitted maximum transfer limit patch into 2 separate patches to
	  allow the fix to be applied for old Tegra chips and for Tegra194.
 [V18] 	: Using Max of SZ_64K (65536) size for dma buffer instead of 65535
 [V16/V17] : I2C core max message size is 65535. So, max_read_len of 65535 is NOP.
	  Removed it leaving max_write_len
 [V15]	: This is new patch in this series.

 drivers/i2c/busses/i2c-tegra.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 036cab795426..f8265bd5d02c 100644
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
@@ -900,12 +903,13 @@ static const struct i2c_algorithm tegra_i2c_algo = {
 /* payload size is only 12 bit */
 static const struct i2c_adapter_quirks tegra_i2c_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
-	.max_read_len = 4096,
-	.max_write_len = 4096 - 12,
+	.max_read_len = SZ_4K,
+	.max_write_len = SZ_4K - I2C_PACKET_HEADER_SIZE,
 };
 
 static const struct i2c_adapter_quirks tegra194_i2c_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
+	.max_write_len = SZ_64K - I2C_PACKET_HEADER_SIZE,
 };
 
 static struct i2c_bus_recovery_info tegra_i2c_recovery_info = {
-- 
2.7.4
