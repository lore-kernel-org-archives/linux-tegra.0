From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH 5/7] i2c: tegra: enable second level clock gating
Date: Thu, 23 Jul 2020 17:48:51 +0530
Message-ID: <1595506733-10307-5-git-send-email-kyarlagadda@nvidia.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: digetx@gmail.com, linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ldewangan@nvidia.com, smohammed@nvidia.com, rgumasta@nvidia.com, Krishna Yarlagadda <kyarlagadda@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable Second Level Clock Gating feature for supported chips.
With SLCG enabled, software need not control clocks anymore
and leave clocks enabled always on.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2f654ed..8ab968e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -235,6 +235,7 @@ struct tegra_i2c_hw_feature {
 	u32 setup_hold_time_fast_fast_plus_mode;
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
+	bool has_slcg_support;
 };
 
 /**
@@ -299,6 +300,7 @@ struct tegra_i2c_dev {
 	struct completion dma_complete;
 	bool is_curr_atomic_xfer;
 	int clk_divisor_hs_mode;
+	bool is_clkon_always;
 };
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
@@ -1478,6 +1480,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.supports_bus_clear = false,
 	.has_reg_write_buffering = true,
 	.has_hs_mode_support = false,
+	.has_slcg_support = false,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1506,6 +1509,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.supports_bus_clear = false,
 	.has_reg_write_buffering = true,
 	.has_hs_mode_support = false,
+	.has_slcg_support = false,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1534,6 +1538,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.supports_bus_clear = true,
 	.has_reg_write_buffering = true,
 	.has_hs_mode_support = false,
+	.has_slcg_support = false,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1562,6 +1567,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.supports_bus_clear = true,
 	.has_reg_write_buffering = true,
 	.has_hs_mode_support = false,
+	.has_slcg_support = false,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1590,6 +1596,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.supports_bus_clear = true,
 	.has_reg_write_buffering = true,
 	.has_hs_mode_support = false,
+	.has_slcg_support = false,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1618,6 +1625,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.supports_bus_clear = true,
 	.has_reg_write_buffering = false,
 	.has_hs_mode_support = false,
+	.has_slcg_support = true,
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x3,
@@ -1646,6 +1654,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.supports_bus_clear = true,
 	.has_reg_write_buffering = false,
 	.has_hs_mode_support = true,
+	.has_slcg_support = true,
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
@@ -1822,7 +1831,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (i2c_dev->is_multimaster_mode) {
+	if (i2c_dev->is_multimaster_mode || i2c_dev->hw->has_slcg_support)
+		i2c_dev->is_clkon_always = true;
+	else
+		i2c_dev->is_clkon_always = false;
+
+	if (i2c_dev->is_clkon_always) {
 		ret = clk_enable(i2c_dev->div_clk);
 		if (ret < 0) {
 			dev_err(i2c_dev->dev, "div_clk enable failed %d\n",
@@ -1875,7 +1889,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	tegra_i2c_release_dma(i2c_dev);
 
 disable_div_clk:
-	if (i2c_dev->is_multimaster_mode)
+	if (i2c_dev->is_clkon_always)
 		clk_disable(i2c_dev->div_clk);
 
 put_rpm:
@@ -1908,7 +1922,7 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c_dev->adapter);
 
-	if (i2c_dev->is_multimaster_mode)
+	if (i2c_dev->is_clkon_always)
 		clk_disable(i2c_dev->div_clk);
 
 	pm_runtime_disable(&pdev->dev);
@@ -1932,7 +1946,8 @@ static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 	int err = 0;
 
-	i2c_mark_adapter_suspended(&i2c_dev->adapter);
+	if (i2c_dev->is_clkon_always)
+		clk_disable(i2c_dev->div_clk);
 
 	if (!pm_runtime_status_suspended(dev))
 		err = tegra_i2c_runtime_suspend(dev);
@@ -1968,6 +1983,15 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 			return err;
 	}
 
+	if (i2c_dev->is_clkon_always) {
+		err = clk_enable(i2c_dev->div_clk);
+		if (err < 0) {
+			dev_err(i2c_dev->dev, "clock enable failed %d\n",
+				err);
+			return err;
+		}
+	}
+
 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
 
 	return 0;
-- 
2.7.4
