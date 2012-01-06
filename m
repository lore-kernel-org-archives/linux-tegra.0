From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] TPS62360: Add tps62360 regulator driver
Date: Fri, 6 Jan 2012 10:57:58 -0800
Message-ID: <20120106185755.GC2893@opensource.wolfsonmicro.com>
References: <1325668818-1096-1-git-send-email-ldewangan@nvidia.com>
 <20120105062919.GI11867@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9E9B@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9E9B-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 05, 2012 at 07:18:25PM +0530, Laxman Dewangan wrote:

Please fix your mailer to word wrap in less than 80 columns.  I've
reflowed your text for legibility.

> > > +	/* Configure the output discharge path */
> > > +	st = tps62360_reg_modify_bits(tps, REG_RAMPCTRL, BIT(2), BIT(2));
> > > +	if (st < 0)
> > > +		dev_err(tps->dev, "%s() fails in updating reg %d\n",
> > > +			__func__, REG_RAMPCTRL);
> > > +}

> > I rather suspect that if this is worth doing it's also worth doing over
> > suspend...

> The discharge path should be only enabled when the output voltage will
> go to 0.  If it stay in non-zero voltage and enabling discharge path
> will consume more power.  In suspend, it is not necessarily that
> voltage output will be 0 and hence it should not be enabled. In
> shutdown all power goes off from pmu and hence it is worth to enable
> discharge path for quick fall of output voltage.

Why is shutdown particularly special in this regard, and surely the
hardware is capable of automatically disabling the discharge while the
regulator is enabled?

Though frankly it seems rather broken if the hardware doesn't
automatically remove the clamp when 

> > > + * @vsel: Select the voltage id register.

> > What's this?

> There is 4 sets of voltage configuration register for voltage output.
> The power on reset values for this registers are different and
> selection of the voltage configuration register is done by 2 pins of
> the pmu chip which is board dependent.  Based on board connection, it
> need to be program the desired voltage configuration Register to
> achieve the desired output.

Ah, you've misunderstood this functionality.  The reason regulators have
these pin based register selections is that they'll be connected to
GPIOs so that we can change voltages quickly without having to take the
cost of I2C I/O.

For all practical purposes it's reasonable to assume that if vsel is
fixed to anything rather than being connected to GPIOs it'll be
connected to ground.

The other thing is that the naming is really unclear.
