From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v1 1/3] gpio: defer probe if pinctrl cannot be found
Date: Fri, 10 Jul 2015 09:27:45 -0600
Message-ID: <559FE471.1030408@wwwdotorg.org>
References: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com> <1435754753-31307-2-git-send-email-tomeu.vizoso@collabora.com> <CAL_JsqKXODBk4FVB-kiWFHLGFLCwJDjXvpVqOTvuEJubApbVSg@mail.gmail.com> <CAAObsKBS0OOhPNEAEV5Bh_+WMVWYhuGtGLqaVdCbzxPuT8a_gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAObsKBS0OOhPNEAEV5Bh_+WMVWYhuGtGLqaVdCbzxPuT8a_gA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robherring2@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On 07/10/2015 03:29 AM, Tomeu Vizoso wrote:
> On 1 July 2015 at 19:36, Rob Herring <robherring2@gmail.com> wrote:
>> On Wed, Jul 1, 2015 at 7:45 AM, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
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

That doesn't make sense; the mapping between GPIO controller pins and 
pin controller pins is a property of the SoC not the board.


