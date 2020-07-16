From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/6] gpio: max77620: Use irqchip template
Date: Thu, 16 Jul 2020 10:55:31 +0200
Message-ID: <CACRpkdbPNRoPGc4UCRZqhE52336d_LxT19A5y2oHK+hW-vn2ng@mail.gmail.com>
References: <20200709171203.12950-1-digetx@gmail.com> <20200709171203.12950-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200709171203.12950-6-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 9, 2020 at 7:12 PM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> +       mgpio->gpio_chip.irq.chip = &max77620_gpio_irqchip;
> +       mgpio->gpio_chip.irq.default_type = IRQ_TYPE_NONE;
> +       mgpio->gpio_chip.irq.handler = handle_edge_irq;
> +       mgpio->gpio_chip.irq.threaded = true;

And I didn't even realize one could do this.

> -       gpiochip_irqchip_add_nested(&mgpio->gpio_chip, &max77620_gpio_irqchip,
> -                                   0, handle_edge_irq, IRQ_TYPE_NONE);
> -
(...)
> -       gpiochip_set_nested_irqchip(&mgpio->gpio_chip, &max77620_gpio_irqchip,
> -                                   gpio_irq);

And get rid of these two.

I suppose I can just do the same for the remaining users of
gpiochip_irqchip_add_nested() and gpiochip_set_nested_irqchip()
and get rid of these two functions altogether!

Yours,
Linus Walleij
