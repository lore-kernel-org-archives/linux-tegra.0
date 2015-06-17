From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 9/9] irq: spear-shirq: fix race in installing chained IRQ handler
Date: Wed, 17 Jun 2015 08:10:55 +0530
Message-ID: <CAOh2x=m2y+T0Z78nV5zDmSa6_7NH972EXcEEUKZMZ1dSxE6YKw@mail.gmail.com>
References: <E1Z4z0X-0002T1-6U@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1Z4z0X-0002T1-6U-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 17, 2015 at 3:37 AM, Russell King
<rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> Fix a race where a pending interrupt could be received and the handler
> called before the handler's data has been setup, by converting to
> irq_set_chained_handler_and_data().
>
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> ---
> Depends on patch 1.
>
>  drivers/irqchip/spear-shirq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/spear-shirq.c b/drivers/irqchip/spear-shirq.c
> index 9c145a7cb056..a45121546caf 100644
> --- a/drivers/irqchip/spear-shirq.c
> +++ b/drivers/irqchip/spear-shirq.c
> @@ -207,8 +207,7 @@ static void __init spear_shirq_register(struct spear_shirq *shirq,
>         if (!shirq->irq_chip)
>                 return;
>
> -       irq_set_chained_handler(parent_irq, shirq_handler);
> -       irq_set_handler_data(parent_irq, shirq);
> +       irq_set_chained_handler_and_data(parent_irq, shirq_handler, shirq);

Acked-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
