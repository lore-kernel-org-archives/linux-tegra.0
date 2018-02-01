From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 6/6] cpufreq: tegra124-cpufreq: extend to support
 Tegra210
Date: Thu, 1 Feb 2018 11:25:20 +0200
Message-ID: <20180201092520.GV7031@tbergstrom-lnx.Nvidia.com>
References: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
 <1516797938-32044-8-git-send-email-pdeschrijver@nvidia.com>
 <248eee6f-7f37-a5d1-8eff-116c3ef57751@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <248eee6f-7f37-a5d1-8eff-116c3ef57751-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 31, 2018 at 11:06:36AM +0000, Jon Hunter wrote:
> 
> On 24/01/18 12:45, Peter De Schrijver wrote:
> > Tegra210 has a very similar CPU clocking scheme than Tegra124. So add
> > support in this driver. Also allow for the case where the CPU voltage is
> > controlled directly by the DFLL rather than by a separate regulator object.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/cpufreq/tegra124-cpufreq.c | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> > index 4353025..d631dc4 100644
> > --- a/drivers/cpufreq/tegra124-cpufreq.c
> > +++ b/drivers/cpufreq/tegra124-cpufreq.c
> > @@ -64,7 +64,8 @@ static void tegra124_cpu_switch_to_pllx(struct tegra124_cpufreq_priv *priv)
> >  {
> >  	clk_set_parent(priv->cpu_clk, priv->pllp_clk);
> >  	clk_disable_unprepare(priv->dfll_clk);
> > -	regulator_sync_voltage(priv->vdd_cpu_reg);
> > +	if (priv->vdd_cpu_reg)
> > +		regulator_sync_voltage(priv->vdd_cpu_reg);
> >  	clk_set_parent(priv->cpu_clk, priv->pllx_clk);
> >  }
> >  
> > @@ -89,10 +90,8 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
> >  		return -ENODEV;
> >  
> >  	priv->vdd_cpu_reg = regulator_get(cpu_dev, "vdd-cpu");
> > -	if (IS_ERR(priv->vdd_cpu_reg)) {
> > -		ret = PTR_ERR(priv->vdd_cpu_reg);
> > -		goto out_put_np;
> > -	}
> > +	if (IS_ERR(priv->vdd_cpu_reg))
> > +		priv->vdd_cpu_reg = NULL;
> >  
> 
> For Tegra124, don't we still want to return an error here?

Not necessarily. Also on Tegra124 the DFLL can use PWM and I think jetson TK1
can be reworked to use this.

Peter.

> 
> >  	priv->cpu_clk = of_clk_get_by_name(np, "cpu_g");
> >  	if (IS_ERR(priv->cpu_clk)) {
> > @@ -148,7 +147,6 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
> >  	clk_put(priv->cpu_clk);
> >  out_put_vdd_cpu_reg:
> >  	regulator_put(priv->vdd_cpu_reg);
> > -out_put_np:
> >  	of_node_put(np);
> >  
> >  	return ret;
> > @@ -181,7 +179,8 @@ static int __init tegra_cpufreq_init(void)
> >  	int ret;
> >  	struct platform_device *pdev;
> >  
> > -	if (!of_machine_is_compatible("nvidia,tegra124"))
> > +	if (!(of_machine_is_compatible("nvidia,tegra124")
> > +		|| of_machine_is_compatible("nvidia,tegra210")))
> >  		return -ENODEV;
> >  
> >  	/*
> > 
> 
> Cheers
> Jon
> 
> -- 
> nvpublic
