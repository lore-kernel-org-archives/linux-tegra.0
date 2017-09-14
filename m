From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 14/16] gpio: Add support for banked GPIO controllers
Date: Thu, 14 Sep 2017 15:59:26 +0200
Message-ID: <CACRpkdZ7QwyrqqO8iLXDcDimWk5iwOEKZBvXQ-2mBO5s+vg13A@mail.gmail.com>
References: <20170901185736.28051-1-thierry.reding@gmail.com> <20170901185736.28051-15-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170901185736.28051-15-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 1, 2017 at 8:57 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Some GPIO controllers are subdivided into multiple logical blocks called
> banks (or ports). This is often caused by the design assigning separate
> resources, such as register regions or interrupts, to each bank, or some
> set of banks.
>
> This commit adds support for describing controllers that have such a
> banked design and provides common code for dealing with them.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This patch makes me really happy.

It pulls in a lot of weirdness to the OF core and creates a coherent
way of handling these "banked" GPIO chips.

CC to Tony to make sure he checks that OMAP is ready to use this
too.

I would change num_pins to num_lines everywhere in this patch,
so if you resend the series, please fix that.

> +void gpio_irq_chip_banked_handler(struct irq_desc *desc)

Maybe we should name this gpio_irq_chip_banked_chained_handler()
since it only deals with chained IRQs?

Sooner or later we will have a nested bank too...

Otherwise it looks fine.

Yours,
Linus Walleij
