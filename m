From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: remove the ifdef of ARCH SoC in the tegra_resume
Date: Mon, 03 Jun 2013 09:26:21 -0600
Message-ID: <51ACB59D.9030005@wwwdotorg.org>
References: <1370247004-31846-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370247004-31846-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/03/2013 02:10 AM, Joseph Lo wrote:
> Removing the ifdef of ARCH_TEGRA_SoC in the tegra_resume function. Because
> we always build with all Tegra SoCs support and had a runtime chip
> detection code there. And we expect most of the chips would need the code
> in the future.
> 
> We also fix a typo of a macro name that cause a build error.

OK, this fixes the build issue, but this patch raises some questions
about the code...

> diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S

> -#ifndef CONFIG_ARCH_TEGRA_2x_SOC
>  	/* Are we on Tegra20? */
>  	cmp	r6, #TEGRA20
>  	beq	1f				@ Yes

Was that ifdef completely incorrect before? I can see why the cmp/beq
might be ifdef'd (although it's not worth it), but I assume the code
after that beq was intended to run on all chips after Tegra20. The ifdef
as it was written does something rather different; it prevents any of
that code from running unless the kernel doesn't have Tegra20 support.
So, I think that the removal of the ifdef is more of a bug-fix that
"because we always build with all Tegra SoCs support. Let me know, and
I'll re-write the commit description to something more accurate...

>  	/* Clear the flow controller flags for this CPU. */
> -	cpu_to_csr_req r1, r0
> +	cpu_to_csr_reg r1, r0
>  	mov32	r2, TEGRA_FLOW_CTRL_BASE
>  	ldr	r1, [r2, r1]
>  	/* Clear event & intr flag */
> @@ -70,7 +69,6 @@ no_cpu0_chk:
>  	bic	r1, r1, r0
>  	str	r1, [r2]
>  1:
> -#endif
>  
>  	check_cpu_part_num 0xc09, r8, r9
>  	bne	not_ca9
