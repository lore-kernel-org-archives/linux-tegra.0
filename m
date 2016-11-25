From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Fri, 25 Nov 2016 10:57:44 +0100
Message-ID: <20161125095744.GB11512@ulmo.ba.sec>
References: <1479976734-30498-1-git-send-email-ldewangan@nvidia.com>
 <1479976734-30498-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479976734-30498-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 02:08:54PM +0530, Laxman Dewangan wrote:
> NVIDIA Tegra124 and later SoCs support the multi-voltage level and
> low power state of some of its IO pads. The IO pads can work in
> the voltage of the 1.8V and 3.3V of IO voltage from IO power rail
> sources. When IO interfaces are not used then IO pads can be
> configure in low power state to reduce the power consumption from
> that IO pads.
>=20
> On Tegra124, the voltage level of IO power rail source is auto
> detected by hardware(SoC) and hence it is only require to configure
> in low power mode if IO pads are not used.
>=20
> On T210 onwards, the auto-detection of voltage level from IO power
> rail is removed from SoC and hence SW need to configure the PMC
> register explicitly to set proper voltage in IO pads based on
> IO rail power source voltage.
>=20
> This driver adds the IO pad driver to configure the power state and
> IO pad voltage based on the usage and power tree via pincontrol
> framework. The configuration can be static and dynamic.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> ---
> Changes from V1:
> - Dropped the custom properties to set pad voltage and use regulator.
> - Added support for regulator to get vottage in boot and configure IO
>   pad voltage.
> - Add support for callback to handle regulator notification and configure
>   IO pad voltage based on voltage change.
>=20
> Changes from V2:
>  Mostly nit changes per Jon's feedback i.e. use macros for voltage, added
>  comment on macros, reduce the structure and variable name size, optimise
>  number of variables, and allocate memory for regulator info when it need=
ed.
>=20
> Changes from V3:
>  Use the devm_regulator_get() instead of devm_regulator_get_optional().
>=20
>  drivers/pinctrl/tegra/Kconfig                |  12 +
>  drivers/pinctrl/tegra/Makefile               |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c | 530 +++++++++++++++++++++=
++++++
>  3 files changed, 543 insertions(+)
>  create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
>=20
> diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
> index 24e20cc..6004e5c 100644
> --- a/drivers/pinctrl/tegra/Kconfig
> +++ b/drivers/pinctrl/tegra/Kconfig
> @@ -23,6 +23,18 @@ config PINCTRL_TEGRA210
>  	bool
>  	select PINCTRL_TEGRA
> =20
> +config PINCTRL_TEGRA_IO_PAD
> +	bool "Tegra IO pad Control Driver"
> +	depends on ARCH_TEGRA && REGULATOR
> +	select PINCONF
> +	select PINMUX
> +	help
> +	  NVIDIA Tegra124/210 SoC has IO pads which supports multi-voltage
> +	  level of interfacing and deep power down mode of IO pads. The
> +	  voltage of IO pads are SW configurable based on IO rail of that
> +	  pads on T210. This driver provides the interface to change IO pad
> +	  voltage and power state via pincontrol interface.

This has a lot of chip-specific text. Will all of that have to be
updated if support for new chips is added?

> +
>  config PINCTRL_TEGRA_XUSB
>  	def_bool y if ARCH_TEGRA
>  	select GENERIC_PHY
> diff --git a/drivers/pinctrl/tegra/Makefile b/drivers/pinctrl/tegra/Makef=
ile
> index d9ea2be..3ebaaa2 100644
> --- a/drivers/pinctrl/tegra/Makefile
> +++ b/drivers/pinctrl/tegra/Makefile
> @@ -4,4 +4,5 @@ obj-$(CONFIG_PINCTRL_TEGRA30)		+=3D pinctrl-tegra30.o
>  obj-$(CONFIG_PINCTRL_TEGRA114)		+=3D pinctrl-tegra114.o
>  obj-$(CONFIG_PINCTRL_TEGRA124)		+=3D pinctrl-tegra124.o
>  obj-$(CONFIG_PINCTRL_TEGRA210)		+=3D pinctrl-tegra210.o
> +obj-$(CONFIG_PINCTRL_TEGRA_IO_PAD)	+=3D pinctrl-tegra-io-pad.o
>  obj-$(CONFIG_PINCTRL_TEGRA_XUSB)	+=3D pinctrl-tegra-xusb.o
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c b/drivers/pinct=
rl/tegra/pinctrl-tegra-io-pad.c
> new file mode 100644
> index 0000000..aab02d0
> --- /dev/null
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
> @@ -0,0 +1,530 @@
> +/*
> + * pinctrl-tegra-io-pad: IO PAD driver for configuration of IO rail and =
deep
> + *			 Power Down mode via pinctrl framework.
> + *
> + * Copyright (C) 2016 NVIDIA CORPORATION. All rights reserved.
> + *
> + * Author: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <soc/tegra/pmc.h>

Have you considered moving this code into the PMC driver? It seems a
little over the top to go through all of the platform device creation
and driver registration dance only to call into a public API later on.

> +#include "../core.h"
> +#include "../pinconf.h"
> +#include "../pinctrl-utils.h"
> +
> +#define TEGRA_IO_RAIL_1800000UV 1800000
> +#define TEGRA_IO_RAIL_3300000UV 3300000

Is there really a point in having these defines? They are really long
and effectively don't carry more information than just the plain
numbers.

> +
> +/* Covert IO voltage to IO pad voltage enum */

Convert

> +#define tegra_io_uv_to_io_pads_uv(io_uv)				\
> +		(((io_uv) =3D=3D TEGRA_IO_RAIL_1800000UV) ?			\
> +		  TEGRA_IO_PAD_1800000UV : TEGRA_IO_PAD_3300000UV)
> +
> +#define tegra_io_voltage_is_valid(io_uv)			\
> +	({ typeof(io_uv) io_uv_ =3D (io_uv);			\
> +	    ((io_uv_ =3D=3D TEGRA_IO_RAIL_1800000UV) ||		\
> +	     (io_uv_ =3D=3D TEGRA_IO_RAIL_3300000UV)); })
>
Maybe make both of these static inline functions to improve readability?
I find the above very hard to read.

> +struct tegra_io_pads_cfg {
> +	const char *name;
> +	const unsigned int pins[1];
> +	const char *vsupply;
> +	enum tegra_io_pad id;
> +	bool supports_low_power;
> +};

Pretty much everything in this driver operates on single pads, so it's a
little confusing to use the "pads" in the names. I think it would be
more appropriate to name this structure tegra_io_pad_cfg because it is
configuration data associated with a single pad.

> +
> +struct tegra_io_pads_soc_data {

I think the _data suffix is redundant and can be dropped.

The use of "pads" in this structure name is fine because it really does
contain data for multiple pads.

> +	const struct tegra_io_pads_cfg *cfg;
> +	int num_cfg;

This can be unsigned int. Also I think it's more common to use the
plural in these (cfgs, num_cfgs).

> +	const struct pinctrl_pin_desc *desc;
> +	int num_desc;

Same here.

> +};
> +
> +struct tegra_io_pads_info {
> +	struct device *dev;
> +	struct pinctrl_dev *pctl;
> +	const struct tegra_io_pads_soc_data *soc_data;

If you drop the _data suffix from the type I think you can also drop it
=66rom the field name.

"pads" is fine here as well because, again, this deals with multiple
pads.

> +};
> +
> +struct tegra_io_pads_regulator_info {
> +	struct tegra_io_pads_info *tiopi;
> +	const struct tegra_io_pads_cfg *cfg;
> +	struct regulator *regulator;
> +	struct notifier_block regulator_nb;

The regulator_ prefix is redundent here. It's contained within a
structure named tegra_io_pads_regulator_info, so it's fairly obvious
that this is related to regulators.

This deals only with a single pad, so tegra_io_pad_regulator_info would
be less confusing, I think. Perhaps even drop the _info suffix while at
it because it doesn't add anything useful.

> +};
> +
> +static int tegra_io_pads_pinctrl_get_groups_count(struct pinctrl_dev *pc=
tldev)
> +{
> +	struct tegra_io_pads_info *tiopi =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +	return tiopi->soc_data->num_cfg;
> +}
> +
> +static const char *tegra_io_pads_pinctrl_get_group_name(
> +		struct pinctrl_dev *pctldev, unsigned int group)
> +{
> +	struct tegra_io_pads_info *tiopi =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +	return tiopi->soc_data->cfg[group].name;
> +}
> +
> +static int tegra_io_pads_pinctrl_get_group_pins(struct pinctrl_dev *pctl=
dev,
> +						unsigned int group,
> +						const unsigned int **pins,
> +						unsigned int *num_pins)
> +{
> +	struct tegra_io_pads_info *tiopi =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +	*pins =3D tiopi->soc_data->cfg[group].pins;
> +	*num_pins =3D 1;
> +
> +	return 0;
> +}
> +
> +static const struct pinctrl_ops tegra_io_pads_pinctrl_ops =3D {
> +	.get_groups_count	=3D tegra_io_pads_pinctrl_get_groups_count,
> +	.get_group_name		=3D tegra_io_pads_pinctrl_get_group_name,
> +	.get_group_pins		=3D tegra_io_pads_pinctrl_get_group_pins,
> +	.dt_node_to_map		=3D pinconf_generic_dt_node_to_map_pin,
> +	.dt_free_map		=3D pinctrl_utils_free_map,
> +};

Nit: I don't think this padding using tabs increases readability.

> +
> +static int tegra_io_pads_pinconf_get(struct pinctrl_dev *pctldev,
> +				     unsigned int pin, unsigned long *config)
> +{
> +	struct tegra_io_pads_info *tiopi =3D pinctrl_dev_get_drvdata(pctldev);
> +	int param =3D pinconf_to_config_param(*config);
> +	const struct tegra_io_pads_cfg *cfg =3D &tiopi->soc_data->cfg[pin];
> +	int arg =3D 0;

Why not make that a u16...

> +	int ret;
> +
> +	switch (param) {
> +	case PIN_CONFIG_LOW_POWER_MODE:
> +		if (!cfg->supports_low_power) {
> +			dev_err(tiopi->dev,
> +				"IO pad %s does not support low power\n",
> +				cfg->name);
> +			return -EINVAL;
> +		}
> +
> +		ret =3D tegra_io_pad_power_get_status(cfg->id);
> +		if (ret < 0)
> +			return ret;
> +		arg =3D !ret;
> +		break;
> +
> +	default:
> +		dev_err(tiopi->dev, "The parameter %d not supported\n", param);
> +		return -EINVAL;
> +	}
> +
> +	*config =3D pinconf_to_config_packed(param, (u16)arg);

=2E.. and avoid the cast here?

> +
> +	return 0;
> +}
> +
> +static int tegra_io_pads_pinconf_set(struct pinctrl_dev *pctldev,
> +				     unsigned int pin, unsigned long *configs,
> +				    unsigned int num_configs)

This last line is not quite properly aligned.

> +{
> +	struct tegra_io_pads_info *tiopi =3D pinctrl_dev_get_drvdata(pctldev);
> +	const struct tegra_io_pads_cfg *cfg =3D &tiopi->soc_data->cfg[pin];
> +	int i;

This should be unsigned.

> +
> +	for (i =3D 0; i < num_configs; i++) {
> +		int ret;
> +		int param =3D pinconf_to_config_param(configs[i]);

The function returns an enum pin_config_param, why not use that as the
type?

> +		u16 param_val =3D pinconf_to_config_argument(configs[i]);
> +
> +		switch (param) {
> +		case PIN_CONFIG_LOW_POWER_MODE:
> +			if (!cfg->supports_low_power) {
> +				dev_err(tiopi->dev,
> +					"IO pad %s does not support low power\n",
> +					cfg->name);
> +				return -EINVAL;
> +			}
> +			if (param_val)
> +				ret =3D tegra_io_pad_power_disable(cfg->id);
> +			else
> +				ret =3D tegra_io_pad_power_enable(cfg->id);
> +			if (ret < 0) {
> +				dev_err(tiopi->dev,
> +					"Failed to set DPD %d of io-pad %s: %d\n",
> +					param_val, cfg->name, ret);
> +				return ret;
> +			}
> +			break;
> +
> +		default:
> +			dev_err(tiopi->dev, "The parameter %d not supported\n",
> +				param);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct pinconf_ops tegra_io_pads_pinconf_ops =3D {
> +	.pin_config_get =3D tegra_io_pads_pinconf_get,
> +	.pin_config_set =3D tegra_io_pads_pinconf_set,
> +};
> +
> +static struct pinctrl_desc tegra_io_pads_pinctrl_desc =3D {
> +	.name =3D "pinctrl-tegra-io-pads",
> +	.pctlops =3D &tegra_io_pads_pinctrl_ops,
> +	.confops =3D &tegra_io_pads_pinconf_ops,
> +};
> +
> +static int tegra_io_pads_rail_change_notify_cb(struct notifier_block *nb,
> +					       unsigned long event, void *data)
> +{
> +	struct tegra_io_pads_regulator_info *rinfo;
> +	struct pre_voltage_change_data *vdata;
> +	unsigned long int io_volt_uv;

You can drop the int, it's implied by long.

> +	enum tegra_io_pad_voltage pad_volt;
> +	int ret;
> +
> +	rinfo =3D container_of(nb, struct tegra_io_pads_regulator_info,
> +			     regulator_nb);
> +
> +	switch (event) {
> +	case REGULATOR_EVENT_PRE_VOLTAGE_CHANGE:
> +		vdata =3D data;
> +
> +		if (!tegra_io_voltage_is_valid(vdata->old_uV) ||
> +		    !tegra_io_voltage_is_valid(vdata->min_uV)) {
> +			dev_err(rinfo->tiopi->dev,
> +				"IO rail %s voltage is not 1.8/3.3V: %lu:%lu\n",
> +				rinfo->cfg->name, vdata->old_uV, vdata->min_uV);
> +			return -EINVAL;
> +		}
> +
> +		/**
> +		 * Change IO pad voltage before changing IO voltage when it
> +		 * changes from 1.8V to 3.3V
> +		 */
> +		if (vdata->min_uV =3D=3D TEGRA_IO_RAIL_1800000UV)
> +			break;
> +
> +		ret =3D tegra_io_pad_set_voltage(rinfo->cfg->id,
> +					       TEGRA_IO_PAD_3300000UV);
> +		if (ret < 0) {
> +			dev_err(rinfo->tiopi->dev,
> +				"Failed to set voltage %lu of pad %s: %d\n",
> +				vdata->min_uV, rinfo->cfg->name, ret);
> +			return ret;
> +		}
> +		break;
> +
> +	case REGULATOR_EVENT_VOLTAGE_CHANGE:
> +		io_volt_uv =3D (unsigned long)data;
> +		ret =3D tegra_io_pad_get_voltage(rinfo->cfg->id);
> +		if (ret < 0) {
> +			dev_err(rinfo->tiopi->dev,
> +				"Failed to get IO pad voltage: %d\n", ret);
> +			return ret;
> +		}

Might be worth reassigning ret to a variable of type enum
tegra_io_pad_voltage because...

> +
> +		if (!tegra_io_voltage_is_valid(io_volt_uv)) {
> +			dev_err(rinfo->tiopi->dev,
> +				"IO rail %s voltage is not 1.8/3.3V: %lu\n",
> +				rinfo->cfg->name, io_volt_uv);
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * If IO pad configuration matching with IO rail voltage then
> +		 * do nothing.
> +		 */
> +		if (((io_volt_uv =3D=3D TEGRA_IO_RAIL_1800000UV) &&
> +		     (ret =3D=3D TEGRA_IO_PAD_1800000UV)) ||
> +		     ((io_volt_uv =3D=3D TEGRA_IO_RAIL_3300000UV) &&
> +		      (ret =3D=3D TEGRA_IO_PAD_3300000UV)))
> +			break;

=2E.. if somebody ever inserted code between the above and this, they
might be overwriting ret.

> +
> +		ret =3D tegra_io_pad_set_voltage(rinfo->cfg->id,
> +					       TEGRA_IO_PAD_1800000UV);
> +		if (ret < 0) {
> +			dev_err(rinfo->tiopi->dev,
> +				"Failed to set voltage %lu of pad %s: %d\n",
> +				vdata->min_uV, rinfo->cfg->name, ret);

You might want to add the units of the voltage to avoid confusion. Same
in a couple more messages above and below.

> +			return ret;
> +		}
> +		break;
> +
> +	case REGULATOR_EVENT_ABORT_VOLTAGE_CHANGE:
> +		io_volt_uv =3D (unsigned long)data;
> +
> +		if (!tegra_io_voltage_is_valid(io_volt_uv)) {
> +			dev_err(rinfo->tiopi->dev,
> +				"IO rail %s voltage is not 1.8/3.3V: %lu\n",
> +				rinfo->cfg->name, io_volt_uv);
> +			return -EINVAL;
> +		}
> +
> +		pad_volt =3D tegra_io_uv_to_io_pads_uv(io_volt_uv);
> +		ret =3D tegra_io_pad_set_voltage(rinfo->cfg->id, pad_volt);
> +		if (ret < 0) {
> +			dev_err(rinfo->tiopi->dev,
> +				"Failed to set voltage %lu of pad %s: %d\n",
> +				io_volt_uv, rinfo->cfg->name, ret);
> +			return ret;
> +		}
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int tegra_io_pads_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	const struct platform_device_id *id =3D platform_get_device_id(pdev);
> +	const struct tegra_io_pads_soc_data *soc_data =3D
> +			(const struct tegra_io_pads_soc_data *)id->driver_data;
> +	struct tegra_io_pads_info *tiopi;
> +	int ret, i;
> +
> +	if (!pdev->dev.parent->of_node) {
> +		dev_err(dev, "PMC should be register from DT\n");
> +		return -ENODEV;
> +	}
> +
> +	tiopi =3D devm_kzalloc(dev, sizeof(*tiopi), GFP_KERNEL);
> +	if (!tiopi)
> +		return -ENOMEM;
> +
> +	tiopi->dev =3D &pdev->dev;
> +	pdev->dev.of_node =3D pdev->dev.parent->of_node;
> +	tiopi->soc_data =3D soc_data;
> +
> +	for (i =3D 0; i < soc_data->num_cfg; ++i) {
> +		struct tegra_io_pads_regulator_info *rinfo;
> +		enum tegra_io_pad_voltage pad_volt;
> +		int io_volt_uv;
> +
> +		if (!soc_data->cfg[i].vsupply)
> +			continue;
> +
> +		rinfo =3D devm_kzalloc(dev, sizeof(*rinfo), GFP_KERNEL);
> +		if (!rinfo)
> +			return -ENOMEM;
> +
> +		rinfo->tiopi =3D tiopi;
> +		rinfo->cfg =3D &soc_data->cfg[i];
> +
> +		rinfo->regulator =3D devm_regulator_get(dev,
> +						      soc_data->cfg[i].vsupply);
> +		if (IS_ERR(rinfo->regulator)) {
> +			ret =3D PTR_ERR(rinfo->regulator);
> +			if (ret =3D=3D -EPROBE_DEFER)
> +				return ret;
> +			continue;
> +		}
> +
> +		io_volt_uv =3D regulator_get_voltage(rinfo->regulator);
> +		if (io_volt_uv < 0) {
> +			dev_warn(dev, "Failed to get voltage for rail %s: %d\n",
> +				 soc_data->cfg[i].vsupply, io_volt_uv);
> +			continue;
> +		}
> +
> +		if (!tegra_io_voltage_is_valid(io_volt_uv)) {
> +			dev_warn(dev, "IO rail %s voltage is not 1.8/3.3V: %d\n",
> +				 soc_data->cfg[i].vsupply, io_volt_uv);
> +			continue;
> +		}
> +
> +		pad_volt =3D tegra_io_uv_to_io_pads_uv(io_volt_uv);
> +		ret =3D tegra_io_pad_set_voltage(soc_data->cfg[i].id, pad_volt);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to set voltage %d of pad %s: %d\n",
> +				io_volt_uv, soc_data->cfg[i].name, ret);
> +			return ret;
> +		}
> +
> +		rinfo->regulator_nb.notifier_call =3D
> +					tegra_io_pads_rail_change_notify_cb;
> +		ret =3D devm_regulator_register_notifier(rinfo->regulator,
> +						       &rinfo->regulator_nb);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to register regulator %s notifier: %d\n",
> +				soc_data->cfg[i].name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	tegra_io_pads_pinctrl_desc.pins =3D tiopi->soc_data->desc;
> +	tegra_io_pads_pinctrl_desc.npins =3D tiopi->soc_data->num_desc;

This modifies global data. Can we avoid that? I think the easiest would
be to make tegra_io_pads_pinctrl_desc a field of the tegra_io_pads_info
struct.

> +	platform_set_drvdata(pdev, tiopi);
> +
> +	tiopi->pctl =3D devm_pinctrl_register(dev, &tegra_io_pads_pinctrl_desc,
> +					    tiopi);
> +	if (IS_ERR(tiopi->pctl)) {
> +		ret =3D PTR_ERR(tiopi->pctl);
> +		dev_err(dev, "Failed to register io-pad pinctrl driver: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +#define TEGRA124_PAD_INFO_TABLE(_entry_)			\
> +	_entry_(0, "audio", AUDIO, true, NULL),			\
> +	_entry_(1, "bb", BB, true, NULL),			\
> +	_entry_(2, "cam", CAM, true, NULL),			\
> +	_entry_(3, "comp", COMP, true, NULL),			\
> +	_entry_(4, "csia", CSIA, true, NULL),			\
> +	_entry_(5, "csib", CSIB, true, NULL),			\
> +	_entry_(6, "csie", CSIE, true, NULL),			\
> +	_entry_(7, "dsi", DSI, true, NULL),			\
> +	_entry_(8, "dsib", DSIB, true, NULL),			\
> +	_entry_(9, "dsic", DSIC, true, NULL),			\
> +	_entry_(10, "dsid", DSID, true, NULL),			\
> +	_entry_(11, "hdmi", HDMI, true, NULL),			\
> +	_entry_(12, "hsic", HSIC, true, NULL),			\
> +	_entry_(13, "hv", HV, true, NULL),			\
> +	_entry_(14, "lvds", LVDS, true, NULL),			\
> +	_entry_(15, "mipi-bias", MIPI_BIAS, true, NULL),	\
> +	_entry_(16, "nand", NAND, true, NULL),			\
> +	_entry_(17, "pex-bias", PEX_BIAS, true, NULL),		\
> +	_entry_(18, "pex-clk1", PEX_CLK1, true, NULL),		\
> +	_entry_(19, "pex-clk2", PEX_CLK2, true, NULL),		\
> +	_entry_(20, "pex-ctrl", PEX_CNTRL, true, NULL),		\
> +	_entry_(21, "sdmmc1", SDMMC1, true, NULL),		\
> +	_entry_(22, "sdmmc3", SDMMC3, true, NULL),		\
> +	_entry_(23, "sdmmc4", SDMMC4, true, NULL),		\
> +	_entry_(24, "sys-ddc", SYS_DDC, true, NULL),		\
> +	_entry_(25, "uart", UART, true, NULL),			\
> +	_entry_(26, "usb0", USB0, true, NULL),			\
> +	_entry_(27, "usb1", USB1, true, NULL),			\
> +	_entry_(28, "usb2", USB2, true, NULL),			\
> +	_entry_(29, "usb-bias", USB_BIAS, true, NULL)
> +
> +#define TEGRA210_PAD_INFO_TABLE(_entry_)			\
> +	_entry_(0, "audio", AUDIO, true, "vddio-audio"),	\
> +	_entry_(1, "audio-hv", AUDIO_HV, true, "vddio-audio-hv"), \
> +	_entry_(2, "cam", CAM, true, "vddio-cam"),		\
> +	_entry_(3, "csia", CSIA, true, NULL),			\
> +	_entry_(4, "csib", CSIB, true, NULL),			\
> +	_entry_(5, "csic", CSIC, true, NULL),			\
> +	_entry_(6, "csid", CSID, true, NULL),			\
> +	_entry_(7, "csie", CSIE, true, NULL),			\
> +	_entry_(8, "csif", CSIF, true, NULL),			\
> +	_entry_(9, "dbg", DBG, true, "vddio-dbg"),		\
> +	_entry_(10, "debug-nonao", DEBUG_NONAO, true, NULL),	\
> +	_entry_(11, "dmic", DMIC, true, "vddio-dmic"),		\
> +	_entry_(12, "dp", DP, true, NULL),			\
> +	_entry_(13, "dsi", DSI, true, NULL),			\
> +	_entry_(14, "dsib", DSIB, true, NULL),			\
> +	_entry_(15, "dsic", DSIC, true, NULL),			\
> +	_entry_(16, "dsid", DSID, true, NULL),			\
> +	_entry_(17, "emmc", SDMMC4, true, NULL),		\
> +	_entry_(18, "emmc2", EMMC2, true, NULL),		\
> +	_entry_(19, "gpio", GPIO, true, "vddio-gpio"),		\
> +	_entry_(20, "hdmi", HDMI, true, NULL),			\
> +	_entry_(21, "hsic", HSIC, true, NULL),			\
> +	_entry_(22, "lvds", LVDS, true, NULL),			\
> +	_entry_(23, "mipi-bias", MIPI_BIAS, true, NULL),	\
> +	_entry_(24, "pex-bias", PEX_BIAS, true, NULL),		\
> +	_entry_(25, "pex-clk1", PEX_CLK1, true, NULL),		\
> +	_entry_(26, "pex-clk2", PEX_CLK2, true, NULL),		\
> +	_entry_(27, "pex-ctrl", PEX_CNTRL, false, "vddio-pex-ctrl"), \
> +	_entry_(28, "sdmmc1", SDMMC1, true, "vddio-sdmmc1"),	\
> +	_entry_(29, "sdmmc3", SDMMC3, true, "vddio-sdmmc3"),	\
> +	_entry_(30, "spi", SPI, true, "vddio-spi"),		\
> +	_entry_(31, "spi-hv", SPI_HV, true, "vddio-spi-hv"),	\
> +	_entry_(32, "uart", UART, true, "vddio-uart"),		\
> +	_entry_(33, "usb0", USB0, true, NULL),			\
> +	_entry_(34, "usb1", USB1, true, NULL),			\
> +	_entry_(35, "usb2", USB2, true, NULL),			\
> +	_entry_(36, "usb3", USB3, true, NULL),			\
> +	_entry_(37, "usb-bias", USB_BIAS, true, NULL)
> +
> +#define TEGRA_IO_PAD_INFO(_pin, _name, _id, _lpstate, _vsupply)	\
> +	{							\
> +		.name =3D _name,					\
> +		.pins =3D {(_pin)},				\
> +		.id =3D TEGRA_IO_PAD_##_id,			\
> +		.vsupply =3D (_vsupply),				\
> +		.supports_low_power =3D (_lpstate),		\
> +	}
> +
> +static const struct tegra_io_pads_cfg tegra124_io_pads_cfg_info[] =3D {
> +	TEGRA124_PAD_INFO_TABLE(TEGRA_IO_PAD_INFO),
> +};
> +
> +static const struct tegra_io_pads_cfg tegra210_io_pads_cfg_info[] =3D {
> +	TEGRA210_PAD_INFO_TABLE(TEGRA_IO_PAD_INFO),
> +};

That's a weird way of writing these tables. Why not do something simpler
and much more common such as:

	#define TEGRA_IO_PAD_INFO(...) ...

	static const struct tegra_io_pads_cfg tegra124_io_pads_cfgs[] =3D {
		TEGRA_IO_PAD_INFO(...),
		...
	};

	static const struct tegra_io_pads_cfg tegra210_io_pad_cfgs[] =3D {
		TEGRA_IO_PAD_INFO(...),
		...
	};

> +
> +#define TEGRA_IO_PAD_DESC(_pin, _name, _id, _lpstate, _vsupply)	\
> +	PINCTRL_PIN(_pin, _name)
> +
> +static const struct pinctrl_pin_desc tegra124_io_pads_pinctrl_desc[] =3D=
 {
> +	TEGRA124_PAD_INFO_TABLE(TEGRA_IO_PAD_DESC),
> +};
> +
> +static const struct pinctrl_pin_desc tegra210_io_pads_pinctrl_desc[] =3D=
 {
> +	TEGRA210_PAD_INFO_TABLE(TEGRA_IO_PAD_DESC),
> +};
> +
> +static const struct tegra_io_pads_soc_data tegra124_io_pad_soc_data =3D {
> +	.desc		=3D tegra124_io_pads_pinctrl_desc,
> +	.num_desc	=3D ARRAY_SIZE(tegra124_io_pads_pinctrl_desc),
> +	.cfg		=3D tegra124_io_pads_cfg_info,
> +	.num_cfg	=3D ARRAY_SIZE(tegra124_io_pads_cfg_info),
> +};
> +
> +static const struct tegra_io_pads_soc_data tegra210_io_pad_soc_data =3D {
> +	.desc		=3D tegra210_io_pads_pinctrl_desc,
> +	.num_desc	=3D ARRAY_SIZE(tegra210_io_pads_pinctrl_desc),
> +	.cfg		=3D tegra210_io_pads_cfg_info,
> +	.num_cfg	=3D ARRAY_SIZE(tegra210_io_pads_cfg_info),
> +};
> +
> +static const struct platform_device_id tegra_io_pads_dev_id[] =3D {
> +	{
> +		.name =3D "pinctrl-t124-io-pad",
> +		.driver_data =3D (kernel_ulong_t)&tegra124_io_pad_soc_data,
> +	}, {
> +		.name =3D "pinctrl-t210-io-pad",
> +		.driver_data =3D (kernel_ulong_t)&tegra210_io_pad_soc_data,
> +	}, {
> +	},
> +};
> +MODULE_DEVICE_TABLE(platform, tegra_io_pads_dev_id);
> +
> +static struct platform_driver tegra_io_pads_pinctrl_driver =3D {
> +	.driver		=3D {
> +		.name	=3D "pinctrl-tegra-io-pad",
> +	},
> +	.probe		=3D tegra_io_pads_pinctrl_probe,
> +	.id_table	=3D tegra_io_pads_dev_id,
> +};
> +
> +module_platform_driver(tegra_io_pads_pinctrl_driver);
> +
> +MODULE_DESCRIPTION("NVIDIA TEGRA IO pad Control Driver");
> +MODULE_AUTHOR("Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");

Like I said above, I think there's a lot of boilerplate in here that's
simply there to create a virtual device and bind a driver to it. All of
that comes with very little to no benefit. I think this could all just
be moved into the PMC driver and be simplified quite a bit.

Thierry

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYOAsWAAoJEN0jrNd/PrOhBV0P/2KNKE6UZ5TBZp4SEvSU1QOG
jF5ZmQZZhRug9U2+8GE5UnKWtACy1YgDEt/MEWAeGMKLYgrYAKE4INgZHG1PLf3f
V++GyEvL4AHF8LEt2j2vGnMv8i7jfPiom65s0Agc0uTVYVw/4PWYrQ075gErPepS
zGDh7A7i52NrN5ZioF6JEDTBI3qQXFX3Adg/mZxo/993iA1W/hzlf3aPY18drtU7
/hqrSoqZiDjK8H1d5ol3xehB563cjQQJMdoWD4uevqoatS9ZKevj+NaFTDSJv6er
3hchQCUrh5RH078ndnIno0Mg/t0nLcB2HAF0sESVdDTOEtDeR+GobyavAxRD9JDs
uJkC9g7yxpXbl/VJzdPgIVn/B2fa0O33w5eQpBCKf+fLSv3dtjDtAitK96kHJ/4Z
zYs4IR6/YWugDKgLeMa30KzQX2m36egy2JBPlRkjGYQLoVZgfh4WJkJMdTK9IsZk
4SIK5mloNRDj/+Q9ls5FbsNhvgGfJLFTtTjTFOb/nK6uK/2O/7aKxpcapO1pIsPL
6xVlTQoFuarwf3laLru61AGdhuaUFpzt0/Ralnei5ncBoCrZe17QCg7isjQlbTaX
lbWGZPdDi5bWMcijdieYOx+EuXsvZ7MhoqbixmlHJ7PK588W9IPQhwlhLLztxaS+
U/wXfVeqaFHcPQKS+Tn+
=3uKL
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
