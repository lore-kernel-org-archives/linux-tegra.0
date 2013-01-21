From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [v2 1/1] ARM: Add API to detect SCU base address from CP15
Date: Mon, 21 Jan 2013 15:31:55 +0000
Message-ID: <20130121153155.GK23505@n2100.arm.linux.org.uk>
References: <50F97E19.8070607@wwwdotorg.org> <1358754175-15484-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358754175-15484-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 21, 2013 at 09:42:55AM +0200, Hiroshi Doyu wrote:
> Add API to detect SCU base address from CP15.
> 
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> ---
> For usage: http://patchwork.ozlabs.org/patch/212013/
> ---
>  arch/arm/include/asm/smp_scu.h |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/include/asm/smp_scu.h b/arch/arm/include/asm/smp_scu.h
> index 4eb6d00..1733ec7 100644
> --- a/arch/arm/include/asm/smp_scu.h
> +++ b/arch/arm/include/asm/smp_scu.h
> @@ -6,6 +6,18 @@
>  #define SCU_PM_POWEROFF	3
>  
>  #ifndef __ASSEMBLER__
> +
> +#include <asm/cputype.h>
> +
> +static inline phys_addr_t scu_get_base(void)
> +{
> +	if (read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A9) {
> +		phys_addr_t pa;
> +		asm("mrc p15, 4, %0, c15, c0, 0" : "=r" (pa));
> +		return pa;
> +	}
> +	return 0;
> +}
>  unsigned int scu_get_core_count(void __iomem *);
>  void scu_enable(void __iomem *);
>  int scu_power_mode(void __iomem *, unsigned int);

Not sure what iteration this patch is at but... it's easy to avoid more
iterations when you review the patch yourself before sending.

Reasonable coding style suggests there should be a blank line after the
new } and before the prototypes.

However, as I _am_ commenting on this patch because of the above, I'll
also suggest that we don't do it like this.  And actually, the above
code is buggy.  If phys_addr_t is 64-bit, the upper half of 'pa' won't
be set.

I'd suggest this instead:

static inline bool scu_a9_has_base(void)
{
	return read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A9;
}

static inline unsigned long scu_a9_get_base(void)
{
	unsigned long pa;

	asm("mrc p15, 4, %0, c15, c0, 0" : "=r" (pa));

	return pa;
}

and let the user of these functions decide whether to read it using
scu_a9_has_base().

And why 'unsigned long' ?  Well, it could also be u32, but on 32-bit
ARM, it's been more conventional to use unsigned long for phys addresses
which can't be larger than 32-bit - which this one can't because the
mrc instruction is limited to writing one 32-bit register.
