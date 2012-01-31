From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 3/8] ARM: tegra: rework Tegra secondary CPU core
	bringup
Date: Tue, 31 Jan 2012 22:50:45 +0000
Message-ID: <20120131225045.GE8338@n2100.arm.linux.org.uk>
References: <1328028051-24271-1-git-send-email-pdeschrijver@nvidia.com> <1328028051-24271-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1328028051-24271-4-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 06:40:41PM +0200, Peter De Schrijver wrote:
> +ENTRY(__tegra_cpu_reset_handler_start)
> +
> +/*
> + * __tegra_cpu_reset_handler:
> + *
> + * Common handler for all CPU reset events.
> + *
> + * Register usage within the reset handler:
> + *
> + *      R7  = CPU present (to the OS) mask
> + *      R8  = CPU in LP1 state mask
> + *      R9  = CPU in LP2 state mask
> + *      R10 = CPU number
> + *      R11 = CPU mask
> + *      R12 = pointer to reset handler data
> + *
> + * NOTE: This code is copied to IRAM. All code and data accesses
> + *       must be position-independent.
> + */
> +
> +	.align L1_CACHE_SHIFT
> +ENTRY(__tegra_cpu_reset_handler)
> +
> +#if DEBUG_CPU_RESET_HANDLER
> +	enable_coresight r0
> +	b	.
> +#endif
> +	cpsid	aif, 0x13			@ SVC mode, interrupts disabled
> +	mrc	p15, 0, r0, c0, c0, 0		@ read main ID register
> +	and	r5, r0, #0x00f00000		@ variant
> +	and	r6, r0, #0x0000000f		@ revision
> +	orr	r6, r6, r5, lsr #20-4		@ combine variant and revision
> +#ifdef CONFIG_ARM_ERRATA_743622
> +	teq	r6, #0x20			@ present in r2p0
> +	teqne	r6, #0x21			@ present in r2p1
> +	teqne	r6, #0x22			@ present in r2p2
> +	teqne	r6, #0x27			@ present in r2p7
> +	teqne	r6, #0x29			@ present in r2p9

Okay, so we have this errata in proc-v7.S, but only for p0..p2.  If
it's also p7 and p9, then it shows that the errata in the kernel aren't
being actively maintained, and brings into question their worth.

Plus, of course, we don't want platforms re-implementing the errata
in their own code if we're already implementing it somewhere in the
kernel.  So, that's something which needs to be thought about.

That's something that needs considering along side the whole 'what
to do about errata when running in non-secure mode' problem which
OMAP suffers from.

> +	mrceq	p15, 0, r10, c15, c0, 1		@ read diagnostic register
> +	orreq	r10, r10, #1 << 6		@ set bit #6
> +	mcreq	p15, 0, r10, c15, c0, 1		@ write diagnostic register
> +#endif
