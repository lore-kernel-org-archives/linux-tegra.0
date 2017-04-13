From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 12/12] gpio: Add Tegra186 support
Date: Thu, 13 Apr 2017 14:38:44 +0200
Message-ID: <CACRpkdaQacEqqW9Vdn7mtnZMH_VvL1B-35VFV=PcORwgtLz2eg@mail.gmail.com>
References: <20170403160532.20282-1-thierry.reding@gmail.com> <20170403160532.20282-13-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403160532.20282-13-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 3, 2017 at 6:05 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Tegra186 has two GPIO controllers that are largely register compatible
> between one another but are completely different from the controller
> found on earlier generations.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v3:
> - make use of GPIOLIB_IRQCHIP for IRQ chip handling

So this is the interesting patch where you make use of the new
tightly integrated IRQchip.

> +struct tegra_gpio {
> +       struct gpio_chip gpio;
> +       struct irq_chip intc;
> +       unsigned int num_irq;
> +       unsigned int *irq;

So I find it a bit strange that the array of irq parents is still kept around
when you add so much infrastructure. Could this not just go into the core
so that is natively able to handle multiple parents cleanly?

> +static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
> +                                 const struct of_phandle_args *spec,
> +                                 u32 *flags)
> +{
> +       struct tegra_gpio *gpio = gpiochip_get_data(chip);
> +       unsigned int port, pin, i, offset = 0;
> +
> +       if (WARN_ON(chip->of_gpio_n_cells < 2))
> +               return -EINVAL;
> +
> +       if (WARN_ON(spec->args_count < chip->of_gpio_n_cells))
> +               return -EINVAL;
> +
> +       port = spec->args[0] / 8;
> +       pin = spec->args[0] % 8;

Actually modular ports/banks is something we will also see again and
have seen before. Maybe this should be a new core xlate function
just taking some MOD argument.

> +static void tegra186_gpio_irq(struct irq_desc *desc)
> +{
> +       struct tegra_gpio *gpio = irq_desc_get_handler_data(desc);
> +       struct irq_domain *domain = gpio->gpio.irq.domain;
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       unsigned int parent = irq_desc_get_irq(desc);
> +       unsigned int i, offset = 0;
> +
> +       chained_irq_enter(chip, desc);
> +
> +       for (i = 0; i < gpio->soc->num_ports; i++) {
> +               const struct tegra_gpio_port *port = &gpio->soc->ports[i];
> +               void __iomem *base = gpio->base + port->offset;
> +               unsigned int pin, irq;
> +               unsigned long value;
> +
> +               /* skip ports that are not associated with this controller */
> +               if (parent != gpio->irq[port->irq])
> +                       goto skip;

This parent-to-irq lookup I think the core should handle.

> +static int tegra186_gpio_irq_domain_xlate(struct irq_domain *domain,
> +                                         struct device_node *np,
> +                                         const u32 *spec, unsigned int size,
> +                                         unsigned long *hwirq,
> +                                         unsigned int *type)
> +{
> +       struct tegra_gpio *gpio = gpiochip_get_data(domain->host_data);
> +       unsigned int port, pin, i, offset = 0;
> +
> +       if (size < 2)
> +               return -EINVAL;
> +
> +       port = spec[0] / 8;
> +       pin = spec[0] % 8;

Here is this MOD business again. This is clearly a pattern.

> +       err = of_irq_count(pdev->dev.of_node);
> +       if (err < 0)
> +               return err;
> +
> +       gpio->num_irq = err;

This variable (err) has a confusing name. This is clearly not an error
at this point. Can you rename it to "ret" or something?

> +       gpio->irq = devm_kcalloc(&pdev->dev, gpio->num_irq, sizeof(*gpio->irq),
> +                                GFP_KERNEL);
> +       if (!gpio->irq)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < gpio->num_irq; i++) {
> +               err = platform_get_irq(pdev, i);
> +               if (err < 0)
> +                       return err;
> +
> +               gpio->irq[i] = err;
> +       }

So this array of parent IRQs I think should be stored in the core
gpio irqchip, not here locally in the driver.

> +       for (i = 0, offset = 0; i < gpio->soc->num_ports; i++) {
> +               const struct tegra_gpio_port *port = &gpio->soc->ports[i];
> +               char *name;
> +
> +               for (j = 0; j < port->pins; j++) {
> +                       name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL,
> +                                             "P%s.%02x", port->name, j);
> +                       if (!name)
> +                               return -ENOMEM;
> +
> +                       names[offset + j] = name;
> +               }
> +
> +               offset += port->pins;
> +       }

Interesting way of using the names array. This will override any names
from the device tree I think, don't you want to use gpio-line-names = ""..
in the device tree instead?

> +       irq = &gpio->gpio.irq;
> +       irq->chip = &gpio->intc;
> +       irq->first = 0;
> +       irq->domain_ops = &tegra186_gpio_irq_domain_ops;
> +       irq->handler = handle_simple_irq;
> +       irq->lock_key = &tegra186_gpio_lock_class;
> +       irq->default_type = IRQ_TYPE_NONE;
> +       irq->parent_handler = tegra186_gpio_irq;
> +       irq->parent_handler_data = gpio;
> +       irq->num_parents = gpio->num_irq;
> +       irq->parents = gpio->irq;
> +
> +       irq->map = devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
> +                               sizeof(*irq->map), GFP_KERNEL);
> +       if (!irq->map)
> +               return -ENOMEM;
> +
> +       for (i = 0, offset = 0; i < gpio->soc->num_ports; i++) {
> +               const struct tegra_gpio_port *port = &gpio->soc->ports[i];
> +
> +               for (j = 0; j < port->pins; j++)
> +                       irq->map[offset + j] = irq->parents[port->irq];
> +
> +               offset += port->pins;
> +       }

So this is the core API use. But setting up the map in the driver, that
seems too much to implement over and over again for all drivers
don't you think? Also to have local irqdomain operations. All that
should be in the core and be reusable IMO.

I would imagine that the core keeps track of the parent IRQs and
will make sure to free up all maps of all IRQs when the GPIOchip
is removed.

Maybe I'm missing something about this, I was simply expecting
a full multi-parent handling and tracking in the core, moving the
drivers that now loose track of their parents over to that as well.

Yours,
Linus Walleij
