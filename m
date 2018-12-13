From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2 06/21] clk: tegra: dfll: CVB calculation alignment with
 the regulator
Date: Thu, 13 Dec 2018 11:18:20 +0000
Message-ID: <ce41aec0-64a7-03ca-e6ce-80c0c58e5a7d@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-7-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181213093438.29621-7-josephl@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 13/12/2018 09:34, Joseph Lo wrote:
> The CVB table contains calibration data for the CPU DFLL based on
> process characterization. The regulator step and offset parameters depend
> on the regulator supplying vdd-cpu, not on the specific Tegra SKU.
> 
> When using a PWM controlled regulator, the voltage step and offset are
> determined by the regulator type in use. This is specified in DT. When
> using an I2C controlled regulator, we can retrieve them from CPU regulator
> Then pass this information to the CVB table calculation function.
> 
> Based on the work done of "Peter De Schrijver <pdeschrijver@nvidia.com>"
> and "Alex Frid <afrid@nvidia.com>".
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *V2:
>  - use the updated DT binding string for parsing
>  - update the mechanism for geting regulator data from DT (PWM mode) or
>  regulator (I2C mode)
> ---
>  drivers/clk/tegra/clk-dfll.h               |  6 ++-
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 57 ++++++++++++++++++++--
>  drivers/clk/tegra/cvb.c                    | 12 +++--
>  drivers/clk/tegra/cvb.h                    |  6 +--
>  4 files changed, 67 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
> index 83352c8078f2..ecc43cb9b6f1 100644
> --- a/drivers/clk/tegra/clk-dfll.h
> +++ b/drivers/clk/tegra/clk-dfll.h
> @@ -1,6 +1,6 @@
>  /*
>   * clk-dfll.h - prototypes and macros for the Tegra DFLL clocksource driver
> - * Copyright (C) 2013 NVIDIA Corporation.  All rights reserved.
> + * Copyright (C) 2013-2018 NVIDIA Corporation.  All rights reserved.
>   *
>   * Aleksandr Frid <afrid@nvidia.com>
>   * Paul Walmsley <pwalmsley@nvidia.com>
> @@ -22,11 +22,14 @@
>  #include <linux/reset.h>
>  #include <linux/types.h>
>  
> +#include "cvb.h"
> +
>  /**
>   * struct tegra_dfll_soc_data - SoC-specific hooks/integration for the DFLL driver
>   * @dev: struct device * that holds the OPP table for the DFLL
>   * @max_freq: maximum frequency supported on this SoC
>   * @cvb: CPU frequency table for this SoC
> + * @alignment: parameters of the regulator step and offset
>   * @init_clock_trimmers: callback to initialize clock trimmers
>   * @set_clock_trimmers_high: callback to tune clock trimmers for high voltage
>   * @set_clock_trimmers_low: callback to tune clock trimmers for low voltage
> @@ -35,6 +38,7 @@ struct tegra_dfll_soc_data {
>  	struct device *dev;
>  	unsigned long max_freq;
>  	const struct cvb_table *cvb;
> +	struct rail_alignment alignment;
>  
>  	void (*init_clock_trimmers)(void);
>  	void (*set_clock_trimmers_high)(void);
> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> index 1a2cc113e5c8..189b5e20ee4e 100644
> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> @@ -23,6 +23,7 @@
>  #include <linux/init.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>  #include <soc/tegra/fuse.h>
>  
>  #include "clk.h"
> @@ -50,9 +51,6 @@ static const struct cvb_table tegra124_cpu_cvb_tables[] = {
>  		.process_id = -1,
>  		.min_millivolts = 900,
>  		.max_millivolts = 1260,
> -		.alignment = {
> -			.step_uv = 10000, /* 10mV */
> -		},
>  		.speedo_scale = 100,
>  		.voltage_scale = 1000,
>  		.entries = {
> @@ -105,11 +103,45 @@ static const struct of_device_id tegra124_dfll_fcpu_of_match[] = {
>  	{ },
>  };
>  
> +static void get_alignment_from_dt(struct device *dev,
> +				  struct rail_alignment *align)
> +{
> +	align->step_uv = 0;
> +	align->offset_uv = 0;
> +
> +	if (of_property_read_u32(dev->of_node,
> +				 "nvidia,pwm-voltage-step-microvolts",
> +				 &align->step_uv))
> +		align->step_uv = 0;

Not sure why it is necessary to initialise this again on failure.

> +
> +	if (of_property_read_u32(dev->of_node,
> +				 "nvidia,pwm-min-microvolts",
> +				 &align->offset_uv))
> +		align->offset_uv = 0;

Same here.

> +}
> +
> +static int get_alignment_from_regulator(struct device *dev,
> +					 struct rail_alignment *align)
> +{
> +	struct regulator *reg = devm_regulator_get(dev, "vdd-cpu");
> +
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +
> +	align->offset_uv = regulator_list_voltage(reg, 0);
> +	align->step_uv = regulator_get_linear_step(reg);
> +
> +	devm_regulator_put(reg);
> +
> +	return 0;
> +}
> +
>  static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
>  {
>  	int process_id, speedo_id, speedo_value, err;
>  	struct tegra_dfll_soc_data *soc;
>  	const struct dfll_fcpu_data *fcpu_data;
> +	struct rail_alignment align;
>  
>  	fcpu_data = of_device_get_match_data(&pdev->dev);
>  	if (!fcpu_data)
> @@ -135,12 +167,27 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	if (of_property_read_bool(pdev->dev.of_node, "nvidia,pwm-to-pmic")) {
> +		get_alignment_from_dt(&pdev->dev, &align);
> +	} else {
> +		err = get_alignment_from_regulator(&pdev->dev, &align);
> +		if (err == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;

Why not return any error here? The print below maybe misleading.

> +	}
> +
> +	if (!align.step_uv) {
> +		dev_err(&pdev->dev, "missing step uv\n");
> +		return -EINVAL;
> +	}
> +

Cheers
Jon

-- 
nvpublic
