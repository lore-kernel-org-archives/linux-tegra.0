From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/3] gpio: defer probe if pinctrl cannot be found
Date: Fri, 10 Jul 2015 13:40:58 -0500
Message-ID: <CAL_JsqL1dofXxZ7wG3oeiq1M7BUBOse23PG2D20+YHBNvAKryA@mail.gmail.com>
References: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com>
 <1435754753-31307-2-git-send-email-tomeu.vizoso@collabora.com>
 <CAL_JsqKXODBk4FVB-kiWFHLGFLCwJDjXvpVqOTvuEJubApbVSg@mail.gmail.com> <CAAObsKBS0OOhPNEAEV5Bh_+WMVWYhuGtGLqaVdCbzxPuT8a_gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKBS0OOhPNEAEV5Bh_+WMVWYhuGtGLqaVdCbzxPuT8a_gA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 10, 2015 at 4:29 AM, Tomeu Vizoso
<tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> On 1 July 2015 at 19:36, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Wed, Jul 1, 2015 at 7:45 AM, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>>> When an OF node has a pin range for its GPIOs, return -EPROBE_DEFER if
>>> the pin controller isn't available.
>>>
>>> Otherwise, the GPIO range wouldn't be set at all unless the pin
>>> controller probed always before the GPIO chip.
>>>
>>> With this change, the probe of the GPIO chip will be deferred and will
>>> be retried at a later point, hopefully once the pin controller has been
>>> registered and probed already.
>>
>> This will break cases where the pinctrl driver does not exist, but the
>> DT contains pinctrl bindings. We can have similar problems already
>> with clocks though. However, IMO this problem is a bit different in
>> that pinctrl is more likely entirely optional while clocks are often
>> required. You may do all pin setup in bootloader/firmware on some
>> boards and not others. Of course then why put pinctrl in the DT in
>> that case? They could be present just due to how chip vs. board dts
>> files are structured.
>
> I see. My instinct tells me that it would be better if the gpio-ranges
> property was set in the board dts, but I don't really know what each
> mach does with its DTSs.
>
>> We could address this by simply marking the pin controller node
>> disabled. However, ...
>>
>>> @@ -361,7 +361,7 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
>>>
>>>                 pctldev = of_pinctrl_get(pinspec.np);
>>>                 if (!pctldev)
>>> -                       break;
>>> +                       return -EPROBE_DEFER;
>>
>> But you cannot distinguish that case here. I think of_pinctrl_get
>> needs to set the error code appropriately.
>
> Why not? I was thinking of just doing this before we call of_pinctrl_get():
>
>         if (!of_device_is_available(pinspec.np))
>             continue;

That is exactly what you need, but that should be of_pinctrl_get's
responsibility to check, not the caller's. IIRC, this is the only user
of of_pinctrl_get, so it should be just as easy to change.

Rob
