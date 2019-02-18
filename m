From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V2] i2c: tegra: fix tegra186 hw feature support for has_mst_fifo_reg
Date: Mon, 18 Feb 2019 13:07:35 -0800
Message-ID: <1550524059-28900-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com
Cc: wsa@the-dreams.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra186 does not have master fifo control register and instead
uses fifo control register like prior tegra chipset.

This patch fixes this and prevents crashing during boot when
accessing fifo control registers.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a4cd79c9f7a7..e6851904acc1 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1436,7 +1436,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_config_load_reg = true,
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
-	.has_mst_fifo = true,
+	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
-- 
2.7.4
