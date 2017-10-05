From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/16] gpio: Tight IRQ chip integration and banked infrastructure
Date: Thu, 5 Oct 2017 13:19:16 +0200
Message-ID: <CACRpkdb8xRv8sWsKkNidwHQ3QjBvS2VjhkhnUDybXD813POmng@mail.gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <44cf41e3-834e-ddb3-4c9e-8ab00e0866cb@ti.com> <CACRpkdagAxotP=VZr1NUvmNmHgACfr4x2aHkh=nyyEhUWWgzPw@mail.gmail.com>
 <b583d903-03ea-eb74-e142-02b31ad3ddfb@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b583d903-03ea-eb74-e142-02b31ad3ddfb@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Hoan Tran <hotran@apm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: Andrew Bresticker <abrestic@chromium.org>, James Hogan <james.hogan@imgtec.com>, Shawn Guo <shawn.guo@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 3, 2017 at 8:26 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 10/02/2017 02:55 AM, Linus Walleij wrote:
>> On Thu, Sep 28, 2017 at 4:22 PM, Grygorii Strashko
>> <grygorii.strashko@ti.com> wrote:
>>
>>> Sry, but I do not agree with this series.
>>> - no prof that it can be re-used by other drivers than tegra
>>>   (at least I do not see reasons to re-use it for any TI drivers)
>>
>> This is not necessarily a blocker if it can be shown that others than
>> TI/OMAP can reuse it.
>
> sure. My point is - this is big change in gpiolib, which is > 1000 lines,
> but current re-usability just 2 drivers (I'm comparing with your work when
> gpio irq infra was introduced - you did it bottom-up, by refactoring
> existing drivers and moving common code in gpiolib, so re usability is great).

Yes I am leaning toward adding this infrastructure also with switching as many
candidates as possible over to using the new infrastructure. So I'm trying
to align a few maintainers to this cause. Maybe OMAP will not be one
of them as I thought initially :/

>                 gpio: gpio@226000 {
>                         compatible = "ti,dm6441-gpio";
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         reg = <0x226000 0x1000>;
>                         interrupts = <42 IRQ_TYPE_EDGE_BOTH
>                                 43 IRQ_TYPE_EDGE_BOTH 44 IRQ_TYPE_EDGE_BOTH
>                                 45 IRQ_TYPE_EDGE_BOTH 46 IRQ_TYPE_EDGE_BOTH
>                                 47 IRQ_TYPE_EDGE_BOTH 48 IRQ_TYPE_EDGE_BOTH
>                                 49 IRQ_TYPE_EDGE_BOTH 50 IRQ_TYPE_EDGE_BOTH>;
>                         ti,ngpio = <144>;
>                         ti,davinci-gpio-unbanked = <0>;
>                         status = "disabled";
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
>                 };
>
> FYI. Above is gpio-dvinci example which defines the same, but without coding
> gpio banks in DT (note 2 IRQ lines per bank, bank 32 pins).

Yeah. This case would be nice to cover too.

>>> - irq->map[offset + j] = irq->parents[parent]; holds IRQs for all pins
>>>    which is waste of memory
>>> - DT binding changes not documented and no DT examples
>>> - below is ugly ;)
>>> +       bank = (spec[0] >> gc->of_gpio_bank_mask) & gc->of_gpio_bank_shift;
>>> +       pin = (spec[0] >> gc->of_gpio_pin_mask) & gc->of_gpio_pin_shift;
>>
>> These should be fixable quite easily I think. Thierry?
>
> What I'm trying to understand is how GPIO client bindings will look like?
> Now it is: gpios = <&gpio2 14 GPIO_ACTIVE_LOW>; (pistachio_marduk.dts)
>
> But as per of_gpio_banked_xlate() it expected to be
> gpios = <&gpio [Linear gpio num] GPIO_ACTIVE_LOW>;
> Wouldn't this break DT compatibility and prevent re-using of this feature
> for pistachio, for example? (or i'm missing smth).

I was hoping we could introduce infrastructure that can be used
by the existing in-tree banked/port GPIO drivers without any
changes to the consumer side of bindings.

So that is the patch set I'm imagining.

Else we're not really getting reusability.

Yours,
Linus Walleij
