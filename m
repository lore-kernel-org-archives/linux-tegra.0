From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: max77620: Support Maxim 77663" to the regulator tree
Date: Tue, 28 May 2019 16:07:14 +0100 (BST)
Message-ID: <20190528150714.F17D4440046@finisterre.sirena.org.uk>
References: <20190524151034.26048-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524151034.26048-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Mallikarjun Kasoju <mkasoju@nvidia.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

The patch

   regulator: max77620: Support Maxim 77663

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From cbafbd1dcc04ffe6c24225d0262b71c569631def Mon Sep 17 00:00:00 2001
From: Dmitry Osipenko <digetx@gmail.com>
Date: Fri, 24 May 2019 18:10:34 +0300
Subject: [PATCH] regulator: max77620: Support Maxim 77663

Add support for Maxim 77663.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/max77620-regulator.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index 0ad91a7f9cb9..0ec9f81fe74a 100644
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
2.20.1
