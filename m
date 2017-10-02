From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/16] gpio: Tight IRQ chip integration and banked infrastructure
Date: Mon, 2 Oct 2017 09:55:24 +0200
Message-ID: <CACRpkdagAxotP=VZr1NUvmNmHgACfr4x2aHkh=nyyEhUWWgzPw@mail.gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com> <44cf41e3-834e-ddb3-4c9e-8ab00e0866cb@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <44cf41e3-834e-ddb3-4c9e-8ab00e0866cb@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Andrew Bresticker <abrestic@chromium.org>, James Hogan <james.hogan@imgtec.com>, Shawn Guo <shawn.guo@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 28, 2017 at 4:22 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Sry, but I do not agree with this series.
> - no prof that it can be re-used by other drivers than tegra
>  (at least I do not see reasons to re-use it for any TI drivers)

This is not necessarily a blocker if it can be shown that others than
TI/OMAP can reuse it.

I've looked at things like the imagination pistachio:

pinctrl@18101C00 {
        compatible = "img,pistachio-system-pinctrl";
        reg = <0x18101C00 0x400>;

        gpio0: gpio0 {
                interrupts = <GIC_SHARED 71 IRQ_TYPE_LEVEL_HIGH>;

                gpio-controller;
                #gpio-cells = <2>;

                interrupt-controller;
                #interrupt-cells = <2>;
        };

        ...

        gpio5: gpio5 {
                interrupts = <GIC_SHARED 76 IRQ_TYPE_LEVEL_HIGH>;

                gpio-controller;
                #gpio-cells = <2>;

                interrupt-controller;
                #interrupt-cells = <2>;
        };

This looks like a clear candidate.
CC: to  Andrew Bresticker, can you look into this?

Another example would be gpio-tz1090, notably with interrupt optional:

       gpios: gpio-controller@02005800 {
                #address-cells = <1>;
                #size-cells = <0>;
                compatible = "img,tz1090-gpio";
                reg = <0x02005800 0x90>;

                /* bank 0 with an interrupt */
                gpios0: bank@0 {
                        #gpio-cells = <2>;
                        #interrupt-cells = <2>;
                        reg = <0>;
                        interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
                        gpio-controller;
                        gpio-ranges = <&pinctrl 0 0 30>;
                        interrupt-controller;
                };

                /* bank 2 without interrupt */
                gpios2: bank@2 {
                        #gpio-cells = <2>;
                        reg = <2>;
                        gpio-controller;
                        gpio-ranges = <&pinctrl 0 60 30>;
                };
        };

CC to James Hogan to look at the series from this perspective.

A third is gpio-mxs.c:

pinctrl@80018000 {
        compatible = "fsl,imx28-pinctrl", "simple-bus";
        reg = <0x80018000 2000>;

        gpio0: gpio@0 {
                compatible = "fsl,imx28-gpio";
                interrupts = <127>;
                gpio-controller;
                #gpio-cells = <2>;
                interrupt-controller;
                #interrupt-cells = <2>;
        };

        gpio1: gpio@1 {
                compatible = "fsl,imx28-gpio";
                interrupts = <126>;
                gpio-controller;
                #gpio-cells = <2>;
                interrupt-controller;
                #interrupt-cells = <2>;
        };

        gpio2: gpio@2 {
                compatible = "fsl,imx28-gpio";
                interrupts = <125>;
                gpio-controller;
                #gpio-cells = <2>;
                interrupt-controller;
                #interrupt-cells = <2>;
        };
(...)

CC to Shawn Guo to look into this.

So in short I think there can be others that can make good use of this
infrastructure.

> - all GPIO IRQs mapped statically

This really needs to be fixed.

> - irq->map[offset + j] = irq->parents[parent]; holds IRQs for all pins
>   which is waste of memory
> - DT binding changes not documented and no DT examples
> - below is ugly ;)
> +       bank = (spec[0] >> gc->of_gpio_bank_mask) & gc->of_gpio_bank_shift;
> +       pin = (spec[0] >> gc->of_gpio_pin_mask) & gc->of_gpio_pin_shift;

These should be fixable quite easily I think. Thierry?

Yours,
Linus Walleij
