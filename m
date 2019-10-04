From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: max77620: Fix interrupt handling
Date: Sat, 5 Oct 2019 00:03:37 +0200
Message-ID: <CACRpkdYhSu9feBKqFA4wGdWP81fgjNYPHCdC7zaZ+eqO+caw5Q@mail.gmail.com>
References: <20191002122825.3948322-1-thierry.reding@gmail.com> <20191002122825.3948322-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002122825.3948322-3-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Timo Alho <talho@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 2, 2019 at 2:28 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Timo Alho <talho@nvidia.com>
>
> The interrupt-related register fields on the MAX77620 GPIO controller
> share registers with GPIO related fields. If the IRQ chip is implemented
> with regmap-irq, this causes the IRQ controller code to overwrite fields
> previously configured by the GPIO controller code.
>
> Two examples where this causes problems are the NVIDIA Jetson TX1 and
> Jetson TX2 boards, where some of the GPIOs are used to enable vital
> power regulators. The MAX77620 GPIO controller also provides the USB OTG
> ID pin. If configured as an interrupt, this causes some of the
> regulators to be powered off.
>
> Signed-off-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

I am looking for ways to pass also nested irqchips along when registering
the gpio_chip but I guess I need to clean up all the chained chips
first (getting there...)

Yours,
Linus Walleij
