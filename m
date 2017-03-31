From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Tegra186 support
Date: Fri, 31 Mar 2017 15:59:40 +0200
Message-ID: <CACRpkdZpev7op=4e7DwYfnRpNBPN6U_EXd6G3PqM-XQudLHqow@mail.gmail.com>
References: <20170310162629.31455-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170310162629.31455-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 10, 2017 at 5:26 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Tegra186 has two GPIO controllers that are largely register compatible
> between one another but are completely different from the controller
> found on earlier generations.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:

So this still doesn't use GPIOLIB_IRQCHIP even though I pointed
out that you can assign several parent interrupts to the same
irqchip.

For a recent example see:
http://marc.info/?l=devicetree&m=149012117004066&w=2
(Notice Gregory's elegant manipulation of the mask.)

My earlier reply here:

----------------------
>> I would prefer if you could try to convert this driver to use
>> CONFIG_GPIOLIB_IRQCHIP and install a chained interrupt
>> handler with gpiochip_irqchio_add() + gpiolib_set_chained_irqchip().
>> It would save us so much trouble and so much complicated
>> code to maintain for this custom irqdomain.
>>
>> I suggest you to look into the mechanisms mentioned in my
>> previous mail for how to poke holes in the single linear
>> irqdomain used by this mechanism.
>>
>> As it seems, you only have one parent interrupt with all
>> these IRQs cascading off it as far as I can tell.
>
> Like I said in other email, I don't think this will work because the
> GPIOLIB_IRQCHIP support seems to be limited to cases where a single
> parent interrupt is used. We could possibly live with a single IRQ
> handler and data, but we definitely need to request multiple IRQs if
> we want to be able to use all GPIOs as interrupts.

Sorry if I missed that.

Actually it works.

If you look at gpiochip_set_chained_irqchip() it just calls
irq_set_chained_handler_and_data() for the parent interrupt.
------------------------

Just call gpiochip_set_chained_irqchip() for all the irqs, and
figure out a way to get the right interrupt hardware offset in the
interrupt handler.

(...)

> +config GPIO_TEGRA186
> +       tristate "NVIDIA Tegra186 GPIO support"
> +       default ARCH_TEGRA_186_SOC
> +       depends on ARCH_TEGRA_186_SOC || COMPILE_TEST
> +       depends on OF_GPIO

select GPIOLIB_IRQCHIP

> +#include <linux/gpio/driver.h>
> +#include <linux/gpio.h>

Only <linux/gpio/driver.h>

You should not use <linux/gpio.h> in drivers, then you are
doing something wrong.

> +struct tegra_gpio {
> +       struct gpio_chip gpio;
> +       struct irq_chip intc;
> +       unsigned int num_irq;
> +       unsigned int *irq;

Why are you keeping the irqs around after requesting?
Use devm_*

> +
> +       const struct tegra_gpio_soc *soc;
> +
> +       void __iomem *base;
> +
> +       struct irq_domain *domain;

I don't like custom irq domains it is messy.
Please do your best to try to use GPIOLIB_IRQCHIP

If you still decide to go with a custom irqdomain, there is
stuff missing, especially the gpiochip_lock_as_irq()
calls from the irqchip .irq_request/release_resources()
callbacks, see the gpiolib.c implementation in the
helpers there for reference.

Yours,
Linus Walleij
