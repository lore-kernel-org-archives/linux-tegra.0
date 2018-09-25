From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/9] gpio: Add support for hierarchical IRQ domains
Date: Tue, 25 Sep 2018 10:11:06 +0200
Message-ID: <CACRpkdYnrf7FknvnZyFSgfT5aCrcWT4hxSnQo0UqxYfR6Fkqwg@mail.gmail.com>
References: <20180921102546.12745-1-thierry.reding@gmail.com> <20180921102546.12745-7-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102546.12745-7-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry!

Thanks for the patch!

I am a bit ignorant about irqdomains so I will probably need an ACK
from some irq maintainer before I can apply this.

On Fri, Sep 21, 2018 at 12:25 PM Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Hierarchical IRQ domains can be used to stack different IRQ controllers
> on top of each other. One specific use-case where this can be useful is
> if a power management controller has top-level controls for wakeup
> interrupts. In such cases, the power management controller can be a
> parent to other interrupt controllers and program additional registers
> when an IRQ has its wake capability enabled or disabled.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

While I think it is really important that we start supporting hierarchical
irqdomains in the gpiolib core, I want a more complete approach,
so that drivers that need hierarchical handling of irqdomains
can get the same support from gpiolib as they get for simple
domains.

> @@ -1918,7 +1918,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
>                 type = IRQ_TYPE_NONE;
>         }
>
> -       gpiochip->to_irq = gpiochip_to_irq;
> +       if (!gpiochip->to_irq)
> +               gpiochip->to_irq = gpiochip_to_irq;

So here you let the drivers override the .to_irq() function and that
I think gets confusing as we are asking gpiolib to handle our
irqchip.


> -       gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
> -                                                    gpiochip->irq.first,
> -                                                    ops, gpiochip);
> +       if (gpiochip->irq.parent_domain)
> +               gpiochip->irq.domain = irq_domain_add_hierarchy(gpiochip->irq.parent_domain,
> +                                                               0, gpiochip->ngpio,
> +                                                               np, ops, gpiochip);
> +       else
> +               gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
> +                                                            gpiochip->irq.first,
> +                                                            ops, gpiochip);

So this part is great: if we pass in a parent domain the core helps us
create the hierarchy.

But the stuff in .to_irq() should also be handled in the gpiolib core:
the irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &spec) for
example. That way you should not need any external .to_irq() function.

I can't see if you need to pull more stuff into the core to accomplish
that, but I think in essence the core gpiolib needs to be more helpful
with hierarchies.

Yours,
Linus Walleij
