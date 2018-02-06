From: Tuomas Tynkkynen <tuomas@tuxera.com>
Subject: Re: [PATCH v2 6/6] cpufreq: tegra124-cpufreq: extend to support
 Tegra210
Date: Tue, 6 Feb 2018 14:27:20 +0200
Message-ID: <20180206142720.3a52b532@duuni>
References: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
 <1516797938-32044-8-git-send-email-pdeschrijver@nvidia.com>
 <248eee6f-7f37-a5d1-8eff-116c3ef57751@nvidia.com>
 <20180201092520.GV7031@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20180201092520.GV7031@tbergstrom-lnx.Nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

(Attempting to post through Gmane - let's see if this works at all).

On Thu, 1 Feb 2018 11:25:20 +0200
Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> On Wed, Jan 31, 2018 at 11:06:36AM +0000, Jon Hunter wrote:
> > 
> > On 24/01/18 12:45, Peter De Schrijver wrote:  
> > > Tegra210 has a very similar CPU clocking scheme than Tegra124. So add
> > > support in this driver. Also allow for the case where the CPU voltage is
> > > controlled directly by the DFLL rather than by a separate regulator object.
> > > 
> > > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  drivers/cpufreq/tegra124-cpufreq.c | 13 ++++++-------
> > >  1 file changed, 6 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> > > index 4353025..d631dc4 100644
> > > --- a/drivers/cpufreq/tegra124-cpufreq.c
> > > +++ b/drivers/cpufreq/tegra124-cpufreq.c
> > > @@ -64,7 +64,8 @@ static void tegra124_cpu_switch_to_pllx(struct tegra124_cpufreq_priv *priv)
> > >  {
> > >  	clk_set_parent(priv->cpu_clk, priv->pllp_clk);
> > >  	clk_disable_unprepare(priv->dfll_clk);
> > > -	regulator_sync_voltage(priv->vdd_cpu_reg);
> > > +	if (priv->vdd_cpu_reg)
> > > +		regulator_sync_voltage(priv->vdd_cpu_reg);
> > >  	clk_set_parent(priv->cpu_clk, priv->pllx_clk);
> > >  }
> > >  
> > > @@ -89,10 +90,8 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
> > >  		return -ENODEV;
> > >  
> > >  	priv->vdd_cpu_reg = regulator_get(cpu_dev, "vdd-cpu");
> > > -	if (IS_ERR(priv->vdd_cpu_reg)) {
> > > -		ret = PTR_ERR(priv->vdd_cpu_reg);
> > > -		goto out_put_np;
> > > -	}
> > > +	if (IS_ERR(priv->vdd_cpu_reg))
> > > +		priv->vdd_cpu_reg = NULL;
> > >    
> > 
> > For Tegra124, don't we still want to return an error here?  
> 
> Not necessarily. Also on Tegra124 the DFLL can use PWM and I think jetson TK1
> can be reworked to use this.
> 
> Peter.
> 

Regardless of that, you need to bail out on -EPROBE_DEFER I think.
