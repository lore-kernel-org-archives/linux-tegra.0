From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] arm/tegra: prepare early init for multiple tegra
 variants
Date: Tue, 1 Nov 2011 15:37:15 +0200
Message-ID: <20111101133715.GE13358@tbergstrom-lnx.Nvidia.com>
References: <1319561644-6160-1-git-send-email-pdeschrijver@nvidia.com>
 <1319561644-6160-4-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF173E1B49B2@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173E1B49B2-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 27, 2011 at 10:06:13PM +0200, Stephen Warren wrote:
> Peter De Schrijver wrote at Tuesday, October 25, 2011 10:54 AM:
> > This patch splits the early init code in a common and a tegra20 specific part.
> 
> > diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
> 
> > +static void __init tegra_init_early(void)
> > +{
> > +
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(early_init); i++)
> > +		if (of_machine_is_compatible(early_init[i].machine))
> > +			return early_init[i].init();
> > +
> > +	printk(KERN_WARNING "Unknown platform detected\n");
> 
> pr_warn/WARN/WARN_ON?
> 
> > diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
> 
> > @@ -31,8 +31,6 @@
> >  #include "clock.h"
> >  #include "fuse.h"
> > 
> > -void (*arch_reset)(char mode, const char *cmd) = tegra_assert_system_reset;
> > -
> >  void tegra_assert_system_reset(char mode, const char *cmd)
> >  {
> >  	void __iomem *reset = IO_ADDRESS(TEGRA_CLK_RESET_BASE + 0x04);
> > @@ -44,7 +42,9 @@ void tegra_assert_system_reset(char mode, const char *cmd)
> >  	writel_relaxed(reg, reset);
> >  }
> > 
> > -static __initdata struct tegra_clk_init_table common_clk_init_table[] = {
> > +void (*arch_reset)(char mode, const char *cmd) = tegra_assert_system_reset;
> 
> I'm not sure why you moved that, but I suppose it's fine.
> 
> > +
> > +static __initdata struct tegra_clk_init_table tegra20_clk_init_table[] = {
> >  	/* name		parent		rate		enabled */
> >  	{ "clk_m",	NULL,		0,		true },
> >  	{ "pll_p",	"clk_m",	216000000,	true },
> > @@ -65,19 +65,25 @@ static void __init tegra_init_cache(void)
> >  {
> >  #ifdef CONFIG_CACHE_L2X0
> >  	void __iomem *p = IO_ADDRESS(TEGRA_ARM_PERIF_BASE) + 0x3000;
> > +	u32 aux_ctrl;
> > 
> >  	writel_relaxed(0x331, p + L2X0_TAG_LATENCY_CTRL);
> >  	writel_relaxed(0x441, p + L2X0_DATA_LATENCY_CTRL);
> > +	writel(2, p + L2X0_PREFETCH_CTRL);

This is actually wrong :)

> > +
> > +	aux_ctrl = readl(p + L2X0_CACHE_TYPE);
> > +	aux_ctrl = (aux_ctrl & 0x700) << (17-8);
> > +	aux_ctrl |= 0x6C000001;
> 
> This is an unrelated change?
> 

This is needed to deal with potential differences in L2 associativity between
SoCs.

Cheers,

Peter.
