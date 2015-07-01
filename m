From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: defer probe if pinctrl cannot be found
Date: Wed, 1 Jul 2015 12:36:00 -0500
Message-ID: <CAL_JsqKXODBk4FVB-kiWFHLGFLCwJDjXvpVqOTvuEJubApbVSg@mail.gmail.com>
References: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com> <1435754753-31307-2-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1435754753-31307-2-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 1, 2015 at 7:45 AM, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
> When an OF node has a pin range for its GPIOs, return -EPROBE_DEFER if
> the pin controller isn't available.
>
> Otherwise, the GPIO range wouldn't be set at all unless the pin
> controller probed always before the GPIO chip.
>
> With this change, the probe of the GPIO chip will be deferred and will
> be retried at a later point, hopefully once the pin controller has been
> registered and probed already.

This will break cases where the pinctrl driver does not exist, but the
DT contains pinctrl bindings. We can have similar problems already
with clocks though. However, IMO this problem is a bit different in
that pinctrl is more likely entirely optional while clocks are often
required. You may do all pin setup in bootloader/firmware on some
boards and not others. Of course then why put pinctrl in the DT in
that case? They could be present just due to how chip vs. board dts
files are structured.

We could address this by simply marking the pin controller node
disabled. However, ...

> @@ -361,7 +361,7 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
>
>                 pctldev = of_pinctrl_get(pinspec.np);
>                 if (!pctldev)
> -                       break;
> +                       return -EPROBE_DEFER;

But you cannot distinguish that case here. I think of_pinctrl_get
needs to set the error code appropriately.

Rob
