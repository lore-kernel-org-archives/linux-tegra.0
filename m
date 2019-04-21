From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 5/5] mfd: max77620: Support device-tree properly
Date: Sun, 21 Apr 2019 20:48:34 +0300
Message-ID: <20190421174834.9366-6-digetx@gmail.com>
References: <20190421174834.9366-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190421174834.9366-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

For some unknown reason the driver for Max77620 doesn't wire up the
device-tree support properly and nothing in kernel creates I2C device
for the driver (and never did), moreover device-tree files for NVIDIA
Tegra210/186/194 boards already have nodes for Max77620. Hence add the
missing of_match_table to make driver actually usable.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/max77620.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index 3b6dded0595c..ef313604ca47 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -37,6 +37,10 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+struct max77620_desc {
+	enum max77620_chip_id chip_id;
+};
+
 static const struct resource gpio_resources[] = {
 	DEFINE_RES_IRQ(MAX77620_IRQ_TOP_GPIO),
 };
@@ -486,6 +490,7 @@ static int max77620_probe(struct i2c_client *client,
 	const struct regmap_config *rmap_config;
 	struct max77620_chip *chip;
 	const struct mfd_cell *mfd_cells;
+	const struct max77620_desc *desc;
 	int n_mfd_cells;
 	int ret;
 
@@ -493,11 +498,13 @@ static int max77620_probe(struct i2c_client *client,
 	if (!chip)
 		return -ENOMEM;
 
+	desc = of_device_get_match_data(&client->dev);
+
 	i2c_set_clientdata(client, chip);
 	chip->dev = &client->dev;
 	chip->irq_base = -1;
 	chip->chip_irq = client->irq;
-	chip->chip_id = (enum max77620_chip_id)id->driver_data;
+	chip->chip_id = desc->chip_id;
 
 	switch (chip->chip_id) {
 	case MAX77620:
@@ -665,11 +672,23 @@ static int max77620_i2c_resume(struct device *dev)
 }
 #endif
 
-static const struct i2c_device_id max77620_id[] = {
-	{"max77620", MAX77620},
-	{"max20024", MAX20024},
-	{"max77663", MAX77663},
-	{},
+static const struct max77620_desc max77620_desc = {
+	.chip_id = MAX77620,
+};
+
+static const struct max77620_desc max20024_desc = {
+	.chip_id = MAX20024,
+};
+
+static const struct max77620_desc max77663_desc = {
+	.chip_id = MAX77663,
+};
+
+static const struct of_device_id max77620_of_match[] = {
+	{ .compatible = "maxim,max77620", .data = &max77620_desc },
+	{ .compatible = "maxim,max20024", .data = &max20024_desc },
+	{ .compatible = "maxim,max77663", .data = &max77663_desc },
+	{ },
 };
 
 static const struct dev_pm_ops max77620_pm_ops = {
@@ -680,8 +699,8 @@ static struct i2c_driver max77620_driver = {
 	.driver = {
 		.name = "max77620",
 		.pm = &max77620_pm_ops,
+		.of_match_table = of_match_ptr(max77620_of_match),
 	},
 	.probe = max77620_probe,
-	.id_table = max77620_id,
 };
 builtin_i2c_driver(max77620_driver);
-- 
2.21.0
