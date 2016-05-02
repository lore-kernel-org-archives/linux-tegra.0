From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
Date: Mon, 2 May 2016 23:28:12 +0530
Message-ID: <57279534.5010409@nvidia.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com> <CACRpkda7HqPLSRLzaSdO-7chjUBL9C2VAMB0nyVZUw=PSGL3VQ@mail.gmail.com> <5723274B.3050209@nvidia.com> <CACRpkdZ-muOGvtKbKNP66Bv5FSPeMeYvmArC5GAM92EcKp+kgQ@mail.gmail.com> <57277C70.5080204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57277C70.5080204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Monday 02 May 2016 09:42 PM, Stephen Warren wrote:
> On 04/30/2016 05:07 AM, Linus Walleij wrote:
>> On Fri, Apr 29, 2016 at 11:20 AM, Laxman Dewangan 
>> <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> On Friday 29 April 2016 02:37 PM, Linus Walleij wrote:
>>>> On Mon, Apr 25, 2016 at 12:38 PM, Laxman Dewangan 
>>>> <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> wrote:
>>>>
>>>>> Add support for the debounce as Tegra210 support debounce in HW.
>>>>> Also do the clenaups to remove all global variables.
>>>>
>>>> OK this v5 is applied.
>>>>
>>>> Laxman does this GPIO also have open drain and/or open source
>>>> handling?
>>>
>>>
>>> Some of the pins support the open drain and these are part of pinmux
>>> register set.
>>> For that we have property for setting open drain.
>
> IIRC, Tegra has open-drain control in both the GPIO controller for all 
> pins (OE bit) and in the pinmux controller for a small subset of pins. 
> For GPIOs, why wouldn't we just use the control bit in the GPIO 
> controller for all GPIOs. This would avoid any special-cases, and 
> minimize coupling between the GPIO and pinctrl drivers.


Toggling OE bit is something emulating the open drain here.

I think idea is that when we configure the pin in open drain then it 
should be automatically handled by HW  when we want to set pin state 
high or low. When we set low, the pin should be driven and when high 
then it should be tristated input. We should not need any direction bit 
setting.

Otherwise, if pin is configured as open drain then:

Set out = 0

and when it need to set pin to high then oe = 0 else oe =1. Do not 
toggle any other bits.

On this case, we need to store that pin is configured as open drain so 
that set_value should toggle OE instead of OUT.

Or do you want to have different implementation?
