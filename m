From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH 6/7] i2c: tegra: DMA support for t186 and t194
Date: Thu, 23 Jul 2020 17:48:52 +0530
Message-ID: <1595506733-10307-6-git-send-email-kyarlagadda@nvidia.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: digetx@gmail.com, linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ldewangan@nvidia.com, smohammed@nvidia.com, rgumasta@nvidia.com, Krishna Yarlagadda <kyarlagadda@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable GPC DMA support for Tegra186 and Tegra194

Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 8ab968e..77198fc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -236,6 +236,7 @@ struct tegra_i2c_hw_feature {
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
 	bool has_slcg_support;
+	bool has_gpc_dma;
 };
 
 /**
@@ -432,11 +433,18 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_addr_t dma_phys;
 	int err;
 
-	if (!i2c_dev->hw->has_apb_dma)
-		return 0;
-
-	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
+	if (i2c_dev->hw->has_gpc_dma) {
+		if (!IS_ENABLED(CONFIG_TEGRA_GPC_DMA)) {
+			dev_dbg(i2c_dev->dev, "Support for GPC DMA not enabled!\n");
+			return 0;
+		}
+	} else if (i2c_dev->hw->has_apb_dma) {
+		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
+			dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
+			return 0;
+		}
+	} else {
+		dev_dbg(i2c_dev->dev, "DMA is not enabled!\n");
 		return 0;
 	}
 
@@ -1490,6 +1498,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_gpc_dma = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1519,6 +1528,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_gpc_dma = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1548,6 +1558,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_gpc_dma = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1577,6 +1588,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_gpc_dma = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1606,6 +1618,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_gpc_dma = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1635,6 +1648,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_gpc_dma = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1664,6 +1678,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
+	.has_gpc_dma = true,
 };
 
 /* Match table for of_platform binding */
-- 
2.7.4
