From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 1/2] mfd: tps65910: Use correct variable name for regmap config
Date: Wed,  7 Mar 2012 18:46:05 +0530
Message-ID: <1331126166-3908-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This was the copy-paste issue in reg cache support code where
variable name for regmap config was not really starting from
the device name, it was starting from some other device name.
Fixing this so that variable name contains actual device name.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This is just variable name change.

 drivers/mfd/tps65910.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 1c4f53e..bf2b25e 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -81,7 +81,7 @@ static bool is_volatile_reg(struct device *dev, unsigned int reg)
 	return true;
 }
 
-static const struct regmap_config rc5t583_regmap_config = {
+static const struct regmap_config tps65910_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.volatile_reg = is_volatile_reg,
@@ -120,7 +120,7 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
 	tps65910->write = tps65910_i2c_write;
 	mutex_init(&tps65910->io_mutex);
 
-	tps65910->regmap = regmap_init_i2c(i2c, &rc5t583_regmap_config);
+	tps65910->regmap = regmap_init_i2c(i2c, &tps65910_regmap_config);
 	if (IS_ERR(tps65910->regmap)) {
 		ret = PTR_ERR(tps65910->regmap);
 		dev_err(&i2c->dev, "regmap initialization failed: %d\n", ret);
-- 
1.7.1.1
