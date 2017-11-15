From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v7 08/15] gpio: Move irq_valid_mask into struct
 gpio_irq_chip
Date: Wed, 15 Nov 2017 09:57:07 -0600
Message-ID: <e2f24e23-31fa-f521-74c5-1d33b62d7f17@ti.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com>
 <20171107181559.6318-9-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171107181559.6318-9-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry, Linus,

On 11/07/2017 12:15 PM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> In order to consolidate the multiple ways to associate an IRQ chip with
> a GPIO chip, move more fields into the new struct gpio_irq_chip.
> 

I'd like to report possible issue related to irq.valid_mask in case if drivers
which are using it will switch to use gpio_irq_chip and new infra.

Now irq.valid_mask is used the following way:
- gpiochip_add_data() -- It will allocate irq.valid_mask
- driver fills irq.valid_mask if required
- driver calls gpiochip_irqchip_add() which will take into account irq.valid_mask
and prevents mapping of invalid IRQs

With current infra gpio irqchip will be created and initialized from gpiochip_add_data
and drivers have no possibility to fill it before that. 

Again, for now this is "possible issue".

> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   Documentation/gpio/driver.txt              |  4 ++--
>   drivers/gpio/gpio-aspeed.c                 |  4 ++--
>   drivers/gpio/gpio-stmpe.c                  |  4 ++--
>   drivers/gpio/gpiolib.c                     | 16 ++++++++--------
>   drivers/pinctrl/intel/pinctrl-baytrail.c   |  4 ++--
>   drivers/pinctrl/intel/pinctrl-cherryview.c |  4 ++--
>   drivers/platform/x86/intel_int0002_vgpio.c |  4 ++--
>   include/linux/gpio/driver.h                | 21 +++++++++++++++------
>   8 files changed, 35 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
> index dcf6af1d9e56..d8de1c7de85a 100644
> --- a/Documentation/gpio/driver.txt
> +++ b/Documentation/gpio/driver.txt
> @@ -313,8 +313,8 @@ symbol:
>     mark all the child IRQs as having the other IRQ as parent.
>   
>   If there is a need to exclude certain GPIOs from the IRQ domain, you can
> -set .irq_need_valid_mask of the gpiochip before gpiochip_add_data() is
> -called. This allocates an .irq_valid_mask with as many bits set as there
> +set .irq.need_valid_mask of the gpiochip before gpiochip_add_data() is
> +called. This allocates an .irq.valid_mask with as many bits set as there
>   are GPIOs in the chip. Drivers can exclude GPIOs by clearing bits from this
>   mask. The mask must be filled in before gpiochip_irqchip_add() or
>   gpiochip_irqchip_add_nested() is called.
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c

,...

-- 
regards,
-grygorii
