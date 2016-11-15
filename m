From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Tue, 15 Nov 2016 15:07:30 +0000
Message-ID: <b65cf9ea-208a-0704-7cc9-843bc18da508@nvidia.com>
References: <1478696782-11657-1-git-send-email-ldewangan@nvidia.com>
 <1478696782-11657-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478696782-11657-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: gnurou@gmail.com, yamada.masahiro@socionext.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 09/11/16 13:06, Laxman Dewangan wrote:
> NVIDIA Tegra124 and later SoCs support the multi-voltage level and
> low power state of some of its IO pads. The IO pads can work in
> the voltage of the 1.8V and 3.3V of IO voltage from IO power rail
> sources. When IO interfaces are not used then IO pads can be
> configure in low power state to reduce the power consumption from
> that IO pads.
> 
> On Tegra124, the voltage level of IO power rail source is auto
> detected by hardware(SoC) and hence it is only require to configure
> in low power mode if IO pads are not used.
> 
> On T210 onwards, the auto-detection of voltage level from IO power
> rail is removed from SoC and hence SW need to configure the PMC
> register explicitly to set proper voltage in IO pads based on
> IO rail power source voltage.
> 
> This driver adds the IO pad driver to configure the power state and
> IO pad voltage based on the usage and power tree via pincontrol
> framework. The configuration can be static and dynamic.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> ---
> Changes from V1:
> - Dropped the custom properties to set pad voltage and use regulator.
> - Added support for regulator to get vottage in boot and configure IO
>   pad voltage.
> - Add support for callback to handle regulator notification and configure
>   IO pad voltage based on voltage change.
> ---
>  drivers/pinctrl/tegra/Kconfig                |  12 +
>  drivers/pinctrl/tegra/Makefile               |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c | 488 +++++++++++++++++++++++++++
>  3 files changed, 501 insertions(+)
>  create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
> 
> diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
> index 24e20cc..6004e5c 100644
> --- a/drivers/pinctrl/tegra/Kconfig
> +++ b/drivers/pinctrl/tegra/Kconfig
> @@ -23,6 +23,18 @@ config PINCTRL_TEGRA210
>  	bool
>  	select PINCTRL_TEGRA
>  
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
> +
>  config PINCTRL_TEGRA_XUSB
>  	def_bool y if ARCH_TEGRA
>  	select GENERIC_PHY
> diff --git a/drivers/pinctrl/tegra/Makefile b/drivers/pinctrl/tegra/Makefile
> index d9ea2be..3ebaaa2 100644
> --- a/drivers/pinctrl/tegra/Makefile
> +++ b/drivers/pinctrl/tegra/Makefile
> @@ -4,4 +4,5 @@ obj-$(CONFIG_PINCTRL_TEGRA30)		+= pinctrl-tegra30.o
>  obj-$(CONFIG_PINCTRL_TEGRA114)		+= pinctrl-tegra114.o
>  obj-$(CONFIG_PINCTRL_TEGRA124)		+= pinctrl-tegra124.o
>  obj-$(CONFIG_PINCTRL_TEGRA210)		+= pinctrl-tegra210.o
> +obj-$(CONFIG_PINCTRL_TEGRA_IO_PAD)	+= pinctrl-tegra-io-pad.o
>  obj-$(CONFIG_PINCTRL_TEGRA_XUSB)	+= pinctrl-tegra-xusb.o
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c b/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
> new file mode 100644
> index 0000000..f5cf0d0
> --- /dev/null
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
> @@ -0,0 +1,488 @@
> +/*
> + * pinctrl-tegra-io-pad: IO PAD driver for configuration of IO rail and deep
> + *			 Power Down mode via pinctrl framework.
> + *
> + * Copyright (C) 2016 NVIDIA CORPORATION. All rights reserved.
> + *
> + * Author: Laxman Dewangan <ldewangan@nvidia.com>
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
> +
> +#include "../core.h"
> +#include "../pinconf.h"
> +#include "../pinctrl-utils.h"
> +
> +/**
> + * Macro for 1.8V, keep 200mV as tolerance for deciding that
> + * IO pads should be set for 3.3V (high voltage) or 1.8V.
> + */
> +#define TEGRA_IO_PAD_1800000UV_UPPER_LIMIT 2000000

Is there a reference we could add for the source of this information?

> +
> +struct tegra_io_pads_cfg_info {

Nit-pick do you need the suffix '_info'? May be nice to keep the name
shorter and just have 'tegra_io_pads_cfg'

> +	const char *name;
> +	const unsigned int pins[1];
> +	const char *vsupply;
> +	enum tegra_io_pad pad_id;

Nit-pick, I think "id" would be sufficient here.

> +	bool support_low_power_state;

I don't see where the above is used. I would also shorten to
"supports_low_power".

> +};
> +
> +struct tegra_io_pad_soc_data {

s/tegra_io_pad/tegra_io_pads/

> +	const struct tegra_io_pads_cfg_info *pads_cfg;
> +	int num_pads_cfg;

May be just ...

	const struct tegra_io_pads_cfg_info *cfgs;
	int num_cfgs;

> +	const struct pinctrl_pin_desc *pins_desc;
> +	int num_pins_desc;
> +};
> +
> +struct tegra_io_pads_regulator_info {
> +	struct device *dev;
> +	const struct tegra_io_pads_cfg_info *pads_cfg;
> +	struct regulator *regulator;
> +	struct notifier_block regulator_nb;
> +};

Is this struct necessary? Seems to be a lot of duplicated information
from the other structs. Why not add the regulator and regulator_nb to
the main struct? OK, not all io_pads have a regulator but you are only
saving one pointer.

> +
> +struct tegra_io_pads_info {
> +	struct device *dev;
> +	struct pinctrl_dev *pctl;
> +	struct tegra_io_pads_regulator_info *rinfo;
> +	const struct tegra_io_pad_soc_data *soc_data;
> +};
> +
> +static int tegra_iop_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +	struct tegra_io_pads_info *tiopi = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return tiopi->soc_data->num_pads_cfg;
> +}
> +
> +static const char *tegra_iop_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
> +						    unsigned int group)
> +{
> +	struct tegra_io_pads_info *tiopi = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return tiopi->soc_data->pads_cfg[group].name;
> +}
> +
> +static int tegra_iop_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
> +					    unsigned int group,
> +					    const unsigned int **pins,
> +					    unsigned int *num_pins)
> +{
> +	struct tegra_io_pads_info *tiopi = pinctrl_dev_get_drvdata(pctldev);
> +
> +	*pins = tiopi->soc_data->pads_cfg[group].pins;
> +	*num_pins = 1;
> +
> +	return 0;
> +}
> +
> +static const struct pinctrl_ops tegra_iop_pinctrl_ops = {
> +	.get_groups_count	= tegra_iop_pinctrl_get_groups_count,
> +	.get_group_name		= tegra_iop_pinctrl_get_group_name,
> +	.get_group_pins		= tegra_iop_pinctrl_get_group_pins,
> +	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pin,
> +	.dt_free_map		= pinctrl_utils_free_map,
> +};
> +
> +static int tegra_io_pad_pinconf_get(struct pinctrl_dev *pctldev,
> +				    unsigned int pin, unsigned long *config)
> +{

Seems to be a mixture of tegra_iop/tegra_io_pad/tegra_io_pads between
various function names. Would be good to be consistent.

> +	struct tegra_io_pads_info *tiopi = pinctrl_dev_get_drvdata(pctldev);
> +	int param = pinconf_to_config_param(*config);
> +	const struct tegra_io_pads_cfg_info *pads_cfg =
> +					&tiopi->soc_data->pads_cfg[pin];
> +	enum tegra_io_pad pad_id = pads_cfg->pad_id;
> +	int arg = 0;

Nit-pick, pad_id and arg seem unnecessary.

> +	int ret;
> +
> +	switch (param) {
> +	case PIN_CONFIG_LOW_POWER_MODE:
> +		ret = tegra_io_pad_power_get_status(pad_id);
> +		if (ret < 0)
> +			return ret;
> +		arg = !ret;
> +		break;
> +
> +	default:
> +		dev_err(tiopi->dev, "The parameter %d not supported\n", param);
> +		return -EINVAL;
> +	}
> +
> +	*config = pinconf_to_config_packed(param, (u16)arg);
> +	return 0;
> +}
> +
> +static int tegra_io_pad_pinconf_set(struct pinctrl_dev *pctldev,
> +				    unsigned int pin, unsigned long *configs,
> +				    unsigned int num_configs)
> +{
> +	struct tegra_io_pads_info *tiopi = pinctrl_dev_get_drvdata(pctldev);
> +	const struct tegra_io_pads_cfg_info *pads_cfg =
> +					&tiopi->soc_data->pads_cfg[pin];
> +	int pad_id = pads_cfg->pad_id;

Unnecessary variable?

> +	u16 param_val;
> +	int param;
> +	int ret;
> +	int i;

Nit-pick, can't the above be on one line?

> +
> +	for (i = 0; i < num_configs; i++) {
> +		param = pinconf_to_config_param(configs[i]);
> +		param_val = pinconf_to_config_argument(configs[i]);
> +
> +		switch (param) {
> +		case PIN_CONFIG_LOW_POWER_MODE:
> +			if (param_val)
> +				ret = tegra_io_pad_power_disable(pad_id);
> +			else
> +				ret = tegra_io_pad_power_enable(pad_id);
> +			if (ret < 0) {
> +				dev_err(tiopi->dev,
> +					"Failed to set DPD %d of pin %u: %d\n",
> +					param_val, pin, ret);
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
> +static const struct pinconf_ops tegra_io_pad_pinconf_ops = {
> +	.pin_config_get = tegra_io_pad_pinconf_get,
> +	.pin_config_set = tegra_io_pad_pinconf_set,
> +};
> +
> +static struct pinctrl_desc tegra_iop_pinctrl_desc = {
> +	.name = "pinctrl-tegra-io-pads",
> +	.pctlops = &tegra_iop_pinctrl_ops,
> +	.confops = &tegra_io_pad_pinconf_ops,
> +};
> +
> +static int tegra_io_pads_rail_change_notify_cb(struct notifier_block *nb,
> +					       unsigned long event, void *data)
> +{
> +	struct tegra_io_pads_regulator_info *rinfo;
> +	struct pre_voltage_change_data *vdata;
> +	unsigned long int io_volt_uv, old_uv;
> +	enum tegra_io_pad_voltage io_volt;
> +	int ret;
> +
> +	rinfo = container_of(nb, struct tegra_io_pads_regulator_info,
> +			     regulator_nb);
> +
> +	switch (event) {
> +	case REGULATOR_EVENT_PRE_VOLTAGE_CHANGE:
> +		vdata = data;
> +		if ((vdata->old_uV > TEGRA_IO_PAD_1800000UV_UPPER_LIMIT) &&
> +		    (vdata->min_uV <= TEGRA_IO_PAD_1800000UV_UPPER_LIMIT))
> +			break;

The data-sheet for Tegra210 only lists 1.8V or 3.3V as supported
options. Do we need to support a range? Or does the h/w support a range
of voltages? I am just wondering why we cannot check explicitly for 1.8V
or 3.3V and treat anything else as an error.

> +
> +		ret = tegra_io_pad_set_voltage(rinfo->pads_cfg->pad_id,
> +					       TEGRA_IO_PAD_3300000UV);
> +		if (ret < 0) {
> +			dev_err(rinfo->dev,
> +				"Failed to set voltage %lu of pad %s: %d\n",
> +				vdata->min_uV, rinfo->pads_cfg->name, ret);
> +			return ret;
> +		}
> +		break;
> +
> +	case REGULATOR_EVENT_VOLTAGE_CHANGE:
> +		io_volt_uv = (unsigned long)data;
> +		ret = tegra_io_pad_get_voltage(rinfo->pads_cfg->pad_id);
> +		if (ret < 0) {
> +			dev_err(rinfo->dev, "Failed to get IO pad voltage: %d\n",
> +				ret);
> +			return ret;
> +		}
> +		old_uv = (ret == TEGRA_IO_PAD_1800000UV) ? 1800000 : 3300000;
> +		if (((io_volt_uv <= TEGRA_IO_PAD_1800000UV_UPPER_LIMIT) &&
> +		      (old_uv <= TEGRA_IO_PAD_1800000UV_UPPER_LIMIT)) ||
> +		       ((io_volt_uv > TEGRA_IO_PAD_1800000UV_UPPER_LIMIT) &&
> +			 (old_uv > TEGRA_IO_PAD_1800000UV_UPPER_LIMIT)))
> +			break;

Macro or sub-function? It is hard to read.

> +
> +		ret = tegra_io_pad_set_voltage(rinfo->pads_cfg->pad_id,
> +					       TEGRA_IO_PAD_1800000UV);
> +		if (ret < 0) {
> +			dev_err(rinfo->dev,
> +				"Failed to set voltage %lu of pad %s: %d\n",
> +				vdata->min_uV, rinfo->pads_cfg->name, ret);
> +			return ret;
> +		}
> +		break;
> +
> +	case REGULATOR_EVENT_ABORT_VOLTAGE_CHANGE:
> +		io_volt_uv = (unsigned long)data;
> +		io_volt = (io_volt_uv <= TEGRA_IO_PAD_1800000UV_UPPER_LIMIT) ?
> +			   TEGRA_IO_PAD_1800000UV : TEGRA_IO_PAD_3300000UV;

Macro? I believe this is also used in another place.

> +		ret = tegra_io_pad_set_voltage(rinfo->pads_cfg->pad_id,
> +					       io_volt);
> +		if (ret < 0) {
> +			dev_err(rinfo->dev,
> +				"Failed to set voltage %lu of pad %s: %d\n",
> +				io_volt_uv, rinfo->pads_cfg->name, ret);
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
> +static int tegra_iop_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct platform_device_id *id = platform_get_device_id(pdev);
> +	const struct tegra_io_pad_soc_data *soc_data;
> +	struct device_node *np_parent = pdev->dev.parent->of_node;

I would get rid of this variable and set pdev->dev.of_node right before
testing it is valid.

> +	struct tegra_io_pads_info *tiopi;
> +	int ret, i;
> +
> +	if (!np_parent) {
> +		dev_err(dev, "PMC should be register from DT\n");
> +		return -ENODEV;
> +	}
> +
> +	soc_data = (const struct tegra_io_pad_soc_data *)id->driver_data;
> +
> +	tiopi = devm_kzalloc(dev, sizeof(*tiopi), GFP_KERNEL);
> +	if (!tiopi)
> +		return -ENOMEM;
> +
> +	tiopi->rinfo = devm_kzalloc(dev, sizeof(*tiopi->rinfo) *
> +				    soc_data->num_pads_cfg, GFP_KERNEL);
> +	if (!tiopi->rinfo)
> +		return -ENOMEM;
> +
> +	tiopi->dev = &pdev->dev;
> +	pdev->dev.of_node = np_parent;
> +	tiopi->soc_data = soc_data;
> +
> +	for (i = 0; i < soc_data->num_pads_cfg; ++i) {
> +		struct tegra_io_pads_regulator_info *rinfo = tiopi->rinfo + i;
> +		const struct tegra_io_pads_cfg_info *pads_cfg =
> +							&soc_data->pads_cfg[i];

Is this variable necessary? Why not set rinfo->pads_cfg directly from
soc_data?

> +		struct regulator *regulator;
> +		int io_volt_uv;
> +		enum tegra_io_pad_voltage io_volt;
> +
> +		if (!pads_cfg->vsupply)
> +			continue;
> +
> +		regulator = devm_regulator_get_optional(dev, pads_cfg->vsupply);
> +		if (IS_ERR(regulator)) {
> +			ret = PTR_ERR(regulator);
> +			if (ret == -EPROBE_DEFER)
> +				return ret;
> +			continue;
> +		}
> +
> +		io_volt_uv = regulator_get_voltage(regulator);
> +		if (io_volt_uv < 0) {
> +			dev_err(dev, "Failed to get voltage for rail %s: %d\n",
> +				pads_cfg->vsupply, io_volt_uv);
> +			return ret;
> +		}
> +
> +		io_volt = (io_volt_uv <= TEGRA_IO_PAD_1800000UV_UPPER_LIMIT) ?
> +			   TEGRA_IO_PAD_1800000UV : TEGRA_IO_PAD_3300000UV;

Macro?

> +		ret = tegra_io_pad_set_voltage(pads_cfg->pad_id, io_volt);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to set voltage %d of pad %s: %d\n",
> +				io_volt_uv, pads_cfg->name, ret);
> +			return ret;
> +		}
> +		rinfo->dev = tiopi->dev;
> +		rinfo->regulator = regulator;
> +		rinfo->pads_cfg = pads_cfg;
> +
> +		rinfo->regulator_nb.notifier_call =
> +					tegra_io_pads_rail_change_notify_cb;
> +		ret = devm_regulator_register_notifier(regulator,
> +						       &rinfo->regulator_nb);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to register regulator %s notifier: %d\n",
> +				pads_cfg->name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	tegra_iop_pinctrl_desc.pins = tiopi->soc_data->pins_desc;
> +	tegra_iop_pinctrl_desc.npins = tiopi->soc_data->num_pins_desc;
> +	platform_set_drvdata(pdev, tiopi);
> +
> +	tiopi->pctl = devm_pinctrl_register(dev, &tegra_iop_pinctrl_desc,
> +					    tiopi);
> +	if (IS_ERR(tiopi->pctl)) {
> +		ret = PTR_ERR(tiopi->pctl);
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
> +#define TEGRA_IO_PAD_INFO(_id, _name, _pad_id, _lpstate, _vsupply)	\
> +	{								\
> +		.name = _name,						\

Do we need to store 'name' in this struct as well seeing as it is
already in the pins_desc?

Cheers
Jon

-- 
nvpublic
