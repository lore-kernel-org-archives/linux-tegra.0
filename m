From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFT PATCH 1/2] i2c: tegra: update CONFIG_LOAD for new conifiguration
Date: Tue, 30 Jun 2015 16:24:26 +0530
Message-ID: <1435661667-11554-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrewc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Once the new configuration is set on the conifg register of
I2C controller, it is require to update the CONFIG_LOAD register
to transfer the new SW configuration to actual HW internal
registers that would be used in the actual logic.

It is like, SW is programming only shadow registers through
regular configuration and when these load_config bit fields
are set to 1, it causes the regular/shadows registers
configuration transferred to the HW internal active registers.
So SW has to set these bit fields at the end of all regular
registers configuration. And these config_load bits are HW
auto-clear bits. HW clears these bit fields once the register
configuration is moved to HW internal active registers. So SW
has to wait until these bits are auto-cleared before going
for any further programming

This mechanism is supported on T124 and after this SoCs.

This is based on change done by
	Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Stephen/Andrew,
I need help on testing this on other platform. I tested this on T210.

 drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1bcd75e..53f816b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -100,6 +100,12 @@
 #define I2C_HEADER_CONTINUE_XFER		(1<<15)
 #define I2C_HEADER_MASTER_ADDR_SHIFT		12
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
+
+#define I2C_CONFIG_LOAD				0x08C
+#define I2C_MSTR_CONFIG_LOAD			(1 << 0)
+#define I2C_SLV_CONFIG_LOAD			(1 << 1)
+#define I2C_TIMEOUT_CONFIG_LOAD			(1 << 2)
+
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
  * @MSG_END_STOP: Send stop pulse at end of transfer.
@@ -121,6 +127,8 @@ enum msg_end_type {
  * @has_single_clk_source: The i2c controller has single clock source. Tegra30
  *		and earlier Socs has two clock sources i.e. div-clk and
  *		fast-clk.
+ * @has_config_load_reg: Has the config load register to load the new
+ *		configuration.
  * @clk_divisor_hs_mode: Clock divisor in HS mode.
  * @clk_divisor_std_fast_mode: Clock divisor in standard/fast mode. It is
  *		applicable if there is no fast clock source i.e. single clock
@@ -131,6 +139,7 @@ struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
 	bool has_per_pkt_xfer_complete_irq;
 	bool has_single_clk_source;
+	bool has_config_load_reg;
 	int clk_divisor_hs_mode;
 	int clk_divisor_std_fast_mode;
 };
@@ -410,6 +419,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	u32 val;
 	int err = 0;
 	u32 clk_divisor;
+	unsigned long timeout = jiffies + HZ;
 
 	err = tegra_i2c_clock_enable(i2c_dev);
 	if (err < 0) {
@@ -451,6 +461,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (tegra_i2c_flush_fifos(i2c_dev))
 		err = -ETIMEDOUT;
 
+	if (i2c_dev->hw->has_config_load_reg) {
+		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
+			if (time_after(jiffies, timeout)) {
+				dev_warn(i2c_dev->dev,
+					"timeout waiting for config load\n");
+				return -ETIMEDOUT;
+			}
+			msleep(1);
+		}
+	}
+
 	tegra_i2c_clock_disable(i2c_dev);
 
 	if (i2c_dev->irq_disabled) {
@@ -675,6 +697,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_single_clk_source = false,
 	.clk_divisor_hs_mode = 3,
 	.clk_divisor_std_fast_mode = 0,
+	.has_config_load_reg = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -683,6 +706,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_single_clk_source = false,
 	.clk_divisor_hs_mode = 3,
 	.clk_divisor_std_fast_mode = 0,
+	.has_config_load_reg = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -691,10 +715,21 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
 	.clk_divisor_std_fast_mode = 0x19,
+	.has_config_load_reg = false,
+};
+
+static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.has_single_clk_source = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_fast_mode = 0x19,
+	.has_config_load_reg = true,
 };
 
 /* Match table for of_platform binding */
 static const struct of_device_id tegra_i2c_of_match[] = {
+	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
 	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
-- 
2.1.4
