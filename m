From: Mark Zhang <markz@nvidia.com>
Subject: Re: [2/2] mfd: max77620: Add low battery monitor support
Date: Tue, 29 Jan 2019 14:52:31 +0800
Message-ID: <bd942195-4f1c-1a39-283f-610354308f45@nvidia.com>
References: <3587c682-e1db-5140-fd8e-13c46d882dd3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3587c682-e1db-5140-fd8e-13c46d882dd3@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: blaws05@gmail.com, lee.jones@linaro.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 1/27/2019 10:54 PM, Billy Laws wrote:
>  >This patch adds PMIC configurations for low-battery
>  >monitoring by handling max77620 register CNFGGLBL1.
>  >
> It might be an idea to add lbhyst configuration here and support using
> custom lbdac values to specify a different cutoff point.

Yeah this patch doesn't have support to program LBHYST & LBDAC because
according to our experiences, we don't have requirement to modify them
when low battery monitor support added.

I think we can create a new patch to support these 2 fields in the future
when we really need them. Or you can create a patch if you have requirement
for them, is this OK to you Billy?

Mark

>=20
> See: https://datasheetspdf.com/pdf-file/924230/Maxim/MAX8698C/1=C2=A0 pg =
46
>  >Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>  >Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
>  >Signed-off-by: Mark Zhang <markz@nvidia.com>
>  >---
>  > drivers/mfd/max77620.c | 57 +++++++++++++++++++++++++++++++++++++++++-
>  > 1 file changed, 56 insertions(+), 1 deletion(-)
>  >
>  >diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
>  >index f58143103185..9e50d145afd8 100644
>  >--- a/drivers/mfd/max77620.c
>  >+++ b/drivers/mfd/max77620.c
>  >@@ -474,6 +474,57 @@ static int=20
> max77620_init_backup_battery_charging(struct max77620_chip *chip)
>  >=C2=A0 return ret;
>  > }
>  >
>  >+static int max77620_init_low_battery_monitor(struct max77620_chip *chi=
p)
>  >+{
>  >+ struct device *dev =3D chip->dev;
>  >+ struct device_node *np;
>  >+ bool pval;
>  >+ u8 mask =3D 0;
>  >+ u8 val =3D 0;
>  >+ int ret;
>  >+
>  >+ np =3D of_get_child_by_name(dev->of_node, "low-battery-monitor");
>  >+ if (!np) {
>  >+ dev_info(dev, "Low battery monitoring support disabled\n");
>  >+ return 0;
>  >+ }
>  >+
>  >+ pval =3D of_property_read_bool(np, "maxim,low-battery-dac-enable");
>  >+ if (pval) {
>  >+ mask |=3D MAX77620_CNFGGLBL1_LBDAC_EN;
>  >+ val |=3D MAX77620_CNFGGLBL1_LBDAC_EN;
>  >+ }
>  >+
>  >+ pval =3D of_property_read_bool(np, "maxim,low-battery-dac-disable");
>  >+ if (pval)
>  >+ mask |=3D MAX77620_CNFGGLBL1_LBDAC_EN;
>  >+
>  >+ pval =3D of_property_read_bool(np, "maxim,low-battery-shutdown-enable=
");
>  >+ if (pval) {
>  >+ mask |=3D MAX77620_CNFGGLBL1_MPPLD;
>  >+ val |=3D MAX77620_CNFGGLBL1_MPPLD;
>  >+ }
>  >+
>  >+ pval =3D of_property_read_bool(np, "maxim,low-battery-shutdown-disabl=
e");
>  >+ if (pval)
>  >+ mask |=3D MAX77620_CNFGGLBL1_MPPLD;
>  >+
>  >+ pval =3D of_property_read_bool(np, "maxim,low-battery-reset-enable");
>  >+ if (pval) {
>  >+ mask |=3D MAX77620_CNFGGLBL1_LBRSTEN;
>  >+ val |=3D MAX77620_CNFGGLBL1_LBRSTEN;
>  >+ }
>  >+
>  >+ pval =3D of_property_read_bool(np, "maxim,low-battery-reset-disable")=
;
>  >+ if (pval)
>  >+ mask |=3D MAX77620_CNFGGLBL1_LBRSTEN;
>  >+
>  >+ ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_CNFGGLBL1, mask, =
val);
>  >+ if (ret < 0)
>  >+ dev_err(dev, "Reg CNFGGLBL1 update failed: %d\n", ret);
>  >+ return ret;
>  >+}
>  >+
>  > static int max77620_read_es_version(struct max77620_chip *chip)
>  > {
>  >=C2=A0 unsigned int val;
>  >@@ -563,7 +614,11 @@ static int max77620_probe(struct i2c_client *clien=
t,
>  >=C2=A0 if (ret < 0)
>  >=C2=A0 return ret;
>  >
>  >- ret =3D=C2=A0 devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
>  >+ ret =3D max77620_init_low_battery_monitor(chip);
>  >+ if (ret < 0)
>  >+ return ret;
>  >+
>  >+ ret =3D devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
>  >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfd_cells, n_mfd_cells, NULL, 0,
>  >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_irq_get_domain(chip->top_irq_data=
));
>  >=C2=A0 if (ret < 0) {
>=20
