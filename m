From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 07/12] dt-bindings: i2c: Add support for 'i2c-bus' subnode
Date: Tue, 28 Jun 2016 12:20:15 +0200
Message-ID: <9ce42fd3-972f-8487-f3b3-a2cfe28dc394@axentia.se>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
 <1466697545-11868-8-git-send-email-jonathanh@nvidia.com>
 <0e9ab029-ed95-c3cb-61f5-6acd9da12a24@axentia.se>
 <57723371.4060806@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <57723371.4060806@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 2016-06-28 10:21, Jon Hunter wrote:
> 
> On 27/06/16 13:04, Peter Rosin wrote:
>> On 2016-06-23 17:59, Jon Hunter wrote:
>>> The I2C driver core for boards using device-tree assumes any subnode of
>>> an I2C adapter in the device-tree blob as being a I2C slave device.
>>> Although this makes complete sense, some I2C adapters may have subnodes
>>> which are not I2C slaves but subnodes presenting other features. For
>>> example some Tegra devices have an I2C interface which may share its
>>> pins with other devices and to share these pins subnodes for
>>> representing these pins so they have be shared via the pinctrl framework
>>> are needed.
>>>
>>> To allow I2C adapters to have non-I2C specific subnodes in device-tree
>>> that are not parsed by the I2C driver core by adding support for a
>>> 'i2c-bus' subnode where I2C slaves can be placed. If the 'i2c-bus'
>>> subnode is present then all I2C slaves must be placed under this subnode.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  Documentation/devicetree/bindings/i2c/i2c.txt | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
>>> index f31b2ad1552b..71bea55d4c1b 100644
>>> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
>>> @@ -32,6 +32,14 @@ wants to support one of the below features, it should adapt the bindings below.
>>>  - clock-frequency
>>>  	frequency of bus clock in Hz.
>>>  
>>> +- i2c-bus
>>> +	For I2C adapters that have child nodes that are a mixture of both I2C
>>> +	devices and non-I2C devices (such as a pin controller), the 'i2c-bus'
>>> +	subnode can be used for populating I2C devices. If the 'i2c-bus'
>>> +	subnode is present, only subnodes of this will be considered as I2C
>>> +	slaves. The properties, '#address-cells' and '#size-cells' must be
>>> +	defined under this subnode if present.
>>
>> Hmmm, those #-properties are listed above, under "Required properties", which
>> is no longer 100% true. Maybe rephrase to
>>
>> 	slaves. The required properties '#address-cells' and '#size-cells'
>> 	must be	defined under this subnode instead, if this subnode is present.
>>
>> to make the rules (even) clearer?
> 
> I see what you are saying but I wonder if the following is better ...
> 
>  slaves. The required properties '#address-cells' and '#size-cells'
>  must be defined under this subnode if present and not the parent node.

Naaw, I don't like that either, I associate the last "and not" with the
"if present" part and not the intended "under this subnode". Then I go
WTF when I fail to parse. Maybe just add an example instead...

Or just forget me ever saying anything. Sorry for making a fuss over this.

Cheers,
Peter
