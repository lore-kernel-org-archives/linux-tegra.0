From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/12] gpio: Tight IRQ chip integration and Tegra186 support
Date: Thu, 13 Apr 2017 14:22:14 +0200
Message-ID: <CACRpkdbDQy8etCip5fJ1snFthzoq89LcmX5qQ7i14aJOf-oe4A@mail.gmail.com>
References: <20170403160532.20282-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403160532.20282-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 3, 2017 at 6:05 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> here's a first draft of patches to make GPIOLIB_IRQCHIP flexible enough
> to support the Tegra186 use-case. Instead of just fixing the bugs that I
> had pointed out earlier, this goes one step further and completely
> integrates IRQ chip registration into GPIO chip registration. The idea
> is that drivers will initialize a set of fields (collected in a new
> struct gpio_irq_chip) before calling gpiochip_add() (or derivatives) and
> gpiolib will internally set up an IRQ domain and register the IRQ chip.
>
> Currently this makes use of the new infrastructure only in the Tegra186
> driver, but I plan to convert a couple of others once we can agree that
> this is a direction that you're comfortable with.

So I like what you are doing here, I applied patch 1 which is an obvious
fix.

Patches 2-11 need to be applied early after v4.12-rc1 (after rebasing)
and pulled into both the GPIO and pin control trees so we do not
get development glitches. It gives a more elegant structure to things.

I will look into patch 12 especially to see how you use the infrastructure.

Yours,
Linus Walleij
