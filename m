From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: max77620: Initialize interrupts state
Date: Wed, 8 Jul 2020 19:58:03 +0300
Message-ID: <CAHp75VcFG3oK7C8Y7RZKoEvwPo9+hKMMucnDhtpqLDmLGoPmJw@mail.gmail.com>
References: <20200708155834.19762-1-digetx@gmail.com> <20200708155834.19762-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200708155834.19762-2-digetx@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 8, 2020 at 6:58 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> I noticed on Nexus 7 that after rebooting from downstream kernel to
> upstream, the GPIO interrupt is triggering non-stop despite of interrupts

despite interrupts

> being disabled for all of GPIOs. This happens because Nexus 7 uses a
> soft-reboot, meaning that bootloader should take care of resetting
> hardware, but bootloader doesn't do it well. In a result, GPIO interrupt

but the bootloader

As a result

> may be left ON at a boot time. Let's mask all GPIO interrupts at the
> driver's initialization time in order to resolve the issue.

...

>         mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
>         mgpio->gpio_chip.can_sleep = 1;
>         mgpio->gpio_chip.base = -1;
> +       mgpio->gpio_chip.irq.init_hw = max77620_gpio_irq_init_hw,

Now this seems a bit awkward. Perhaps you need first to switch to use
GPIO IRQ chip structure?
It's also in the TODO of the GPIO subsystem ;-)

...

>  #ifdef CONFIG_OF_GPIO
>         mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
>  #endif

This seems to be done by GPIO library.

Also point to improve: don't shadow error from platform_get_irq().

-- 
With Best Regards,
Andy Shevchenko
