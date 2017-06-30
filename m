From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] dmaengine: tegra-apb: Really fix runtime-pm usage
Date: Fri, 30 Jun 2017 11:12:49 +0530
Message-ID: <20170630054249.GO19154@localhost>
References: <1496753369-5356-1-git-send-email-jonathanh@nvidia.com>
 <20170606144820.GB21217@ulmo>
 <f336e72a-d966-11e4-0885-e324843d5c00@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f336e72a-d966-11e4-0885-e324843d5c00-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 27, 2017 at 12:44:58PM +0100, Jon Hunter wrote:

> >>  static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
> >>  	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resume,
> >>  			   NULL)
> >> -	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_pm_suspend, tegra_dma_pm_resume)
> >> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> >> +				pm_runtime_force_resume)
> > 
> > Is that even necessary? I thought runtime PM was going to be triggered
> > for system sleep anyway, but it looks like there are other examples of
> > this usage, so maybe I'm mistaken.
> 
> Yes this is necessary. No RPM is not automatically trigger by system
> suspend AFAICT.

Yes I was earlier under the same impression but later did realize that the
behaviour seems to be arch specific and we don't have guarantee on this

-- 
~Vinod
