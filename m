From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH] thermal: tegra: add get_trend ops
Date: Wed, 28 Nov 2018 17:41:30 +0800
Message-ID: <0ff2454d-fc08-ed16-1502-620a726dfca9@nvidia.com>
References: <1542705077-29697-1-git-send-email-wni@nvidia.com>
 <20181120153833.GB28796@ulmo>
 <d510d768-452f-5f70-a9b6-37d6a63a56c9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d510d768-452f-5f70-a9b6-37d6a63a56c9@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi all,
Does there have any more comments for this patch?

Thanks.
Wei.

On 21/11/2018 2:36 PM, Wei Ni wrote:
> 
> 
> On 20/11/2018 11:38 PM, Thierry Reding wrote:
>> On Tue, Nov 20, 2018 at 05:11:17PM +0800, Wei Ni wrote:
>>> Add support for get_trend ops that allows soctherm
>>> sensors to be used with the step-wise governor.
>>>
>>> Signed-off-by: Wei Ni <wni@nvidia.com>
>>> ---
>>>  drivers/thermal/tegra/soctherm.c | 34 ++++++++++++++++++++++++++++++++++
>>>  1 file changed, 34 insertions(+)
>>>
>>> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
>>> index ed28110a3535..d2951fbe2b7c 100644
>>> --- a/drivers/thermal/tegra/soctherm.c
>>> +++ b/drivers/thermal/tegra/soctherm.c
>>> @@ -488,9 +488,43 @@ static int tegra_thermctl_set_trip_temp(void *data, int trip, int temp)
>>>  	return 0;
>>>  }
>>>  
>>> +static int tegra_thermctl_get_trend(void *data, int trip,
>>> +				    enum thermal_trend *trend)
>>> +{
>>> +	struct tegra_thermctl_zone *zone = data;
>>> +	struct thermal_zone_device *tz = zone->tz;
>>> +	int trip_temp, temp, last_temp, ret;
>>> +
>>> +	if (!tz)
>>> +		return -EINVAL;
>>> +
>>> +	ret = tz->ops->get_trip_temp(zone->tz, trip, &trip_temp);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	mutex_lock(&tz->lock);
>>> +	temp = tz->temperature;
>>> +	last_temp = tz->last_temperature;
>>> +	mutex_unlock(&tz->lock);
>>> +
>>> +	if (temp > trip_temp) {
>>> +		if (temp >= last_temp)
>>> +			*trend = THERMAL_TREND_RAISING;
>>> +		else
>>> +			*trend = THERMAL_TREND_STABLE;
>>> +	} else if (temp < trip_temp) {
>>> +		*trend = THERMAL_TREND_DROPPING;
>>> +	} else {
>>> +		*trend = THERMAL_TREND_STABLE;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>
>> This looks like a reimplementation of the get_tz_trend() helper. Is
>> seems like that helper already has everything we need. Perhaps this
>> isn't working because of-thermal installs of_thermal_get_trend(), a
>> function that returns -EINVAL if the driver doesn't implement the
>> ->get_trend() callback.
> 
> 1. The get_tz_trend() helper can work, because it has:
> if (tz->emul_temperature || !tz->ops->get_trend ||
>             tz->ops->get_trend(tz, trip, &trend)) {
> ...
> }
> the tz->ops->get_trend is of_thermal_get_trend(). If without special
> get_trend(), it will return -EINVAL, so it will implement the if block
> to get the "trend". If we have the special get_trend(), then the
> of_thermal_get_trend() will return 0, so this helper will not implement
> the if block, it will get the "trend" from the special get_trend().
> 
> 2. There has a little difference between the helper and our special
> callback. The tegra_thermctl_get_trend() consider the trip_temp, but the
> get_tz_trend() helper didn't.
> 
>>
>> Perhaps a better way would be to do something like this in
>> thermal_zone_of_add_sensor():
>>
>> 	if (ops->get_trend)
>> 		tzd->ops->get_trend = of_thermal_get_trend;
>>
>> That's similar to how ->set_trips() and ->set_emul_temp() are set up
>> and should make sure that get_tz_trend() will do the right thing for
>> all drivers that don't implement a special ->get_trend().
> 
> As above description, I think the of_thermal_get_trend() already can
> handle this case, doesn't need to change.
> 
> Wei.
> 
>>
>> Thierry
>>
