From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] regulator: tps62360: Fix crash in i2c_driver .probe
Date: Mon, 17 Jun 2013 20:47:37 +0300
Message-ID: <1371491257-23791-3-git-send-email-ttynkkynen@nvidia.com>
References: <1371491257-23791-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371491257-23791-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit "i2c: core: make it possible to match a pure device tree driver"
changed semantics of the i2c probing for device tree devices.
Device tree probed devices now get a NULL i2c_device_id pointer.
This caused kernel panics due to NULL dereference.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/tps62360-regulator.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/tps62360-regulator.c b/drivers/regulator/tps62360-regulator.c
index 612919c..a490d5b 100644
--- a/drivers/regulator/tps62360-regulator.c
+++ b/drivers/regulator/tps62360-regulator.c
@@ -351,7 +351,6 @@ static int tps62360_probe(struct i2c_client *client,
 	int chip_id;
 
 	pdata = client->dev.platform_data;
-	chip_id = id->driver_data;
 
 	if (client->dev.of_node) {
 		const struct of_device_id *match;
@@ -364,6 +363,11 @@ static int tps62360_probe(struct i2c_client *client,
 		chip_id = (int)match->data;
 		if (!pdata)
 			pdata = of_get_tps62360_platform_data(&client->dev);
+	} else if (id) {
+		chip_id = id->driver_data;
+	} else {
+		dev_err(&client->dev, "No device tree match or id table match found\n");
+		return -ENODEV;
 	}
 
 	if (!pdata) {
@@ -402,7 +406,7 @@ static int tps62360_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	tps->desc.name = id->name;
+	tps->desc.name = client->name;
 	tps->desc.id = 0;
 	tps->desc.ops = &tps62360_dcdc_ops;
 	tps->desc.type = REGULATOR_VOLTAGE;
-- 
1.8.1.5
