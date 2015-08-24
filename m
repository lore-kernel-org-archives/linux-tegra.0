From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/7] DMA: tegra-apb: Correct runtime-pm usage
Date: Mon, 24 Aug 2015 19:51:43 +0530
Message-ID: <20150824142143.GK13546@localhost>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
 <1439905755-25150-2-git-send-email-jonathanh@nvidia.com>
 <20150823141707.GB13546@localhost>
 <55DADA11.5040306@nvidia.com>
 <20150824092230.GI13546@localhost>
 <55DB1AA9.7090906@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55DB1AA9.7090906-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rafael <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 24, 2015 at 02:22:49PM +0100, Jon Hunter wrote:
> 
> On 24/08/15 10:22, Vinod Koul wrote:
> > On Mon, Aug 24, 2015 at 09:47:13AM +0100, Jon Hunter wrote:
> >>
> >> On 23/08/15 15:17, Vinod Koul wrote:
> >>> On Tue, Aug 18, 2015 at 02:49:09PM +0100, Jon Hunter wrote:
> >>>
> >>>> @@ -1543,7 +1531,7 @@ static int tegra_dma_pm_suspend(struct device *dev)
> >>>>  	int ret;
> >>>>  
> >>>>  	/* Enable clock before accessing register */
> >>>> -	ret = tegra_dma_runtime_resume(dev);
> >>>> +	ret = pm_runtime_get_sync(dev);
> >>>
> >>> why is this required ?
> >>
> >> Because the clock could be disabled when this function is called. This
> >> function saves the DMA context so that if the context is lost during
> >> suspend, it can be restored.
> > 
> > Have you verified this? Coz my understanding is that when PM does suspend it
> > will esnure you are runtime resume if runtime suspended and then will do
> > suspend.
> > So you do not need to do above
> 
> I see what you are saying. I did some testing with ftrace today to trace
> rpm and suspend/resume calls. If the dma controller is runtime suspended
> and I do not call pm_runtime_get_sync() above then I do not see any
> runtime resume of the dma controller prior to suspend. Now I was hoping
> that this would cause a complete kernel crash but it did not and so the
> DMA clock did not appear to be needed here (at least on the one board I
> tested). However, I would not go as far as to remove this and prefer to
> keep as above.

Okay am adding Rafael here for his recommendations.

I have tested in past and if my driver was runtime suspended we were resumed
prior to being suspended. So I am not sure why you did not see that
behaviour, and if that is right we don't need to force resume here

-- 
~Vinod
