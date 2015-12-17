From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH V2 5/8] irqchip/gic: Return an error if GIC
 initialisation fails
Date: Thu, 17 Dec 2015 14:26:02 +0100
Message-ID: <CACRpkdaw+DM5ddi27UpJEg-+3A3ffS7k_Qnm4i-w2rLhpxp+8g@mail.gmail.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
	<1450349309-8107-6-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450349309-8107-6-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 17, 2015 at 11:48 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> If the GIC initialisation fails, then currently we do not return an error
> or clean-up afterwards. Although for root controllers, this failure may be
> fatal anyway, for secondary controllers, it may not be fatal and so return
> an error on failure and clean-up.
>
> Also for non-banked GIC controllers, make sure that we free any memory
> allocated if we fail to initialise the IRQ domain.
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
(...)

Almost perfect but...

> +err:
> +       if (IS_ENABLED(CONFIG_GIC_NON_BANKED) && percpu_offset) {
> +               free_percpu(gic->dist_base.percpu_base);
> +               free_percpu(gic->cpu_base.percpu_base);

What if the first map worked but not the second?

Should it be:

if (gic->dist_base.percpu_base)
   free_percpu(gic->dist_base.percpu_base);
if (gic->cpu_base.percpu_base)
   free_percpu(gic->cpu_base.percpu_base);

?

Yours,
Linus Walleij
