From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2 14/16] gpio: Add support for banked GPIO controllers
Date: Tue, 10 Oct 2017 17:12:35 -0500
Message-ID: <2ac1bb4c-35c4-00c1-b16a-7ee2cfc053b5@ti.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <20170928095628.21966-15-thierry.reding@gmail.com>
 <ff3b45ec-2af0-5f34-aae8-bb54e892a64a@ti.com> <20171010110050.GB24484@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171010110050.GB24484@ulmo>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 10/10/2017 06:00 AM, Thierry Reding wrote:
> On Mon, Oct 09, 2017 at 04:52:21PM -0500, Grygorii Strashko wrote:
>>
>>
>> On 09/28/2017 04:56 AM, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Some GPIO controllers are subdivided into multiple logical blocks called
>>> banks (or ports). This is often caused by the design assigning separate
>>> resources, such as register regions or interrupts, to each bank, or some
>>> set of banks.
>>>
>>> This commit adds support for describing controllers that have such a
>>> banked design and provides common code for dealing with them.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>    drivers/gpio/gpiolib-of.c   | 101 +++++++++++++++++++++++++++++++++++++++++
>>>    drivers/gpio/gpiolib.c      |  98 ++++++++++++++++++++++++++++++++++++++++
>>>    include/linux/gpio/driver.h | 108 ++++++++++++++++++++++++++++++++++++++++++++
>>>    include/linux/of_gpio.h     |  10 ++++
>>>    4 files changed, 317 insertions(+)
>>>
>>> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
>>> index bfcd20699ec8..9baabe00966d 100644
>>> --- a/drivers/gpio/gpiolib-of.c
>>> +++ b/drivers/gpio/gpiolib-of.c
>>> @@ -309,6 +309,107 @@ int of_gpio_simple_xlate(struct gpio_chip *gc,
>>>    }
>>>    EXPORT_SYMBOL(of_gpio_simple_xlate);
>>>    
>>> +/**
>>> + * gpio_banked_irq_domain_xlate - decode an IRQ specifier for banked chips
>>> + * @domain: IRQ domain
>>> + * @np: device tree node
>>> + * @spec: IRQ specifier
>>> + * @size: number of cells in IRQ specifier
>>> + * @hwirq: return location for the hardware IRQ number
>>> + * @type: return location for the IRQ type
>>> + *
>>> + * Translates the IRQ specifier found in device tree into a hardware IRQ
>>> + * number and an interrupt type.
>>> + *
>>> + * Returns:
>>> + * 0 on success or a negative error code on failure.
>>> + */
>>> +int gpio_banked_irq_domain_xlate(struct irq_domain *domain,
>>> +				 struct device_node *np,
>>> +				 const u32 *spec, unsigned int size,
>>> +				 unsigned long *hwirq,
>>> +				 unsigned int *type)
>>> +{
>>> +	struct gpio_chip *gc = domain->host_data;
>>> +	unsigned int bank, line, i, offset = 0;
>>> +
>>> +	if (size < 2)
>>> +		return -EINVAL;
>>> +
>>> +	bank = (spec[0] >> gc->of_gpio_bank_mask) & gc->of_gpio_bank_shift;
>>> +	line = (spec[0] >> gc->of_gpio_line_mask) & gc->of_gpio_line_shift;
>>> +
>>> +	if (bank >= gc->num_banks) {
>>> +		dev_err(gc->parent, "invalid bank number: %u\n", bank);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (line >= gc->banks[bank]->num_lines) {
>>> +		dev_err(gc->parent, "invalid line number: %u\n", line);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	for (i = 0; i < bank; i++)
>>> +		offset += gc->banks[i]->num_lines;
>>
>> Just to clarify, why is above iteration required?
> 
> This is used to handle the generic case where not all banks have the
> same number of lines. In order to avoid having to separately deal with
> non-existing lines, drivers are supposed to register only the exact
> number of lines they support.
> 
> However, the binding may be written such that the (bank, line) pair is
> encoded in one cell. To make that easier to construct and parse, simple
> OR'ing is used, perhaps like this:
> 
> 	index = (((bank) << 3) | (line))
> 
> However, if not all banks have 8 lines, this leaves blanks in the number
> space when working your way back.
> 
> So the above iteration maps the sparse number space of the specifier to
> the dense number space of per-chip lines.

Wouldn't it be reasonable to save GPIO offset in struct gpio_bank - it's
one time configuration.

> 
>>> +	*type = spec[1] & IRQ_TYPE_SENSE_MASK;
>>> +	*hwirq = offset + line;
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(gpio_banked_irq_domain_xlate);
>>> +
>>> +/**
>>> + * of_gpio_banked_xlate - translate GPIO specifier to a GPIO number and flags
>>> + * @gc: GPIO chip
>>> + * @gpiospec: GPIO specifier
>>> + * @flags: return location for flags parsed from the GPIO specifier
>>> + *
>>> + * This translation function takes into account multiple banks that can make
>>> + * up a single controller. Each bank can contain one or more pins. A single
>>> + * cell in the specifier is used to represent a (bank, pin) pair, with each
>>> + * encoded in different fields. The &gpio_chip.of_gpio_bank_shift and
>>> + * &gpio_chip.of_gpio_bank_mask fields, and &gpio_chip.of_gpio_line_shift and
>>> + * &gpio_chip.of_gpio_line_mask are used to specify the encoding.
>>> + *
>>> + * Returns:
>>> + * The chip-relative index of the pin given by the GPIO specifier.
>>> + */
>>> +int of_gpio_banked_xlate(struct gpio_chip *gc,
>>> +			 const struct of_phandle_args *gpiospec, u32 *flags)
>>> +{
>>> +	unsigned int offset = 0, bank, line, i;
>>> +	const u32 *spec = gpiospec->args;
>>> +
>>> +	if (WARN_ON(gc->of_gpio_n_cells < 2))
>>> +		return -EINVAL;
>>> +
>>> +	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
>>> +		return -EINVAL;
>>> +
>>> +	bank = (spec[0] >> gc->of_gpio_bank_shift) & gc->of_gpio_bank_mask;
>>> +	line = (spec[0] >> gc->of_gpio_line_shift) & gc->of_gpio_line_mask;
>>> +
>>> +	if (bank >= gc->num_banks) {
>>> +		dev_err(gc->parent, "invalid bank number: %u\n", bank);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (line >= gc->banks[bank]->num_lines) {
>>> +		dev_err(gc->parent, "invalid line number: %u\n", line);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	for (i = 0; i < bank; i++)
>>> +		offset += gc->banks[i]->num_lines;
>>> +
>>> +	if (flags)
>>> +		*flags = spec[1];
>>> +
>>> +	return offset + line;
>>> +}
>>> +EXPORT_SYMBOL(of_gpio_banked_xlate);
>>
>> Adding above two functions means adding new GPIO bindings (may be optional,
>> but common).
> 
> No. This function is used to parse bindings that use an encoding of
> (bank, line) pairs in one cell. Tegra and Tegra186 are two such
> examples, though they seem to be the only ones doing this.

They are only one such examples ;)

Again two cells <bank/port> <pin> mach more user friendly as for me.


> 
>>
>>> +
>>>    /**
>>>     * of_mm_gpiochip_add_data - Add memory mapped GPIO chip (bank)
>>>     * @np:		device node of the GPIO chip
>>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>>> index c15fb858848a..b3bd19b793d3 100644
>>> --- a/drivers/gpio/gpiolib.c
>>> +++ b/drivers/gpio/gpiolib.c
>>> @@ -1765,6 +1765,57 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
>>>    	gpiochip->to_irq = gpiochip_to_irq;
>>>    	gpiochip->irq.default_type = type;
>>>    
>>> +	if (gpiochip->num_banks > 0 && !gpiochip->irq.map) {
>>> +		struct gpio_irq_chip *irq = &gpiochip->irq;
>>> +		unsigned int i, j, offset = 0;
>>> +
>>> +		if (!irq->parents) {
>>> +			chip_err(gpiochip, "no parent interrupts defined\n");
>>> +			return -EINVAL;
>>> +		}
>>> +
>>> +		irq->map = devm_kcalloc(gpiochip->parent, gpiochip->ngpio,
>>> +					sizeof(*irq->map), GFP_KERNEL);
>>> +		if (!irq->map)
>>> +			return -ENOMEM;
>>> +
>>> +		for (i = 0; i < gpiochip->num_banks; i++) {
>>> +			struct gpio_bank *bank = gpiochip->banks[i];
>>> +			unsigned int parent = bank->parent_irq;
>>
>>
>>
>>> +
>>> +			for (j = 0; j < bank->num_lines; j++) {
>>> +				if (parent >= irq->num_parents) {
>>> +					chip_err(gpiochip,
>>> +						 "invalid parent interrupt: %u\n",
>>> +						 parent);
>>> +					return -EINVAL;
>>> +				}
>>> +
>>> +				irq->map[offset + j] = irq->parents[parent];
>>> +			}
>>> +
>>> +			offset += bank->num_lines;
>>
>> Most of gpio drivers, you've listed in [1], have only one parent
>> (waste of memory). There should be way not to store it permanently.
> 
> I'm sure we can find a way to special-case this for optimization. The
> condition above could be extended to include
> 
> 	gpiochip->irq.num_parents > 1
> 
> And a similar special case added to gpiochip_to_irq() to set the single
> parent if no map is available.


> 
>>> +		}
>>> +	}
>>> +
>>> +	if (gpiochip->num_banks > 0) {
>>> +		unsigned int i;
>>> +
>>> +		for (i = 0; i < gpiochip->num_banks; i++) {
>>> +			struct gpio_bank *bank = gpiochip->banks[i];
>>> +			unsigned int num_lines = bank->num_lines;
>>> +
>>> +			bank->pending = devm_kcalloc(gpiochip->parent,
>>> +						     BITS_TO_LONGS(num_lines),
>>> +						     sizeof(unsigned long),
>>> +						     GFP_KERNEL);
>>> +			if (!bank->pending)
>>> +				return -ENOMEM;
>>> +
>>> +			bank->chip = gpiochip;
>>> +		}
>>> +	}
>>> +
>>>    	if (gpiochip->irq.domain_ops)
>>>    		ops = gpiochip->irq.domain_ops;
>>>    	else
>>> @@ -1973,6 +2024,53 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
>>>    }
>>>    EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
>>>    
>>> +/**
>>> + * gpio_irq_chip_banked_chained_handler - interrupt handler for banked IRQ chips
>>> + * @desc: IRQ descriptor
>>> + *
>>> + * Drivers can use this interrupt handler for banked GPIO controllers. This
>>> + * implementation iterates over all banks and handles pending interrupts of
>>> + * the pins associated with the bank.
>>> + *
>>> + * This function uses driver specific parts, split out into the
>>> + * &gpio_chip.update_bank() callback, to retrieves the interrupt pending
>>> + * state for each of the GPIOs exposed by the given bank.
>>> + */
>>> +void gpio_irq_chip_banked_chained_handler(struct irq_desc *desc)
>>> +{
>>> +	struct gpio_chip *gpio = irq_desc_get_handler_data(desc);
>>
>> As per Patch 1 - there are no restriction to use parent_handler_data with
>> this standard handler - in this case parent_handler_data might not be struct gpio_chip.
> 
> Well, that would have to be considered a driver bug. I can add a comment
> to the kerneldoc about this if you have any concerns.

It would be good to have Documentation/gpio/driver.txt updated actually.

> 
>>> +	struct irq_chip *irq = irq_desc_get_chip(desc);
>>> +	unsigned int parent = irq_desc_get_irq(desc);
>>> +	struct gpio_irq_chip *chip = &gpio->irq;
>>> +	unsigned int i, offset = 0;
>>> +
>>> +	chained_irq_enter(irq, desc);
>>> +
>>> +	for (i = 0; i < gpio->num_banks; i++) {
>>> +		struct gpio_bank *bank = gpio->banks[i];
>>> +		unsigned int line, virq;
>>> +
>>> +		if (parent != chip->parents[bank->parent_irq])
>>> +			goto skip;
>>
>> You've used this handler in gpio-tegra.c.
>> So for compatible = "nvidia,tegra20-gpio":
>> - there are will be 7 parent irqs/banks.
>> - gpiochip will be used as chained_handler data.
>>
>> So, how will it work:
>> - for bank0 it will take 1 iteration to get correct bank structure
>> - but for bank7 - 7 iteration always (in hot path?)
> 
> Yes, that's correct. This could potentially be optimized by passing in
> the right bank as handler data. I think the above code is fairly simple
> and straightforward, and this is quite little overhead, so I'm not sure
> it's very useful to optimize at this point.

I'm not sure about this handler at all. HW IRQ handler is usually very
HW specific and well optimized, so as for me it should not be generic.
And it any way can be used for sleepable controllers. 
And for Edge IRQs handling it might be reasonable to read IRQ status and handle IRQs 
in IRQ handler in cycle.
...


> 
>>> +
>>> +		chip->update_bank(bank);
>>
>> Half of gpio drivers, you've listed in [1] required access to common
>> Interrupt status registers before proceeding to banks.
> 
> I'm sure we can add some additional callback(s) to account for those
> cases.

How many? ;)

> 
>>> +
>>> +		for_each_set_bit(line, bank->pending, bank->num_lines) {
>>> +			virq = irq_find_mapping(chip->domain, offset + line);
>>> +			if (WARN_ON(virq == 0))
>>> +				continue;
>>
>> drivers might require to do additional action before/after generic_handle_irq()
>> (intel_mid_irq_handler())
> 
> That could be done from within ->update_bank(). Or it could be done in
> an additional callback if necessary. Alternatively they may just not be
> able to use this particular implementation and just provide their own
> instead. This isn't meant to be a universal solution for every case, but
> rather provide a meaningful helper that can be used when appropriate to
> reduce boilerplate.

My opinion - It's better not to introduce generic IRQ handler at all as there
are too many variations in IRQ registers processing.

> 
>>> +
>>> +			generic_handle_irq(virq);
>>> +		}
>>> +
>>> +skip:
>>> +		offset += bank->num_lines;
>>> +	}
>>> +
>>> +	chained_irq_exit(irq, desc);
>>> +}
>>> +EXPORT_SYMBOL_GPL(gpio_irq_chip_banked_chained_handler);
>>
>> chained IRQ handler is not RT friendly (no control from User space)
> 
> I don't understand this comment. What are you suggesting?

Documentation/gpio/driver.txt Real-Time compliance for GPIO IRQ chips


-- 
regards,
-grygorii
