From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: max77620: Replace 8 with MAX77620_GPIO_NR
Date: Wed, 8 Jul 2020 19:45:18 +0300
Message-ID: <CAHp75VeKKDevnYgu-te9DzND5nm1EfZQFCjEsGhaDg3yJn9-Kw@mail.gmail.com>
References: <20200708155834.19762-1-digetx@gmail.com> <20200708155834.19762-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200708155834.19762-3-digetx@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 8, 2020 at 6:58 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The MAX77620_GPIO_NR enum value represents the total number of GPIOs,
> let's use it instead of a raw value in order to improve the code's
> readability a tad.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpio/gpio-max77620.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
> index 970ad6397a56..08bd5b141437 100644
> --- a/drivers/gpio/gpio-max77620.c
> +++ b/drivers/gpio/gpio-max77620.c
> @@ -19,8 +19,8 @@ struct max77620_gpio {
>         struct regmap           *rmap;
>         struct device           *dev;
>         struct mutex            buslock; /* irq_bus_lock */
> -       unsigned int            irq_type[8];
> -       bool                    irq_enabled[8];
> +       unsigned int            irq_type[MAX77620_GPIO_NR];
> +       bool                    irq_enabled[MAX77620_GPIO_NR];
>  };
>
>  static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
> @@ -38,7 +38,7 @@ static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
>
>         pending = value;
>
> -       for_each_set_bit(offset, &pending, 8) {
> +       for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
>                 unsigned int virq;
>
>                 virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
> --
> 2.26.0
>


-- 
With Best Regards,
Andy Shevchenko
