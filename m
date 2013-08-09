From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v2 2/3] ARM: dt: t114 dalmore: add dt entry for nct1008
Date: Fri, 9 Aug 2013 14:16:22 +0800
Message-ID: <52048936.9040809@nvidia.com>
References: <1375944991-29182-1-git-send-email-wni@nvidia.com> <1375944991-29182-3-git-send-email-wni@nvidia.com> <52040146.7060703@cogentembedded.com> <52040236.2080701@wwwdotorg.org> <52040EB9.2050908@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52040EB9.2050908@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "khali@linux-fr.org" <khali@linux-fr.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lm-sensors@lm-sensors.org" <lm-sensors@lm-sensors.org>, Matthew Longnecker <MLongnecker@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On 08/09/2013 05:33 AM, Guenter Roeck wrote:
> On 08/08/2013 01:40 PM, Stephen Warren wrote:
>> On 08/08/2013 02:36 PM, Sergei Shtylyov wrote:
>>> Hello.
>>>
>>> On 08/08/2013 10:56 AM, Wei Ni wrote:
>>>
>>>> Enable thermal sensor nct1008 for t114 dalmore.
>>>
>>>> Signed-off-by: Wei Ni <wni@nvidia.com>
>>>> ---
>>>>    arch/arm/boot/dts/tegra114-dalmore.dts |   10 +++++++++-
>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>>> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts
>>>> b/arch/arm/boot/dts/tegra114-dalmore.dts
>>>> index b5a42f0..9d4d2b2 100644
>>>> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
>>>> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
>>>> @@ -738,6 +738,14 @@
>>>>                realtek,ldo1-en-gpios =
>>>>                    <&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
>>>>            };
>>>> +
>>>> +        nct1008 {
>>>
>>>     ePAPR [1] says: "the name of a node should be somewhat generic,
>>> reflecting the function of the device and not its precise programming
>>> model". So I suggest "thermal"
>>
>> True, although there's quite some precedent for node-names being the
>> chip name for external chips in existing DTs. If we change this node
>> name, I'd like to see a patch that makes all the other "nct1008" nodes
>> match the new name...
>>
> 
> On the other side, one should not use a bad example as an argument or excuse
> to make the same mistake again (though I keep hearing it all the time ... ).
> I for my part tend to use something like temp-sensor or temp-sensor@1c.
> Advantage of that kind of node name is that it auto-describes the node.

Ok, so I will set the node name as "temp-sensor"
And I will send out patches to change all other "nct1008" nodes.

> 
> Guenter
> 
