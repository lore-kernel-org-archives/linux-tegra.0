From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tegra: Fix tegra_gpio_irq_set_type()
Date: Sun, 29 Jul 2018 22:39:30 +0200
Message-ID: <CACRpkdbx1Zj8G0H9pKsF-+JfXBruE4_Rx3ZD5j8q3ycsNS+YOQ@mail.gmail.com>
References: <20180717161038.21500-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717161038.21500-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 17, 2018 at 6:12 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> Commit 36b312792b97 ("gpiolib: Respect error code of ->get_direction()")
> broke tegra_gpio_irq_set_type() because requesting of GPIO direction must
> be done after enabling GPIO function for a pin.
>
> This patch fixes drivers probe failure like this:
>
>  gpio gpiochip0: (tegra-gpio): gpiochip_lock_as_irq: cannot get GPIO direction
>  tegra-gpio 6000d000.gpio: unable to lock Tegra GPIO 144 as IRQ
>
> Fixes: 36b312792b97 ("gpiolib: Respect error code of ->get_direction()")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Patch applied with Jon's tags.

Yours,
Linus Walleij
