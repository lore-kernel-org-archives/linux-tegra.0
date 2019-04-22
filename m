From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 6/7] mfd: max77620: Support device-tree properly
Date: Mon, 22 Apr 2019 22:13:49 +0300
Message-ID: <20190422191350.27527-7-digetx@gmail.com>
References: <20190422191350.27527-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190422191350.27527-1-digetx@gmail.com>
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
 drivers/mfd/max77620.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index 9b0009c29610..b7a058069808 100644
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
@@ -487,6 +491,7 @@ static int max77620_probe(struct i2c_client *client,
 	const struct regmap_config *rmap_config;
 	struct max77620_chip *chip;
 	const struct mfd_cell *mfd_cells;
+	const struct max77620_desc *desc;
 	int n_mfd_cells;
 	int ret;
 
@@ -500,6 +505,10 @@ static int max77620_probe(struct i2c_client *client,
 	chip->chip_irq = client->irq;
 	chip->chip_id = (enum max77620_chip_id)id->driver_data;
 
+	desc = of_device_get_match_data(&client->dev);
+	if (desc)
+		chip->chip_id = desc->chip_id;
+
 	switch (chip->chip_id) {
 	case MAX77620:
 		mfd_cells = max77620_children;
@@ -673,6 +682,25 @@ static const struct i2c_device_id max77620_id[] = {
 	{},
 };
 
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
+};
+
 static const struct dev_pm_ops max77620_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(max77620_i2c_suspend, max77620_i2c_resume)
 };
@@ -681,6 +709,7 @@ static struct i2c_driver max77620_driver = {
 	.driver = {
 		.name = "max77620",
 		.pm = &max77620_pm_ops,
+		.of_match_table = of_match_ptr(max77620_of_match),
 	},
 	.probe = max77620_probe,
 	.id_table = max77620_id,
-- 
2.21.0
