From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/5] regulator: max77620: Support Maxim 77663
Date: Sun, 21 Apr 2019 20:48:32 +0300
Message-ID: <20190421174834.9366-4-digetx@gmail.com>
References: <20190421174834.9366-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190421174834.9366-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add support for Maxim 77663.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/max77620-regulator.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index 1607ac673e44..7d6b53828056 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -761,6 +761,24 @@ static struct max77620_regulator_info max20024_regs_info[MAX77620_NUM_REGS] = {
 	RAIL_LDO(LDO8, ldo8, "in-ldo7-8", N, 800000, 3950000, 50000),
 };
 
+static struct max77620_regulator_info max77663_regs_info[MAX77620_NUM_REGS] = {
+	RAIL_SD(SD0, sd0, "in-sd0", SD0, 600000, 3387500, 12500, 0xFF, NONE),
+	RAIL_SD(SD1, sd1, "in-sd1", SD1, 800000, 1587500, 12500, 0xFF, NONE),
+	RAIL_SD(SD2, sd2, "in-sd2", SDX, 600000, 3787500, 12500, 0xFF, NONE),
+	RAIL_SD(SD3, sd3, "in-sd3", SDX, 600000, 3787500, 12500, 0xFF, NONE),
+	RAIL_SD(SD4, sd4, "in-sd4", SDX, 600000, 3787500, 12500, 0xFF, NONE),
+
+	RAIL_LDO(LDO0, ldo0, "in-ldo0-1", N, 800000, 2375000, 25000),
+	RAIL_LDO(LDO1, ldo1, "in-ldo0-1", N, 800000, 2375000, 25000),
+	RAIL_LDO(LDO2, ldo2, "in-ldo2",   P, 800000, 3950000, 50000),
+	RAIL_LDO(LDO3, ldo3, "in-ldo3-5", P, 800000, 3950000, 50000),
+	RAIL_LDO(LDO4, ldo4, "in-ldo4-6", P, 800000, 1587500, 12500),
+	RAIL_LDO(LDO5, ldo5, "in-ldo3-5", P, 800000, 3950000, 50000),
+	RAIL_LDO(LDO6, ldo6, "in-ldo4-6", P, 800000, 3950000, 50000),
+	RAIL_LDO(LDO7, ldo7, "in-ldo7-8", N, 800000, 3950000, 50000),
+	RAIL_LDO(LDO8, ldo8, "in-ldo7-8", N, 800000, 3950000, 50000),
+};
+
 static int max77620_regulator_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *max77620_chip = dev_get_drvdata(pdev->dev.parent);
@@ -785,9 +803,14 @@ static int max77620_regulator_probe(struct platform_device *pdev)
 	case MAX77620:
 		rinfo = max77620_regs_info;
 		break;
-	default:
+	case MAX20024:
 		rinfo = max20024_regs_info;
 		break;
+	case MAX77663:
+		rinfo = max77663_regs_info;
+		break;
+	default:
+		return -EINVAL;
 	}
 
 	config.regmap = pmic->rmap;
@@ -881,6 +904,7 @@ static const struct dev_pm_ops max77620_regulator_pm_ops = {
 static const struct platform_device_id max77620_regulator_devtype[] = {
 	{ .name = "max77620-pmic", },
 	{ .name = "max20024-pmic", },
+	{ .name = "max77663-pmic", },
 	{},
 };
 MODULE_DEVICE_TABLE(platform, max77620_regulator_devtype);
-- 
2.21.0
