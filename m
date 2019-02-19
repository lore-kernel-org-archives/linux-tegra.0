From: Mark Zhang <markz@nvidia.com>
Subject: Re: [PATCH v3 2/4] mfd: max77620: add documentation for backup
 battery charging
Date: Tue, 19 Feb 2019 10:07:23 +0800
Message-ID: <91d3d8f8-0b96-c442-5674-3eff8209848b@nvidia.com>
References: <20190212064353.7451-1-markz@nvidia.com>
 <20190212064353.7451-3-markz@nvidia.com>
 <CAL_JsqKiL8A+SBwqLzYa9djWBT1S+2kxUUB4iuKWX7EoqXouCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKiL8A+SBwqLzYa9djWBT1S+2kxUUB4iuKWX7EoqXouCw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 2/19/2019 2:06 AM, Rob Herring wrote:
> On Tue, Feb 12, 2019 at 12:44 AM Mark Zhang <markz@nvidia.com> wrote:
>>
>> Adding documentation for 3 new backup battery charging dts
>> properties:
>> - maxim,charging-current-microamp
>> - maxim,charging-voltage-microvolt
>> - maxim,output-resister-ohms
> 
> What's the difference between the 77620 and 77650 as there's patches
> on the list for the 77650 too. The properties are similar, but seems
> to be main vs. backup battery charger. We should have common
> properties for this.

Rob, it's different. The RTC in max77620 is supplied from a backup
battery and consumes 2.0uA (IBBATT) when no other power sources are
available. So unlike max77620 battery charging, which provides features
like:

static enum power_supply_property max77650_charger_properties[] = {
	POWER_SUPPLY_PROP_STATUS,
	POWER_SUPPLY_PROP_ONLINE,
	POWER_SUPPLY_PROP_CHARGE_TYPE
};

For backup battery charging in max77620, what we can do is just setting
those 3 parameters. We don't know whether it's charging, whether the
backup battery is online, the percentage of the charging progress, and
etc. That's why I mentioned before that it's not appropriate to create
it as a power supply driver.

Mark

> 
>> Signed-off-by: Mark Zhang <markz@nvidia.com>
>> ---
>>  .../devicetree/bindings/mfd/max77620.txt      | 20 +++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
>> index 9c16d51cc15b..88825eaf2567 100644
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
>> +       -maxim,charging-current-microamp: Charging current setting.
>> +                       The device supports 50/100/200/400/600/800uA.
>> +                       If this property is unavailable then it will
>> +                       charge with 50uA.
>> +       -maxim,charging-voltage-microvolt: Charging Voltage Limit Setting.
>> +                       Device supports 2500000/3000000/3300000/350000uV.
>> +                       Default will be set to 2500mV. The voltage will be roundoff
>> +                       to nearest lower side if other than above is configured.
>> +       -maxim,output-resister-ohms: Output resistor on Ohm.
>> +                       Device supports 100/1000/3000/6000 Ohms.
>> +                       Default will be set to 1000 Ohm.
>> +
>>  Example:
>>  --------
>>  #include <dt-bindings/mfd/max77620.h>
>> --
>> 2.19.2
>>
