From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 15/15] gpio: Automatically add lockdep keys
Date: Wed, 8 Nov 2017 14:21:44 +0100
Message-ID: <CACRpkdbqsTXaTEorenia4a79jfH+GLxSMzyFwVGC5hWnd3aYnA@mail.gmail.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com> <20171107181559.6318-16-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171107181559.6318-16-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 7, 2017 at 7:15 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> In order to avoid lockdep boilerplate in individual drivers, turn the
> gpiochip_add_data() function into a macro that creates a unique class
> key for each driver.
>
> Note that this has the slight disadvantage of adding a key for each
> driver registered with the system. However, these keys are 8 bytes in
> size, which is negligible and a small price to pay for generic
> infrastructure.
>
> Suggested-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> -extern int gpiochip_add_data(struct gpio_chip *chip, void *data);
> +extern int __gpiochip_add_data(struct gpio_chip *chip, void *data,
> +                              struct lock_class_key *lock_key);

As it happens I hate __functions because this syntax is so ambigous.
So I just took the liberty to rename this
gpiochip_add_data_with_key() when applying.

Apart from that it is fine :)

Yours,
Linus Walleij
