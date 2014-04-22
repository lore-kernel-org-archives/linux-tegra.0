From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Deprecate nvidia,hpd-gpio property
Date: Tue, 22 Apr 2014 17:57:42 +0200
Message-ID: <1398182262.5085.34.camel@weser.hi.pengutronix.de>
References: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com>
	 <1397736181-1593-2-git-send-email-thierry.reding@gmail.com>
	 <535574D6.3010002@wwwdotorg.org> <20140422072314.GB11766@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140422072314.GB11766@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 22.04.2014, 09:23 +0200 schrieb Thierry Reding:
> On Mon, Apr 21, 2014 at 01:43:18PM -0600, Stephen Warren wrote:
> > On 04/17/2014 06:02 AM, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > 
> > > Properties referencing GPIOs should use the plural suffix -gpios. This
> > > convention is encoded in the device tree backend of gpiod_get(), which
> > > we'll eventually want to migrate to.
> > 
> > Wouldn't it be simpler to fix the GPIO binding documentation and
> > gpiod_get() code to allow the -gpio suffix in addition to -gpios? It
> > always struck me as silly that the binding required a plural property
> > name when only a single entry made sense.
> > 
> > (For something like "clocks", since the property name applies to any
> > clock, and there certainly can be many clocks, a plural property name
> > makes sense. However, since each type of GPIO is "foo-gpios" rather than
> > an "foo" entry in "gpios", that same argument doesn't apply, and a
> > singular property name seems much more correct).
> 
> Yeah, it's somewhat unfortunate that this is done inconsistently across
> different subsystems. GPIO isn't the only exception here. Regulators use
> a similar pattern.
> 
> For consistency it'd be nice if we could get everyone to agree to one
> scheme, but I suspect that by now we're far beyond that being a viable
> option.
> 
> I don't have a strong feeling either way, so if allowing both *-gpios
> and *-gpio properties is what we want, then I can certainly come up with
> a patch.
> 
I agree with Stephen, allowing the singular form in the property name
seems like a nicer solution (it makes for a less irritating property
name), without the need to break existing DTs.

Regards,
Lucas
-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
