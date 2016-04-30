From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
Date: Sat, 30 Apr 2016 13:07:33 +0200
Message-ID: <CACRpkdZ-muOGvtKbKNP66Bv5FSPeMeYvmArC5GAM92EcKp+kgQ@mail.gmail.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
	<CACRpkda7HqPLSRLzaSdO-7chjUBL9C2VAMB0nyVZUw=PSGL3VQ@mail.gmail.com>
	<5723274B.3050209@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5723274B.3050209-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 29, 2016 at 11:20 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Friday 29 April 2016 02:37 PM, Linus Walleij wrote:
>> On Mon, Apr 25, 2016 at 12:38 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> wrote:
>>
>>> Add support for the debounce as Tegra210 support debounce in HW.
>>> Also do the clenaups to remove all global variables.
>>
>> OK this v5 is applied.
>>
>> Laxman does this GPIO also have open drain and/or open source
>> handling?
>
>
> Some of the pins support the open drain and these are part of pinmux
> register set.
> For that we have property for setting open drain.
>
> Is it possible to link the gpio APIs to pincontrol for setting that pin?

I have the same issue with Nomadik pin control that I use as a
testbed: there is a backend in pin control to the GPIO side.

I was thinking about adding a new cross call. We now have this:

/* External interface to pin control */
extern int pinctrl_request_gpio(unsigned gpio);
extern void pinctrl_free_gpio(unsigned gpio);
extern int pinctrl_gpio_direction_input(unsigned gpio);
extern int pinctrl_gpio_direction_output(unsigned gpio);

I was going to add:

extern int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);

That can be used by GPIO drivers to call back into pincontrol
and set up any config flags using the conventions of the
corresponding pin control back-end.

This could be used for as well open drain as other things (like
pull-up) as the userspace ABI matures (it currently only has
in/out and open drain/source).

What do you think about this idea?

>> Then you might want to look into supporting that too as I just added
>> support for native single-endedness to gpiolib, c.f.:
>> http://marc.info/?l=linux-gpio&m=146011780301280&w=2
>
> Yaah, Some of PMIC's (which I am handling) gpios support open drain and I
> think I can have changes for the PMIC gpio driver.

Nice! :)

>> It would be nice if you also implement .get_direction() which
>> makes debugfs and initial reading of the state of the lines
>> more accurate.
>
> Sure, this can be implemented.
> Will post the patch on top of the series soon.

Thanks.

Yours,
Linus Walleij
