From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 4/4] soc/tegra: pmc: apply MBIST work around fo
 Tegra210
Date: Thu, 25 Jan 2018 12:06:25 +0200
Message-ID: <20180125100625.GL7031@tbergstrom-lnx.Nvidia.com>
References: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
 <1516699369-3513-5-git-send-email-pdeschrijver@nvidia.com>
 <cf919367-4521-25b1-1f80-16e2b660045e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cf919367-4521-25b1-1f80-16e2b660045e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 24, 2018 at 10:43:45PM +0000, Jon Hunter wrote:
> 
> On 23/01/18 09:22, Peter De Schrijver wrote:
> > Apply the memory built-in self test work around when ungating certain
> > Tegra210 power domains.
> 
> Nit-pick .. typo in $subject.
> 
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/soc/tegra/pmc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index ce62a47..c4eff4b 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -153,6 +153,7 @@ struct tegra_pmc_soc {
> >  
> >  	bool has_tsense_reset;
> >  	bool has_gpu_clamps;
> > +	bool needs_mbist_war;
> >  
> >  	const struct tegra_io_pad_soc *io_pads;
> >  	unsigned int num_io_pads;
> > @@ -431,6 +432,9 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
> >  
> >  	usleep_range(10, 20);
> >  
> > +	if (pg->pmc->soc->needs_mbist_war)
> > +		tegra210_clk_handle_mbist_war(pg->id);
> > +
> 
> Be good if we could return an error from the above function.
> 

We need to also undo whatever we did before then. 

> >  	if (disable_clocks)
> >  		tegra_powergate_disable_clocks(pg);
> >  
> > @@ -1815,6 +1819,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
> >  	.cpu_powergates = tegra210_cpu_powergates,
> >  	.has_tsense_reset = true,
> >  	.has_gpu_clamps = true,
> > +	.needs_mbist_war = true,
> >  	.num_io_pads = ARRAY_SIZE(tegra210_io_pads),
> >  	.io_pads = tegra210_io_pads,
> >  	.regs = &tegra20_pmc_regs,
> > 
> 
> Otherwise looks good to me.
> 
> Cheers
> Jon
> 
> -- 
> nvpublic
