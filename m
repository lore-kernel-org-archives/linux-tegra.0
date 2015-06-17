From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH 02/21] ARM: tegra: Add gpio-ranges property
Date: Wed, 17 Jun 2015 12:04:53 +0200
Message-ID: <CAAObsKAkVKNOQpw9hbY-EVKjh7fRTfP5GbzcVVGxQMTFAztc7Q@mail.gmail.com>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
 <1432565608-26036-3-git-send-email-tomeu.vizoso@collabora.com>
 <5564CC84.1030700@wwwdotorg.org> <CACRpkdbtCDQLaPhWFT0a7NdJmxYzRvhU_efgUh2ZXhbc+FHg3g@mail.gmail.com>
 <556DCE71.7050108@wwwdotorg.org> <CAAObsKBtmJnBZXcv0UE6xGvphSCShFNWehOG8a-PJg-VqPznRw@mail.gmail.com>
 <558087CE.5070903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558087CE.5070903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 16 June 2015 at 22:32, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 06/16/2015 02:42 AM, Tomeu Vizoso wrote:
>>
>> On 2 June 2015 at 17:40, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>>
>>> On 06/02/2015 05:28 AM, Linus Walleij wrote:
>>>>
>>>>
>>>> On Tue, May 26, 2015 at 9:41 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>>>> wrote:
>>>>>
>>>>>
>>>>> On 05/25/2015 08:53 AM, Tomeu Vizoso wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> Specify how the GPIOs map to the pins in T124, so the dependency is
>>>>>> explicit.
>>>>>>
>>>>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>>>>> ---
>>>>>>     arch/arm/boot/dts/tegra124.dtsi | 1 +
>>>>>>     1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/arch/arm/boot/dts/tegra124.dtsi
>>>>>> b/arch/arm/boot/dts/tegra124.dtsi
>>>>>> index 13cc7ca..5d1d35f 100644
>>>>>> --- a/arch/arm/boot/dts/tegra124.dtsi
>>>>>> +++ b/arch/arm/boot/dts/tegra124.dtsi
>>>>>> @@ -254,6 +254,7 @@
>>>>>>                   gpio-controller;
>>>>>>                   #interrupt-cells = <2>;
>>>>>>                   interrupt-controller;
>>>>>> +               gpio-ranges = <&pinmux 0 0 250>;
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> We should be consistent between SoCs. Why not make the same change for
>>>>> all
>>>>> Tegra SoCs?
>>>>
>>>>
>>>>
>>>> Agreed.
>>>>
>>>>> I think this change will cause the GPIO subsystem to call into the
>>>>> pinctrl
>>>>> subsystem and create/add/register a new GPIO<->pinctrl range structure.
>>>>> The
>>>>> pinctrl driver already does this, so I think we'll end up with two
>>>>> duplicate
>>>>> entries in the pinctrl device's gpio_ranges list. This probably won't
>>>>> cause
>>>>> a problem, but I wanted to make sure you'd thought about it to make
>>>>> sure.
>>>>
>>>>
>>>>
>>>> That sounds like duplication indeed, I would expect that first a patch
>>>> adds the ranges to the dts[i] files and then a second patch delete the
>>>> same ranges from the pinctrl driver then, if these shall come in from
>>>> the device tree.
>>>
>>>
>>>
>>> We can't delete the gpio-range-registration code from the Tegra pinmux
>>> driver, or old DTs won't work correctly. We could make it conditional
>>> based
>>> upon whether the DT contains the property or not.
>>
>>
>> I've been looking at this and haven't found a good solution. From what
>> I see, the pinctrl driver doesn't have a reference to the gpio device
>> node so cannot tell if it needs to add the range or not.
>
>
> Well, we know what the node must be called, so the pinctrl driver could
> search for it by name.

Ok, will write something in this direction.

>> The gpio driver can tell whether it should add the range or not, but
>> if it has to because the gpio-ranges property isn't there, then it
>> doesn't have the reference to the pinctrl device to set the range to.
>>
>> So, given that pinctrl_add_gpio_range is deprecated already, wonder if
>> the lesser evil isn't leaving the duplicated entries for now. On newer
>> SoC revisions such as T210 we can stop calling pinctrl_add_gpio_range
>> at all.
>>
>> Or, we can accept that nobody is going to boot a newer kernel with an
>> older DT on the affected boards and just rely on the presence of the
>> gpio-ranges property :)
>
>
> Isn't the simplest solution to just leave it as it is? Nothing's broken is
> it?

Well, without an explicit dependency from the gpio node to the pinctrl
node I cannot avoid a deferred probe (which will cause other deferred
probes in turn).

> For any new SoCs we add, we can certainly switch to a new scheme if we want,
> but we need to catch/implement that early before the base .dtsi file is
> included in its first kernel release.

Definitely.

Regards,

Tomeu

> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
