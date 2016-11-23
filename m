From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: Add Tegra186 support
Date: Wed, 23 Nov 2016 14:30:45 +0100
Message-ID: <CACRpkdYs3WoBPCiuuuka_DQz5KP0Sxc_wT57Zd3c4MF+9xH1+Q@mail.gmail.com>
References: <20161122173042.GA3239@ulmo.ba.sec> <20161122175539.3897-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161122175539.3897-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 22, 2016 at 6:55 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Tegra186 has two GPIO controllers that are largely register compatible
> between one another but are completely different from the controller
> found on earlier generations.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I would prefer if you could try to convert this driver to use
CONFIG_GPIOLIB_IRQCHIP and install a chained interrupt
handler with gpiochip_irqchio_add() + gpiolib_set_chained_irqchip().
It would save us so much trouble and so much complicated
code to maintain for this custom irqdomain.

I suggest you to look into the mechanisms mentioned in my
previous mail for how to poke holes in the single linear
irqdomain used by this mechanism.

As it seems, you only have one parent interrupt with all
these IRQs cascading off it as far as I can tell.

Yours,
Linus Walleij
