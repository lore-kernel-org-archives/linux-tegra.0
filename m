From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v1 1/3] gpio: defer probe if pinctrl cannot be found
Date: Thu, 2 Jul 2015 10:59:45 +0200
Message-ID: <CAMuHMdXfKD200tpcJdxBrmwFQhyYLiptOxHOXKLRM9eRfJ9uqg@mail.gmail.com>
References: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com>
	<1435754753-31307-2-git-send-email-tomeu.vizoso@collabora.com>
	<CAL_JsqKXODBk4FVB-kiWFHLGFLCwJDjXvpVqOTvuEJubApbVSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKXODBk4FVB-kiWFHLGFLCwJDjXvpVqOTvuEJubApbVSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Rob,

On Wed, Jul 1, 2015 at 7:36 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Jul 1, 2015 at 7:45 AM, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>> When an OF node has a pin range for its GPIOs, return -EPROBE_DEFER if
>> the pin controller isn't available.
>>
>> Otherwise, the GPIO range wouldn't be set at all unless the pin
>> controller probed always before the GPIO chip.
>>
>> With this change, the probe of the GPIO chip will be deferred and will
>> be retried at a later point, hopefully once the pin controller has been
>> registered and probed already.
>
> This will break cases where the pinctrl driver does not exist, but the
> DT contains pinctrl bindings. We can have similar problems already
> with clocks though. However, IMO this problem is a bit different in
> that pinctrl is more likely entirely optional while clocks are often
> required. You may do all pin setup in bootloader/firmware on some
> boards and not others. Of course then why put pinctrl in the DT in
> that case? They could be present just due to how chip vs. board dts
> files are structured.

Isn't that already the case?
If I change the compatible value of a pinctrl node to an invalid value, I get:

    sh-sci e6c50000.serial: could not find pctldev for node
/pfc@e6050000/serial1, deferring probe

> We could address this by simply marking the pin controller node
> disabled. However, ...

Doesn't seem to make any difference.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
