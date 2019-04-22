From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 7/7] mfd: max77620: Provide system power-off functionality
Date: Mon, 22 Apr 2019 22:13:50 +0300
Message-ID: <20190422191350.27527-8-digetx@gmail.com>
References: <20190422191350.27527-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190422191350.27527-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Provide system power-off functionality that allows to turn off machine
gracefully.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/max77620.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index b7a058069808..3b8fd0b45425 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -41,6 +41,8 @@ struct max77620_desc {
 	enum max77620_chip_id chip_id;
 };
 
+static struct max77620_chip *max77620_scratch;
+
 static const struct resource gpio_resources[] = {
 	DEFINE_RES_IRQ(MAX77620_IRQ_TOP_GPIO),
 };
@@ -485,6 +487,15 @@ static int max77620_read_es_version(struct max77620_chip *chip)
 	return ret;
 }
 
+static void max77620_pm_power_off(void)
+{
+	struct max77620_chip *chip = max77620_scratch;
+
+	regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG1,
+			   MAX77620_ONOFFCNFG1_SFT_RST,
+			   MAX77620_ONOFFCNFG1_SFT_RST);
+}
+
 static int max77620_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
@@ -493,6 +504,7 @@ static int max77620_probe(struct i2c_client *client,
 	const struct mfd_cell *mfd_cells;
 	const struct max77620_desc *desc;
 	int n_mfd_cells;
+	bool pm_off;
 	int ret;
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
@@ -563,6 +575,13 @@ static int max77620_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	pm_off = of_property_read_bool(client->dev.of_node,
+				       "maxim,system-power-controller");
+	if (pm_off && !pm_power_off) {
+		max77620_scratch = chip;
+		pm_power_off = max77620_pm_power_off;
+	}
+
 	return 0;
 }
 
-- 
2.21.0
