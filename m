From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: tegra114: add CPU hotplug support
Date: Wed, 15 May 2013 17:11:41 -0600
Message-ID: <5194162D.7010007@wwwdotorg.org>
References: <1368613644-11863-1-git-send-email-josephl@nvidia.com> <1368613644-11863-7-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368613644-11863-7-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/15/2013 04:27 AM, Joseph Lo wrote:
> The Tegra114 is a quad cores SoC. Each core can be hotplugged including
> CPU0. The hotplug sequence can be controlled by setting event trigger in
> flow controller. Then the flow controller will take care all the power
> sequence that include CPU up and down.

> diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile

> +obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= sleep-tegra30.o

CONFIG_ARCH_TEGRA_3x_SOC also adds that to obj-y. Will including it
twice cause problems?

> diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S

>   *	  CPU boot vector when restarting the a CPU following
>   *	  an LP2 transition. Also branched to by LP0 and LP1 resume after
>   *	  re-enabling sdram.
> + *
> + *	r6: SoC ID << 8

I meant to ask in patch 1: Perhaps the macro could do a >>8 so that code
can compare directly against the SoC IDs instead of having to compare
against shifted values.

> +	tegra_check_soc_id TEGRA114, TEGRA_APB_MISC_BASE, r6, r7
> +	beq	no_cpu0_chk

Does that need a THUMB(it ...) added? Same elsewhere.

> +	cmp	r6, #(TEGRA114 <<8)

Needs a space after <<.

> diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S

> @@ -45,12 +46,17 @@ ENDPROC(tegra30_hotplug_shutdown)
>   * and powergates it -- flags (in R0) indicate the request type.
>   * Must never be called for CPU 0.

That comment is wrong now, I think.

>  	tst	r0, #TEGRA30_POWER_HOTPLUG_SHUTDOWN
> +	beq	flow_ctrl_setting_for_lp2
> +
> +	/* flow controller set up for hotplug */
> +	mov	r3, #FLOW_CTRL_WAITEVENT		@ For hotplug
> +	b	flow_ctrl_done
> +flow_ctrl_setting_for_lp2:
> +	/* flow controller set up for LP2 */
> +	cmp	r10, #(TEGRA30 << 8)
>  	moveq   r3, #FLOW_CTRL_WAIT_FOR_INTERRUPT	@ For LP2

Do you need e.g. "movne r3, #0" or similar here? Otherwise, I think r3
ends up not being initialized.

> -	movne	r3, #FLOW_CTRL_WAITEVENT		@ For hotplug
> +flow_ctrl_done:
> +	cmp	r10, #(TEGRA30 << 8)
>  	str	r3, [r2]

I wonder whether creating a separate tegra114_cpu_shutdown() wouldn't be
better, to avoid all the runtime conditional code.
