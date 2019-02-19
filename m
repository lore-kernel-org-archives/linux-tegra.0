From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v1 11/12] of: Add bindings of OC hw throttle for Tegra
 soctherm
Date: Tue, 19 Feb 2019 14:31:26 +0800
Message-ID: <9b489907-d776-230b-7e82-df823ad72854@nvidia.com>
References: <1545118484-23641-1-git-send-email-wni@nvidia.com>
 <1545118484-23641-13-git-send-email-wni@nvidia.com>
 <20190218203204.GA12911@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218203204.GA12911@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: thierry.reding@gmail.com, daniel.lezcano@linaro.org, edubezval@gmail.com, linux-tegra@vger.kernel.org, rui.zhang@intel.com, srikars@nvidia.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 19/2/2019 4:32 AM, Rob Herring wrote:
> On Tue, Dec 18, 2018 at 03:34:43PM +0800, Wei Ni wrote:
>> Add OC HW throttle configuration for soctherm in DT.
>> It is used to describe the OCx throttle events.
>>
>> Signed-off-by: Wei Ni <wni@nvidia.com>
>> ---
>>  .../bindings/thermal/nvidia,tegra124-soctherm.txt  | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
>> index cf6d0be56b7a..d112a8e59ec3 100644
>> --- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
>> +++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
>> @@ -64,6 +64,21 @@ Required properties :
>>        - #cooling-cells: Should be 1. This cooling device only support on/off state.
>>          See ./thermal.txt for a description of this property.
>>  
>> +      Optional properties: The following properties are T210 specific and
>> +      valid only for OCx throttle events.
>> +      - nvidia,count-threshold: Specifies the number of OC events that are
>> +        required for triggering an interrupt. Interrupts are not triggered if
>> +        the property is missing. A value of 0 will interrupt on every OC alarm.
>> +      - nvidia,polarity-active-low: Configures the polarity of the OC alaram
>> +        signal. Accepted values are 1 for assert low and 0 for assert high.
>> +        Default value is 0.
> 
> Why not boolean?

Ok, will change to use boolean.

> 
>> +      - nvidia,alarm-filter: Number of clocks to filter event. When the filter
>> +        expires (which means the OC event has not occurred for a long time),
>> +        the counter is cleared and filter is rearmed. Default value is 0.
>> +      - nvidia,throttle-period: Specifies the number of uSec for which
>> +        throttling is engaged after the OC event is deasserted. Default value
>> +        is 0.
> 
> Needs a unit suffix as defined in property-units.txt.

Yes, will add suffix "-us" for it.

> 
>> +
>>  Optional properties:
>>  - nvidia,thermtrips : When present, this property specifies the temperature at
>>    which the soctherm hardware will assert the thermal trigger signal to the
>> @@ -134,6 +149,17 @@ Example :
>>  			 * arbiter will select the highest priority as the final throttle
>>  			 * settings to skip cpu pulse.
>>  			 */
>> +
>> +			throttle_oc1: oc1 {
>> +				nvidia,priority = <50>;
>> +				nvidia,polarity-active-low = <1>;
>> +				nvidia,count-threshold = <100>;
>> +				nvidia,alarm-filter = <5100000>;
>> +				nvidia,throttle-period = <0>;
>> +				nvidia,cpu-throt-percent = <75>;
>> +				nvidia,gpu-throt-level =
>> +						<TEGRA_SOCTHERM_THROT_LEVEL_MED>;
>> +                        };
>>  		};
>>  	};
>>  
>> -- 
>> 2.7.4
>>
