From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 1/3] gpio: defer probe if pinctrl cannot be found
Date: Fri, 10 Jul 2015 11:07:27 -0600
Message-ID: <559FFBCF.4020906@wwwdotorg.org>
References: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com> <1435754753-31307-2-git-send-email-tomeu.vizoso@collabora.com> <CAL_JsqKXODBk4FVB-kiWFHLGFLCwJDjXvpVqOTvuEJubApbVSg@mail.gmail.com> <CAAObsKBS0OOhPNEAEV5Bh_+WMVWYhuGtGLqaVdCbzxPuT8a_gA@mail.gmail.com> <559FE471.1030408@wwwdotorg.org> <CAAObsKAav-5-0bZA2XYW4m7eUd9F7yc+9kGvmt_hS-Z0ip=zKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKAav-5-0bZA2XYW4m7eUd9F7yc+9kGvmt_hS-Z0ip=zKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/10/2015 10:21 AM, Tomeu Vizoso wrote:
> On 10 July 2015 at 17:27, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 07/10/2015 03:29 AM, Tomeu Vizoso wrote:
>>>
>>> On 1 July 2015 at 19:36, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>
>>>> On Wed, Jul 1, 2015 at 7:45 AM, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>>> wrote:
>>>>>
>>>>> When an OF node has a pin range for its GPIOs, return -EPROBE_DEFER if
>>>>> the pin controller isn't available.
>>>>>
>>>>> Otherwise, the GPIO range wouldn't be set at all unless the pin
>>>>> controller probed always before the GPIO chip.
>>>>>
>>>>> With this change, the probe of the GPIO chip will be deferred and will
>>>>> be retried at a later point, hopefully once the pin controller has been
>>>>> registered and probed already.
>>>>
>>>>
>>>> This will break cases where the pinctrl driver does not exist, but the
>>>> DT contains pinctrl bindings. We can have similar problems already
>>>> with clocks though. However, IMO this problem is a bit different in
>>>> that pinctrl is more likely entirely optional while clocks are often
>>>> required. You may do all pin setup in bootloader/firmware on some
>>>> boards and not others. Of course then why put pinctrl in the DT in
>>>> that case? They could be present just due to how chip vs. board dts
>>>> files are structured.
>>>
>>>
>>> I see. My instinct tells me that it would be better if the gpio-ranges
>>> property was set in the board dts, but I don't really know what each
>>> mach does with its DTSs.
>>
>>
>> That doesn't make sense; the mapping between GPIO controller pins and pin
>> controller pins is a property of the SoC not the board.
>
>  From what Rob said above, apparently some boards will rely on the pin
> setup done by the bootloader, and some other boards with the same soc
> will want to do it in the kernel. So it's not really a difference in
> the hw itself, but what expectations exist about the firmware on a
> specific board.

Sure, but none of that changes the mapping between the GPIO and pin 
controller pins.
