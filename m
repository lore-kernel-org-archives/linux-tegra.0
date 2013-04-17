From: Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Subject: Re: [PATCH 3/3] regulator: palmas: add support for LDO8 tracking
 mode
Date: Wed, 17 Apr 2013 14:54:32 +0100
Message-ID: <516EA998.3050008@slimlogic.co.uk>
References: <1366191793-13934-1-git-send-email-ldewangan@nvidia.com> <1366191793-13934-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1366191793-13934-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Looks good to me, I don't actually know the use case for this feature!

Acked-by: Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>

On 17/04/13 10:43, Laxman Dewangan wrote:
> LDO8 of Palma device like tps65913 support the tracking mode
> on which LDO8 track the SMPS45 voltage when SMPS45 is ON
> and use the LDO8.VOLTAGE_SEL register when SMPS45 is OFF.
>
> On track mode, the steps of voltage change for LDO8 is 25mV
> where in non-tracking mode it is 50mV. Set the steps accordingly.
> Number of voltage count is still same for both the cases.
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/regulator/palmas-regulator.c |   53 ++++++++++++++++++++++++++++++++++
>  include/linux/mfd/palmas.h           |    3 ++
>  2 files changed, 56 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
> index 28080a7..d6efaf1 100644
> --- a/drivers/regulator/palmas-regulator.c
> +++ b/drivers/regulator/palmas-regulator.c
> @@ -572,6 +572,46 @@ static int palmas_extreg_init(struct palmas *palmas, int id,
>  	return 0;
>  }
>  
> +static void palmas_enable_ldo8_track(struct palmas *palmas)
> +{
> +	unsigned int reg;
> +	unsigned int addr;
> +	int ret;
> +
> +	addr = palmas_regs_info[PALMAS_REG_LDO8].ctrl_addr;
> +
> +	ret = palmas_ldo_read(palmas, addr, &reg);
> +	if (ret) {
> +		dev_err(palmas->dev, "Error in reading ldo8 control reg\n");
> +		return;
> +	}
> +
> +	reg |= PALMAS_LDO8_CTRL_LDO_TRACKING_EN;
> +	ret = palmas_ldo_write(palmas, addr, reg);
> +	if (ret < 0) {
> +		dev_err(palmas->dev, "Error in enabling tracking mode\n");
> +		return;
> +	}
> +	/*
> +	 * When SMPS45 is set to off and LDO8 tracking is enabled, the LDO8
> +	 * output is defined by the LDO8_VOLTAGE.VSEL register divided by two,
> +	 * and can be set from 0.45 to 1.65 V.
> +	 */
> +	addr = palmas_regs_info[PALMAS_REG_LDO8].vsel_addr;
> +	ret = palmas_ldo_read(palmas, addr, &reg);
> +	if (ret) {
> +		dev_err(palmas->dev, "Error in reading ldo8 voltage reg\n");
> +		return;
> +	}
> +
> +	reg = (reg << 1) & PALMAS_LDO8_VOLTAGE_VSEL_MASK;
> +	ret = palmas_ldo_write(palmas, addr, reg);
> +	if (ret < 0)
> +		dev_err(palmas->dev, "Error in setting ldo8 voltage reg\n");
> +
> +	return;
> +}
> +
>  static struct of_regulator_match palmas_matches[] = {
>  	{ .name = "smps12", },
>  	{ .name = "smps123", },
> @@ -657,6 +697,11 @@ static void palmas_dt_to_pdata(struct device *dev,
>  		if (ret)
>  			pdata->reg_init[idx]->vsel =
>  				PALMAS_SMPS12_VOLTAGE_RANGE;
> +
> +		if (idx == PALMAS_REG_LDO8)
> +			pdata->enable_ldo8_tracking = of_property_read_bool(
> +						palmas_matches[idx].of_node,
> +						"ti,enable-ldo8-tracking");
>  	}
>  
>  	pdata->ldo6_vibrator = of_property_read_bool(node, "ti,ldo6-vibrator");
> @@ -836,6 +881,13 @@ static int palmas_regulators_probe(struct platform_device *pdev)
>  						palmas_regs_info[id].ctrl_addr);
>  			pmic->desc[id].enable_mask =
>  					PALMAS_LDO1_CTRL_MODE_ACTIVE;
> +
> +			/* Check if LDO8 is in tracking mode or not */
> +			if (pdata && (id == PALMAS_REG_LDO8) &&
> +					pdata->enable_ldo8_tracking) {
> +				palmas_enable_ldo8_track(palmas);
> +				pmic->desc[id].uV_step = 25000;
> +			}
>  		} else {
>  			pmic->desc[id].n_voltages = 1;
>  			pmic->desc[id].ops = &palmas_ops_extreg;
> @@ -884,6 +936,7 @@ static int palmas_regulators_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +
>  	return 0;
>  
>  err_unregister_regulator:
> diff --git a/include/linux/mfd/palmas.h b/include/linux/mfd/palmas.h
> index fb04d07..12d8a62 100644
> --- a/include/linux/mfd/palmas.h
> +++ b/include/linux/mfd/palmas.h
> @@ -187,6 +187,9 @@ struct palmas_pmic_platform_data {
>  
>  	/* use LDO6 for vibrator control */
>  	int ldo6_vibrator;
> +
> +	/* Enable tracking mode of LDO8 */
> +	bool enable_ldo8_tracking;
>  };
>  
>  struct palmas_usb_platform_data {
