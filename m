From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/4] clk: tegra: Add la clock for Tegra210
Date: Wed, 24 Jan 2018 13:23:50 +0200
Message-ID: <20180124112350.GG7031@tbergstrom-lnx.Nvidia.com>
References: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
 <1516699369-3513-2-git-send-email-pdeschrijver@nvidia.com>
 <31118e4b-80bd-1db2-0a82-9359b99deccf@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <31118e4b-80bd-1db2-0a82-9359b99deccf-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 24, 2018 at 10:03:31AM +0000, Jon Hunter wrote:
> 
> On 23/01/18 09:22, Peter De Schrijver wrote:
> > This clock is needed by the memory built-in self test work around.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/clk-tegra210.c         | 14 ++++++++++++++
> >  include/dt-bindings/clock/tegra210-car.h |  2 +-
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> > index 9e62608..f790c2d 100644
> > --- a/drivers/clk/tegra/clk-tegra210.c
> > +++ b/drivers/clk/tegra/clk-tegra210.c
> > @@ -41,6 +41,7 @@
> >  #define CLK_SOURCE_CSITE 0x1d4
> >  #define CLK_SOURCE_EMC 0x19c
> >  #define CLK_SOURCE_SOR1 0x410
> > +#define CLK_SOURCE_LA 0x1f8
> >  
> >  #define PLLC_BASE 0x80
> >  #define PLLC_OUT 0x84
> > @@ -2654,6 +2655,13 @@ static int tegra210_init_pllu(void)
> >  			      sor1_parents_idx, 0, &sor1_lock),
> >  };
> >  
> > +static const char * const la_parents[] = {
> > +	"pll_p", "pll_c2", "pll_c", "pll_c3", "pll_re_out1", "pll_a1", "clk_m", "pll_c4_out0"
> > +};
> > +
> 
> I was comparing this with downstream and it appears that the parents are
> listed as "pll_p", "pll_c", "pll_m", "clk_m". Can you double check the
> above is correct?
> 

For all I can see the parents as listed in dowstream are incorrect. Likely
only pll_p is used in practice, so noone has noticed this. pll_m for example
can only be used by emc since T210, so it cannot be part of the parent list
of la.

Peter.
