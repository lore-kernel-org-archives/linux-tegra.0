From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/6] gpio: max77620: Don't set of_node
Date: Thu, 9 Jul 2020 00:44:34 +0300
Message-ID: <675c4691-d372-4fe1-d515-c86fdba2f588@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-4-digetx@gmail.com>
 <CAHp75VejftNuSqdYvd1YE1SdRON6=mQ_iD2dEr4K9D8YGgeRBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VejftNuSqdYvd1YE1SdRON6=mQ_iD2dEr4K9D8YGgeRBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

08.07.2020 23:57, Andy Shevchenko пишет:
> 
> 
> On Wednesday, July 8, 2020, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> <mailto:digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>> wrote:
> 
>     The gpiochip_add_data() takes care of setting the of_node to the
>     parent's
>     device of_node, hence there is no need to do it manually in the driver's
>     code. This patch corrects the parent's device pointer and removes the
>     unnecessary setting of the of_node.
> 
> 
> I gave a second look and I think my suggestion is wrong. Here is an
> interesting propagation of the parent device node to its grand son,
> leaving son’s one untouched. Original code has intentions to do that way.

The [1] says that gpio_chip.parent should point at the "device providing
the GPIOs". That's the pdev->dev.parent in the case of this driver.
MAX77620 is an MFD PMIC device that has virtual sub-devices like GPIO
controller, PINCTRL and RTC. The MFD is the parent device that provides
the GPIOs [2].

[1]
https://elixir.bootlin.com/linux/v5.8-rc3/source/include/linux/gpio/driver.h#L276

[2]
https://elixir.bootlin.com/linux/v5.8-rc3/source/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi#L48

I think the old code was wrong and this patch is correct, please correct
me if I'm missing something.

>     Suggested-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>     <mailto:andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>>
>     Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>     <mailto:digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>>
>     ---
>      drivers/gpio/gpio-max77620.c | 5 +----
>      1 file changed, 1 insertion(+), 4 deletions(-)
> 
>     diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
>     index 7f7e8d4bf0d3..39d431da2dbc 100644
>     --- a/drivers/gpio/gpio-max77620.c
>     +++ b/drivers/gpio/gpio-max77620.c
>     @@ -279,7 +279,7 @@ static int max77620_gpio_probe(struct
>     platform_device *pdev)
>             mgpio->dev = &pdev->dev;
> 
>             mgpio->gpio_chip.label = pdev->name;
>     -       mgpio->gpio_chip.parent = &pdev->dev;
>     +       mgpio->gpio_chip.parent = pdev->dev.parent;
>             mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
>             mgpio->gpio_chip.get = max77620_gpio_get;
>             mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
>     @@ -288,9 +288,6 @@ static int max77620_gpio_probe(struct
>     platform_device *pdev)
>             mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
>             mgpio->gpio_chip.can_sleep = 1;
>             mgpio->gpio_chip.base = -1;
>     -#ifdef CONFIG_OF_GPIO
>     -       mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
>     -#endif
> 
>             platform_set_drvdata(pdev, mgpio);
>      
>     -- 
>     2.26.0
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
