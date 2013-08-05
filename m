From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 7/8] ARM: tegra114: add LP1 suspend support
Date: Mon, 5 Aug 2013 14:51:53 +0800
Message-ID: <1375685513.1731.25.camel@jlo-ubuntu-64.nvidia.com>
References: <1374830110-30685-1-git-send-email-josephl@nvidia.com>
	 <1374830110-30685-8-git-send-email-josephl@nvidia.com>
	 <51F7007F.6090200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51F7007F.6090200-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2013-07-30 at 07:53 +0800, Stephen Warren wrote:
> On 07/26/2013 03:15 AM, Joseph Lo wrote:
> > The LP1 suspend mode will power off the CPU, clock gated the PLLs and put
> > SDRAM to self-refresh mode. Any interrupt can wake up device from LP1. The
> > sequence when LP1 suspending:
> 
> > diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
> > index 5ae7ee5..36cadaa 100644
> > --- a/arch/arm/mach-tegra/pm.c
> > +++ b/arch/arm/mach-tegra/pm.c
> > @@ -214,6 +214,7 @@ static bool tegra_lp1_iram_hook(void)
> >  		tegra20_lp1_iram_hook();
> >  		break;
> >  	case TEGRA30:
> > +	case TEGRA114:
> >  		tegra30_lp1_iram_hook();
> 
> That's in pm-tegra30.c, which is only compiled in if
> CONFIG_ARCH_TEGRA_3x_SOC is enabled. Similarly, this patch adds a lot of
> code to sleep-tegra30.S, which also isn't built/linked if
> !CONFIG_ARCH_TEGRA_3x_SOC.
> 
The "pm-tegra30.c" would be build when just CONFIG_ARCH_TEGRA_3x_SOC,
CONFIG_ARCH_TEGRA_114_SOC or both.

> Does this series built with all 7 combinations of Tegra20/30/114 support
> enabled?
Yes, I did some test about this. But not include all 7 combination.
> 
> > diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
> 
> > @@ -96,9 +100,15 @@
> >  	orreq	\rd, \rd, #(1 << 30)
> >  	streq	\rd, [\r_car_base, #\pll_base]
> >  	/* Enable lock detector */
> > +	.if	\pll_misc
> > +	ldr	\rd, [\r_car_base, #\pll_misc]
> > +	bic	\rd, \rd, #(1 << 18)
> > +	str	\rd, [\r_car_base, #\pll_misc]
> > +	ldr	\rd, [\r_car_base, #\pll_misc]
> >  	ldr	\rd, [\r_car_base, #\pll_misc]
> >  	orr	\rd, \rd, #(1 << 18)
> >  	str	\rd, [\r_car_base, #\pll_misc]
> > +	.endif
> 
> Hmm. Those last 3 lines that aren't touched by this patch already
> touched the pll_misc register even if !pll_misc. Was that a bug in a
> previous patch?
Oops. Yes, will fix in next version.
> 
> Is git bisect maintained for both compile and run-time across this whole
> patch series?
Yes, it's OK. Will do it again before V2 sent.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
