From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/3] rtc: max77686: Use single-byte writes on MAX77620
Date: Fri, 17 Apr 2020 19:08:25 +0200
Message-ID: <20200417170825.2551367-3-thierry.reding@gmail.com>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200417170825.2551367-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The MAX77620 doesn't support bulk writes, so make sure the regmap code
breaks bulk writes into multiple single-byte writes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/rtc/rtc-max77686.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 35fd74b83626..f53db4d6bead 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -78,6 +78,8 @@ struct max77686_rtc_driver_data {
 	int			alarm_pending_status_reg;
 	/* RTC IRQ CHIP for regmap */
 	const struct regmap_irq_chip *rtc_irq_chip;
+	/* regmap configuration for the chip */
+	const struct regmap_config *regmap_config;
 };
 
 struct max77686_rtc_info {
@@ -182,6 +184,11 @@ static const struct regmap_irq_chip max77686_rtc_irq_chip = {
 	.num_irqs	= ARRAY_SIZE(max77686_rtc_irqs),
 };
 
+static const struct regmap_config max77686_rtc_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static const struct max77686_rtc_driver_data max77686_drv_data = {
 	.delay = 16000,
 	.mask  = 0x7f,
@@ -191,6 +198,13 @@ static const struct max77686_rtc_driver_data max77686_drv_data = {
 	.alarm_pending_status_reg = MAX77686_REG_STATUS2,
 	.rtc_i2c_addr = MAX77686_I2C_ADDR_RTC,
 	.rtc_irq_chip = &max77686_rtc_irq_chip,
+	.regmap_config = &max77686_rtc_regmap_config,
+};
+
+static const struct regmap_config max77620_rtc_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.use_single_write = true,
 };
 
 static const struct max77686_rtc_driver_data max77620_drv_data = {
@@ -202,6 +216,7 @@ static const struct max77686_rtc_driver_data max77620_drv_data = {
 	.alarm_pending_status_reg = MAX77686_INVALID_REG,
 	.rtc_i2c_addr = MAX77620_I2C_ADDR_RTC,
 	.rtc_irq_chip = &max77686_rtc_irq_chip,
+	.regmap_config = &max77620_rtc_regmap_config,
 };
 
 static const unsigned int max77802_map[REG_RTC_END] = {
@@ -658,11 +673,6 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
 	return ret;
 }
 
-static const struct regmap_config max77686_rtc_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
 static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
@@ -698,7 +708,7 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 	}
 
 	info->rtc_regmap = devm_regmap_init_i2c(info->rtc,
-						&max77686_rtc_regmap_config);
+						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap)) {
 		ret = PTR_ERR(info->rtc_regmap);
 		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
-- 
2.24.1
