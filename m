From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra: fix unbalanced chained_irq_enter/exit
Date: Wed, 2 Aug 2017 10:43:27 +0200
Message-ID: <CACRpkdaXXZsBT+T0Rzd1bOZAQ=oXkRry2e+RVFZMXSeTaX-kVw@mail.gmail.com>
References: <a9c261800dbb662c9c703544817dc103e2937472.1500381146.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a9c261800dbb662c9c703544817dc103e2937472.1500381146.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 18, 2017 at 2:35 PM, Micha=C5=82 Miros=C5=82aw
<mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org> wrote:

> When more than one GPIO IRQs are triggered simultaneously,
> tegra_gpio_irq_handler() called chained_irq_exit() multiple
> times for one chained_irq_enter().
>
> Fixes: 3c92db9ac0ca3eee8e46e2424b6c074e2e394ad9
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>

Patch applied. I also changed this variable to a bool.

Yours,
Linus Walleij
