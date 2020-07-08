From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 4/5] gpio: max77620: Don't handle disabled interrupts
Date: Wed, 8 Jul 2020 11:46:09 +0300
Message-ID: <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA@mail.gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200708082634.30191-5-digetx@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Check whether GPIO IRQ is enabled before proceeding with handling the
> interrupt request. The interrupt handler now returns IRQ_NONE if none
> of interrupts were handled, which is usually a sign of a problem.

...

> -       pending = value;
> +       pending = value & gpio->irq_enb_mask;

> +       if (!pending)
> +               return IRQ_NONE;

for_each_set_bit() should take care of it, no?
(and probably return with IRQ_RETVAL() macro)

>         for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
>                 unsigned int virq;

-- 
With Best Regards,
Andy Shevchenko
