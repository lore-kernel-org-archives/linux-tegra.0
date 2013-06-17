From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] mfd: tps65910: Fix crash in i2c_driver .probe
Date: Mon, 17 Jun 2013 20:47:36 +0300
Message-ID: <1371491257-23791-2-git-send-email-ttynkkynen@nvidia.com>
References: <1371491257-23791-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371491257-23791-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit "i2c: core: make it possible to match a pure device tree driver"
changed semantics of the i2c probing for device tree devices.
Device tree probed devices now get a NULL i2c_device_id pointer.
This caused kernel panics due to NULL dereference.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mfd/tps65910.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index d792772..a62c30d 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -461,16 +461,18 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
 	struct tps65910_board *of_pmic_plat_data = NULL;
 	struct tps65910_platform_data *init_data;
 	int ret = 0;
-	int chip_id = id->driver_data;
+	int chip_id = -1;
 
 	pmic_plat_data = dev_get_platdata(&i2c->dev);
 
-	if (!pmic_plat_data && i2c->dev.of_node) {
+	if (id) {
+		chip_id = id->driver_data;
+	} else if (i2c->dev.of_node) {
 		pmic_plat_data = tps65910_parse_dt(i2c, &chip_id);
 		of_pmic_plat_data = pmic_plat_data;
 	}
 
-	if (!pmic_plat_data)
+	if (!pmic_plat_data || chip_id < 0)
 		return -EINVAL;
 
 	init_data = devm_kzalloc(&i2c->dev, sizeof(*init_data), GFP_KERNEL);
-- 
1.8.1.5
