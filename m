From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] gpio: Add support for hierarchical IRQ domains
Date: Fri, 14 Dec 2018 14:41:01 +0100
Message-ID: <CACRpkdYhgCsr2w-MgwdLDvcZXDhkvn2_sgvGW8VskK1=3kVASw@mail.gmail.com>
References: <20181129170312.23625-1-thierry.reding@gmail.com> <20181129170312.23625-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129170312.23625-2-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry!

thanks a lot for the patch! This is really in the right direction
of how I want things to go with hierarchical IRQs.

Some comments:

On Thu, Nov 29, 2018 at 6:03 PM Thierry Reding <thierry.reding@gmail.com> wrote:

>  config GPIOLIB_IRQCHIP
> -       select IRQ_DOMAIN
> +       select IRQ_DOMAIN_HIERARCHY

I understand that IRQ_DOMAIN_HIERARCHY implies
IRQ_DOMAIN but I kind of like if we anyway select both
(unless Kconfig dislikes it).

Otherwise it looks like we're just using hierarchies.

>  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
> +       struct irq_domain *domain = chip->irq.domain;
> +
>         if (!gpiochip_irqchip_irq_valid(chip, offset))
>                 return -ENXIO;
>
> +       if (irq_domain_is_hierarchy(domain)) {
> +               struct irq_fwspec spec;
> +
> +               spec.fwnode = domain->fwnode;
> +               spec.param_count = 2;
> +               spec.param[0] = offset;
> +               spec.param[1] = 0;
> +
> +               return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &spec);
> +       }
> +
>         return irq_create_mapping(chip->irq.domain, offset);
>  }

This is really nice.

> -       gpiochip->to_irq = gpiochip_to_irq;
> +       /*
> +        * Allow GPIO chips to override the ->to_irq() if they really need to.
> +        * This should only be very rarely needed, the majority should be fine
> +        * with gpiochip_to_irq().
> +        */
> +       if (!gpiochip->to_irq)
> +               gpiochip->to_irq = gpiochip_to_irq;

And I see this is what your driver does, which leaves the default
domain hierarchy callback path unused.

It's better if you indirect the pointer like we do with some other
irqchip stuff (see Hans Verkuils patches), i.e. if ->to_irq
is defined, we save that function pointer and call that at the
end of the gpiochip_to_irq() pointer, then we override it
with our own.

Since the Tegra186 clearly .to_irq() clearly is mostly the
same plus some extra, this should work fine and give
lesser lines of code in that driver.

Apart from that I am a big fan of this patch!

Yours,
Linus Walleij
