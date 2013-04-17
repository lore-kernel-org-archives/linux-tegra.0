From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: tegra: make sure the pointer on 4 byte align
 when THUMB2_KERNEL enabled
Date: Wed, 17 Apr 2013 17:59:27 +0100
Message-ID: <20130417165927.GD2249@linaro.org>
References: <1366066255-18192-1-git-send-email-swarren@wwwdotorg.org>
 <1366066255-18192-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1366066255-18192-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 15, 2013 at 04:50:55PM -0600, Stephen Warren wrote:
> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> When building kernel with CONFIG_THUMB2_KERNEL, the data pointer in the
> assembly may not on the 4 byte alignment. Then causing a data abort when
> accessing the pointer. This patch add a ".align" flag in the head of the
> pointer. And always using 32-bit ADR Thumb instruction to make sure it
> won't build failure.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With the change to W(adr), Reviewed-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  arch/arm/mach-tegra/reset-handler.S |    1 +
>  arch/arm/mach-tegra/sleep.h         |    3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S
> index e6de88a..519a8c5 100644
> --- a/arch/arm/mach-tegra/reset-handler.S
> +++ b/arch/arm/mach-tegra/reset-handler.S
> @@ -83,6 +83,7 @@ ENDPROC(tegra_resume)
>  
>  #ifdef CONFIG_CACHE_L2X0
>  	.globl	l2x0_saved_regs_addr
> +	.align
>  l2x0_saved_regs_addr:
>  	.long	0
>  #endif
> diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
> index 4ffae54..8e9b6af 100644
> --- a/arch/arm/mach-tegra/sleep.h
> +++ b/arch/arm/mach-tegra/sleep.h
> @@ -92,7 +92,8 @@
>  
>  #ifdef CONFIG_CACHE_L2X0
>  .macro l2_cache_resume, tmp1, tmp2, tmp3, phys_l2x0_saved_regs
> -	adr	\tmp1, \phys_l2x0_saved_regs
> + ARM(	adr	\tmp1, \phys_l2x0_saved_regs )
> + THUMB(	adr.w	\tmp1, \phys_l2x0_saved_regs )
>  	ldr	\tmp1, [\tmp1]
>  	ldr	\tmp2, [\tmp1, #L2X0_R_PHY_BASE]
>  	ldr	\tmp3, [\tmp2, #L2X0_CTRL]
> -- 
> 1.7.10.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
