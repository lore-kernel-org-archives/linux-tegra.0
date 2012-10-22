From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra30: clocks: add AHB and APB clocks
Date: Mon, 22 Oct 2012 15:17:56 +0800
Message-ID: <1350890276.9491.2.camel@jlo-ubuntu-64.nvidia.com>
References: <1350628693-1190-1-git-send-email-josephl@nvidia.com>
	 <5084CDBC.2010106@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5084CDBC.2010106-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2012-10-22 at 12:38 +0800, Prashant Gaikwad wrote:
> On Friday 19 October 2012 12:08 PM, Joseph Lo wrote:
> > Adding the AHB and APB bus clock control interface for Tegra30.
> >
> > Signed-off-by: Joseph Lo<josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >   arch/arm/mach-tegra/common.c              |    4 +
> >   arch/arm/mach-tegra/tegra30_clocks.c      |  106 +++++++++++++++++++++++++++++
> >   arch/arm/mach-tegra/tegra30_clocks.h      |    1 +
> >   arch/arm/mach-tegra/tegra30_clocks_data.c |   46 +++++++++++++
> >   4 files changed, 157 insertions(+), 0 deletions(-)
> 
> <snip>
> 
> > +
> > +static long tegra30_bus_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > +				unsigned long *prate)
> > +{
> > +	unsigned long parent_rate = *prate;
> > +	s64 divider;
> > +
> > +	if (rate>= parent_rate)
> > +		return rate;
> > +
> 
> return parent_rate?

Prashant,

Yes, thanks.

> 
> > +	divider = parent_rate;
> > +	divider += rate - 1;
> > +	do_div(divider, rate);
> > +
> > +	if (divider<  0)
> > +		return divider;
> > +
> > +	if (divider>  4)
> > +		divider = 4;
> > +	do_div(parent_rate, divider);
> > +
> > +	return parent_rate;
> > +}
> >
> 
