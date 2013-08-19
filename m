From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/5] clk: tegra: Add reset only clock node flag and COP
Date: Mon, 19 Aug 2013 17:53:53 +0300
Message-ID: <20130819145353.GP18810@tbergstrom-lnx.Nvidia.com>
References: <1375874709-10438-1-git-send-email-markz@nvidia.com>
 <1375874709-10438-2-git-send-email-markz@nvidia.com>
 <52027C9B.2030009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52027C9B.2030009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 07, 2013 at 06:58:03PM +0200, Stephen Warren wrote:
> On 08/07/2013 05:25 AM, Mark Zhang wrote:
> > From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > COP is a reset only clock. So this patch adds NO_CLK support
> > then adds the COP clock.
> 
> Do we actually need this clock upstream yet?
> 
> IIRC, Prashant was working on implementing the common reset API, so I'd
> prefer not to add any reset-only "clocks" to the clock driver, but
> rather to simply make sure that the new reset driver exposes them.
> 

It would be better if we can switch to the reset API.

> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> 
> >  enum tegra114_clk {
> > -	rtc = 4, timer = 5, uarta = 6, sdmmc2 = 9, i2s1 = 11, i2c1 = 12,
> > +	cop = 1, rtc = 4, timer = 5, uarta = 6, sdmmc2 = 9, i2s1 = 11, i2c1 = 12,
> 
> To make this change, you would also need to edit
> include/dt-bindings/clock/tegra114-car.h. BTW, why doesn't the Tegra
> clock driver include that file rather than defining its own enum?

History. include/dt-bindings/clock/tegra114-car.h didn't exist when
clk-tegra114.c was written.

Cheers,

Peter.
