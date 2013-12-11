From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra: add missing error handling to probe
Date: Wed, 11 Dec 2013 13:40:03 +0100
Message-ID: <CACRpkdadZUaVXdHAX5c9r0NMUJzU=YsWejYz9HwZMZr-f7Eofg@mail.gmail.com>
References: <1386362171-29311-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386362171-29311-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 6, 2013 at 9:36 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The call to gpiochip_add() is not currently error-checked. Add the
> missing checking.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Patch applied and Reviewed-by tags added.

> Perhaps this should be Cc: stable since Greg wants more stable patches,
> but it's not a bug that's likely to be hit...

Nah.

> -       gpiochip_add(&tegra_gpio_chip);
> +       ret = gpiochip_add(&tegra_gpio_chip);
> +       if (ret < 0) {
> +               irq_domain_remove(irq_domain);
> +               return ret;
> +       }

I fear we are missing quite a few irq_domain_remove() calls in some
GPIO drivers ... adding to my TODO to do an overview of this.

Yours,
Linus Walleij
