From: Mark Zhang <markz@nvidia.com>
Subject: Re: [2/2] mfd: max77620: Add low battery monitor support
Date: Tue, 29 Jan 2019 17:03:54 +0800
Message-ID: <e1ebcd02-2d25-a6b7-081b-578878be15b4@nvidia.com>
References: <3587c682-e1db-5140-fd8e-13c46d882dd3@gmail.com>
 <bd942195-4f1c-1a39-283f-610354308f45@nvidia.com>
 <CAFUUQHM88kVh0ov1G30Sz9WQKJRY4p78hBMporL1xU=aY_tNCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFUUQHM88kVh0ov1G30Sz9WQKJRY4p78hBMporL1xU=aY_tNCA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Billy Laws <blaws05@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 1/29/2019 3:36 PM, Billy Laws wrote:
> Sure, that's fine with me, will send then this gets accepted. Two
> other things: you should probably set the reg to 0 if the property
> isn't specified as regmap_add_irqchip sets it to 0xff (basically all
> enabled on highest limit), and you haven't updated the dt-bindings.

Billy, v2 is out, dt-bindings patches are added.
But after a second thought, I don't think regmap_add_irqchip might set
registers to 0xff. I mean, for 2 registers which this patch set touches,
they're not IRQ registers(mask/status/...), so regmap_add_irqchip should
not touch them so I didn't make changes to driver codes in v2.

Mark

> 
> On Tue, Jan 29, 2019 at 6:52 AM Mark Zhang <markz@nvidia.com> wrote:
>>
>> On 1/27/2019 10:54 PM, Billy Laws wrote:
>>>  >This patch adds PMIC configurations for low-battery
>>>  >monitoring by handling max77620 register CNFGGLBL1.
>>>  >
>>> It might be an idea to add lbhyst configuration here and support using
>>> custom lbdac values to specify a different cutoff point.
>>
>> Yeah this patch doesn't have support to program LBHYST & LBDAC because
>> according to our experiences, we don't have requirement to modify them
>> when low battery monitor support added.
>>
>> I think we can create a new patch to support these 2 fields in the future
>> when we really need them. Or you can create a patch if you have requirement
>> for them, is this OK to you Billy?
>>
>> Mark
>>
>>>
>>> See: https://datasheetspdf.com/pdf-file/924230/Maxim/MAX8698C/1  pg 46
>>>  >Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>>>  >Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
>>>  >Signed-off-by: Mark Zhang <markz@nvidia.com>
>>>  >---
>>>  > drivers/mfd/max77620.c | 57 +++++++++++++++++++++++++++++++++++++++++-
>>>  > 1 file changed, 56 insertions(+), 1 deletion(-)
>>>  >
>>>  >diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
>>>  >index f58143103185..9e50d145afd8 100644
>>>  >--- a/drivers/mfd/max77620.c
>>>  >+++ b/drivers/mfd/max77620.c
>>>  >@@ -474,6 +474,57 @@ static int
>>> max77620_init_backup_battery_charging(struct max77620_chip *chip)
>>>  >  return ret;
>>>  > }
>>>  >
>>>  >+static int max77620_init_low_battery_monitor(struct max77620_chip *chip)
>>>  >+{
>>>  >+ struct device *dev = chip->dev;
>>>  >+ struct device_node *np;
>>>  >+ bool pval;
>>>  >+ u8 mask = 0;
>>>  >+ u8 val = 0;
>>>  >+ int ret;
>>>  >+
>>>  >+ np = of_get_child_by_name(dev->of_node, "low-battery-monitor");
>>>  >+ if (!np) {
>>>  >+ dev_info(dev, "Low battery monitoring support disabled\n");
>>>  >+ return 0;
>>>  >+ }
>>>  >+
>>>  >+ pval = of_property_read_bool(np, "maxim,low-battery-dac-enable");
>>>  >+ if (pval) {
>>>  >+ mask |= MAX77620_CNFGGLBL1_LBDAC_EN;
>>>  >+ val |= MAX77620_CNFGGLBL1_LBDAC_EN;
>>>  >+ }
>>>  >+
>>>  >+ pval = of_property_read_bool(np, "maxim,low-battery-dac-disable");
>>>  >+ if (pval)
>>>  >+ mask |= MAX77620_CNFGGLBL1_LBDAC_EN;
>>>  >+
>>>  >+ pval = of_property_read_bool(np, "maxim,low-battery-shutdown-enable");
>>>  >+ if (pval) {
>>>  >+ mask |= MAX77620_CNFGGLBL1_MPPLD;
>>>  >+ val |= MAX77620_CNFGGLBL1_MPPLD;
>>>  >+ }
>>>  >+
>>>  >+ pval = of_property_read_bool(np, "maxim,low-battery-shutdown-disable");
>>>  >+ if (pval)
>>>  >+ mask |= MAX77620_CNFGGLBL1_MPPLD;
>>>  >+
>>>  >+ pval = of_property_read_bool(np, "maxim,low-battery-reset-enable");
>>>  >+ if (pval) {
>>>  >+ mask |= MAX77620_CNFGGLBL1_LBRSTEN;
>>>  >+ val |= MAX77620_CNFGGLBL1_LBRSTEN;
>>>  >+ }
>>>  >+
>>>  >+ pval = of_property_read_bool(np, "maxim,low-battery-reset-disable");
>>>  >+ if (pval)
>>>  >+ mask |= MAX77620_CNFGGLBL1_LBRSTEN;
>>>  >+
>>>  >+ ret = regmap_update_bits(chip->rmap, MAX77620_REG_CNFGGLBL1, mask, val);
>>>  >+ if (ret < 0)
>>>  >+ dev_err(dev, "Reg CNFGGLBL1 update failed: %d\n", ret);
>>>  >+ return ret;
>>>  >+}
>>>  >+
>>>  > static int max77620_read_es_version(struct max77620_chip *chip)
>>>  > {
>>>  >  unsigned int val;
>>>  >@@ -563,7 +614,11 @@ static int max77620_probe(struct i2c_client *client,
>>>  >  if (ret < 0)
>>>  >  return ret;
>>>  >
>>>  >- ret =  devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
>>>  >+ ret = max77620_init_low_battery_monitor(chip);
>>>  >+ if (ret < 0)
>>>  >+ return ret;
>>>  >+
>>>  >+ ret = devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
>>>  >      mfd_cells, n_mfd_cells, NULL, 0,
>>>  >      regmap_irq_get_domain(chip->top_irq_data));
>>>  >  if (ret < 0) {
>>>
