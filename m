From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] TPS62360: Add tps62360 regulator driver
Date: Sat, 7 Jan 2012 11:10:48 -0800
Message-ID: <20120107191047.GA3590@opensource.wolfsonmicro.com>
References: <1325668818-1096-1-git-send-email-ldewangan@nvidia.com>
 <20120105062919.GI11867@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9E9B@BGMAIL01.nvidia.com>
 <20120106185755.GC2893@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3AA0DE@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <96C9D994977DD0439FB6D3FE3B13DD907DBD3AA0DE-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Jan 07, 2012 at 11:16:55PM +0530, Laxman Dewangan wrote:

> > Though frankly it seems rather broken if the hardware doesn't
> > automatically remove the clamp when

> The enable through external input line does not remove the clamp.
> It need to do the reset of the pmu chip (through power off) to
> remove the clamp automatically. The fast discharging is require

Oh, wow.  That's a bit special.

> in shutdown if we want to again power ON device quickly.

That's kind of what's concerning me - I'd expect that if we need to
power on quickly after shutdown it'd be at least as important to do this
if the regulator is just disabled in normal operation or during system
suspend.  But from what you're saying above it sounds like the feature
is just too hard to use outside of shutdown.

> I think I should  go with your suggestion to allow the VSEL0/1 to be
> dynamically changeable. If I implement this then client need to provide
> 4 sets of the regulator init data to register regulator. Each will have
> different sets of consumer. Client will get regulator for all sets of

That's one option, another option is to have the driver automatically
choose voltages to assign to the slots, for example using a LRU approach
to expire old voltages.  You can also do things like make sure that the
top voltage in the ranges specified are assigned slots to help with fast
ramping.

I'm actually starting to think we should factor this out into the core,
at least the slot assignment stuff.  There's a bunch of devices doing
variations on the theme already.  Let's not worry about that for now,
though - let's just get this in and factor out later.

> In the platform data, I will take 4 sets of regulator_init_data
> corresponding to VSEL0/1. If client is not interested in all and tied
> to fixed high/low, he will just pass NULL to unused index and proper
> information to used option.

Taking multiple different regulator_init_data is definitely not what we
want, there's a whole bunch of information in there, not just the
voltages.  You should just use platform data to specify the GPIOs (and
a set of voltages if you go with that approach).
