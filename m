From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] soc/tegra: pmc: fix child-node lookup
Date: Fri, 12 Jan 2018 10:19:51 +0100
Message-ID: <20180112091951.GC11344@localhost>
References: <20171115094458.31666-1-johan@kernel.org>
 <43890bb2-f902-2fc4-7480-a8cb71061048@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <43890bb2-f902-2fc4-7480-a8cb71061048@kapsi.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <cyndis@kapsi.fi>, Thierry Reding <thierry.reding@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 16, 2017 at 01:40:24PM +0200, Mikko Perttunen wrote:
> On 15.11.2017 11:44, Johan Hovold wrote:
> > Fix child-node lookup during probe, which ended up searching the whole
> > device tree depth-first starting at the parent rather than just matching
> > on its children.
> >
> > To make things worse, the parent pmc node could end up being prematurely
> > freed as of_find_node_by_name() drops a reference to its first argument.
> >
> > Fixes: 3568df3d31d6 ("soc: tegra: Add thermal reset (thermtrip) support to PMC")
> > Cc: stable <stable@vger.kernel.org>     # 4.0
> > Cc: Mikko Perttunen <mperttunen@nvidia.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/soc/tegra/pmc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index 0453ff6839a7..7e9ef3431bea 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -1321,7 +1321,7 @@ static void tegra_pmc_init_tsense_reset(struct tegra_pmc *pmc)
> >  	if (!pmc->soc->has_tsense_reset)
> >  		return;
> >
> > -	np = of_find_node_by_name(pmc->dev->of_node, "i2c-thermtrip");
> > +	np = of_get_child_by_name(pmc->dev->of_node, "i2c-thermtrip");
> >  	if (!np) {
> >  		dev_warn(dev, "i2c-thermtrip node not found, %s.\n", disabled);
> >  		return;
> >
> 
> Good find!
> 
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

This one still hasn't made it to linux-next so figured I'd send a
reminder. Will you be picking this one up for 4.16, Thierry?

Thanks,
Johan
