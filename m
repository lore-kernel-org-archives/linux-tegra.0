From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2 15/16] gpio: tegra: Use banked GPIO infrastructure
Date: Tue, 10 Oct 2017 14:31:15 -0500
Message-ID: <ad79e202-1fdd-81d3-f0f6-925eed5049c1@ti.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <20170928095628.21966-16-thierry.reding@gmail.com>
 <dfeb33cf-34b5-259d-cf83-f065d75444f3@ti.com> <20171010102727.GA24484@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171010102727.GA24484@ulmo>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 10/10/2017 05:27 AM, Thierry Reding wrote:
> On Mon, Oct 09, 2017 at 04:22:29PM -0500, Grygorii Strashko wrote:
>>
>>
>> On 09/28/2017 04:56 AM, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Convert the Tegra GPIO driver to use the banked GPIO infrastructure,
>>> which simplifies some parts of the driver.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>    drivers/gpio/Kconfig      |   1 +
>>>    drivers/gpio/gpio-tegra.c | 203 ++++++++++++++++++++++------------------------
>>>    2 files changed, 98 insertions(+), 106 deletions(-)
>>>
>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>>> index db3e446ad9b3..458157d6d491 100644
>>> --- a/drivers/gpio/Kconfig
>>> +++ b/drivers/gpio/Kconfig
>>> @@ -439,6 +439,7 @@ config GPIO_TEGRA
>>>    	default ARCH_TEGRA
>>>    	depends on ARCH_TEGRA || COMPILE_TEST
>>
>> ...
>>
>>> @@ -616,76 +617,66 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>>>    	tgi->ic.irq_set_wake		= tegra_gpio_irq_set_wake;
>>>    #endif
>>>    
>>> +	irq = &tgi->gc.irq;
>>> +	irq->chip = &tgi->ic;
>>> +	irq->handler = handle_simple_irq;
>>> +	irq->lock_key = &tegra_gpio_lock_class;
>>
>> As per current gpiolib design lockdep lock_class_key is assigned
>> automatically and hidden from gpiolib users.
>> Why do you need to do the same manually?
> 
> Can you elaborate? I don't see the lock class key getting set anywhere.
> gpiolib does set if for interrupts, but only if the drivers assigned it
> before adding the chip.
> 

include/linux/gpio/driver.h

#ifdef CONFIG_LOCKDEP

/*
 * Lockdep requires that each irqchip instance be created with a
 * unique key so as to avoid unnecessary warnings. This upfront
 * boilerplate static inlines provides such a key for each
 * unique instance.
 */
static inline int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
				       struct irq_chip *irqchip,
				       unsigned int first_irq,
				       irq_flow_handler_t handler,
				       unsigned int type)
{
	static struct lock_class_key key;
^^^

	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
					handler, type, false, &key);
}
 

-- 
regards,
-grygorii
