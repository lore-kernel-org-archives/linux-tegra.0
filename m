From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 00/12] gpio: Tight IRQ chip integration
Date: Tue, 7 Nov 2017 10:49:58 -0600
Message-ID: <87fd58e7-8f46-5660-9c23-189e656529e0@ti.com>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
 <ca8c7138-2e87-0481-ac8c-7077bed749f6@ti.com> <20171106111807.GA6756@ulmo>
 <e5996910-43a0-a75e-5f7f-a0606e05d914@ti.com> <20171107111344.GA7314@ulmo>
 <20171107115238.GB7314@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171107115238.GB7314@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 11/07/2017 05:52 AM, Thierry Reding wrote:
> On Tue, Nov 07, 2017 at 12:13:44PM +0100, Thierry Reding wrote:
>> On Mon, Nov 06, 2017 at 05:13:33PM -0600, Grygorii Strashko wrote:
>>> On 11/06/2017 05:18 AM, Thierry Reding wrote:
>>>> On Fri, Nov 03, 2017 at 05:30:30PM -0500, Grygorii Strashko wrote:
> [...]
>>>>> @@ -312,8 +321,29 @@ struct gpio_chip {
>>>>>    extern const char *gpiochip_is_requested(struct gpio_chip *chip,
>>>>>    			unsigned offset);
>>>>>    
>>>>> +extern int gpiochip_add_data_key(struct gpio_chip *chip, void *data,
>>>>> +				 struct  *irq_lock_key);
>>>>> +#ifdef CONFIG_LOCKDEP
>>>>> +/*
>>>>> + * Lockdep requires that each irqchip instance be created with a
>>>>> + * unique key so as to avoid unnecessary warnings. This upfront
>>>>> + * boilerplate static inlines provides such a key for each
>>>>> + * unique instance which is created now from inside gpiochip_add_data_key().
>>>>> + */
>>>>> +static inline int gpiochip_add_data(struct gpio_chip *chip, void *data)
>>>>> +{
>>>>> +	static struct lock_class_key key;
>>>>> +
>>>>> +	return gpiochip_add_data_key(chip, data, key);
>>>>> +}
>>>>
>>>> This looks like a neat improvement, but I think it can be done in a
>>>> follow-up to remove the boilerplate in drivers.
>>>
>>> Can't agree here - it better to be considered now.
>>> Now only two GPIO drivers define lock_class_key:
>>> ./drivers/gpio/gpio-bcm-kona.c:static struct lock_class_key gpio_lock_class;
>>> ./drivers/gpio/gpio-brcmstb.c:static struct lock_class_key brcmstb_gpio_irq_lock_class;
>>>
>>> and these drivers do not use gpioirq framework (your tegra driver will be the third).
>>>
>>> So, if proposed changes will be applied all drivers switched to use it will need to define
>>> its own lock_class_key again and it will be step back.
>>
>> I think this would be a minor, mostly mechanical refactoring to do as
>> follow-up. But since you feel very strongly about it, I'll add that into
>> the series.
> 
> After implementing this, I'm having second thoughts. We've got a bunch
> of drivers calling gpiochip_add_data() that never register an IRQ chip
> but which will each add a struct lock_class_key after this change, and
> it will never be used. Now, struct lock_class_key is only 8 bytes big,
> so maybe this isn't a big deal, but it still seems like a waste.

True. And this I've called my approach not ideal, but I do not see other way to do it :(
- that's price to pay for gpioirq chip initialization integration in
gpiochip_add_data() which limits APIs variation used by GPIO drivers. 

Any other opinions, thoughts?

-- 
regards,
-grygorii
