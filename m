From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] clk: tegra: use pll_ref as the pll_e parent
Date: Wed, 30 Oct 2013 16:44:10 +0100
Message-ID: <1383147850.4095.3.camel@weser.hi.pengutronix.de>
References: <1383093707-10312-1-git-send-email-pdeschrijver@nvidia.com>
	 <527128B5.2020101@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <527128B5.2020101@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Mark Zhang <markz@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 30.10.2013, 09:41 -0600 schrieb Stephen Warren:
> On 10/29/2013 06:41 PM, Peter De Schrijver wrote:
> > Use pll_ref instead of pll_re_vco as the pll_e parent on Tegra114 and
> > Tegra124. Also add a pll_ref table entry for pll_e for Tegra114.
> 
> Why? What benefit does this give, or what bug does this fix?
> 
> > diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> 
> >  	val_aux = pll_readl(pll_params->aux_reg, pll);
> >  
> >  	if (val & PLL_BASE_ENABLE) {
> > -		if (!(val_aux & PLLE_AUX_PLLRE_SEL))
> > +		if ((val_aux & PLLE_AUX_PLLRE_SEL) || (val_aux & val_aux))
> 
> Isn't "|| (val_aux & val_aux)" always true, at least if the value is
> non-zero? Either this should be simply "|| val_aux", or one of those two
> "val_aux" is the wrong thing.
> 
> >  			WARN(1, "pll_e enabled with unsupported parent %s\n",
> > -			  (val & PLLE_AUX_PLLP_SEL) ? "pllp_out0" : "pll_ref");
> > +			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
> > +					"pll_re_vco");
> >  	} else {
> > -		val_aux |= PLLE_AUX_PLLRE_SEL;
> > +		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
> >  		pll_writel(val, pll_params->aux_reg, pll);
> >  	}
> 
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> 
> > @@ -560,6 +560,7 @@ static struct tegra_clk_pll_freq_table pll_e_freq_table[] = {
> >  	/* PLLE special case: use cpcon field to store cml divider value */
> >  	{336000000, 100000000, 100, 21, 16, 11},
> >  	{312000000, 100000000, 200, 26, 24, 13},
> > +	{12000000, 100000000, 200,  1,  24, 13},
> 
> Presumably this is because pll_ref is the crystal, which runs at 12MHz.
> What if it doesn't; Tegra supports a bunch of other crystal rates. Don't
> we need entries for all the other potential crystal rates too?

The TRM states that PCIe and thus PLLE are only supported with 12MHz
external crystal rate.

-- 
Pengutronix e.K.                           | Lucas Stach                 |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5076 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
