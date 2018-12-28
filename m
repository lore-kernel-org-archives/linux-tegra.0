From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v1 01/12] of: Add bindings of thermtrip for Tegra soctherm
Date: Fri, 28 Dec 2018 11:28:42 +0800
Message-ID: <1441d2d1-acfa-7b8d-5ed8-c2ca257df05d@nvidia.com>
References: <1545118484-23641-1-git-send-email-wni@nvidia.com>
 <1545118484-23641-3-git-send-email-wni@nvidia.com>
 <20181227230630.GA3659@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181227230630.GA3659@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: thierry.reding@gmail.com, daniel.lezcano@linaro.org, edubezval@gmail.com, linux-tegra@vger.kernel.org, rui.zhang@intel.com, srikars@nvidia.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 28/12/2018 7:06 AM, Rob Herring wrote:
> On Tue, Dec 18, 2018 at 03:34:33PM +0800, Wei Ni wrote:
>> Add optional property "nvidia,thermtrips".
>> If present, these trips will be used as HW shutdown trips,
>> and critical trips will be used as SW shutdown trips.
>>
>> Signed-off-by: Wei Ni <wni@nvidia.com>
>> ---
>>  .../bindings/thermal/nvidia,tegra124-soctherm.txt    | 20 +++++++++++++++++---
>>  1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
>> index b6c0ae53d4dc..ab66d6feab4b 100644
>> --- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
>> +++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
>> @@ -55,10 +55,21 @@ Required properties :
>>        - #cooling-cells: Should be 1. This cooling device only support on/off state.
>>          See ./thermal.txt for a description of this property.
>>  
>> +Optional properties:
>> +- nvidia,thermtrips : When present, this property specifies the temperature at
>> +  which the soctherm hardware will assert the thermal trigger signal to the
>> +  Power Management IC, which can be configured to reset or shutdown the device.
>> +  It is an array of pairs where each pair represents a tsensor id followed by a
>> +  temperature in milli Celcius. In the absence of this property the critical
>> +  trip point will be used for thermtrip temperature.
>> +
>>  Note:
>> -- the "critical" type trip points will be set to SOC_THERM hardware as the
>> -shut down temperature. Once the temperature of this thermal zone is higher
>> -than it, the system will be shutdown or reset by hardware.
>> +- the "critical" type trip points will be used to set the temperature at which
>> +the SOC_THERM hardware will assert a thermal trigger if the "nvidia,thermtrips"
>> +property is missing. When the thermtrips property is present, the breach of a
>> +critical trip point is reported back to the thermal framework to implement
>> +software shutdown.
> 
> This hardly seems like a NVidia specific concept. A h/w shutdown 
> temperature... Come up with something common.

Hi Rob,
In current thermal framework, it doesn't support to set h/w shutdown
trips, the "critical" trip is used for s/w shutdown. I noticed that in
rockchip-thermal driver, it also used "rockchip,hw-tshut-temp" to set
h/w shutdown temperature.

> 
> Also, we already have a temperature table. Why do we need temperatures 
> in 2 places.

Sorry, what do you mean temperature table? Do you mean the trip nodes?

Thanks.
Wei.

> 
>> +
>>  - the "hot" type trip points will be set to SOC_THERM hardware as the throttle
>>  temperature. Once the the temperature of this thermal zone is higher
>>  than it, it will trigger the HW throttle event.
>> @@ -79,6 +90,9 @@ Example :
>>  
>>  		#thermal-sensor-cells = <1>;
>>  
>> +		nvidia,thermtrips = <TEGRA124_SOCTHERM_SENSOR_CPU 102500
>> +				     TEGRA124_SOCTHERM_SENSOR_GPU 103000>;
>> +
>>  		throttle-cfgs {
>>  			/*
>>  			 * When the "heavy" cooling device triggered,
>> -- 
>> 2.7.4
>>
