From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 00/16] gpio: Tight IRQ chip integration and banked
 infrastructure
Date: Tue, 3 Oct 2017 13:26:38 -0500
Message-ID: <b583d903-03ea-eb74-e142-02b31ad3ddfb@ti.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <44cf41e3-834e-ddb3-4c9e-8ab00e0866cb@ti.com>
 <CACRpkdagAxotP=VZr1NUvmNmHgACfr4x2aHkh=nyyEhUWWgzPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdagAxotP=VZr1NUvmNmHgACfr4x2aHkh=nyyEhUWWgzPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 10/02/2017 02:55 AM, Linus Walleij wrote:
> On Thu, Sep 28, 2017 at 4:22 PM, Grygorii Strashko
> <grygorii.strashko-l0cyMroinI0@public.gmane.org> wrote:
> 
>> Sry, but I do not agree with this series.
>> - no prof that it can be re-used by other drivers than tegra
>>   (at least I do not see reasons to re-use it for any TI drivers)
> 
> This is not necessarily a blocker if it can be shown that others than
> TI/OMAP can reuse it.

sure. My point is - this is big change in gpiolib, which is > 1000 lines,
but current re-usability just 2 drivers (I'm comparing with your work when
gpio irq infra was introduced - you did it bottom-up, by refactoring
existing drivers and moving common code in gpiolib, so re usability is great). 

> 
> I've looked at things like the imagination pistachio:
> 
> pinctrl@18101C00 {
>          compatible = "img,pistachio-system-pinctrl";
>          reg = <0x18101C00 0x400>;
> 
>          gpio0: gpio0 {
>                  interrupts = <GIC_SHARED 71 IRQ_TYPE_LEVEL_HIGH>;
> 
>                  gpio-controller;
>                  #gpio-cells = <2>;
> 
>                  interrupt-controller;
>                  #interrupt-cells = <2>;
>          };
> 
>          ...
> 
>          gpio5: gpio5 {
>                  interrupts = <GIC_SHARED 76 IRQ_TYPE_LEVEL_HIGH>;
> 
>                  gpio-controller;
>                  #gpio-cells = <2>;
> 
>                  interrupt-controller;
>                  #interrupt-cells = <2>;
>          };
> 
> This looks like a clear candidate.
> CC: to  Andrew Bresticker, can you look into this?
> 

[...]

		gpio: gpio@226000 {
			compatible = "ti,dm6441-gpio";
			gpio-controller;
			#gpio-cells = <2>;
			reg = <0x226000 0x1000>;
			interrupts = <42 IRQ_TYPE_EDGE_BOTH
				43 IRQ_TYPE_EDGE_BOTH 44 IRQ_TYPE_EDGE_BOTH
				45 IRQ_TYPE_EDGE_BOTH 46 IRQ_TYPE_EDGE_BOTH
				47 IRQ_TYPE_EDGE_BOTH 48 IRQ_TYPE_EDGE_BOTH
				49 IRQ_TYPE_EDGE_BOTH 50 IRQ_TYPE_EDGE_BOTH>;
			ti,ngpio = <144>;
			ti,davinci-gpio-unbanked = <0>;
			status = "disabled";
			interrupt-controller;
			#interrupt-cells = <2>;
		};

FYI. Above is gpio-dvinci example which defines the same, but without coding
gpio banks in DT (note 2 IRQ lines per bank, bank 32 pins).

> 
> CC to Shawn Guo to look into this.
> 
> So in short I think there can be others that can make good use of this
> infrastructure.
> 
>> - all GPIO IRQs mapped statically
> 
> This really needs to be fixed.
> 
>> - irq->map[offset + j] = irq->parents[parent]; holds IRQs for all pins
>>    which is waste of memory
>> - DT binding changes not documented and no DT examples
>> - below is ugly ;)
>> +       bank = (spec[0] >> gc->of_gpio_bank_mask) & gc->of_gpio_bank_shift;
>> +       pin = (spec[0] >> gc->of_gpio_pin_mask) & gc->of_gpio_pin_shift;
> 
> These should be fixable quite easily I think. Thierry?

What I'm trying to understand is how GPIO client bindings will look like?
Now it is: gpios = <&gpio2 14 GPIO_ACTIVE_LOW>; (pistachio_marduk.dts)

But as per of_gpio_banked_xlate() it expected to be
gpios = <&gpio [Linear gpio num] GPIO_ACTIVE_LOW>;
Wouldn't this break DT compatibility and prevent re-using of this feature
for pistachio, for example? (or i'm missing smth).

-- 
regards,
-grygorii
