From: Mark Zhang <markz@nvidia.com>
Subject: [PATCH v3 1/4] mfd: max77620: Add backup battery charger support
Date: Tue, 12 Feb 2019 14:43:50 +0800
Message-ID: <20190212064353.7451-2-markz@nvidia.com>
References: <20190212064353.7451-1-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212064353.7451-1-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add PMIC configurations for backup battery charger, which
is a constant voltage and constant current style charger
with a series output resistance.

The max77620 register CNFGBBC(addr: 0x04) defines the
parameters of backup battery charger. This patch adds
support for it.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
Signed-off-by: Mark Zhang <markz@nvidia.com>
---
 drivers/mfd/max77620.c | 80 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index d8ddd1a6f304..494d98357f65 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -398,6 +398,82 @@ static int max77620_initialise_fps(struct max77620_chi=
p *chip)
 	return 0;
 }
=20
+static int max77620_init_backup_battery_charging(struct max77620_chip *chi=
p)
+{
+	struct device *dev =3D chip->dev;
+	struct device_node *np;
+	u32 pval;
+	u8 config;
+	int charging_current;
+	int charging_voltage;
+	int resistor;
+	int ret;
+
+	np =3D of_get_child_by_name(dev->of_node, "backup-battery");
+	if (!np) {
+		dev_info(dev, "Backup battery charging support disabled\n");
+		ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_CNFGBBC,
+					 MAX77620_CNFGBBC_ENABLE, 0);
+		if (ret < 0)
+			dev_err(dev, "Failed to update CNFGBBC: %d\n", ret);
+		return ret;
+	}
+
+	ret =3D of_property_read_u32(np,
+			"maxim,charging-current-microamp", &pval);
+	charging_current =3D (!ret) ? pval : 50;
+
+	ret =3D of_property_read_u32(np,
+			"maxim,charging-voltage-microvolt", &pval);
+	charging_voltage =3D (!ret) ? pval : 2500000;
+	charging_voltage /=3D 1000;
+
+	ret =3D of_property_read_u32(np,
+			"maxim,output-resister-ohms", &pval);
+	resistor =3D (!ret) ? pval : 1000;
+
+	config =3D MAX77620_CNFGBBC_ENABLE;
+	if (charging_current <=3D 50)
+		config |=3D 0 << MAX77620_CNFGBBC_CURRENT_SHIFT;
+	else if (charging_current <=3D 100)
+		config |=3D 3 << MAX77620_CNFGBBC_CURRENT_SHIFT;
+	else if (charging_current <=3D 200)
+		config |=3D 0 << MAX77620_CNFGBBC_CURRENT_SHIFT;
+	else if (charging_current <=3D 400)
+		config |=3D 3 << MAX77620_CNFGBBC_CURRENT_SHIFT;
+	else if (charging_current <=3D 600)
+		config |=3D 1 << MAX77620_CNFGBBC_CURRENT_SHIFT;
+	else
+		config |=3D 2 << MAX77620_CNFGBBC_CURRENT_SHIFT;
+
+	if (charging_current > 100)
+		config |=3D MAX77620_CNFGBBC_LOW_CURRENT_DISABLE;
+
+	if (charging_voltage <=3D 2500)
+		config |=3D 0 << MAX77620_CNFGBBC_VOLTAGE_SHIFT;
+	else if (charging_voltage <=3D 3000)
+		config |=3D 1 << MAX77620_CNFGBBC_VOLTAGE_SHIFT;
+	else if (charging_voltage <=3D 3300)
+		config |=3D 2 << MAX77620_CNFGBBC_VOLTAGE_SHIFT;
+	else
+		config |=3D 3 << MAX77620_CNFGBBC_VOLTAGE_SHIFT;
+
+	if (resistor <=3D 100)
+		config |=3D 0 << MAX77620_CNFGBBC_RESISTOR_SHIFT;
+	else if (resistor <=3D 1000)
+		config |=3D 1 << MAX77620_CNFGBBC_RESISTOR_SHIFT;
+	else if (resistor <=3D 3000)
+		config |=3D 2 << MAX77620_CNFGBBC_RESISTOR_SHIFT;
+	else if (resistor <=3D 6000)
+		config |=3D 3 << MAX77620_CNFGBBC_RESISTOR_SHIFT;
+
+	ret =3D regmap_write(chip->rmap, MAX77620_REG_CNFGBBC, config);
+	if (ret < 0)
+		dev_err(dev, "Reg 0x%02x write failed, %d\n",
+				MAX77620_REG_CNFGBBC, ret);
+	return ret;
+}
+
 static int max77620_read_es_version(struct max77620_chip *chip)
 {
 	unsigned int val;
@@ -483,6 +559,10 @@ static int max77620_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
=20
+	ret =3D max77620_init_backup_battery_charging(chip);
+	if (ret < 0)
+		return ret;
+
 	ret =3D  devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
 				    mfd_cells, n_mfd_cells, NULL, 0,
 				    regmap_irq_get_domain(chip->top_irq_data));
--=20
2.19.2
