From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: Use runtime_pm for clk enable/disable
Date: Wed, 18 Dec 2013 22:13:28 +0530
Message-ID: <20131218164328.GQ16227@intel.com>
References: <1386751756-12583-1-git-send-email-bandik@nvidia.com>
 <52A8CFD9.6030002@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52A8CFD9.6030002-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 11, 2013 at 01:49:29PM -0700, Stephen Warren wrote:
> On 12/11/2013 01:49 AM, Chaitanya Bandi wrote:
> > Used runtime_pm APIs for clock enabling/disabling.
> > Made changes such that clock is not enabled during
> > idle. Also moved the usage of clk prepare/unprepare
> > such that they are not called in isr context.
> 
> Hmm. This is going to cause conflicts with the patch I'm taking through
> the Tegra tree which converts the driver to support the standard DMA DT
> bindings. Perhaps this can wait until 3.15, or perhaps we can merge the
> Tegra branch back into the DMA tree to resolve the conflict.
Ok pls do resubmit once your stuff is sorted out!

> 
> > diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> 
> > - * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
> > + * Copyright (c) 2012-13, NVIDIA CORPORATION.  All rights reserved.
> 
> s/13/2013/
> 
> > @@ -580,6 +580,11 @@ static void handle_once_dma_done(struct tegra_dma_channel *tdc,
> >  	list_add_tail(&sgreq->node, &tdc->free_sg_req);
> >  
> >  	/* Do not start DMA if it is going to be terminate */
> > +	if (list_empty(&tdc->pending_sg_req) && (!to_terminate)) {
> > +		clk_disable(tdc->tdma->dma_clk);
> > +		pm_runtime_put(tdc->tdma->dev);
> > +	}
> > +
> >  	if (to_terminate || list_empty(&tdc->pending_sg_req))
> >  		return;
> 
> Don't you want to insert the new code before the comment? Otherwise,
> you're separating the existing comment and code.
> 
> Here and many other places, both pm_runtime_get/put *and*
> clk_enable/disable are called. Why doesn't the code *just* call
> pm_runtime_get/put, and let the implementation of those APIs perform the
> clock_enable/disable? That'd be a lot more typical.
And that's what I was thinking too. Why dont we rely on runtime calls for doing
the ref counting and then in runtime suspend & resume handlers disable and
enable clock

> 
> Most of the new calls to pm_runtime_*()/clk_{en,dis}able() are missing
> error checking.
> 
> > @@ -682,12 +687,21 @@ static void tegra_dma_issue_pending(struct dma_chan *dc)
> 
> > +	pm_runtime_get(tdc->tdma->dev);
> 
> I think you need pm_runtime_get_sync() here to make sure the clock gets
> turned on immediately? Perhaps that why...
> 
> > +	ret = clk_enable(tdc->tdma->dma_clk);
> 
> ... there's also direct manipulation of the clock everywhere.
> 
> Also, shouldn't the DMA core be calling pm_runtime_get(), rather than
> each individual DMA driver?
Yes i have been keen on that, not getting priortized yet!

--
~Vinod
