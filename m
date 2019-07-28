From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: allow customizing hierarchical IRQ chips
Date: Mon, 29 Jul 2019 00:49:55 +0200
Message-ID: <CACRpkdZn-czbOOTrRs5ZgR7qTtf2A4i_L4J8_vk+kJiBuAnikg@mail.gmail.com>
References: <20190708110138.24657-1-masneyb@onstation.org> <20190708110138.24657-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708110138.24657-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org, David Daney <david.daney@cavium.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <treding@nvidia.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 8, 2019 at 1:01 PM Brian Masney <masneyb@onstation.org> wrote:

> Now that the GPIO core has support for hierarchical IRQ chips, let's add
> support for three new callbacks in struct gpio_irq_chip:
>
> populate_parent_fwspec:
>     This optional callback populates the struct irq_fwspec for the
>     parent's IRQ domain. If this is not specified, then
>     gpiochip_populate_parent_fwspec_twocell will be used. A four-cell
>     variant named &gpiochip_populate_parent_fwspec_twocell is also
>     available.
>
> child_pin_to_irq:
>     This optional callback is used to translate the child's GPIO pin
>     number to an IRQ number for the GPIO to_irq() callback. If this is
>     not specified, then a default callback will be provided that
>     returns the pin number.
>
> child_irq_domain_ops:
>     The IRQ domain operations that will be used for this GPIO IRQ
>     chip. If no operations are provided, then default callbacks will
>     be populated to setup the IRQ hierarchy. Some drivers need to
>     supply their own translate function.
>
> These will be initially used by Qualcomm's spmi-gpio and ssbi-gpio.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

This is overall looking very appetizing!

I want to apply this on top of my patch and respin it
with some of Masahiro's comments as well and then let's
try to just apply all of this.

> Note: checkpatch doesn't like that child_irq_domain_ops is not const.

Hm? I suspect some janitor will find the problem and patch it for us.

> +static void gpiochip_add_default_irq_domain_ops(struct irq_domain_ops *ops)
> +{
> +       if (!ops->activate)
> +               ops->activate = gpiochip_irq_domain_activate;
> +
> +       if (!ops->deactivate)
> +               ops->deactivate = gpiochip_irq_domain_deactivate;
> +
> +       if (!ops->translate)
> +               ops->translate = gpiochip_hierarchy_irq_domain_translate;
> +
> +       if (!ops->alloc)
> +               ops->alloc = gpiochip_hierarchy_irq_domain_alloc;
> +
> +       if (!ops->free)
> +               ops->free = irq_domain_free_irqs_common;
> +}

I'm fine with translate(), this seems to be what Lina needs too.

But do we really need to make them all optional? activate() and
deactivate() will require the driver to lock the irq etc which is hairy.

Yours,
Linus Walleij
