From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V19 3/7] i2c: tegra: fix maximum transfer size
Date: Tue, 12 Feb 2019 11:06:44 -0800
Message-ID: <1549998408-9137-3-git-send-email-skomatineni@nvidia.com>
References: <1549998408-9137-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549998408-9137-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com
Cc: wsa@the-dreams.de, peda@axentia.se, digetx@gmail.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra186 and prior supports maximum 4K bytes per packet transfer
including 12 bytes of packet header.

This patch fixes max write length limit to account packet header
size for transfers.

Cc: stable@vger.kernel.org # 4.4+

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 [V19]	: Splitted maximum transfer limit patch into 2 separate patches to
	  allow this fix for old Tegra chips and next patch in this series for
	  Tegra194.
 [V18] 	: Using Max of SZ_64K (65536) size for dma buffer instead of 65535
 [V16/V17] : I2C core max message size is 65535. So, max_read_len of 65535 is NOP.
	  Removed it leaving max_write_len
 [V15]	: This is new patch in this series.


 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a46446dbc48a..036cab795426 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -901,7 +901,7 @@ static const struct i2c_algorithm tegra_i2c_algo = {
 static const struct i2c_adapter_quirks tegra_i2c_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
 	.max_read_len = 4096,
-	.max_write_len = 4096,
+	.max_write_len = 4096 - 12,
 };
 
 static const struct i2c_adapter_quirks tegra194_i2c_quirks = {
-- 
2.7.4
