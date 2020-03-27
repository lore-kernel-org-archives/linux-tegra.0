From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/9] gpio: Support GPIO controllers without pin-ranges
Date: Fri, 27 Mar 2020 11:37:07 +0100
Message-ID: <CACRpkda5M4NPvMBBLg+_2BJw7ZmryrgN72JZL_XAFQ137s0OLA@mail.gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Wake gpiochip_generic_request() call into the pinctrl helpers only if a
> GPIO controller had any pin-ranges assigned to it. This allows a driver
> to unconditionally use this helper if it supports multiple devices of
> which only a subset have pin-ranges assigned to them.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Patch applied.

We have some drivers like this:
drivers/gpio/gpio-pl061.c:

        if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
                pl061->gc.request = gpiochip_generic_request;
                pl061->gc.free = gpiochip_generic_free;
        }

Should we just make a patch assigning these callbacks
unconditionally as a follow-up?

Yours,
Linus Walleij
