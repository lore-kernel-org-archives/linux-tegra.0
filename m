From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 3/3] arm/tegra: device tree support for ventana board
Date: Thu, 29 Sep 2011 21:55:00 +0300
Message-ID: <20110929185500.GP21166@tbergstrom-lnx.Nvidia.com>
References: <1317248978-10829-1-git-send-email-pdeschrijver@nvidia.com>
 <1317248978-10829-4-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF173A2C6717@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173A2C6717-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 29, 2011 at 07:04:15PM +0200, Stephen Warren wrote:
> Peter De Schrijver wrote at Wednesday, September 28, 2011 4:30 PM:
> ...
> > diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
> ...
> > @@ -80,9 +80,19 @@ static struct of_device_id tegra_dt_gic_match[] __initdata = {
> >  	{}
> >  };
> > 
> > +static struct {
> > +	char *machine;
> > +	void (*init)(void);
> > +} pinmux_configs[] = {
> > +	{ "nvidia,harmony", harmony_pinmux_init() },
> > +	{ "nvidia,seaboard", seaboard_pinmux_init() },
> > +	{ "nvidia,ventana", ventana_pinmux_init() },
> > +};
> 
> Do you want the brackets after the function names there? Locally, they
> cause the following syntax errors during compilation:
> 
> arch/arm/mach-tegra/board-dt.c:85: error: initializer element is not constant
> arch/arm/mach-tegra/board-dt.c:85: error: (near initialization for 'pinmux_configs[0].init')
> arch/arm/mach-tegra/board-dt.c:86: error: initializer element is not constant
> arch/arm/mach-tegra/board-dt.c:86: error: (near initialization for 'pinmux_configs[1].init')
> arch/arm/mach-tegra/board-dt.c:87: error: initializer element is not constant
> arch/arm/mach-tegra/board-dt.c:87: error: (near initialization for 'pinmux_configs[2].init')
> 
> (using gcc version 4.4.3 (gcc-4.4.3_cos_gg_51096))

It compiled fine here using gcc version 4.5.1 (Sourcery G++ Lite 2010.09-50).
I will change it next week when I'm back at the office.

Cheers,

Peter.
