From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 6/6] cpufreq: tegra124-cpufreq: extend to support
 Tegra210
Date: Tue, 6 Feb 2018 18:28:03 +0200
Message-ID: <20180206162803.GF7031@tbergstrom-lnx.Nvidia.com>
References: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
 <1516797938-32044-8-git-send-email-pdeschrijver@nvidia.com>
 <248eee6f-7f37-a5d1-8eff-116c3ef57751@nvidia.com>
 <20180201092520.GV7031@tbergstrom-lnx.Nvidia.com>
 <20180206142720.3a52b532@duuni>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180206142720.3a52b532@duuni>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 06, 2018 at 02:27:20PM +0200, Tuomas Tynkkynen wrote:
> (Attempting to post through Gmane - let's see if this works at all).
> 
> On Thu, 1 Feb 2018 11:25:20 +0200
> Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org> wrote:
> 
> > On Wed, Jan 31, 2018 at 11:06:36AM +0000, Jon Hunter wrote:
> > > 
> > > On 24/01/18 12:45, Peter De Schrijver wrote:  
> > > > Tegra210 has a very similar CPU clocking scheme than Tegra124. So add
> > > > support in this driver. Also allow for the case where the CPU voltage is
> > > > controlled directly by the DFLL rather than by a separate regulator object.
> > > > 
> > > > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > ---
> > > >  drivers/cpufreq/tegra124-cpufreq.c | 13 ++++++-------
> > > >  1 file changed, 6 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> > > > index 4353025..d631dc4 100644
> > > > --- a/drivers/cpufreq/tegra124-cpufreq.c
> > > > +++ b/drivers/cpufreq/tegra124-cpufreq.c
> > > > @@ -64,7 +64,8 @@ static void tegra124_cpu_switch_to_pllx(struct tegra124_cpufreq_priv *priv)
> > > >  {
> > > >  	clk_set_parent(priv->cpu_clk, priv->pllp_clk);
> > > >  	clk_disable_unprepare(priv->dfll_clk);
> > > > -	regulator_sync_voltage(priv->vdd_cpu_reg);
> > > > +	if (priv->vdd_cpu_reg)
> > > > +		regulator_sync_voltage(priv->vdd_cpu_reg);
> > > >  	clk_set_parent(priv->cpu_clk, priv->pllx_clk);
> > > >  }
> > > >  
> > > > @@ -89,10 +90,8 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
> > > >  		return -ENODEV;
> > > >  
> > > >  	priv->vdd_cpu_reg = regulator_get(cpu_dev, "vdd-cpu");
> > > > -	if (IS_ERR(priv->vdd_cpu_reg)) {
> > > > -		ret = PTR_ERR(priv->vdd_cpu_reg);
> > > > -		goto out_put_np;
> > > > -	}
> > > > +	if (IS_ERR(priv->vdd_cpu_reg))
> > > > +		priv->vdd_cpu_reg = NULL;
> > > >    
> > > 
> > > For Tegra124, don't we still want to return an error here?  
> > 
> > Not necessarily. Also on Tegra124 the DFLL can use PWM and I think jetson TK1
> > can be reworked to use this.
> > 
> > Peter.
> > 
> 
> Regardless of that, you need to bail out on -EPROBE_DEFER I think.

Ah yes, likely. That said the code isn't correct because the voltage margin
when using PLLX is higher than when using CL-DVFS..

Peter.
