From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] i2c: i2c-tegra: Move clk_prepare/clk_set_rate to probe
Date: Fri, 15 Aug 2014 22:45:46 +0300
Message-ID: <20140815194546.GI1626@tbergstrom-lnx.Nvidia.com>
References: <1408096034-17270-1-git-send-email-mperttunen@nvidia.com>
 <53EE32C7.6000500@wwwdotorg.org>
 <20140815180218.GH1626@tbergstrom-lnx.Nvidia.com>
 <53EE4C45.5080805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53EE4C45.5080805-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org" <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 15, 2014 at 08:07:01PM +0200, Stephen Warren wrote:
> >> However, the new code sets the clock rate after the clock is prepared. I
> >> think the rate should be set first, then the clock prepared. While this
> >> likely doesn't apply to the Tegra clock controller, prepare() is allowed
> >> to enable the clock if enable() can't be implemented in an atomic
> >> fashion (in which case enable/disable would be no-ops), and we should
> >> make sure that the driver correctly configures the clock before
> >> potentially enabling it.
> >>
> >> I'm not sure if a similar change to our SPI drivers is possible; after
> >> all, the SPI transfer rate can vary per message, so if clk_set_rate()
> >> acquires a lock, it seems there's no way to avoid the issue there.
> >
> > Even for i2c this could be the case I think if you use the highspeed (3.4Mhz)
> > mode? From what I remember, a highspeed i2c transaction starts with a lower
> > speed preamble to make sure non highspeed slaves don't get confused? Which
> > means you could change the bus speed depending on the slave you're addressing.
> 
> Since there's no separate chip-select for I2C, I believe all I2C devices 
> need to be able to understand the entire transaction, so the I2C bus 
> speed is fixed.
> 

Does it? I would assume the slave only needs to check if the address matches
its own address after a START condition and if not can just wait until the
STOP condition appears on the bus?

> At least, that's my understanding between 100KHz and 400KHz I2C. I don't 
> know if 3.4MHz I2C introduced something new, although considering that 
> slower I2C never had anything about being compatible with fast stuff in 
> the spec AFAIK, and such speed-switching would only be useful for 
> backwards-compatibility, I don't see how that would work.
> 

Looking at http://www.i2c-bus.org/highspeed/ they at least claim some form
of backwards compatibility ('High-speed IC devices are downward compatible
allowing for mixed bus systems. ')

> >> Luckily, we don't have any SPI-based chips that do anything related to
> >> clocks on any of our current boards...
> >
> > And we don't use SPI to talk to the PMIC, which is the usecase were actually
> > run into problems with the locking.
> 
> IIRC, the I2C-based clock provider (or consumer?) issue was something 
> mentioned (later on?) in the email thread linked by the patch description.

Yes, that's another usecase, but we don't have that on Tegra. I was refering
to Tegra usecases here.

Cheers,

Peter.
