From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1] mfd: tps65910: Initialize irq platform data properly
Date: Wed, 18 Jan 2012 20:19:16 +0530
Message-ID: <1326898156-11293-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

irq_base of the tps65910 irq platform data should be
initialized with the board provided irq_base data.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mfd/tps65910.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index c1da84b..8517481 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -168,7 +168,7 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
 		goto err;
 
 	init_data->irq = pmic_plat_data->irq;
-	init_data->irq_base = pmic_plat_data->irq;
+	init_data->irq_base = pmic_plat_data->irq_base;
 
 	tps65910_gpio_init(tps65910, pmic_plat_data->gpio_base);
 
-- 
1.7.1.1
