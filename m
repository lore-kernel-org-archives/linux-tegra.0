From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 3/5] gpio: max77620: Replace interrupt-enable array
 with bitmap
Date: Wed, 8 Jul 2020 11:44:08 +0300
Message-ID: <CAHp75Vc56D5QeL2WArUj4OGGk4XgkiK37FnFr=5+XsisLpng1A@mail.gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200708082634.30191-4-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 8, 2020 at 11:30 AM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> There is no need to dedicate an array where a bitmap could be used.
> Let's replace the interrupt's enable-array with the enable-mask in order
> to improve the code a tad.

...

> +#include <linux/bitops.h>

>         unsigned int            irq_type[MAX77620_GPIO_NR];
> -       bool                    irq_enabled[MAX77620_GPIO_NR];
> +       unsigned long           irq_enb_mask;

I would rather to move to DECLARE_BITMAP()
(the macro is defined in types.h IIRC)

-- 
With Best Regards,
Andy Shevchenko
