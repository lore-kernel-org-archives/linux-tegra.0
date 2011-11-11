From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v4 04/10] arm/tegra: prepare early init for multiple
 tegra variants
Date: Fri, 11 Nov 2011 13:54:37 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17408058BB@HQMAIL01.nvidia.com>
References: <1321010541-31337-1-git-send-email-pdeschrijver@nvidia.com>
 <1321010541-31337-5-git-send-email-pdeschrijver@nvidia.com>
 <20111111114521.GB5114@totoro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111111114521.GB5114@totoro>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Jamie Iles wrote at Friday, November 11, 2011 4:45 AM:
> On Fri, Nov 11, 2011 at 01:22:10PM +0200, Peter De Schrijver wrote:
> > This patch splits the early init code in a common and a tegra20 specific part.
> > L2 cache initialization is generalized and discovers the cache associativity
> > at runtime. Also use arm_pm_restart instead of arm_arch_reset and reset the
> > the system using the PMC reset feature rather then the CAR system reset.
...
> > diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
...
> > +static struct {
> > +	const char *machine;
> > +	void (*init)(void);
> > +} early_init[] __initdata = {
> > +#ifdef CONFIG_ARCH_TEGRA_2x_SOC
> > +	{ "nvidia,tegra20", tegra20_init_early },
> > +#endif
> > +};
> > +
> > +static void __init tegra_init_early(void)
> > +{
> > +
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(early_init); i++)
> > +		if (of_machine_is_compatible(early_init[i].machine))
> > +			return early_init[i].init();
> > +
> > +	pr_warn("Unknown platform detected\n");
> > +}
> 
> Wouldn't it be better just to have separate machine descs for tegra20
> and tegra30 and have a different .init_early for each?  I'm not sure
> that this extra indirection buys us much, especially if we had to repeat
> it for any of the other entries.

Jamie, thanks for pointing that. I think that does sound a lot simpler.

-- 
nvpublic
