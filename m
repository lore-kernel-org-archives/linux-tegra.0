From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: add EMC clock scaling API
Date: Mon, 17 Dec 2012 22:43:59 +0100
Message-ID: <1355780639.1490.22.camel@tellur>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de>
	 <1355516086-11116-2-git-send-email-dev@lynxeye.de>
	 <50CF8D51.6020208@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50CF8D51.6020208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 17.12.2012, 14:23 -0700 schrieb Stephen Warren:
> On 12/14/2012 01:14 PM, Lucas Stach wrote:
> > This allows memory clients to collaboratively control the EMC
> > performance.
> > Each client may set its performance demands. EMC driver then tries to
> > find a DRAM performance level which is able to statisfy all those
> > demands.
> 
> > diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/tegra2_emc.c
> 
> > +struct emc_superclient_constraint {
> 
> Why "superclient" not just "client"?
> 
Because I would like to keep this API at the superclient level. For
example the display engines have 5 memory clients each, which interact
in different ways when computing required bandwidth. I would like to
keep the complexity of calculating the bandwidth requirements in the
device specific drivers and not add all this to the EMC API.

Superclient is the term used in TRM to describe the collection of memory
clients used by one engine.

> > +static struct emc_superclient_constraint constraints[TEGRA_EMC_SC_NUM];
> 
> This way, the EMC driver must know all the possible clients. Wouldn't it
> be better to maintain some kind of dynamic list/... so drivers can just
> add/remove to/from this list. I'm not familiar with other
> perf/constraints APIs already in the kernel, but I /think/ that's how
> they tend to work. This would also mean not having to update the EMC
> driver for new Tegra SoCs if all that changed was the set of clients
> attached to the EMC.
> 
This will make things a fair bit more complex, but I'll happily make
this change if you are okay with the general direction of the approach.

> > +static void tegra_emc_scale_clock(void)
> 
> > +	clock_rate = bandwidth_floor >> 2; /* 4byte/clock */
> 
> That assumes a 32-bit SDRAM interface. I'm sure that won't always be
> true. Perhaps we should invent a #define for this so it stands out
> slightly more if/when this needs to change later.
> 
Hm, maybe we can add a DT property within the EMC node for this.

> > +	switch (highest_level) {
> > +	case TEGRA_EMC_PL_MID:
> > +		clock_rate += 300000000;
> > +		break;
> > +	case TEGRA_EMC_PL_HIGH:
> > +		clock_rate += 600000000;
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	/* cap clock_rate at 600MHz, enough to select highest rate table */
> > +	clock_rate = min(600000000UL, clock_rate);
> 
> I think we should parameterize the 600MHz max clock rate, and perhaps
> even get it from some kind of clk_get_max_rate() API; this 600MHz value
> is highly unlikely to be invariant across SoC versions.
> 
Yeah, I think I'll just look at the provided tables and take highest
table rate for the high boost and half of that for the mid boost.

> > +void tegra_emc_request_bandwidth(enum tegra_emc_superclient client,
> > +				 int bandwidth)
> > +{
> > +	constraints[client].bandwidth = bandwidth;
> > +
> > +	tegra_emc_scale_clock();
> 
> Locking?
> 
Right.

> > +void tegra_emc_request_perf_level(enum tegra_emc_superclient client,
> > +				  enum tegra_emc_perf_level level)
> > +{
> > +	constraints[client].perf_level = level;
> > +
> > +	tegra_emc_scale_clock();
> 
> Locking?
> 
> >  static struct tegra_emc_pdata __devinit *tegra_emc_fill_pdata(struct platform_device *pdev)
> 
> > +	emc_clk = clk_get_sys(NULL, "emc");
> 
> Is there a devm_clk_get_sys()? That would avoid the need to add
> tegra_emc_remove().
> 
> Can we use (devm_)clk_get() instead, so we don't have to hard-code clock
> names? That will help when clocks are in DT.
> 
Ok, I'll look into this.

> > diff --git a/include/memory/tegra_emc_performance.h b/include/memory/tegra_emc_performance.h
> 
> tegra_emc.h seems a better/shorter name.
> 
> BTW, did you check our downstream Android kernel to see what we already
> have for EMC scaling constraints? It might provide some useful
> ideas/background.
> 
Only very briefly. It seemed that Tegra 20 isn't really implemented
downstream. And I think the idea of this EMC clock scaling is easy
enough to not require too much thought. Most of the complexity has to
live within the drivers which make use of this API and for this we might
want to look at what has been done downstream.
