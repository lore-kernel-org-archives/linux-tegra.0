From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V1] i2c: tegra: fix tegra186 hw supported features
Date: Sat, 16 Feb 2019 08:33:07 -0800
Message-ID: <1550334787-27703-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com
Cc: wsa@the-dreams.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra186 does not support multi-master mode and also there is no
master fifo control register.

This patch fixes supported features of Tegra186 and prevents
crashing during boot as master fifo control register are not
present on Tegra186 and prior.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a4cd79c9f7a7..24c206db70a4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1434,9 +1434,9 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = true,
-	.has_multi_master_mode = true,
+	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
-	.has_mst_fifo = true,
+	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
-- 
2.7.4
