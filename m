From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 2/2] regulator: tps65910: Enable register caching of voltage controls.
Date: Wed,  8 Feb 2012 16:16:25 +0530
Message-ID: <1328697985-22504-2-git-send-email-ldewangan@nvidia.com>
References: <1328697985-22504-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328697985-22504-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Enabling the caching of the registers which is used for voltage
controls. By doing this, the modify_bits operation is faster as
it does not involve the i2c register read from device, just read
from cache. This results faster set voltage operation.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/tps65910-regulator.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
index 9092b7f..3731d69 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -1123,6 +1123,18 @@ static __devinit int tps65910_probe(struct platform_device *pdev)
 				pmic->desc[i].ops = &tps65911_ops;
 		}
 
+		/* Enable register caching */
+		tps65910_enable_reg_cache(tps65910, pmic->get_ctrl_reg(i));
+		/* VDD1/VDD2/VDDCTRL-TPS65911 have SR and OP register */
+		if ((i == TPS65910_REG_VDD1) || (i == TPS65910_REG_VDD2) ||
+			((tps65910_chip_id(tps65910) == TPS65911) &&
+				(i == TPS65911_REG_VDDCTRL))) {
+			tps65910_enable_reg_cache(tps65910,
+						pmic->get_ctrl_reg(i) + 1);
+			tps65910_enable_reg_cache(tps65910,
+						pmic->get_ctrl_reg(i) + 2);
+		}
+
 		err = tps65910_set_ext_sleep_config(pmic, i,
 				pmic_plat_data->regulator_ext_sleep_control[i]);
 		/*
-- 
1.7.1.1
