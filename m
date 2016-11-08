From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add driver to configure voltage and
 power of io pads
Date: Tue, 8 Nov 2016 14:29:01 +0100
Message-ID: <CACRpkdYO9ZCTGVdnyhVZ4DNLsHq+d-1_xuws2be8yab+MsyyVw@mail.gmail.com>
References: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com>
 <1478077742-25437-3-git-send-email-ldewangan@nvidia.com> <CACRpkdb4DQLzQWHxuZi=TDaeigNzVJV8TN1jsQfOHKF7yPLrUg@mail.gmail.com>
 <58201401.8050805@nvidia.com> <CACRpkdZo+527t4O9gX0U2VOaAYj7fnt7X0wynByBdYN5=2mDsA@mail.gmail.com>
 <5821A6D3.7010000@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5821A6D3.7010000-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 8, 2016 at 11:20 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Tuesday 08 November 2016 03:45 PM, Linus Walleij wrote:

>> If you can *actually* change the volatage, it needs to be modeled
>> as a (fixed voltage?) regulator, not as a custom property for the pin
>> control attributes. I guess you definiately need the regulator framework
>> to accumulate and infer the different consumer requirements anyway
>> in that case.
>
> The PMIC voltage output is changed via regulator calls.
> Here, we need to have two configruations for given voltage level of
> interface:
> * One at IO voltage from PMIC via regulator call to change votlage of IO
> rail.
> * Second, configure the IO pad register to tell the IO voltage level so that
> it can configured internally for that level.

I understand! (I think.)

But then the two things (A) changing the regulator voltage and (B) changing
the pin setting need to happen at the same time do they
not?

Now you're just hardcoding something into these device tree properties
and hoping that the regulators will somehow be set up in accordance to
what you set up for the pads in the device tree, correct?

To me it seems like the pins/pads should all have an <&phandle> to
the regulator controlling its voltage output, in the device tree.

In the Linux kernel, the driver has to regulator_[bulk_]get() this for
each pin, check the voltage with regulator_get_voltage() and set up
this according to the supplied voltage.

The driver then ideally should subscribe to regulator voltage notifier
events to change the setting if the voltage changes. I guess. But
atleast the first step seems inevitable: get the voltage from a regulator.

Else there is no dependency between the regulator and its consumer.

So what your pins need is a regulator phandle, not a magic value to
be poked into a register, hoping things will match up.

I understand that this is a simple quick-and-dirty solution but it is
not the right solution.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
