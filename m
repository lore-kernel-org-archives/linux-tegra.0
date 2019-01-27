From: Billy Laws <blaws05@gmail.com>
Subject: Re: [2/2] mfd: max77620: Add low battery monitor support
Date: Sun, 27 Jan 2019 14:54:57 +0000
Message-ID: <3587c682-e1db-5140-fd8e-13c46d882dd3@gmail.com>
Reply-To: 20190123065620.22250-2-markz@nvidia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

 >This patch adds PMIC configurations for low-battery
 >monitoring by handling max77620 register CNFGGLBL1.
 >
It might be an idea to add lbhyst configuration here and support using
custom lbdac values to specify a different cutoff point.

See: https://datasheetspdf.com/pdf-file/924230/Maxim/MAX8698C/1  pg 46
 >Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
 >Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
 >Signed-off-by: Mark Zhang <markz@nvidia.com>
 >---
 > drivers/mfd/max77620.c | 57 +++++++++++++++++++++++++++++++++++++++++-
 > 1 file changed, 56 insertions(+), 1 deletion(-)
 >
 >diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
 >index f58143103185..9e50d145afd8 100644
 >--- a/drivers/mfd/max77620.c
 >+++ b/drivers/mfd/max77620.c
 >@@ -474,6 +474,57 @@ static int 
max77620_init_backup_battery_charging(struct max77620_chip *chip)
 >  return ret;
 > }
 >
 >+static int max77620_init_low_battery_monitor(struct max77620_chip *chip)
 >+{
 >+ struct device *dev = chip->dev;
 >+ struct device_node *np;
 >+ bool pval;
 >+ u8 mask = 0;
 >+ u8 val = 0;
 >+ int ret;
 >+
 >+ np = of_get_child_by_name(dev->of_node, "low-battery-monitor");
 >+ if (!np) {
 >+ dev_info(dev, "Low battery monitoring support disabled\n");
 >+ return 0;
 >+ }
 >+
 >+ pval = of_property_read_bool(np, "maxim,low-battery-dac-enable");
 >+ if (pval) {
 >+ mask |= MAX77620_CNFGGLBL1_LBDAC_EN;
 >+ val |= MAX77620_CNFGGLBL1_LBDAC_EN;
 >+ }
 >+
 >+ pval = of_property_read_bool(np, "maxim,low-battery-dac-disable");
 >+ if (pval)
 >+ mask |= MAX77620_CNFGGLBL1_LBDAC_EN;
 >+
 >+ pval = of_property_read_bool(np, "maxim,low-battery-shutdown-enable");
 >+ if (pval) {
 >+ mask |= MAX77620_CNFGGLBL1_MPPLD;
 >+ val |= MAX77620_CNFGGLBL1_MPPLD;
 >+ }
 >+
 >+ pval = of_property_read_bool(np, "maxim,low-battery-shutdown-disable");
 >+ if (pval)
 >+ mask |= MAX77620_CNFGGLBL1_MPPLD;
 >+
 >+ pval = of_property_read_bool(np, "maxim,low-battery-reset-enable");
 >+ if (pval) {
 >+ mask |= MAX77620_CNFGGLBL1_LBRSTEN;
 >+ val |= MAX77620_CNFGGLBL1_LBRSTEN;
 >+ }
 >+
 >+ pval = of_property_read_bool(np, "maxim,low-battery-reset-disable");
 >+ if (pval)
 >+ mask |= MAX77620_CNFGGLBL1_LBRSTEN;
 >+
 >+ ret = regmap_update_bits(chip->rmap, MAX77620_REG_CNFGGLBL1, mask, val);
 >+ if (ret < 0)
 >+ dev_err(dev, "Reg CNFGGLBL1 update failed: %d\n", ret);
 >+ return ret;
 >+}
 >+
 > static int max77620_read_es_version(struct max77620_chip *chip)
 > {
 >  unsigned int val;
 >@@ -563,7 +614,11 @@ static int max77620_probe(struct i2c_client *client,
 >  if (ret < 0)
 >  return ret;
 >
 >- ret =  devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
 >+ ret = max77620_init_low_battery_monitor(chip);
 >+ if (ret < 0)
 >+ return ret;
 >+
 >+ ret = devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
 >      mfd_cells, n_mfd_cells, NULL, 0,
 >      regmap_irq_get_domain(chip->top_irq_data));
 >  if (ret < 0) {
