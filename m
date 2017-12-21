From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/4] clk: tegra: add fence_delay for clock registers
Date: Thu, 21 Dec 2017 11:02:22 +0200
Message-ID: <20171221090222.GT29417@tbergstrom-lnx.Nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
 <1510842542-16451-3-git-send-email-pdeschrijver@nvidia.com>
 <9026e3d1-26aa-28fc-6098-60484957da48@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9026e3d1-26aa-28fc-6098-60484957da48-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 19, 2017 at 11:04:25PM +0000, Jon Hunter wrote:
> 
> On 16/11/17 14:29, Peter De Schrijver wrote:
> > To ensure writes to clock registers have properly propagated through the
> > clock control logic and state machines, we need to ensure the writes have
> > been posted in the registers and wait for 1us after that.
> 
> Is this is all cases or just for the SLCG?
> 

This is also needed for other registers, but I think that's outside the scope
of this series.

Peter.

> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/clk.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> > index 872f118..d5badbe 100644
> > --- a/drivers/clk/tegra/clk.h
> > +++ b/drivers/clk/tegra/clk.h
> > @@ -809,4 +809,11 @@ static inline struct clk *tegra_clk_register_emc(void __iomem *base,
> >  u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
> >  int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
> >  
> > +/* Combined read fence with delay */
> > +#define fence_udelay(delay, reg)	\
> > +	do {				\
> > +		readl(reg);		\
> > +		udelay(delay);		\
> > +	} while(0)
> > +
> >  #endif /* TEGRA_CLK_H */
> 
> Do we plan to use this else-where or just for this WAR? I am wondering
> if it should just go in the Tegra210 clock file.
> 
> Cheers
> Jon
> 
> -- 
> nvpublic
