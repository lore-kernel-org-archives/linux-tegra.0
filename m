From: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM: regulator: tps6586x: add PFM/PWM options on SMs
Date: Wed, 20 Apr 2011 14:25:25 -0700
Message-ID: <1303334725-5519-1-git-send-email-yelin@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xxie-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

TPS6586x SM0, SM1 and SM2 port have 2 power switching modes:
    - PWM only, or
    - PMW-PFM auto mode

Some of TPS6586x have voltage spike in PFM-to-FWM transition which
can lockup the CPU if PWM-PFM auto mode is chosen.

This patch enables such mode selection on SMs ports from the
board level power configuration file.

Signed-off-by: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2 changes:
  * implement regulator API get/set_mode() for mode selection,

 drivers/regulator/tps6586x-regulator.c |  117 ++++++++++++++++++++++++++-----
 1 files changed, 98 insertions(+), 19 deletions(-)

diff --git a/drivers/regulator/tps6586x-regulator.c b/drivers/regulator/tps6586x-regulator.c
index 6d20b04..a45916b 100644
--- a/drivers/regulator/tps6586x-regulator.c
+++ b/drivers/regulator/tps6586x-regulator.c
@@ -185,6 +185,72 @@ static int tps6586x_regulator_is_enabled(struct regulator_dev *rdev)
 	return !!(reg_val & (1 << ri->enable_bit[0]));
 }
 
+static unsigned int tps6586x_smx_get_mode(struct regulator_dev *rdev)
+{
+	struct device *parent = to_tps6586x_dev(rdev);
+	int ret;
+	uint8_t mask;
+	uint8_t val;
+	unsigned int mode;
+	int id;
+
+	id = rdev_get_id(rdev);
+	if ((id < TPS6586X_ID_SM_0) || (id > TPS6586X_ID_SM_2)) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	ret = tps6586x_read(parent, TPS6586X_SMODE1, &val);
+	if (ret)
+		return ret;
+
+	/* PWM mode bits = bit0:SM_0, bit1:SM_1, bit2:SM_2 */
+	mask = 1 << (id - TPS6586X_ID_SM_0);
+
+	if (val & mask)
+		/* REGULATOR_MODE_FAST is mapped to tps6586x's PWM_ONLY mode */
+		mode = REGULATOR_MODE_FAST;
+	else
+		/* MODE_NORMAL is mapped to tps6586x's Auto PWM/PFM mode */
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
+
+}
+
+static int tps6586x_smx_set_mode(struct regulator_dev *rdev,
+					unsigned int mode)
+{
+	struct device *parent = to_tps6586x_dev(rdev);
+	int ret = 0;
+	uint8_t mask;
+	int id;
+
+	id = rdev_get_id(rdev);
+	if ((id < TPS6586X_ID_SM_0) || (id > TPS6586X_ID_SM_2)) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	/* PWM mode bits = bit0:SM_0, bit1:SM_1, bit2:SM_2 */
+	mask = 1 << (id - TPS6586X_ID_SM_0);
+
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		/* REGULATOR_MODE_FAST is mapped to tps6586x's PWM_ONLY mode */
+		ret = tps6586x_set_bits(parent, TPS6586X_SMODE1, mask);
+		break;
+	case REGULATOR_MODE_NORMAL:
+		/* MODE_NORMAL is mapped to tps6586x's Auto PWM/PFM mode */
+		ret = tps6586x_clr_bits(parent, TPS6586X_SMODE1, mask);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
 static struct regulator_ops tps6586x_regulator_ldo_ops = {
 	.list_voltage = tps6586x_ldo_list_voltage,
 	.get_voltage = tps6586x_ldo_get_voltage,
@@ -205,6 +271,19 @@ static struct regulator_ops tps6586x_regulator_dvm_ops = {
 	.disable = tps6586x_regulator_disable,
 };
 
+static struct regulator_ops tps6586x_regulator_smx_ops = {
+	.list_voltage = tps6586x_ldo_list_voltage,
+	.get_voltage = tps6586x_ldo_get_voltage,
+	.set_voltage = tps6586x_dvm_set_voltage,
+
+	.is_enabled = tps6586x_regulator_is_enabled,
+	.enable = tps6586x_regulator_enable,
+	.disable = tps6586x_regulator_disable,
+
+	.get_mode = tps6586x_smx_get_mode,
+	.set_mode = tps6586x_smx_set_mode,
+};
+
 static int tps6586x_ldo_voltages[] = {
 	1250, 1500, 1800, 2500, 2700, 2850, 3100, 3300,
 };
@@ -253,37 +332,37 @@ static int tps6586x_dvm_voltages[] = {
 	.go_reg = TPS6586X_##goreg,					\
 	.go_bit = (gobit),
 
-#define TPS6586X_LDO(_id, vdata, vreg, shift, nbits,			\
+#define TPS6586X_LDO(_id, vdata, ops, vreg, shift, nbits,		\
 		     ereg0, ebit0, ereg1, ebit1)			\
 {									\
-	TPS6586X_REGULATOR(_id, vdata, ldo_ops, vreg, shift, nbits,	\
+	TPS6586X_REGULATOR(_id, vdata, ops##_ops, vreg, shift, nbits,	\
 			   ereg0, ebit0, ereg1, ebit1)			\
 }
 
-#define TPS6586X_DVM(_id, vdata, vreg, shift, nbits,			\
+#define TPS6586X_DVM(_id, vdata, ops, vreg, shift, nbits,		\
 		     ereg0, ebit0, ereg1, ebit1, goreg, gobit)		\
 {									\
-	TPS6586X_REGULATOR(_id, vdata, dvm_ops, vreg, shift, nbits,	\
+	TPS6586X_REGULATOR(_id, vdata, ops##_ops, vreg, shift, nbits,	\
 			   ereg0, ebit0, ereg1, ebit1)			\
 	TPS6586X_REGULATOR_DVM_GOREG(goreg, gobit)			\
 }
 
 static struct tps6586x_regulator tps6586x_regulator[] = {
-	TPS6586X_LDO(LDO_0, ldo, SUPPLYV1, 5, 3, ENC, 0, END, 0),
-	TPS6586X_LDO(LDO_3, ldo, SUPPLYV4, 0, 3, ENC, 2, END, 2),
-	TPS6586X_LDO(LDO_5, ldo, SUPPLYV6, 0, 3, ENE, 6, ENE, 6),
-	TPS6586X_LDO(LDO_6, ldo, SUPPLYV3, 0, 3, ENC, 4, END, 4),
-	TPS6586X_LDO(LDO_7, ldo, SUPPLYV3, 3, 3, ENC, 5, END, 5),
-	TPS6586X_LDO(LDO_8, ldo, SUPPLYV2, 5, 3, ENC, 6, END, 6),
-	TPS6586X_LDO(LDO_9, ldo, SUPPLYV6, 3, 3, ENE, 7, ENE, 7),
-	TPS6586X_LDO(LDO_RTC, ldo, SUPPLYV4, 3, 3, V4, 7, V4, 7),
-	TPS6586X_LDO(LDO_1, dvm, SUPPLYV1, 0, 5, ENC, 1, END, 1),
-	TPS6586X_LDO(SM_2, sm2, SUPPLYV2, 0, 5, ENC, 7, END, 7),
-
-	TPS6586X_DVM(LDO_2, dvm, LDO2BV1, 0, 5, ENA, 3, ENB, 3, VCC2, 6),
-	TPS6586X_DVM(LDO_4, ldo4, LDO4V1, 0, 5, ENC, 3, END, 3, VCC1, 6),
-	TPS6586X_DVM(SM_0, dvm, SM0V1, 0, 5, ENA, 1, ENB, 1, VCC1, 2),
-	TPS6586X_DVM(SM_1, dvm, SM1V1, 0, 5, ENA, 0, ENB, 0, VCC1, 0),
+	TPS6586X_LDO(LDO_0, ldo, ldo, SUPPLYV1, 5, 3, ENC, 0, END, 0),
+	TPS6586X_LDO(LDO_3, ldo, ldo, SUPPLYV4, 0, 3, ENC, 2, END, 2),
+	TPS6586X_LDO(LDO_5, ldo, ldo, SUPPLYV6, 0, 3, ENE, 6, ENE, 6),
+	TPS6586X_LDO(LDO_6, ldo, ldo, SUPPLYV3, 0, 3, ENC, 4, END, 4),
+	TPS6586X_LDO(LDO_7, ldo, ldo, SUPPLYV3, 3, 3, ENC, 5, END, 5),
+	TPS6586X_LDO(LDO_8, ldo, ldo, SUPPLYV2, 5, 3, ENC, 6, END, 6),
+	TPS6586X_LDO(LDO_9, ldo, ldo, SUPPLYV6, 3, 3, ENE, 7, ENE, 7),
+	TPS6586X_LDO(LDO_RTC, ldo, ldo, SUPPLYV4, 3, 3, V4, 7, V4, 7),
+	TPS6586X_LDO(LDO_1, dvm, ldo, SUPPLYV1, 0, 5, ENC, 1, END, 1),
+	TPS6586X_LDO(SM_2, sm2, smx, SUPPLYV2, 0, 5, ENC, 7, END, 7),
+
+	TPS6586X_DVM(LDO_2, dvm, dvm, LDO2BV1, 0, 5, ENA, 3, ENB, 3, VCC2, 6),
+	TPS6586X_DVM(LDO_4, ldo4, dvm, LDO4V1, 0, 5, ENC, 3, END, 3, VCC1, 6),
+	TPS6586X_DVM(SM_0, dvm, smx, SM0V1, 0, 5, ENA, 1, ENB, 1, VCC1, 2),
+	TPS6586X_DVM(SM_1, dvm, smx, SM1V1, 0, 5, ENA, 0, ENB, 0, VCC1, 0),
 };
 
 /*
-- 
1.7.2.3
