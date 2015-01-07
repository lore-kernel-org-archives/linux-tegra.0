From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/11] memory: tegra: add mc flush support
Date: Wed, 7 Jan 2015 12:08:05 +0200
Message-ID: <20150107100804.GO10073@tbergstrom-lnx.Nvidia.com>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
 <1419331204-26679-3-git-send-email-vinceh@nvidia.com>
 <20150106141821.GJ31830@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150106141821.GJ31830-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 06, 2015 at 03:18:22PM +0100, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Dec 23, 2014 at 06:39:55PM +0800, Vince Hsu wrote:
> > The flush operation of memory clients is needed for various IP blocks in
> > the Tegra SoCs to perform a clean reset.
> > 
> > Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/memory/tegra/mc.c | 21 +++++++++++++++++++++
> >  include/soc/tegra/mc.h    | 23 ++++++++++++++++++++++-
> >  2 files changed, 43 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> > index fe3c44e7e1d1..a2928b4b26fe 100644
> > --- a/drivers/memory/tegra/mc.c
> > +++ b/drivers/memory/tegra/mc.c
> > @@ -62,6 +62,27 @@ static const struct of_device_id tegra_mc_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
> >  
> > +int tegra_mc_flush(struct tegra_mc *mc, unsigned int swgroup, bool enable)
> > +{
> > +	int i;
> > +	const struct tegra_mc_hr *client;
> > +
> > +	if (!mc || !mc->soc->hr_clients ||
> > +			!mc->soc->ops || !mc->soc->ops->flush)
> > +		return -EINVAL;;
> > +
> > +	client = mc->soc->hr_clients;
> > +
> > +	for (i = 0; i < mc->soc->num_hr_clients; i++, client++) {
> > +		if (swgroup == client->swgroup) {
> > +			return mc->soc->ops->flush(mc, client, enable);
> > +		}
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +EXPORT_SYMBOL(tegra_mc_flush);
> 
> Like Lucas already mentioned in response to another patch, having a
> boolean "enable" argument is suboptimal here. Now according to
> documentation the proper reset sequence for clients is something like
> this:
> 
> 	1) set the FLUSH_ENABLE bit for the client
> 	2) poll the FLUSH_DONE bit for the client
> 	3) assert reset to the client using the CAR
> 	4) deassert reset to the client using the CAR
> 	5) clear the FLUSH_ENABLE bit for the client
> 

Do we ever need to do this outside a powergating or railgating sequence?

> This is really inconvenient because we can't flush the client using a
> single operation. So I think we'll need two functions here, something
> like: tegra_mc_flush_enable/disable(), or tegra_mc_flush_{,de}assert().
> Or maybe even: tegra_mc_reset_{,de}assert() to mirror the reset
> controller API. I suppose we could even export it using the reset
> controller framework.
> 
> Doing so would allow us to have power domain DT nodes like this:
> 
> 	pmc@0,7000e400 {
> 		power-domains {
> 			...
> 
> 			gpu {
> 				resets = <&tegra_car 184>,
> 					 <&mc TEGRA_SWGROUP_GPU>;
> 				reset-names = "module", "client";
> 			};
> 
> 			...
> 		};
> 	};
> 
> The PMC driver could then grab the "module" and "client" resets and do
> something like this:
> 
> 	reset_control_assert(powergate->rst_client);
> 	reset_control_assert(powergate->rst_module);
> 	reset_control_deassert(powergate->rst_module);
> 	reset_control_deassert(powergate->rst_client);
> 
> Optionally the above could be extended with a reset_control_status()-
> loop. Alternatively reset_control_assert() would block until the
> FLUSH_DONE bit is set.
> 

I think the reset_control_assert should wait for the FLUSH_DONE bit to be set
because only then all outstanding memory transactions for the client are
completed so you can't realistically claim the reset has been asserted before
the bit is set. Then you could also expose a single reset which handles both
the memory client and the module reset in CAR? Ie:

reset_control_assert(powergate->rst_module); would set FLUSH_ENABLE for the
memory client, wait for the FLUSH_DONE bit and then assert the CAR reset.
reset_control_deassert(powergate->rst_module); would deassert the CAR reset
and then clear the FLUSH_ENABLE bit. Or is there a usecase to control them
individually?

Cheers,

Peter.
