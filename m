From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add driver to configure voltage and
 power of io pads
Date: Tue, 8 Nov 2016 15:50:03 +0530
Message-ID: <5821A6D3.7010000@nvidia.com>
References: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com> <1478077742-25437-3-git-send-email-ldewangan@nvidia.com> <CACRpkdb4DQLzQWHxuZi=TDaeigNzVJV8TN1jsQfOHKF7yPLrUg@mail.gmail.com> <58201401.8050805@nvidia.com> <CACRpkdZo+527t4O9gX0U2VOaAYj7fnt7X0wynByBdYN5=2mDsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZo+527t4O9gX0U2VOaAYj7fnt7X0wynByBdYN5=2mDsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Tuesday 08 November 2016 03:45 PM, Linus Walleij wrote:
> On Mon, Nov 7, 2016 at 6:41 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On Saturday 05 November 2016 03:54 AM, Linus Walleij wrote:
>>> On Wed, Nov 2, 2016 at 10:09 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> (....)
>>>> On Tegra124, the IO power rail source is auto detected by SoC and hence
>>>> it is only require to configure in low power mode if IO pads are not
>>>> used.
>>>>
>>>> On T210 onwards, the auto-detection is removed from SoC and hence SW
>>>> must configure the PMC register explicitly to set proper voltage in
>>>> IO pads based on IO rail power source voltage.
> (...)
>>>> +static const struct pinconf_generic_params tegra_io_pads_cfg_params[] =
>>>> {
>>>> +       {
>>>> +               .property = "nvidia,power-source-voltage",
>>>> +               .param = TEGRA_IO_PAD_POWER_SOURCE_VOLTAGE,
>>>> +       },
>>>> +};
>>> Why can you not use the standard power-source binding
>>> from Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>>> instead of inventing this nvidia,* variant?
>>
>> Per binding doc,
>> power-source            - select between different power supplies
>>
>> So actually it selects the different source of power supply.
>> In my case, I will have same supply but voltage of that supply get changed.
>> So here property is for the power-supply-voltage.
> I doubt that seriously. Are you sure? Then the commit message is
> misleading because it is talking about different power rails.
The set of pins belongs to the IO pad group and this pad group has power 
supply from external PMIC. The IO pads support multi-level voltage and 
the level need to be configured in the PMIC rail via regulator calls and 
the IO pads configuration register for that level.


> The usual design of such IP is that there is a switch that select
> a voltage from several available rails and this is what the commit
> message seems to be saying, and that is what the binding is for.

There is no switch to select the power source inside IP. We have only 
one source for supply these pins (IO pads) and the source voltage can be 
change here.

>
> If you could actually change the voltage it would change for all
> other pins using the same voltage source as well, would it not?
There is grouping of pins based on interface and yes, voltage level gets 
changed for those group of pins. Like form SDMMC interface all data nd 
clock lines, for i2c SCL and SDA lines etc.
The HW IP design is like that from single IO voltage source, all pins 
are affected.


>
> Unless there is one voltage regulator per pin, which seems like
> a very expensive and chip surface consuming solution. (Albeit
> theoretically possible.)
>
> If you can *actually* change the volatage, it needs to be modeled
> as a (fixed voltage?) regulator, not as a custom property for the pin
> control attributes. I guess you definiately need the regulator framework
> to accumulate and infer the different consumer requirements anyway
> in that case.

The PMIC voltage output is changed via regulator calls.
Here, we need to have two configruations for given voltage level of 
interface:
* One at IO voltage from PMIC via regulator call to change votlage of IO 
rail.
* Second, configure the IO pad register to tell the IO voltage level so 
that it can configured internally for that level.
