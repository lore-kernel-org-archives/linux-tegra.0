From: Mark Zhang <markz@nvidia.com>
Subject: Re: [PATCH v2 2/4] mfd: max77620: add documentation for backup
 battery charging
Date: Thu, 31 Jan 2019 10:26:51 +0800
Message-ID: <068e92a6-716c-8144-d504-3e8236dbf591@nvidia.com>
References: <20190129085531.32364-1-markz@nvidia.com>
 <20190129085531.32364-3-markz@nvidia.com> <20190130195154.GA30939@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130195154.GA30939@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: lee.jones@linaro.org, blaws05@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 1/31/2019 3:51 AM, Rob Herring wrote:
> On Tue, Jan 29, 2019 at 04:55:29PM +0800, Mark Zhang wrote:
>> Adding documentation for 3 new backup battery charging dts
>> properties:
>> - maxim,backup-battery-charging-current
>> - maxim,backup-battery-charging-voltage
>> - maxim,backup-battery-output-resister
>>
>> Signed-off-by: Mark Zhang <markz@nvidia.com>
>> ---
>>  .../devicetree/bindings/mfd/max77620.txt      | 20 +++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
>> index 9c16d51cc15b..484b17e4fba5 100644
>> --- a/Documentation/devicetree/bindings/mfd/max77620.txt
>> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
>> @@ -122,6 +122,26 @@ For DT binding details of different sub modules like GPIO, pincontrol,
>>  regulator, power, please refer respective device-tree binding document
>>  under their respective sub-system directories.
>>  
>> +Backup Battery:
>> +==============
>> +This sub-node configure charging backup battery of the device. Device has
>> +support of charging the backup battery. The subnode name is "backup-battery".
>> +The property for backup-battery child nodes as:
>> +Presence of this child node will enable the backup battery charging.
>> +
>> +Optional properties:
>> +	-maxim,backup-battery-charging-current: Charging current setting.
>> +			The device supports 50/100/200/400/600/800uA.
>> +			If this property is unavailable then it will
>> +			charge with 50uA.
>> +	-maxim,backup-battery-charging-voltage: Charging Voltage Limit Setting.
>> +			Device supports 2500000/3000000/3300000/350000uV.
>> +			Default will be set to 2500mV. The voltage will be roundoff
>> +			to nearest lower side if other than above is configured.
>> +	-maxim,backup-battery-output-resister: Output resistor on Ohm.
>> +			Device supports 100/1000/3000/6000 Ohms.
>> +			Default will be set to 1000 Ohm.
> 
> These need property unit suffixes as defined in property-units.txt. The 
> names are kind of long, so perhaps shorten them a bit.
> 

Thanks Rob. Given these properties will be under "backup-battery" section, so how about
changing them to:
- maxim,charging-current-microamp
- maxim,charging-voltage-microvolt
- maxim,output-resister-ohms

Mark

>> +
>>  Example:
>>  --------
>>  #include <dt-bindings/mfd/max77620.h>
>> -- 
>> 2.19.2
>>
