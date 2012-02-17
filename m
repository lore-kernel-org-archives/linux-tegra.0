From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1] regulator: tps65910: Correct VIO voltage configuration
Date: Fri, 17 Feb 2012 18:56:11 +0530
Message-ID: <1329485171-14189-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The VIO regulator register specify the voltage configuration
on bit3:2 of its register. And hence only these bits should
be modified when setting voltage and used when reading voltage
from register setting.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/tps65910-regulator.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
index 9092b7f..a9bb6d4 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -674,8 +674,9 @@ static int tps65911_get_voltage(struct regulator_dev *dev)
 		step_mv = 100;
 		break;
 	case TPS65910_REG_VIO:
+		value &= LDO_SEL_MASK;
+		value >>= LDO_SEL_SHIFT;
 		return pmic->info[id]->voltage_table[value] * 1000;
-		break;
 	default:
 		return -EINVAL;
 	}
@@ -767,9 +768,11 @@ static int tps65911_set_voltage(struct regulator_dev *dev, unsigned selector)
 	case TPS65911_REG_LDO6:
 	case TPS65911_REG_LDO7:
 	case TPS65911_REG_LDO8:
-	case TPS65910_REG_VIO:
 		return tps65910_modify_bits(pmic, reg,
 				(selector << LDO_SEL_SHIFT), LDO3_SEL_MASK);
+	case TPS65910_REG_VIO:
+		return tps65910_modify_bits(pmic, reg,
+				(selector << LDO_SEL_SHIFT), LDO_SEL_MASK);
 	}
 
 	return -EINVAL;
-- 
1.7.1.1
