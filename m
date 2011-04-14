From: Yen.Lin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Subject: [PATCH] ARM: regulator: tps6586x: add PFM/PWM options on SMs
Date: Thu, 14 Apr 2011 14:59:53 -0700
Message-ID: <1302818393-19067-1-git-send-email-yelin@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org
Cc: lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xxie-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

TPS6586x SM0, SM1 and SM2 port have 2 power switching modes:
    - PWM only, or
    - PMW-PFM auto mode

Some of TPS6586x have voltage spike in PFM-to-FWM transition which
can lockup the CPU if choose PWM-PFM auto mode.

This patch enables such mode selection on SMs ports from the
board level power configuration file.

Signed-off-by: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/tps6586x-regulator.c |   46 ++++++++++++++++++++++++++++++++
 include/linux/mfd/tps6586x.h           |   15 ++++++++++
 2 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/tps6586x-regulator.c b/drivers/regulator/tps6586x-regulator.c
index 6d20b04..c6b945d 100644
--- a/drivers/regulator/tps6586x-regulator.c
+++ b/drivers/regulator/tps6586x-regulator.c
@@ -327,6 +327,45 @@ static inline int tps6586x_regulator_preinit(struct device *parent,
 				 1 << ri->enable_bit[1]);
 }
 
+static inline int tps6586x_regulator_set_pwm_mode(struct platform_device *pdev)
+{
+	struct regulator_init_data *p = pdev->dev.platform_data;
+	struct tps6586x_settings *setting;
+	struct device *parent;
+	int ret = 0;
+	uint8_t mask;
+
+	if (p == NULL)
+		return 0;
+
+	setting = p->driver_data;
+	if (setting == NULL)
+		return 0;
+
+	switch (pdev->id) {
+	case TPS6586X_ID_SM_0:
+		mask = 1 << SM0_PWM_BIT;
+		break;
+	case TPS6586X_ID_SM_1:
+		mask = 1 << SM1_PWM_BIT;
+		break;
+	case TPS6586X_ID_SM_2:
+		mask = 1 << SM2_PWM_BIT;
+		break;
+	default:
+		/* not all regulators have PWM/PFM option */
+		return 0;
+	}
+
+	parent = pdev->dev.parent;
+	if (setting->sm_pwm_mode == PWM_ONLY)
+		ret = tps6586x_set_bits(parent, TPS6586X_SMODE1, mask);
+	else if (setting->sm_pwm_mode == AUTO_PWM_PFM)
+		ret = tps6586x_clr_bits(parent, TPS6586X_SMODE1, mask);
+
+	return ret;
+}
+
 static inline struct tps6586x_regulator *find_regulator_info(int id)
 {
 	struct tps6586x_regulator *ri;
@@ -367,6 +406,13 @@ static int __devinit tps6586x_regulator_probe(struct platform_device *pdev)
 		return PTR_ERR(rdev);
 	}
 
+	err = tps6586x_regulator_set_pwm_mode(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "failed to set pwm mode\n");
+		regulator_unregister(rdev);
+		return err;
+	}
+
 	platform_set_drvdata(pdev, rdev);
 
 	return 0;
diff --git a/include/linux/mfd/tps6586x.h b/include/linux/mfd/tps6586x.h
index d96fb3d..74e92c0 100644
--- a/include/linux/mfd/tps6586x.h
+++ b/include/linux/mfd/tps6586x.h
@@ -1,6 +1,10 @@
 #ifndef __LINUX_MFD_TPS6586X_H
 #define __LINUX_MFD_TPS6586X_H
 
+#define SM0_PWM_BIT 0
+#define SM1_PWM_BIT 1
+#define SM2_PWM_BIT 2
+
 enum {
 	TPS6586X_ID_SM_0,
 	TPS6586X_ID_SM_1,
@@ -48,6 +52,17 @@ enum {
 	TPS6586X_INT_RTC_ALM2,
 };
 
+enum pwm_pfm_mode {
+	PWM_ONLY,
+	AUTO_PWM_PFM,
+	NOT_CONFIGURABLE
+};
+
+struct tps6586x_settings {
+	/* SM0, SM1 and SM2 have PWM-only and auto PWM/PFM mode */
+	enum pwm_pfm_mode sm_pwm_mode;
+};
+
 struct tps6586x_subdev_info {
 	int		id;
 	const char	*name;
-- 
1.7.2.3
