From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFT PATCH 2/2] i2c: tegra: add support for fast plus (FM+) mode clock rate
Date: Tue, 30 Jun 2015 16:24:27 +0530
Message-ID: <1435661667-11554-2-git-send-email-ldewangan@nvidia.com>
References: <1435661667-11554-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435661667-11554-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrewc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra I2C controller required to configure the clock divisor
register inside controller to different value based on the clock
speed. The recommended clock divisor for the I2C controller for
standard/fast mode is 0x19 and for fast-mode plus is 0x10.

Add support to configure clock divisor register of I2C controller
based on bus clock rate.

This clock divisor is supported form T114 onwards.

This is based on change done by
        Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Stephen/Andrew,
I need help on testing this on other platform. I tested this on T210.

 drivers/i2c/busses/i2c-tegra.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 53f816b..6a77a93 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -142,6 +142,7 @@ struct tegra_i2c_hw_feature {
 	bool has_config_load_reg;
 	int clk_divisor_hs_mode;
 	int clk_divisor_std_fast_mode;
+	u16 clk_divisor_fast_plus_mode;
 };
 
 /**
@@ -181,6 +182,7 @@ struct tegra_i2c_dev {
 	size_t msg_buf_remaining;
 	int msg_read;
 	u32 bus_clk_rate;
+	u16 clk_divisor_non_hs_mode;
 	bool is_suspended;
 };
 
@@ -441,7 +443,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 
 	/* Make sure clock divisor programmed correctly */
 	clk_divisor = i2c_dev->hw->clk_divisor_hs_mode;
-	clk_divisor |= i2c_dev->hw->clk_divisor_std_fast_mode <<
+	clk_divisor |= i2c_dev->clk_divisor_non_hs_mode <<
 					I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT;
 	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
 
@@ -697,6 +699,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_single_clk_source = false,
 	.clk_divisor_hs_mode = 3,
 	.clk_divisor_std_fast_mode = 0,
+	.clk_divisor_fast_plus_mode = 0,
 	.has_config_load_reg = false,
 };
 
@@ -706,6 +709,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_single_clk_source = false,
 	.clk_divisor_hs_mode = 3,
 	.clk_divisor_std_fast_mode = 0,
+	.clk_divisor_fast_plus_mode = 0,
 	.has_config_load_reg = false,
 };
 
@@ -715,6 +719,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
 	.clk_divisor_std_fast_mode = 0x19,
+	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = false,
 };
 
@@ -724,6 +729,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
 	.clk_divisor_std_fast_mode = 0x19,
+	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = true,
 };
 
@@ -821,7 +827,14 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	clk_multiplier *= (i2c_dev->hw->clk_divisor_std_fast_mode + 1);
+	i2c_dev->clk_divisor_non_hs_mode =
+			i2c_dev->hw->clk_divisor_std_fast_mode;
+	if (i2c_dev->hw->clk_divisor_fast_plus_mode &&
+		(i2c_dev->bus_clk_rate == 1000000))
+		i2c_dev->clk_divisor_non_hs_mode =
+			i2c_dev->hw->clk_divisor_fast_plus_mode;
+
+	clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
 	ret = clk_set_rate(i2c_dev->div_clk,
 			   i2c_dev->bus_clk_rate * clk_multiplier);
 	if (ret) {
-- 
2.1.4
