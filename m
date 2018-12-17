From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v1 1/3] of: add nvidia,thermtrips property
Date: Mon, 17 Dec 2018 10:57:43 +0800
Message-ID: <172f3d13-fc7f-209c-8fa7-0d859db7dcb2@nvidia.com>
References: <1544177407-20203-1-git-send-email-wni@nvidia.com>
 <1544177407-20203-2-git-send-email-wni@nvidia.com>
 <20181214142956.GF23379@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214142956.GF23379@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 14/12/2018 10:29 PM, Thierry Reding wrote:
> On Fri, Dec 07, 2018 at 06:10:05PM +0800, Wei Ni wrote:
>> Add optional property "nvidia,thermtrips".
>> If present, these trips will be used as HW shutdown trips,
>> and critical trips will be used as SW shutdown trips.
>>
>> Signed-off-by: Wei Ni <wni@nvidia.com>
>> ---
>>  .../bindings/thermal/nvidia,tegra124-soctherm.txt    | 20 +++++++++++++++++---
>>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> This seems like an odd exception. Why not extend the list of trip point
> types with a "shutdown" or "emergency" type that can be used for this?
> This doesn't seem like NVIDIA specific functionality, so adding an
> NVIDIA specific property doesn't seem right.

The thermal framework only support four types "active", "passive",
"hot", "critical". Normally if the "critical" trip is triggered, the
thermal framework will implement a software shutdown. In our soctherm
driver, we also set this "critical" trips to hardware, so it will cause
the HW shutdown directly.
This serial added the "nvidia,thermtrips" to set HW shutdown trips for
our NVIDIA specific functionality, and keep the "critical" trips to
implement SW shutdown.
For example, we will set "critical" trip to 102C, and set
""nvidia,thermtrips" to 103C, it mean if the temperature hit to 102, the
system will be software shutdown, if the temperature increase fast and
up to 103 directly, then it will cause the hardware shutdown.

Thanks.
Wei.

> 
> Also, please always Cc devicetree@vger.kernel.org and the device tree
> bindings maintainers when sending updates for a binding. They need to
> ack these kinds of patches and they can't do that if they don't get a
> copy of the patch.
> 
> Cc'ing them now and quoting the full patch for reference.
> 
> Thierry
> 
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
