From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add driver to configure voltage and
 power of io pads
Date: Tue, 8 Nov 2016 19:05:26 +0530
Message-ID: <5821D49E.2070308@nvidia.com>
References: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com> <1478077742-25437-3-git-send-email-ldewangan@nvidia.com> <CACRpkdb4DQLzQWHxuZi=TDaeigNzVJV8TN1jsQfOHKF7yPLrUg@mail.gmail.com> <58201401.8050805@nvidia.com> <CACRpkdZo+527t4O9gX0U2VOaAYj7fnt7X0wynByBdYN5=2mDsA@mail.gmail.com> <5821A6D3.7010000@nvidia.com> <CACRpkdYO9ZCTGVdnyhVZ4DNLsHq+d-1_xuws2be8yab+MsyyVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYO9ZCTGVdnyhVZ4DNLsHq+d-1_xuws2be8yab+MsyyVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Tuesday 08 November 2016 06:59 PM, Linus Walleij wrote:
> On Tue, Nov 8, 2016 at 11:20 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On Tuesday 08 November 2016 03:45 PM, Linus Walleij wrote:
>>> If you can *actually* change the volatage, it needs to be modeled
>>> as a (fixed voltage?) regulator, not as a custom property for the pin
>>> control attributes. I guess you definiately need the regulator framework
>>> to accumulate and infer the different consumer requirements anyway
>>> in that case.
>> The PMIC voltage output is changed via regulator calls.
>> Here, we need to have two configruations for given voltage level of
>> interface:
>> * One at IO voltage from PMIC via regulator call to change votlage of IO
>> rail.
>> * Second, configure the IO pad register to tell the IO voltage level so that
>> it can configured internally for that level.
> I understand! (I think.)

Thanks,

>
> But then the two things (A) changing the regulator voltage and (B) changing
> the pin setting need to happen at the same time do they
> not?
>
> Now you're just hardcoding something into these device tree properties
> and hoping that the regulators will somehow be set up in accordance to
> what you set up for the pads in the device tree, correct?

There is two types of configuration in given platform, the IO voltage 
does not get change (fixed in given platform) and in some of cases, get 
change dynamically like SDIO3.0 where the voltage switches to 3.3V and 1.8V.

Yes, it can be integrated with the regulator handle and then it can call 
the required configurations through notifier and regulator_get_voltage().
But I think it is too much complex for the static configurations. This 
mandate also to populate the regulator handle and all power tree.

The simple way for static configuration (case where voltage does not get 
change), just take the power tree IO voltage from DT and configure the 
IO pad control register.

For dynamic case, there is some sequence need to be followed based on 
voltage direction change (towards lower or towards higher) for the 
voltage change and the IO pad voltage configuration and it is simple to 
do it from client driver.



>
> To me it seems like the pins/pads should all have an <&phandle> to
> the regulator controlling its voltage output, in the device tree.
>
> In the Linux kernel, the driver has to regulator_[bulk_]get() this for
> each pin, check the voltage with regulator_get_voltage() and set up
> this according to the supplied voltage.
>
> The driver then ideally should subscribe to regulator voltage notifier
> events to change the setting if the voltage changes. I guess. But
> atleast the first step seems inevitable: get the voltage from a regulator.
>
> Else there is no dependency between the regulator and its consumer.
>
> So what your pins need is a regulator phandle, not a magic value to
> be poked into a register, hoping things will match up.
>
> I understand that this is a simple quick-and-dirty solution but it is
> not the right solution.


Yaah, the static power tree configuration is much simple in this 
approach without having regulator drivers and support.

Integrating with regulator driver can be done here also.

I like to have both approach, through pinmux DT and also from regulator. 
So based on the platform, if regulator supported then populate required 
properties in DT for regulator else go on standard pinmux DT way (for 
non-regulator cases).

Need your opinion?
