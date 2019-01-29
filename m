From: Mark Zhang <markz@nvidia.com>
Subject: [PATCH v2 3/4] mfd: max77620: Add low battery monitor support
Date: Tue, 29 Jan 2019 16:55:30 +0800
Message-ID: <20190129085531.32364-4-markz@nvidia.com>
References: <20190129085531.32364-1-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129085531.32364-1-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, blaws05@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch adds PMIC configurations for low-battery
monitoring by handling max77620 register CNFGGLBL1.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
Signed-off-by: Mark Zhang <markz@nvidia.com>
---
 drivers/mfd/max77620.c | 57 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index f58143103185..9e50d145afd8 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -474,6 +474,57 @@ static int max77620_init_backup_battery_charging(struc=
t max77620_chip *chip)
 	return ret;
 }
=20
+static int max77620_init_low_battery_monitor(struct max77620_chip *chip)
+{
+	struct device *dev =3D chip->dev;
+	struct device_node *np;
+	bool pval;
+	u8 mask =3D 0;
+	u8 val =3D 0;
+	int ret;
+
+	np =3D of_get_child_by_name(dev->of_node, "low-battery-monitor");
+	if (!np) {
+		dev_info(dev, "Low battery monitoring support disabled\n");
+		return 0;
+	}
+
+	pval =3D of_property_read_bool(np, "maxim,low-battery-dac-enable");
+	if (pval) {
+		mask |=3D MAX77620_CNFGGLBL1_LBDAC_EN;
+		val |=3D MAX77620_CNFGGLBL1_LBDAC_EN;
+	}
+
+	pval =3D of_property_read_bool(np, "maxim,low-battery-dac-disable");
+	if (pval)
+		mask |=3D MAX77620_CNFGGLBL1_LBDAC_EN;
+
+	pval =3D of_property_read_bool(np, "maxim,low-battery-shutdown-enable");
+	if (pval) {
+		mask |=3D MAX77620_CNFGGLBL1_MPPLD;
+		val |=3D MAX77620_CNFGGLBL1_MPPLD;
+	}
+
+	pval =3D of_property_read_bool(np, "maxim,low-battery-shutdown-disable");
+	if (pval)
+		mask |=3D MAX77620_CNFGGLBL1_MPPLD;
+
+	pval =3D of_property_read_bool(np, "maxim,low-battery-reset-enable");
+	if (pval) {
+		mask |=3D MAX77620_CNFGGLBL1_LBRSTEN;
+		val |=3D MAX77620_CNFGGLBL1_LBRSTEN;
+	}
+
+	pval =3D of_property_read_bool(np, "maxim,low-battery-reset-disable");
+	if (pval)
+		mask |=3D MAX77620_CNFGGLBL1_LBRSTEN;
+
+	ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_CNFGGLBL1, mask, val)=
;
+	if (ret < 0)
+		dev_err(dev, "Reg CNFGGLBL1 update failed: %d\n", ret);
+	return ret;
+}
+
 static int max77620_read_es_version(struct max77620_chip *chip)
 {
 	unsigned int val;
@@ -563,7 +614,11 @@ static int max77620_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
=20
-	ret =3D  devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
+	ret =3D max77620_init_low_battery_monitor(chip);
+	if (ret < 0)
+		return ret;
+
+	ret =3D devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
 				    mfd_cells, n_mfd_cells, NULL, 0,
 				    regmap_irq_get_domain(chip->top_irq_data));
 	if (ret < 0) {
--=20
2.19.2
