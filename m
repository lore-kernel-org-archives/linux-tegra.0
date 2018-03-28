From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCHv3] irqchip: arm-gic: take gic_lock when updating irq type
Date: Wed, 28 Mar 2018 13:21:54 +0100
Message-ID: <067de784-0f27-a8f4-3a50-b33cd8445c54@arm.com>
References: <20180328085430.3401-1-aniruddha.nitd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180328085430.3401-1-aniruddha.nitd@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Aniruddha Banerjee <aniruddha.nitd@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: aniruddhab@nvidia.com, stable@vger.kernel.org, vipink@nvidia.com, strasi@nvidia.com, swarren@nvidia.com, jonathanh@nvidia.com, talho@nvidia.com, treding@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Hi Aniruddha,

On 28/03/18 09:54, Aniruddha Banerjee wrote:
> The kernel documentation states that the locking of the irq-chip
> registers should be handled by the irq-chip driver. In the irq-gic,
> the accesses to the irqchip are seemingly not protected and multiple
> writes to SPIs from different irq descriptors do RMW requests without
> taking the irq-chip lock. When multiple irqs call the request_irq at
> the same time, there can be a simultaneous write at the gic
> distributor, leading to a race. Acquire the gic_lock when the
> irq_type is updated.
> 
> Signed-off-by: Aniruddha Banerjee <aniruddhab@nvidia.com>
> ---
> Changes from V1:
> 
> * Moved the spinlock from irq-gic to irq-gic common, so that the fix
> is valid for GIC v1/v2/v3.
> 
> Change from V2:
> 
> * Fixup the Signed-off-by line.
> 
>  drivers/irqchip/irq-gic-common.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-common.c
> index 9ae71804b5dd..73dd39959e6e 100644
> --- a/drivers/irqchip/irq-gic-common.c
> +++ b/drivers/irqchip/irq-gic-common.c
> @@ -21,6 +21,8 @@
>  
>  #include "irq-gic-common.h"
>  
> +static DEFINE_RAW_SPINLOCK(irq_controller_lock);
> +
>  static const struct gic_kvm_info *gic_kvm_info;
>  
>  const struct gic_kvm_info *gic_get_kvm_info(void)
> @@ -57,6 +59,7 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
>  	 * Read current configuration register, and insert the config
>  	 * for "irq", depending on "type".
>  	 */
> +	raw_spin_lock(&irq_controller_lock);
>  	val = oldval = readl_relaxed(base + GIC_DIST_CONFIG + confoff);
>  	if (type & IRQ_TYPE_LEVEL_MASK)
>  		val &= ~confmask;
> @@ -64,8 +67,10 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
>  		val |= confmask;
>  
>  	/* If the current configuration is the same, then we are done */
> -	if (val == oldval)
> +	if (val == oldval) {
> +		raw_spin_unlock(&irq_controller_lock);
>  		return 0;
> +	}
>  
>  	/*
>  	 * Write back the new configuration, and possibly re-enable
> @@ -83,6 +88,7 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
>  			pr_warn("GIC: PPI%d is secure or misconfigured\n",
>  				irq - 16);
>  	}
> +	raw_spin_unlock(&irq_controller_lock);
>  
>  	if (sync_access)
>  		sync_access();
> 

I've just realized a potential issue: As interrupts are not disabled
here, you could take one in the middle of this critical section. If the
interrupt handler has the stupid idea to change the trigger type of
*any* interrupt, we deadlock.

Yes, this would be a very stupid idea, but better safe than sorry.
Please use raw_pin_lock_irqsave/irqrestore instead.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
