From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH V5 4/9] genirq: Add runtime power management support for
 IRQ chips
Date: Mon, 6 Jun 2016 17:13:55 +0300
Message-ID: <57558523.9070700@ti.com>
References: <1465214023-8299-1-git-send-email-jonathanh@nvidia.com>
 <1465214023-8299-5-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465214023-8299-5-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 06/06/2016 02:53 PM, Jon Hunter wrote:
> Some IRQ chips may be located in a power domain outside of the CPU
> subsystem and hence will require device specific runtime power
> management. In order to support such IRQ chips, add a pointer for a
> device structure to the irq_chip structure, and if this pointer is
> populated by the IRQ chip driver and CONFIG_PM is selected in the kernel
> configuration, then the pm_runtime_get/put APIs for this chip will be
> called when an IRQ is requested/freed, respectively.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
>   include/linux/irq.h    |  4 ++++
>   kernel/irq/chip.c      | 35 +++++++++++++++++++++++++++++++++++
>   kernel/irq/internals.h |  1 +
>   kernel/irq/manage.c    | 31 ++++++++++++++++++++++++++++++-
>   4 files changed, 70 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index 4d758a7c604a..6c92a847394d 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -315,6 +315,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
>   /**
>    * struct irq_chip - hardware interrupt chip descriptor
>    *
> + * @parent_device:	pointer to parent device for irqchip
>    * @name:		name for /proc/interrupts
>    * @irq_startup:	start up the interrupt (defaults to ->enable if NULL)
>    * @irq_shutdown:	shut down the interrupt (defaults to ->disable if NULL)
> @@ -354,6 +355,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
>    * @flags:		chip specific flags
>    */
>   struct irq_chip {
> +	struct device	*parent_device;
>   	const char	*name;
>   	unsigned int	(*irq_startup)(struct irq_data *data);
>   	void		(*irq_shutdown)(struct irq_data *data);
> @@ -488,6 +490,8 @@ extern void handle_bad_irq(struct irq_desc *desc);
>   extern void handle_nested_irq(unsigned int irq);
>   
>   extern int irq_chip_compose_msi_msg(struct irq_data *data, struct msi_msg *msg);
> +extern int irq_chip_pm_get(struct irq_data *data);
> +extern int irq_chip_pm_put(struct irq_data *data);
>   #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
>   extern void irq_chip_enable_parent(struct irq_data *data);
>   extern void irq_chip_disable_parent(struct irq_data *data);
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index 2f9f2b0e79f2..b09226e895c7 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -1093,3 +1093,38 @@ int irq_chip_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>   
>   	return 0;
>   }
> +
> +/**
> + * irq_chip_pm_get - Enable power for an IRQ chip
> + * @data:	Pointer to interrupt specific data
> + *
> + * Enable the power to the IRQ chip referenced by the interrupt data
> + * structure.
> + */
> +int irq_chip_pm_get(struct irq_data *data)
> +{
> +	int retval = 0;
> +
> +	if (IS_ENABLED(CONFIG_PM) && data->chip->parent_device)
> +		retval = pm_runtime_get_sync(data->chip->parent_device);

Sry, for the late comment - above require pm_runtime_put_noidle(data->chip->parent_device);
in case of failure.

[...]


-- 
regards,
-grygorii
