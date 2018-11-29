From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v3 3/3] thermal: tegra: parse sensor id before sensor
 register
Date: Thu, 29 Nov 2018 13:55:02 +0800
Message-ID: <9c373693-1d3c-cd02-4972-dde338651c0e@nvidia.com>
References: <1543383877-20555-1-git-send-email-wni@nvidia.com>
 <1543383877-20555-4-git-send-email-wni@nvidia.com>
 <20181128102520.GC20723@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128102520.GC20723@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 28/11/2018 6:25 PM, Thierry Reding wrote:
> On Wed, Nov 28, 2018 at 01:44:37PM +0800, Wei Ni wrote:
>> Since different platforms may not support all 4
>> sensors, so the sensor registration may be failed.
>> Add codes to parse dt to find sensor id which
>> need to be registered. So that the registration
>> can be successful on all platform.
>>
>> Signed-off-by: Wei Ni <wni@nvidia.com>
>> ---
>>  drivers/thermal/tegra/soctherm.c | 46 ++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 44 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
>> index 375cadbc24cd..79e4628224d7 100644
>> --- a/drivers/thermal/tegra/soctherm.c
>> +++ b/drivers/thermal/tegra/soctherm.c
>> @@ -1224,6 +1224,44 @@ static void soctherm_init(struct platform_device *pdev)
>>  	tegra_soctherm_throttle(&pdev->dev);
>>  }
>>  
>> +static bool tegra_soctherm_find_sensor_id(int sensor_id)
>> +{
>> +	int id;
> 
> You might want to make this and the sensor_id parameter unsigned int to
> match the signedness of the ID in the specifier arguments and the sensor
> groups.

Ok, will change it.

> 
> Thierry
> 
>> +	bool ret = false;
>> +	struct of_phandle_args sensor_specs;
>> +	struct device_node *np, *sensor_np;
>> +
>> +	np = of_find_node_by_name(NULL, "thermal-zones");
>> +	if (!np)
>> +		return ret;
>> +
>> +	sensor_np = of_get_next_child(np, NULL);
>> +	for_each_available_child_of_node(np, sensor_np) {
> 
> Aren't we leaking np here? I think we need of_node_put() after
> of_get_next_child() to make sure the reference to the "thermal-zones"
> node is properly released.

No, we will not leak np here. Because the
for_each_available_child_of_node will call
of_get_next_available_child(), which will call of_node_put(prev) to
decrease refcount of the prev node. So we just need to of_node_put the
last node after break from this for block.
> 
>> +		if (of_parse_phandle_with_args(sensor_np, "thermal-sensors",
>> +						 "#thermal-sensor-cells",
>> +						 0, &sensor_specs))
>> +			continue;
>> +
>> +		if (sensor_specs.args_count != 1) {
>> +			WARN(sensor_specs.args_count > 1,
>> +			     "%s: wrong cells in sensor specifier %d\n",
>> +			     sensor_specs.np->name, sensor_specs.args_count);
>> +			continue;
> 
> This is odd. You check for args_count != 1 but then WARN on args_count >
> 1. Shouldn't both of these conditions be the same?

Sorry, it's my mistake, will fix it.

> 
>> +		} else {
> 
> Also, since the above has "continue;", we don't really need the else
> block.

Will fix it.
> 
>> +			id = sensor_specs.args[0];
>> +			if (sensor_id == id) {
> 
> It might not be worth to store the ID in a separate variable, we could
> just do:
> 
> 	if (sensor_specs.args[0] == sensor_id)
> 
> Thierry

Sure, will fix it.

>> +				ret = true;
>> +				break;
>> +			}
>> +		}
>> +	}
>> +
>> +	of_node_put(np);
We decrease refcount of the last np.

>> +	of_node_put(sensor_np);
>> +
>> +	return ret;
>> +}
>> +
>>  static const struct of_device_id tegra_soctherm_of_match[] = {
>>  #ifdef CONFIG_ARCH_TEGRA_124_SOC
>>  	{
>> @@ -1365,13 +1403,15 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
>>  		zone->sg = soc->ttgs[i];
>>  		zone->ts = tegra;
>>  
>> +		if (!tegra_soctherm_find_sensor_id(soc->ttgs[i]->id))
>> +			continue;
>>  		z = devm_thermal_zone_of_sensor_register(&pdev->dev,
> 
> I'd would prefer a blank line after the if block for readability.

Sure, will update it.

> 
>>  							 soc->ttgs[i]->id, zone,
>>  							 &tegra_of_thermal_ops);
>>  		if (IS_ERR(z)) {
>>  			err = PTR_ERR(z);
>> -			dev_err(&pdev->dev, "failed to register sensor: %d\n",
>> -				err);
>> +			dev_err(&pdev->dev, "failed to register sensor %s: %d\n",
>> +				soc->ttgs[i]->name, err);
>>  			goto disable_clocks;
>>  		}
>>  
>> @@ -1434,6 +1474,8 @@ static int __maybe_unused soctherm_resume(struct device *dev)
>>  		struct thermal_zone_device *tz;
>>  
>>  		tz = tegra->thermctl_tzs[soc->ttgs[i]->id];
>> +		if (!tz)
>> +			continue;
>>  		err = tegra_soctherm_set_hwtrips(dev, soc->ttgs[i], tz);
> 
> Same here:
> 
> 		if (!tz)
> 			continue;
> 
> 		err = ...
> 
> Thierry

Will update it.

> 
