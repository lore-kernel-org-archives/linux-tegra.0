From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/RFT PATCH 3/3] gpiolib: make gpio irqchip compatible with sparse_irq
Date: Tue, 1 Aug 2017 09:46:03 +0200
Message-ID: <CACRpkdZ0N=mPAc5GrReyS27vqxovBV=08VEJ_qzo8yn=+y=DfA@mail.gmail.com>
References: <20170708224413.18281-1-grygorii.strashko@ti.com> <20170708224413.18281-4-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170708224413.18281-4-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jul 9, 2017 at 12:44 AM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Now IRQ mappings are always created for all (allowed) GPIOs in gpio irqchip in
> gpiochip_irqchip_add_key() which goes against the idea of SPARSE_IRQ and,
> as result, leads to:
>  - increasing of memory consumption because of allocated IRQ descriptors most
> of which will never ever be used (especially on platform with a
> high number of GPIOs)
>  - imposibility to use GPIO irqchip APIs by gpio drivers when HW implements
> GPIO IRQ functionality as IRQ crossbar/multiplexer which has only limited
> number of IRQ outputs (example from [1], all GPIOs can be mapped on only 8
> IRQs).
>
> Hence, remove static IRQ mapping code from gpiochip_irqchip_add_key() and
> instead replace irq_find_mapping() with irq_create_mapping() in
> gpiochip_to_irq(). Also add additional gpiochip_irqchip_irq_valid() calls
> in gpiochip_to_irq() and gpiochip_irq_map().
>
> After this change gpio2irq mapping will happen the following way when GPIO
> irqchip APIs are used by gpio driver:
>  - IRQ mappings will be created statically if driver passes first_irq>0
> vlaue in gpiochip_irqchip_add_key().
>  - IRQ mappings will be created dynamically from gpio_to_irq() or
> of_irq_get().
>
> [1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1435847.html
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

This is obviously better and what I should have done from the beginning
had I only been smart enough, so what better to do than to throw this in
now for -next and see what happens :)

Patch applied.

Yours,
Linus Walleij
