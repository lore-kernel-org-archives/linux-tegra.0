From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH v4 3/3] thermal: tegra: parse sensor id before sensor
 register
Date: Thu, 29 Nov 2018 08:46:57 -0800
Message-ID: <20181129164656.GA2688@localhost.localdomain>
References: <1543486183-2868-1-git-send-email-wni@nvidia.com>
 <1543486183-2868-4-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543486183-2868-4-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 29, 2018 at 06:09:43PM +0800, Wei Ni wrote:
> Since different platforms may not support all 4
> sensors, so the sensor registration may be failed.
> Add codes to parse dt to find sensor id which
> need to be registered. So that the registration
> can be successful on all platform.
> 
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 46 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
> index 375cadbc24cd..bdc660f2794a 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -1224,6 +1224,42 @@ static void soctherm_init(struct platform_device *pdev)
>  	tegra_soctherm_throttle(&pdev->dev);
>  }
>  
> +static bool tegra_soctherm_find_sensor_id(unsigned int sensor_id)
> +{
> +	bool ret = false;
> +	struct of_phandle_args sensor_specs;
> +	struct device_node *np, *sensor_np;
> +
> +	np = of_find_node_by_name(NULL, "thermal-zones");
> +	if (!np)
> +		return ret;
> +
> +	sensor_np = of_get_next_child(np, NULL);
> +	for_each_available_child_of_node(np, sensor_np) {
> +		if (of_parse_phandle_with_args(sensor_np, "thermal-sensors",
> +						 "#thermal-sensor-cells",
> +						 0, &sensor_specs))
> +			continue;
> +
> +		if (sensor_specs.args_count != 1) {
> +			WARN(sensor_specs.args_count != 1,
> +			     "%s: wrong cells in sensor specifier %d\n",
> +			     sensor_specs.np->name, sensor_specs.args_count);
> +			continue;
> +		}
> +
> +		if (sensor_specs.args[0] == sensor_id) {
> +			ret = true;
> +			break;
> +		}
> +	}
> +
> +	of_node_put(np);
> +	of_node_put(sensor_np);
> +
> +	return ret;
> +}
> +
>  static const struct of_device_id tegra_soctherm_of_match[] = {
>  #ifdef CONFIG_ARCH_TEGRA_124_SOC
>  	{
> @@ -1365,13 +1401,16 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
>  		zone->sg = soc->ttgs[i];
>  		zone->ts = tegra;
>  
> +		if (!tegra_soctherm_find_sensor_id(soc->ttgs[i]->id))
> +			continue;
> +


Instead of matching driver id with DT id presence, wouldnt make sense to
simply have DT with the sensors that makes sense for that platform?

I am failing to understand why you need to go over and find ids.

>  		z = devm_thermal_zone_of_sensor_register(&pdev->dev,
>  							 soc->ttgs[i]->id, zone,
>  							 &tegra_of_thermal_ops);
>  		if (IS_ERR(z)) {
>  			err = PTR_ERR(z);
> -			dev_err(&pdev->dev, "failed to register sensor: %d\n",
> -				err);
> +			dev_err(&pdev->dev, "failed to register sensor %s: %d\n",
> +				soc->ttgs[i]->name, err);
>  			goto disable_clocks;
>  		}
>  
> @@ -1434,6 +1473,9 @@ static int __maybe_unused soctherm_resume(struct device *dev)
>  		struct thermal_zone_device *tz;
>  
>  		tz = tegra->thermctl_tzs[soc->ttgs[i]->id];
> +		if (!tz)
> +			continue;
> +
>  		err = tegra_soctherm_set_hwtrips(dev, soc->ttgs[i], tz);
>  		if (err) {
>  			dev_err(&pdev->dev,
> -- 
> 2.7.4
> 
