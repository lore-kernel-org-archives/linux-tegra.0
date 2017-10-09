From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 14/16] gpio: Add support for banked GPIO controllers
Date: Mon, 9 Oct 2017 16:52:21 -0500
Message-ID: <ff3b45ec-2af0-5f34-aae8-bb54e892a64a@ti.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <20170928095628.21966-15-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928095628.21966-15-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 09/28/2017 04:56 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Some GPIO controllers are subdivided into multiple logical blocks called
> banks (or ports). This is often caused by the design assigning separate
> resources, such as register regions or interrupts, to each bank, or some
> set of banks.
> 
> This commit adds support for describing controllers that have such a
> banked design and provides common code for dealing with them.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/gpio/gpiolib-of.c   | 101 +++++++++++++++++++++++++++++++++++++++++
>   drivers/gpio/gpiolib.c      |  98 ++++++++++++++++++++++++++++++++++++++++
>   include/linux/gpio/driver.h | 108 ++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/of_gpio.h     |  10 ++++
>   4 files changed, 317 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index bfcd20699ec8..9baabe00966d 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -309,6 +309,107 @@ int of_gpio_simple_xlate(struct gpio_chip *gc,
>   }
>   EXPORT_SYMBOL(of_gpio_simple_xlate);
>   
> +/**
> + * gpio_banked_irq_domain_xlate - decode an IRQ specifier for banked chips
> + * @domain: IRQ domain
> + * @np: device tree node
> + * @spec: IRQ specifier
> + * @size: number of cells in IRQ specifier
> + * @hwirq: return location for the hardware IRQ number
> + * @type: return location for the IRQ type
> + *
> + * Translates the IRQ specifier found in device tree into a hardware IRQ
> + * number and an interrupt type.
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int gpio_banked_irq_domain_xlate(struct irq_domain *domain,
> +				 struct device_node *np,
> +				 const u32 *spec, unsigned int size,
> +				 unsigned long *hwirq,
> +				 unsigned int *type)
> +{
> +	struct gpio_chip *gc = domain->host_data;
> +	unsigned int bank, line, i, offset = 0;
> +
> +	if (size < 2)
> +		return -EINVAL;
> +
> +	bank = (spec[0] >> gc->of_gpio_bank_mask) & gc->of_gpio_bank_shift;
> +	line = (spec[0] >> gc->of_gpio_line_mask) & gc->of_gpio_line_shift;
> +
> +	if (bank >= gc->num_banks) {
> +		dev_err(gc->parent, "invalid bank number: %u\n", bank);
> +		return -EINVAL;
> +	}
> +
> +	if (line >= gc->banks[bank]->num_lines) {
> +		dev_err(gc->parent, "invalid line number: %u\n", line);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < bank; i++)
> +		offset += gc->banks[i]->num_lines;

Just to clarify, why is above iteration required?

> +
> +	*type = spec[1] & IRQ_TYPE_SENSE_MASK;
> +	*hwirq = offset + line;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gpio_banked_irq_domain_xlate);
> +
> +/**
> + * of_gpio_banked_xlate - translate GPIO specifier to a GPIO number and flags
> + * @gc: GPIO chip
> + * @gpiospec: GPIO specifier
> + * @flags: return location for flags parsed from the GPIO specifier
> + *
> + * This translation function takes into account multiple banks that can make
> + * up a single controller. Each bank can contain one or more pins. A single
> + * cell in the specifier is used to represent a (bank, pin) pair, with each
> + * encoded in different fields. The &gpio_chip.of_gpio_bank_shift and
> + * &gpio_chip.of_gpio_bank_mask fields, and &gpio_chip.of_gpio_line_shift and
> + * &gpio_chip.of_gpio_line_mask are used to specify the encoding.
> + *
> + * Returns:
> + * The chip-relative index of the pin given by the GPIO specifier.
> + */
> +int of_gpio_banked_xlate(struct gpio_chip *gc,
> +			 const struct of_phandle_args *gpiospec, u32 *flags)
> +{
> +	unsigned int offset = 0, bank, line, i;
> +	const u32 *spec = gpiospec->args;
> +
> +	if (WARN_ON(gc->of_gpio_n_cells < 2))
> +		return -EINVAL;
> +
> +	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
> +		return -EINVAL;
> +
> +	bank = (spec[0] >> gc->of_gpio_bank_shift) & gc->of_gpio_bank_mask;
> +	line = (spec[0] >> gc->of_gpio_line_shift) & gc->of_gpio_line_mask;
> +
> +	if (bank >= gc->num_banks) {
> +		dev_err(gc->parent, "invalid bank number: %u\n", bank);
> +		return -EINVAL;
> +	}
> +
> +	if (line >= gc->banks[bank]->num_lines) {
> +		dev_err(gc->parent, "invalid line number: %u\n", line);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < bank; i++)
> +		offset += gc->banks[i]->num_lines;
> +
> +	if (flags)
> +		*flags = spec[1];
> +
> +	return offset + line;
> +}
> +EXPORT_SYMBOL(of_gpio_banked_xlate);

Adding above two functions means adding new GPIO bindings (may be optional,
but common).

> +
>   /**
>    * of_mm_gpiochip_add_data - Add memory mapped GPIO chip (bank)
>    * @np:		device node of the GPIO chip
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index c15fb858848a..b3bd19b793d3 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1765,6 +1765,57 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
>   	gpiochip->to_irq = gpiochip_to_irq;
>   	gpiochip->irq.default_type = type;
>   
> +	if (gpiochip->num_banks > 0 && !gpiochip->irq.map) {
> +		struct gpio_irq_chip *irq = &gpiochip->irq;
> +		unsigned int i, j, offset = 0;
> +
> +		if (!irq->parents) {
> +			chip_err(gpiochip, "no parent interrupts defined\n");
> +			return -EINVAL;
> +		}
> +
> +		irq->map = devm_kcalloc(gpiochip->parent, gpiochip->ngpio,
> +					sizeof(*irq->map), GFP_KERNEL);
> +		if (!irq->map)
> +			return -ENOMEM;
> +
> +		for (i = 0; i < gpiochip->num_banks; i++) {
> +			struct gpio_bank *bank = gpiochip->banks[i];
> +			unsigned int parent = bank->parent_irq;



> +
> +			for (j = 0; j < bank->num_lines; j++) {
> +				if (parent >= irq->num_parents) {
> +					chip_err(gpiochip,
> +						 "invalid parent interrupt: %u\n",
> +						 parent);
> +					return -EINVAL;
> +				}
> +
> +				irq->map[offset + j] = irq->parents[parent];
> +			}
> +
> +			offset += bank->num_lines;

Most of gpio drivers, you've listed in [1], have only one parent
(waste of memory). There should be way not to store it permanently.

> +		}
> +	}
> +
> +	if (gpiochip->num_banks > 0) {
> +		unsigned int i;
> +
> +		for (i = 0; i < gpiochip->num_banks; i++) {
> +			struct gpio_bank *bank = gpiochip->banks[i];
> +			unsigned int num_lines = bank->num_lines;
> +
> +			bank->pending = devm_kcalloc(gpiochip->parent,
> +						     BITS_TO_LONGS(num_lines),
> +						     sizeof(unsigned long),
> +						     GFP_KERNEL);
> +			if (!bank->pending)
> +				return -ENOMEM;
> +
> +			bank->chip = gpiochip;
> +		}
> +	}
> +
>   	if (gpiochip->irq.domain_ops)
>   		ops = gpiochip->irq.domain_ops;
>   	else
> @@ -1973,6 +2024,53 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
>   }
>   EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
>   
> +/**
> + * gpio_irq_chip_banked_chained_handler - interrupt handler for banked IRQ chips
> + * @desc: IRQ descriptor
> + *
> + * Drivers can use this interrupt handler for banked GPIO controllers. This
> + * implementation iterates over all banks and handles pending interrupts of
> + * the pins associated with the bank.
> + *
> + * This function uses driver specific parts, split out into the
> + * &gpio_chip.update_bank() callback, to retrieves the interrupt pending
> + * state for each of the GPIOs exposed by the given bank.
> + */
> +void gpio_irq_chip_banked_chained_handler(struct irq_desc *desc)
> +{
> +	struct gpio_chip *gpio = irq_desc_get_handler_data(desc);

As per Patch 1 - there are no restriction to use parent_handler_data with
this standard handler - in this case parent_handler_data might not be struct gpio_chip.

> +	struct irq_chip *irq = irq_desc_get_chip(desc);
> +	unsigned int parent = irq_desc_get_irq(desc);
> +	struct gpio_irq_chip *chip = &gpio->irq;
> +	unsigned int i, offset = 0;
> +
> +	chained_irq_enter(irq, desc);
> +
> +	for (i = 0; i < gpio->num_banks; i++) {
> +		struct gpio_bank *bank = gpio->banks[i];
> +		unsigned int line, virq;
> +
> +		if (parent != chip->parents[bank->parent_irq])
> +			goto skip;

You've used this handler in gpio-tegra.c. 
So for compatible = "nvidia,tegra20-gpio":
- there are will be 7 parent irqs/banks.
- gpiochip will be used as chained_handler data.

So, how will it work:
- for bank0 it will take 1 iteration to get correct bank structure
- but for bank7 - 7 iteration always (in hot path?)

> +
> +		chip->update_bank(bank);

Half of gpio drivers, you've listed in [1] required access to common
Interrupt status registers before proceeding to banks.

> +
> +		for_each_set_bit(line, bank->pending, bank->num_lines) {
> +			virq = irq_find_mapping(chip->domain, offset + line);
> +			if (WARN_ON(virq == 0))
> +				continue;

drivers might require to do additional action before/after generic_handle_irq()
(intel_mid_irq_handler())

> +
> +			generic_handle_irq(virq);
> +		}
> +
> +skip:
> +		offset += bank->num_lines;
> +	}
> +
> +	chained_irq_exit(irq, desc);
> +}
> +EXPORT_SYMBOL_GPL(gpio_irq_chip_banked_chained_handler);

chained IRQ handler is not RT friendly (no control from User space)

> +
>   #else /* CONFIG_GPIOLIB_IRQCHIP */
>   
>   static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index c453e0716228..3caa08b3d2b6 100644

[...]

>   
>   /**
> 



[1] https://www.spinics.net/lists/linux-tegra/msg31105.html

-- 
regards,
-grygorii
