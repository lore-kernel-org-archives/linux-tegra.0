From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v6 00/12] gpio: Tight IRQ chip integration
Date: Mon, 6 Nov 2017 17:13:33 -0600
Message-ID: <e5996910-43a0-a75e-5f7f-a0606e05d914@ti.com>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
 <ca8c7138-2e87-0481-ac8c-7077bed749f6@ti.com> <20171106111807.GA6756@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171106111807.GA6756@ulmo>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 11/06/2017 05:18 AM, Thierry Reding wrote:
> On Fri, Nov 03, 2017 at 05:30:30PM -0500, Grygorii Strashko wrote:
>> Hi
>>
>> On 11/02/2017 12:49 PM, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Hi Linus,
>>>
>>> here's the latest series of patches that implement the tighter IRQ chip
>>> integration. I've dropped the banked infrastructure for now as per the
>>> discussion with Grygorii.
>>>
>>> The first couple of patches are mostly preparatory work in order to
>>> consolidate all IRQ chip related fields in a new structure and create
>>> the base functionality for adding IRQ chips.
>>>
>>> After that, I've added the Tegra186 GPIO support patch that makes use of
>>> the new tight integration.
>>>
>>> Changes in v6:
>>> - rebased on latest linux-gpio devel branch
>>> - one patch dropped due to rebase
>>>
>>> Changes in v5:
>>> - dropped the banked infrastructure patches for now (Grygorii)
>>> - allocate interrupts on demand, rather than upfront (Grygorii)
>>> - split up the first patch further as requested by Grygorii
>>>
>>> Not sure what happened in between here. Notes in commit logs indicate
>>> that this is actually version 5, but I can't find the cover letter for
>>> v3 and v4.
>>>
>>> Changes in v2:
>>> - rename pins to lines for consistent terminology
>>> - rename gpio_irq_chip_banked_handler() to
>>>     gpio_irq_chip_banked_chained_handler()
>>>
>>
>> Sry, for delayed reply, very sorry.
>>
>> Patches 1 - 9, 11 : looks good, so
>> Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
>>
>> Patch 10 - unfortunately not all my comment were incorporated [1],
>> so below diff on top of patch 10
>> which illustrates what i want and also converts gpio-omap to use new infra as
>> test for this new infra.
>>
>> Pls, take a look
>>
>> [1] https://www.spinics.net/lists/linux-tegra/msg31145.html
> 
> Most of the changes I had deemed to be material for follow-up patches
> since they aren't immediately relevant to the gpio_irq_chip conversion
> nor needed by the Tegra186 patch.
> 
> However, a couple of the hunks below seem like they should be part of
> the initial series.
> 
>> -----------><-------------
>>  From 210fe3ad7a642691a1b7603e441f6980b10ff2b4 Mon Sep 17 00:00:00 2001
>> From: Grygorii Strashko <grygorii.strashko@ti.com>
>> Date: Fri, 3 Nov 2017 17:24:51 -0500
>> Subject: [PATCH] [not for merge] gpiolib: update and test new gpioirq chip
>>   infra
>>
>> changes in gpiolib:
>>   - move set_parent to gpiochip_irq_map() and use parents instead of map for only
>>     one parent
>>   - add gpio_irq_chip->first_irq for static IRQ allocation
>>   - fix nested = true if parent_handler not set
>>   - fix gpiochip_irqchip_remove() if parent_handler not set
>>   - get of_node from gpiodev
>>   - fix lock_key: drivers do not need to set it, but looks a bit overcomplicated
>>     as lock_class_key will be created for each gpiochip_add_data() call.
>>     Honestly, do not seem better way :(
>>
>> GPIO OMAP driver updated to use new gpioirq chip infra and tested on am335x-evm.
>> seems it's working - can see irqs from keys.
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>>   drivers/gpio/gpio-omap.c    | 36 ++++++++++++++--------------
>>   drivers/gpio/gpiolib.c      | 58 +++++++++++++++++++--------------------------
>>   include/linux/gpio/driver.h | 32 ++++++++++++++++++++++++-
>>   3 files changed, 73 insertions(+), 53 deletions(-)
> [...]
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> [...]
>> @@ -1642,6 +1644,7 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
>>   			    irq_hw_number_t hwirq)
>>   {
>>   	struct gpio_chip *chip = d->host_data;
>> +	int err = 0;
>>   
>>   	if (!gpiochip_irqchip_irq_valid(chip, hwirq))
>>   		return -ENXIO;
>> @@ -1658,6 +1661,12 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
>>   		irq_set_nested_thread(irq, 1);
>>   	irq_set_noprobe(irq);
>>   
>> +	if (chip->irq.num_parents == 1)
>> +		err = irq_set_parent(irq, chip->irq.parents[0]);
>> +	else if (chip->irq.map)
>> +		err = irq_set_parent(irq, chip->irq.map[hwirq]);
>> +	if (err < 0)
>> +		return err;
> 
> Yeah, this looks sensible. Both in that this is a slightly better place
> to call it and that the handling for num_parents == 1 is necessary, too.
> 
>>   	/*
>>   	 * No set-up of the hardware will happen if IRQ_TYPE_NONE
>>   	 * is passed as default type.
>> @@ -1712,30 +1721,18 @@ static void gpiochip_irq_relres(struct irq_data *d)
>>   
>>   static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
>>   {
>> -	unsigned int irq;
>> -	int err;
>> -
>>   	if (!gpiochip_irqchip_irq_valid(chip, offset))
>>   		return -ENXIO;
>>   
>> -	irq = irq_create_mapping(chip->irq.domain, offset);
>> -	if (!irq)
>> -		return 0;
>> -
>> -	if (chip->irq.map) {
>> -		err = irq_set_parent(irq, chip->irq.map[offset]);
>> -		if (err < 0)
>> -			return err;
>> -	}
>> -
>> -	return irq;
>> +	return irq_create_mapping(chip->irq.domain, offset);
>>   }
>>   
>>   /**
>>    * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
>>    * @gpiochip: the GPIO chip to add the IRQ chip to
>>    */
>> -static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
>> +static int gpiochip_add_irqchip_key(struct gpio_chip *gpiochip,
>> +				    struct lock_class_key *lock_key)
>>   {
>>   	struct irq_chip *irqchip = gpiochip->irq.chip;
>>   	const struct irq_domain_ops *ops;
>> @@ -1753,17 +1750,8 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
>>   	}
>>   
>>   	type = gpiochip->irq.default_type;
>> -	np = gpiochip->parent->of_node;
>> -
>> -#ifdef CONFIG_OF_GPIO
>> -	/*
>> -	 * If the gpiochip has an assigned OF node this takes precedence
>> -	 * FIXME: get rid of this and use gpiochip->parent->of_node
>> -	 * everywhere
>> -	 */
>> -	if (gpiochip->of_node)
>> -		np = gpiochip->of_node;
>> -#endif
>> +	/* called from gpiochip_add_data() and is set properly */
>> +	np = gpiochip->gpiodev->dev.of_node;
> 
> Indeed, looks like we have this twice now.
> 
>>   
>>   	/*
>>   	 * Specifying a default trigger is a terrible idea if DT or ACPI is
>> @@ -1789,7 +1777,8 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
>>   		ops = &gpiochip_domain_ops;
>>   
>>   	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
>> -						     0, ops, gpiochip);
>> +						     gpiochip->irq.first_irq,
>> +						     ops, gpiochip);
>>   	if (!gpiochip->irq.domain)
>>   		return -EINVAL;
> 
> This seems backward. You just spent a lot of time getting rid of all
> users of first_irq (it's actually the reason why I dropped one of the
> patches from the series, since first_irq is no longer used), so why
> reintroduce it?

Yes. It required for HW/drivers not supported (or partially supported)
SPARSE_IRQ. And it's not exactly the same as dropped base_irq.
If SPARSE_IRQ not supported - driver should ensure that proper
 Linux IRQ range allocated (or reserved) and pass first_irq number to the gpiolib
For example, in case of OMAP GPIO this is required for OMAP1 support and
driver has code
  irq_base = devm_irq_alloc_descs(bank->chip.parent, -1, 0, bank->width, 0);

irq_base makes no sense in case of SPARSE_IRQ compatible driver and
therefore was removed from gpiolib to avoid mis-usage - drivers should
maintain it by itself if requred.

> 
>>   
>> @@ -1818,9 +1807,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
>>   		}
>>   
>>   		gpiochip->irq.nested = false;
>> -	} else {
>> -		gpiochip->irq.nested = true;
>>   	}
>> +	/* GPIO driver might not specify parent_handler, but it doesn't mean
>> +	 * it's irq_nested, as driver may use request_irq() */
> 
> That's certainly how irq_nested is used in gpiolib, though. Interrupts
> are considered either cascaded or nested. Maybe this needs clarification
> in general?

No. Please, take closer look at 
gpiochip_set_nested_irqchip() 
gpiochip_set_cascaded_irqchip()
gpiochip_set_chained_irqchip()
gpiochip_set_nested_irqchip()
 and how they are used.
Also, take a look on OMAP driver - it doesn't install chained handler.

gpiolib now can discover automatically only when child irqs are not nested
(nested here means - threaded nested), therefore different APIs were introduced
gpiochip_set_chained_irqchip()
gpiochip_set_nested_irqchip()

So, with your change:
- nested = false; can be set auto if parent_handler provided
- nested = <set by driver> if no parent_handler provided
because with this patch full GPIO IRQ configuration expected to be done
from inside  gpiochip_add_data().

> 
>>   
>>   	acpi_gpiochip_request_interrupts(gpiochip);
>>   
>> @@ -1839,7 +1828,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
>>   
>>   	acpi_gpiochip_free_interrupts(gpiochip);
>>   
>> -	if (gpiochip->irq.chip) {
>> +	if (gpiochip->irq.chip && gpiochip->irq.parent_handler) {
>>   		struct gpio_irq_chip *irq = &gpiochip->irq;
>>   		unsigned int i;
>>   
> 
> Yeah, this seems like a good idea, though I think this is safe
> regardless of irq.parent_handler.
> 
>> @@ -1972,7 +1961,8 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
>>   
>>   #else /* CONFIG_GPIOLIB_IRQCHIP */
>>   
>> -static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
>> +static inline int gpiochip_add_irqchip_key(struct gpio_chip *gpiochip,
>> +					   struct lock_class_key *lock_key)
>>   {
>>   	return 0;
>>   }
>> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
>> index 51fc7b0..3254996 100644
>> --- a/include/linux/gpio/driver.h
>> +++ b/include/linux/gpio/driver.h
>> @@ -128,6 +128,15 @@ struct gpio_irq_chip {
>>   	 * in IRQ domain of the chip.
>>   	 */
>>   	unsigned long *valid_mask;
>> +
>> +	/**
>> +	 * @first_irq:
>> +	 *
>> +	 * Required for static irq allocation.
>> +	 * if set irq_domain_add_simple() will allocate and map all IRQs
>> +	 * during initialization.
>> +	 */
>> +	unsigned int first_irq;
> 
> Again, what was the point of removing all users of this if we need to
> add it again?
> 
> It seems to me like dynamic allocation should be a prerequisite for
> drivers to use this new code, otherwise we'll just end up adding special
> cases to this otherwise generic code.

The idea, as i see it, is to be able to re-use you change for as much drivers
as possible (as I illustrated for OMAP) and in this case we need support backward
compatibility with non SPARSE_IRQ compatible drivers.

> 
>>   };
>>   
>>   static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
>> @@ -312,8 +321,29 @@ struct gpio_chip {
>>   extern const char *gpiochip_is_requested(struct gpio_chip *chip,
>>   			unsigned offset);
>>   
>> +extern int gpiochip_add_data_key(struct gpio_chip *chip, void *data,
>> +				 struct  *irq_lock_key);
>> +#ifdef CONFIG_LOCKDEP
>> +/*
>> + * Lockdep requires that each irqchip instance be created with a
>> + * unique key so as to avoid unnecessary warnings. This upfront
>> + * boilerplate static inlines provides such a key for each
>> + * unique instance which is created now from inside gpiochip_add_data_key().
>> + */
>> +static inline int gpiochip_add_data(struct gpio_chip *chip, void *data)
>> +{
>> +	static struct lock_class_key key;
>> +
>> +	return gpiochip_add_data_key(chip, data, key);
>> +}
> 
> This looks like a neat improvement, but I think it can be done in a
> follow-up to remove the boilerplate in drivers.

Can't agree here - it better to be considered now. 
Now only two GPIO drivers define lock_class_key:
./drivers/gpio/gpio-bcm-kona.c:static struct lock_class_key gpio_lock_class;
./drivers/gpio/gpio-brcmstb.c:static struct lock_class_key brcmstb_gpio_irq_lock_class;

and these drivers do not use gpioirq framework (your tegra driver will be the third).

So, if proposed changes will be applied all drivers switched to use it will need to define
its own lock_class_key again and it will be step back.

Another question that solution I've proposed may be not ideal :(


-- 
regards,
-grygorii
