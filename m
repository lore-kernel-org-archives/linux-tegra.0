From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] TPS62360: Add tps62360 regulator driver
Date: Sun, 8 Jan 2012 08:58:24 -0800
Message-ID: <20120108165819.GB29065@opensource.wolfsonmicro.com>
References: <1325668818-1096-1-git-send-email-ldewangan@nvidia.com>
 <20120105062919.GI11867@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9E9B@BGMAIL01.nvidia.com>
 <20120106185755.GC2893@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3AA0DE@BGMAIL01.nvidia.com>
 <20120107191047.GA3590@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3AA0E4@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <96C9D994977DD0439FB6D3FE3B13DD907DBD3AA0E4-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jan 08, 2012 at 01:12:47PM +0530, Laxman Dewangan wrote:

> > Taking multiple different regulator_init_data is definitely not what we
> > want, there's a whole bunch of information in there, not just the
> > voltages.  You should just use platform data to specify the GPIOs (and
> > a set of voltages if you go with that approach).

> How do you pass the voltages along with gpios? If I understand correctly
> then it may be wither in range form or discrete form.
> Like in range form 500-700 for VSEL:00, 710-800 VSEL:01 etc.
> In discrete form VSEL00:500, 540, 550..
> For, VSEL01, VSEL00:510, 900,

Why would you have ranges?  If you've set the VSEL pins to a particular
value I'd expect the chip to produce whatever voltage is programmed for
that VSEL.

> In range form, the disadvantages is that, most of time, the voltage
> requirement is surrounding operating voltage and so it will use only
> one combination of VSEL in most of time and will not get the benefit.
> The discrete form have long list of voltage and filling table is pain.
> Also need to maintain the big list of lookuptable to select voltage
> configuration register.

You only have four possible VSELs so I don't see a concern there.
