From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] clk: tegra: add fence_delay for clock registers
Date: Thu, 16 Nov 2017 13:27:19 +0200
Message-ID: <20171116112719.GO6210@tbergstrom-lnx.Nvidia.com>
References: <1510313868-24810-1-git-send-email-pdeschrijver@nvidia.com>
 <1510313868-24810-3-git-send-email-pdeschrijver@nvidia.com>
 <20171115004132.GM11955@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171115004132.GM11955-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 14, 2017 at 04:41:32PM -0800, Stephen Boyd wrote:
> On 11/10, Peter De Schrijver wrote:
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Some commit text perhaps explaining why we add this?
> 
> > ---
> >  drivers/clk/tegra/clk.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> > index 872f118..3b8947e 100644
> > --- a/drivers/clk/tegra/clk.h
> > +++ b/drivers/clk/tegra/clk.h
> > @@ -809,4 +809,11 @@ static inline struct clk *tegra_clk_register_emc(void __iomem *base,
> >  u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
> >  int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
> >  
> > +/* Combined read fence with delay */
> > +#define fence_udelay(delay, reg)	\
> > +	do {				\
> > +		readl_relaxed(reg);	\
> > +		udelay(delay);		\
> 
> Does the udelay() need to be after the readl()? As far as I
> recall, the delay can start spinning before the read returns
> because there isn't any sort of barrier between the two. One
> approach would be to have an mb() between the read and the delay
> so that the read is ordered with respect to the delay. If not, we
> need a better comment than "combined read fence with delay".
> 

Yes. the udelay() needs to be after the readl, but it indeed needs to be
readl() so we're sure the read cycle has been completed.

Peter.
