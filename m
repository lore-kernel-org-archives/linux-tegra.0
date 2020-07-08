From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/5] gpio: max77620: Initialize interrupts state
Date: Wed, 8 Jul 2020 11:51:06 +0300
Message-ID: <CAHp75VdFVGgKxR+n5TUMuFnWDy_uEmEeG=TvR9s7Xbe=jOdObg@mail.gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200708082634.30191-2-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> I noticed on Nexus 7 that after rebooting from downstream kernel to
> upstream, the GPIO interrupt is triggering non-stop despite of interrupts
> being disabled for all of GPIOs. This happens because Nexus 7 uses a
> soft-reboot, meaning that bootloader should take care of resetting
> hardware, but bootloader doesn't do it well. In a result, GPIO interrupt
> may be left ON at a boot time. Let's mask all GPIO interrupts at the
> driver's probe time in order to resolve the issue.

...

> +               err = regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(i),
> +                                        MAX77620_CNFG_GPIO_INT_MASK, 0);
> +               if (err < 0)

Does ' < 0' meaningful here?

> +                       dev_err(mgpio->dev, "failed to disable interrupt: %d\n",
> +                               err);

One line.

...

> +       max77620_gpio_initialize(mgpio);

I guess we have special callback for that, i.e.
https://elixir.bootlin.com/linux/v5.8-rc3/C/ident/init_hw.


-- 
With Best Regards,
Andy Shevchenko
