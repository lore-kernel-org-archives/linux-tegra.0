From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/5] mfd: max77620: Support Maxim 77663
Date: Sun, 21 Apr 2019 20:48:31 +0300
Message-ID: <20190421174834.9366-3-digetx@gmail.com>
References: <20190421174834.9366-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190421174834.9366-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add support for Maxim 77663 using the Max77620 driver. The hardware
is very similar to Max77663/20024, although there are couple minor
differences.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/max77620.c       | 68 +++++++++++++++++++++++++++++++++++-
 include/linux/mfd/max77620.h |  1 +
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index d8ddd1a6f304..3b6dded0595c 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -111,6 +111,25 @@ static const struct mfd_cell max20024_children[] = {
 	},
 };
 
+static const struct mfd_cell max77663_children[] = {
+	{ .name = "max77620-clock", },
+	{ .name = "max77663-pmic", },
+	{ .name = "max77620-watchdog", },
+	{
+		.name = "max77620-gpio",
+		.resources = gpio_resources,
+		.num_resources = ARRAY_SIZE(gpio_resources),
+	}, {
+		.name = "max77620-rtc",
+		.resources = rtc_resources,
+		.num_resources = ARRAY_SIZE(rtc_resources),
+	}, {
+		.name = "max77663-power",
+		.resources = power_resources,
+		.num_resources = ARRAY_SIZE(power_resources),
+	},
+};
+
 static const struct regmap_range max77620_readable_ranges[] = {
 	regmap_reg_range(MAX77620_REG_CNFGGLBL1, MAX77620_REG_DVSSD4),
 };
@@ -171,6 +190,35 @@ static const struct regmap_config max20024_regmap_config = {
 	.volatile_table = &max77620_volatile_table,
 };
 
+static const struct regmap_range max77663_readable_ranges[] = {
+	regmap_reg_range(MAX77620_REG_CNFGGLBL1, MAX77620_REG_CID5),
+};
+
+static const struct regmap_access_table max77663_readable_table = {
+	.yes_ranges = max77663_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(max77663_readable_ranges),
+};
+
+static const struct regmap_range max77663_writable_ranges[] = {
+	regmap_reg_range(MAX77620_REG_CNFGGLBL1, MAX77620_REG_CID5),
+};
+
+static const struct regmap_access_table max77663_writable_table = {
+	.yes_ranges = max77663_writable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(max77663_writable_ranges),
+};
+
+static const struct regmap_config max77663_regmap_config = {
+	.name = "power-slave",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX77620_REG_CID5 + 1,
+	.cache_type = REGCACHE_RBTREE,
+	.rd_table = &max77663_readable_table,
+	.wr_table = &max77663_writable_table,
+	.volatile_table = &max77620_volatile_table,
+};
+
 /*
  * MAX77620 and MAX20024 has the following steps of the interrupt handling
  * for TOP interrupts:
@@ -237,6 +285,9 @@ static int max77620_get_fps_period_reg_value(struct max77620_chip *chip,
 	case MAX20024:
 		fps_min_period = MAX20024_FPS_PERIOD_MIN_US;
 		break;
+	case MAX77663:
+		fps_min_period = MAX20024_FPS_PERIOD_MIN_US;
+		break;
 	case MAX77620:
 		fps_min_period = MAX77620_FPS_PERIOD_MIN_US;
 		break;
@@ -274,6 +325,9 @@ static int max77620_config_fps(struct max77620_chip *chip,
 	case MAX77620:
 		fps_max_period = MAX77620_FPS_PERIOD_MAX_US;
 		break;
+	case MAX77663:
+		fps_max_period = MAX20024_FPS_PERIOD_MAX_US;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -375,6 +429,9 @@ static int max77620_initialise_fps(struct max77620_chip *chip)
 	}
 
 skip_fps:
+	if (chip->chip_id == MAX77663)
+		return 0;
+
 	/* Enable wake on EN0 pin */
 	ret = regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG2,
 				 MAX77620_ONOFFCNFG2_WK_EN0,
@@ -453,6 +510,11 @@ static int max77620_probe(struct i2c_client *client,
 		n_mfd_cells = ARRAY_SIZE(max20024_children);
 		rmap_config = &max20024_regmap_config;
 		break;
+	case MAX77663:
+		mfd_cells = max77663_children;
+		n_mfd_cells = ARRAY_SIZE(max77663_children);
+		rmap_config = &max77663_regmap_config;
+		break;
 	default:
 		dev_err(chip->dev, "ChipID is invalid %d\n", chip->chip_id);
 		return -EINVAL;
@@ -546,6 +608,9 @@ static int max77620_i2c_suspend(struct device *dev)
 		return ret;
 	}
 
+	if (chip->chip_id == MAX77663)
+		goto out;
+
 	/* Disable WK_EN0 */
 	ret = regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG2,
 				 MAX77620_ONOFFCNFG2_WK_EN0, 0);
@@ -581,7 +646,7 @@ static int max77620_i2c_resume(struct device *dev)
 	 * For MAX20024: No need to configure WKEN0 on resume as
 	 * it is configured on Init.
 	 */
-	if (chip->chip_id == MAX20024)
+	if (chip->chip_id == MAX20024 || chip->chip_id == MAX77663)
 		goto out;
 
 	/* Enable WK_EN0 */
@@ -603,6 +668,7 @@ static int max77620_i2c_resume(struct device *dev)
 static const struct i2c_device_id max77620_id[] = {
 	{"max77620", MAX77620},
 	{"max20024", MAX20024},
+	{"max77663", MAX77663},
 	{},
 };
 
diff --git a/include/linux/mfd/max77620.h b/include/linux/mfd/max77620.h
index b4fd5a7c2aaa..82407fe85ca2 100644
--- a/include/linux/mfd/max77620.h
+++ b/include/linux/mfd/max77620.h
@@ -324,6 +324,7 @@ enum max77620_fps_src {
 enum max77620_chip_id {
 	MAX77620,
 	MAX20024,
+	MAX77663,
 };
 
 struct max77620_chip {
-- 
2.21.0
