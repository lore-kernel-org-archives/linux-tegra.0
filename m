From: r yang <decatf@gmail.com>
Subject: Re: [PATCH] clk: tegra: Return the exact clock rate from
 clk_round_rate
Date: Mon, 24 Sep 2018 15:18:04 -0400
Message-ID: <20180924191804.GA20060@r>
References: <20180921220149.17136-1-decatf@gmail.com>
 <20180924080803.GF7636@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180924080803.GF7636@tbergstrom-lnx.Nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 24, 2018 at 11:08:03AM +0300, Peter De Schrijver wrote:
> On Fri, Sep 21, 2018 at 06:01:49PM -0400, ryang wrote:
> > The current behavior is that clk_round_rate would return the same clock
> > rate passed to it for valid PLL configurations. This change will return
> > the exact rate the PLL will provide in accordance with clk API.
> > 
> > Signed-off-by: ryang <decatf@gmail.com>
> > ---
> >  drivers/clk/tegra/clk-pll.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> > index 17a058c3bbc1..36014a6ec42e 100644
> > --- a/drivers/clk/tegra/clk-pll.c
> > +++ b/drivers/clk/tegra/clk-pll.c
> > @@ -595,7 +595,12 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
> >  		return -EINVAL;
> >  	}
> >  
> > -	cfg->output_rate >>= p_div;
> > +	if (cfg->m == 0) {
> > +		cfg->output_rate = 0;
> 
> I think a WARN_ON() is appropriate here. the input divider should never be 0.
> 
> Peter.
> 

Should it return -EINVAL (or some error) too? _calc_rate is also in the
clk_set_rate code path. I think we want to avoid programming the
register to 0 input divider all together?

> > +	} else {
> > +		cfg->output_rate = cfg->n * DIV_ROUND_UP(parent_rate, cfg->m);
> > +		cfg->output_rate >>= p_div;
> > +	}
> >  
> >  	if (pll->params->pdiv_tohw) {
> >  		ret = _p_div_to_hw(hw, 1 << p_div);
> > -- 
> > 2.17.1
> > 
