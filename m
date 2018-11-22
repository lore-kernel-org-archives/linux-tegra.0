From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v2 1/3] thermal: tegra: continue if sensor register fails
Date: Thu, 22 Nov 2018 15:10:17 +0800
Message-ID: <5e09bc13-7880-40f2-3f90-01d2cc3510ba@nvidia.com>
References: <1542103567-5521-1-git-send-email-wni@nvidia.com>
 <1542103567-5521-2-git-send-email-wni@nvidia.com>
 <d212af68-fd18-74d4-d81c-ed8b3c0f136a@linaro.org>
 <70f08208-d04c-c9a4-07e6-d377c33a9386@nvidia.com>
 <d77fe117-3cde-108f-e1d7-2871f3d4c485@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d77fe117-3cde-108f-e1d7-2871f3d4c485@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 21/11/2018 8:51 PM, Daniel Lezcano wrote:
> On 21/11/2018 11:23, Wei Ni wrote:
>>
>>
>> On 21/11/2018 4:55 PM, Daniel Lezcano wrote:
>>> On 13/11/2018 11:06, Wei Ni wrote:
>>>> Don't bail when a sensor fails to register with the
>>>> thermal zone and allow other sensors to register.
>>>> This allows other sensors to register with thermal
>>>> framework even if one sensor fails registration.
>>>
>>> I'm not sure if ignoring the error is really safe. Can you describe the
>>> real situation you want to overcome ? How do you differentiate critical
>>> sensors ?
>>
>> The driver will always try to register 4 thermal zones, including cpu,
>> gpu, mem and pll, but if the dts file doesn't set the corresponding
>> sensors, then the register will be failed.
>> Normally, the dts file will set all 4 sensors, but there may have some
>> platform doesn't support them all. So we post this patch.
> 
> Ignoring errors is not the way to go to support different platforms. Fix
> the DT.

The issue isn't in DT file. The Tegra soc thermal include 4 sensors:
cpu, gpu, mem, pll. But in some platforms, for example, we may only need
to support 2 sensors, such as cpu and gpu, so we only configure these
two senors in DT file. But the driver will always try to register 4
sensors, cpu/gpu/mem/pll, so mem and pll will be registered failed. So
in this case we need to ignoring the failure, and continue to enable the
driver.

> 
> 
>> BTW, what do you mean "critical sensors"? We will set critical trip temp
>> for all sensors.
> 
> I meant sensor for thermal zone getting really high temperature.

We doesn't have the critical sensors. We set the critical trip temp for
all registered sensors. And these trip temp is set to the Tegra
hardware. So it mean if the temperature reached the critical trip point,
then the system will be shutdown directly.

> 
> 
>>>> Signed-off-by: Wei Ni <wni@nvidia.com>
>>>> ---
>>>>  drivers/thermal/tegra/soctherm.c | 8 +++++---
>>>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
>>>> index ed28110a3535..a824d2e63af3 100644
>>>> --- a/drivers/thermal/tegra/soctherm.c
>>>> +++ b/drivers/thermal/tegra/soctherm.c
>>>> @@ -1370,9 +1370,9 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
>>>>  							 &tegra_of_thermal_ops);
>>>>  		if (IS_ERR(z)) {
>>>>  			err = PTR_ERR(z);
>>>> -			dev_err(&pdev->dev, "failed to register sensor: %d\n",
>>>> -				err);
>>>> -			goto disable_clocks;
>>>> +			dev_warn(&pdev->dev, "failed to register sensor %s: %d\n",
>>>> +				 soc->ttgs[i]->name, err);
>>>> +			continue;
>>>>  		}
>>>>  
>>>>  		zone->tz = z;
>>>> @@ -1434,6 +1434,8 @@ static int __maybe_unused soctherm_resume(struct device *dev)
>>>>  		struct thermal_zone_device *tz;
>>>>  
>>>>  		tz = tegra->thermctl_tzs[soc->ttgs[i]->id];
>>>> +		if (!tz)
>>>> +			continue;
>>>>  		err = tegra_soctherm_set_hwtrips(dev, soc->ttgs[i], tz);
>>>>  		if (err) {
>>>>  			dev_err(&pdev->dev,
>>>>
>>>
>>>
> 
> 
