From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
Date: Mon, 2 May 2016 12:14:00 +0530
Message-ID: <5726F730.6010802@nvidia.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>	<CACRpkda7HqPLSRLzaSdO-7chjUBL9C2VAMB0nyVZUw=PSGL3VQ@mail.gmail.com>	<5723274B.3050209@nvidia.com> <CACRpkdZ-muOGvtKbKNP66Bv5FSPeMeYvmArC5GAM92EcKp+kgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZ-muOGvtKbKNP66Bv5FSPeMeYvmArC5GAM92EcKp+kgQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Saturday 30 April 2016 04:37 PM, Linus Walleij wrote:
> On Fri, Apr 29, 2016 at 11:20 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On Friday 29 April 2016 02:37 PM, Linus Walleij wrote:
>>> On Mon, Apr 25, 2016 at 12:38 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> wrote:
>>>
>>>> Add support for the debounce as Tegra210 support debounce in HW.
>>>> Also do the clenaups to remove all global variables.
>>> OK this v5 is applied.
>>>
>>> Laxman does this GPIO also have open drain and/or open source
>>> handling?
>>
>> Some of the pins support the open drain and these are part of pinmux
>> register set.
>> For that we have property for setting open drain.
>>
>> Is it possible to link the gpio APIs to pincontrol for setting that pin?
> I have the same issue with Nomadik pin control that I use as a
> testbed: there is a backend in pin control to the GPIO side.
>
> I was thinking about adding a new cross call. We now have this:
>
> /* External interface to pin control */
> extern int pinctrl_request_gpio(unsigned gpio);
> extern void pinctrl_free_gpio(unsigned gpio);
> extern int pinctrl_gpio_direction_input(unsigned gpio);
> extern int pinctrl_gpio_direction_output(unsigned gpio);
>
> I was going to add:
>
> extern int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);
>
> That can be used by GPIO drivers to call back into pincontrol
> and set up any config flags using the conventions of the
> corresponding pin control back-end.
>
> This could be used for as well open drain as other things (like
> pull-up) as the userspace ABI matures (it currently only has
> in/out and open drain/source).
>
> What do you think about this idea?
>

Yes, this will be great.
We will have generic interface which help in extending it in option.
