From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V4 2/2] i2c: tegra: remove multi-master support
Date: Mon, 18 Feb 2019 20:50:25 -0800
Message-ID: <1550551825-1245-2-git-send-email-skomatineni@nvidia.com>
References: <1550551825-1245-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550551825-1245-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com
Cc: wsa@the-dreams.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

multi-master support is defeatured on Tegra210 and Tegra186 due to
known bugs.

This patch removes multi-master support for Tegra210 and Tegra186
i2c hw feature.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e6851904acc1..26f686bc3491 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1409,7 +1409,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = true,
-	.has_multi_master_mode = true,
+	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
@@ -1434,7 +1434,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = true,
-	.has_multi_master_mode = true,
+	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
-- 
2.7.4
