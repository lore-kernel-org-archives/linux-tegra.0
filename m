From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 54/97] ARM: l2c: tegra: remove associativity and way size
 from aux_ctrl
Date: Mon, 28 Apr 2014 14:22:39 -0600
Message-ID: <535EB88F.9000202@wwwdotorg.org>
References: <20140428192419.GV26756@n2100.arm.linux.org.uk> <E1WerGJ-0001XP-TI@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1WerGJ-0001XP-TI-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/28/2014 01:30 PM, Russell King wrote:
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

Peter, can you please ack this patch if you see no issue. Discussion
below...

> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c

>  static void __init tegra_init_cache(void)
>  {
>  #ifdef CONFIG_CACHE_L2X0
> -	static const struct of_device_id pl310_ids[] __initconst = {
> -		{ .compatible = "arm,pl310-cache",  },
> -		{}
> -	};
> -
> -	struct device_node *np;
>  	int ret;
> -	void __iomem *p = IO_ADDRESS(TEGRA_ARM_PERIF_BASE) + 0x3000;
> -	u32 aux_ctrl, cache_type;
> -
> -	np = of_find_matching_node(NULL, pl310_ids);
> -	if (!np)
> -		return;
> -
> -	cache_type = readl(p + L2X0_CACHE_TYPE);
> -	aux_ctrl = (cache_type & 0x700) << (17-8);
> -	aux_ctrl |= 0x3c400001;
>  
> -	ret = l2x0_of_init(aux_ctrl, 0xc200c3fe);
> +	ret = l2x0_of_init(0x3c400001, 0xc20fc3fe);
>  	if (!ret)
>  		l2x0_saved_regs_addr = virt_to_phys(&l2x0_saved_regs);
>  #endif

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I tested on both Tegra20 and Tegra30, and see bits 19:16 are 8 on both,
with or without this patch.

I know that the code above was introduced in:

01548673fa15 arm/tegra: generalize L2 cache initialization

... by Peter, as part of the port to Tegra30. However, there was no
explanation in that patch why it was needed. The existence of the patch
implies that Tegra20/30 use different way sizes or associativity for
their cache, and hence if we're going to forcibly over-write that part
of the aux register, we need to dynamically calculate the correct value
to put there. However in practice, both chips seem to use the same value
for that field anyway (unless perhaps U-Boot is trashing the field
before the kernel boots).
