From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V5 4/9] genirq: Add runtime power management support for
 IRQ chips
Date: Fri, 10 Jun 2016 09:05:41 +0100
Message-ID: <575A74D5.4050905@nvidia.com>
References: <1465214023-8299-1-git-send-email-jonathanh@nvidia.com>
 <1465214023-8299-5-git-send-email-jonathanh@nvidia.com>
 <57558523.9070700@ti.com> <57558909.9090309@nvidia.com>
 <57558A83.1000603@ti.com> <5755917A.7070704@nvidia.com>
 <7htwh2c6o9.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7htwh2c6o9.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 09/06/16 23:56, Kevin Hilman wrote:
> Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:
> 
>> On 06/06/16 15:36, Grygorii Strashko wrote:
>>> On 06/06/2016 05:30 PM, Jon Hunter wrote:
>>>>
>>>> On 06/06/16 15:13, Grygorii Strashko wrote:
>>>>> On 06/06/2016 02:53 PM, Jon Hunter wrote:
>>>>>> Some IRQ chips may be located in a power domain outside of the CPU
>>>>>> subsystem and hence will require device specific runtime power
>>>>>> management. In order to support such IRQ chips, add a pointer for a
>>>>>> device structure to the irq_chip structure, and if this pointer is
>>>>>> populated by the IRQ chip driver and CONFIG_PM is selected in the kernel
>>>>>> configuration, then the pm_runtime_get/put APIs for this chip will be
>>>>>> called when an IRQ is requested/freed, respectively.
>>>>>>
>>>>>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>> Reviewed-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>>>> Reviewed-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>>>>>> ---
>>>>>>    include/linux/irq.h    |  4 ++++
>>>>>>    kernel/irq/chip.c      | 35 +++++++++++++++++++++++++++++++++++
>>>>>>    kernel/irq/internals.h |  1 +
>>>>>>    kernel/irq/manage.c    | 31 ++++++++++++++++++++++++++++++-
>>>>>>    4 files changed, 70 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/include/linux/irq.h b/include/linux/irq.h
>>>>>> index 4d758a7c604a..6c92a847394d 100644
>>>>>> --- a/include/linux/irq.h
>>>>>> +++ b/include/linux/irq.h
>>>>>> @@ -315,6 +315,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
>>>>>>    /**
>>>>>>     * struct irq_chip - hardware interrupt chip descriptor
>>>>>>     *
>>>>>> + * @parent_device:	pointer to parent device for irqchip
>>>>>>     * @name:		name for /proc/interrupts
>>>>>>     * @irq_startup:	start up the interrupt (defaults to ->enable if NULL)
>>>>>>     * @irq_shutdown:	shut down the interrupt (defaults to ->disable if NULL)
>>>>>> @@ -354,6 +355,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
>>>>>>     * @flags:		chip specific flags
>>>>>>     */
>>>>>>    struct irq_chip {
>>>>>> +	struct device	*parent_device;
>>>>>>    	const char	*name;
>>>>>>    	unsigned int	(*irq_startup)(struct irq_data *data);
>>>>>>    	void		(*irq_shutdown)(struct irq_data *data);
>>>>>> @@ -488,6 +490,8 @@ extern void handle_bad_irq(struct irq_desc *desc);
>>>>>>    extern void handle_nested_irq(unsigned int irq);
>>>>>>    
>>>>>>    extern int irq_chip_compose_msi_msg(struct irq_data *data, struct msi_msg *msg);
>>>>>> +extern int irq_chip_pm_get(struct irq_data *data);
>>>>>> +extern int irq_chip_pm_put(struct irq_data *data);
>>>>>>    #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
>>>>>>    extern void irq_chip_enable_parent(struct irq_data *data);
>>>>>>    extern void irq_chip_disable_parent(struct irq_data *data);
>>>>>> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
>>>>>> index 2f9f2b0e79f2..b09226e895c7 100644
>>>>>> --- a/kernel/irq/chip.c
>>>>>> +++ b/kernel/irq/chip.c
>>>>>> @@ -1093,3 +1093,38 @@ int irq_chip_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>>>>>>    
>>>>>>    	return 0;
>>>>>>    }
>>>>>> +
>>>>>> +/**
>>>>>> + * irq_chip_pm_get - Enable power for an IRQ chip
>>>>>> + * @data:	Pointer to interrupt specific data
>>>>>> + *
>>>>>> + * Enable the power to the IRQ chip referenced by the interrupt data
>>>>>> + * structure.
>>>>>> + */
>>>>>> +int irq_chip_pm_get(struct irq_data *data)
>>>>>> +{
>>>>>> +	int retval = 0;
>>>>>> +
>>>>>> +	if (IS_ENABLED(CONFIG_PM) && data->chip->parent_device)
>>>>>> +		retval = pm_runtime_get_sync(data->chip->parent_device);
>>>>>
>>>>> Sry, for the late comment - above require pm_runtime_put_noidle(data->chip->parent_device);
>>>>> in case of failure.
>>>>
>>>> No problem. Sorry, can you elaborate? I am not familiar with the
>>>> _put_noidle().
>>>>
>>>
>>> Question here in use counter - pm_runtime_get_sync() will increment usage_count
>>> always and it will not decrement it in case of failure.
>>> pm_runtime_put_noidle() expected to restore usage_count state (-1).
>>
>> Thanks was not aware of that. 
>>
>> Kevin, Marc, given that you have reviewed this one, are you ok with the
>> above change Grygorii is proposing? 
> 
> Yes, that's the right thing to do on error.

Thanks. I have added this in V6. Please take a look and add your
reviewed-by again if all looks good.

Cheers
Jon

-- 
nvpublic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
