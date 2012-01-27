From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 3/8] ARM: tegra: rework Tegra secondary CPU core
 bringup
Date: Fri, 27 Jan 2012 10:18:02 +0200
Message-ID: <20120127081802.GU29914@tbergstrom-lnx.Nvidia.com>
References: <1327597641-7519-1-git-send-email-pdeschrijver@nvidia.com>
 <1327597641-7519-4-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB8246B@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178CB8246B-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 09:25:53PM +0100, Stephen Warren wrote:
> Peter De Schrijver wrote at Thursday, January 26, 2012 10:07 AM:
> > Prepare the Tegra secondary CPU core bringup code for other Tegra variants.
> > The reset handler is also generalized to allow for future introduction of
> > powersaving modes which turn off the CPU cores.
> 
> > diff --git a/arch/arm/mach-tegra/headsmp.S b/arch/arm/mach-tegra/headsmp.S
> 
> >  ENTRY(tegra_secondary_startup)
> ...
> > +	enable_coresight r0
> 
> > +ENTRY(__tegra_cpu_reset_handler)
> > +
> > +#if DEBUG_CPU_RESET_HANDLER
> > +	enable_coresight r0
> > +	b	.
> > +#endif
> 
> I'm not sure why the macro call enable_coresight is ifdef'd in one place
> but not the other... Should just the instruction "b ." be inside the
> ifdef?
> 

This code path will also be used by LP2 and LP1 resume in the future, I'm not
sure we should unconditionally enable Coresight in that case.

> > diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
> 
> > +static void tegra_cpu_reset_handler_enable(void)
> 
> > +	/*
> > +	 * Prevent further modifications to the physical reset vector.
> > +	 *  NOTE: Has no effect on chips prior to Tegra30.
> > +	 */
> > +	reg = readl(sb_ctrl);
> > +	reg |= 2;
> > +	writel(reg, sb_ctrl);
> > +	wmb();
> 
> Should we skip that on Tegra20 then?
> 

Might make sense. OTOH the bit is just unused on Tegra20 so the write doesn't
cause any harm.

> > +void __init tegra_cpu_reset_handler_init(void)
> > +{
> > +	unsigned long *cpu_reset_data_start, *cpu_reset_data_end;
> 
> Those variables are unused.

Indeed... Leftover from the past...

Cheers,

Peter.
