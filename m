From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [BUG] gpio: gpiolib: possible sleep-in-atomic-context bugs in gpiochip_lock_as_irq()
Date: Wed, 29 Aug 2018 10:52:55 +0200
Message-ID: <CACRpkdYhSdO1etL=PwE09zYYdRN+W_vzUqRiiCpUjfv8-jKQJg@mail.gmail.com>
References: <c4904283-37d1-08d7-feb3-4dc7ef0bea0a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c4904283-37d1-08d7-feb3-4dc7ef0bea0a@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: baijiaju1990@gmail.com, Hans Verkuil <hans.verkuil@cisco.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jia-Ju,

Hans Verkuil is working on revamping the IRQ locking API for GPIO,
and I think these semantic problems will simply disappear when that
is done.

Yours,
Linus Walleij

On Sat, Aug 11, 2018 at 4:22 AM Jia-Ju Bai <baijiaju1990@gmail.com> wrote:
>
> The driver may sleep with holding a spinlock.
>
> The function call paths (from bottom to top) in Linux-4.16 are:
>
> [FUNC] mutex_lock_nested
> drivers/gpio/gpio-exar.c, 69: mutex_lock_nested in exar_get
> drivers/gpio/gpio-exar.c, 83: exar_get in exar_get_direction
> drivers/gpio/gpiolib.c, 3103: [FUNC_PTR]exar_get_direction in gpiochip_lock_as_irq
> drivers/gpio/gpio-tegra.c, 326: gpiochip_lock_as_irq in tegra_gpio_irq_set_type
> kernel/irq/chip.c, 1335: [FUNC_PTR]tegra_gpio_irq_set_type in irq_chip_set_type_parent
> kernel/irq/manage.c, 686: [FUNC_PTR]irq_chip_set_type_parent in __irq_set_trigger
> kernel/irq/manage.c, 1350: __irq_set_trigger in __setup_irq
> kernel/irq/manage.c, 1238: _raw_spin_lock_irqsave in __setup_irq
>
> [FUNC] mutex_lock_nested
> drivers/gpio/gpio-pca953x.c, 372: mutex_lock_nested in pca953x_gpio_get_direction
> drivers/gpio/gpiolib.c, 3103: [FUNC_PTR]pca953x_gpio_get_direction in gpiochip_lock_as_irq
> drivers/gpio/gpio-tegra.c, 326: gpiochip_lock_as_irq in tegra_gpio_irq_set_type
> kernel/irq/chip.c, 1335: [FUNC_PTR]tegra_gpio_irq_set_type in irq_chip_set_type_parent
> kernel/irq/manage.c, 686: [FUNC_PTR]irq_chip_set_type_parent in __irq_set_trigger
> kernel/irq/manage.c, 1350: __irq_set_trigger in __setup_irq
> kernel/irq/manage.c, 1238: _raw_spin_lock_irqsave in __setup_irq
>
> [FUNC] mutex_lock_nested
> drivers/mfd/stmpe.c, 170: mutex_lock_nested in stmpe_reg_read
> drivers/gpio/gpio-stmpe.c, 83: stmpe_reg_read in stmpe_gpio_get_direction
> drivers/gpio/gpiolib.c, 3103: [FUNC_PTR]stmpe_gpio_get_direction in gpiochip_lock_as_irq
> drivers/gpio/gpio-tegra.c, 326: gpiochip_lock_as_irq in tegra_gpio_irq_set_type
> kernel/irq/chip.c, 1335: [FUNC_PTR]tegra_gpio_irq_set_type in irq_chip_set_type_parent
> kernel/irq/manage.c, 686: [FUNC_PTR]irq_chip_set_type_parent in __irq_set_trigger
> kernel/irq/manage.c, 1350: __irq_set_trigger in __setup_irq
> kernel/irq/manage.c, 1238: _raw_spin_lock_irqsave in __setup_irq
>
> Note that [FUNC_PTR] means a function pointer call is used.
>
> I do not find a good way to fix, so I only report.
> This is found by my static analysis tool (DSAC).
>
>
> Best wishes,
> Jia-Ju Bai
