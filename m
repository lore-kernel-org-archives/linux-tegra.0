From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 6/8] clk: tegra20: Turn EMC clock gate into divider
Date: Mon, 09 Jul 2018 14:52:41 +0300
Message-ID: <1722318.xXycuB2Qx5@dimapc>
References: <20180617145539.4758-1-digetx@gmail.com> <20180617145539.4758-7-digetx@gmail.com> <153109441777.143105.8459253820659446035@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153109441777.143105.8459253820659446035@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday, 9 July 2018 03:00:17 MSK Stephen Boyd wrote:
> Quoting Dmitry Osipenko (2018-06-17 07:55:37)
> 
> > Kernel should never gate the EMC clock as it causes immediate lockup, so
> > removing clk-gate functionality doesn't affect anything. Turning EMC clk
> > gate into divider allows to implement glitch-less EMC scaling, avoiding
> > reparenting to a backup clock.
> > 
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > ---
> 
> Who's supposed to apply this? Me? Thierry? The "To:" line is not
> useful when every maintainer is there.

That's up to you and Thierry to decide. Perhaps it would be less churning if 
you'll give your ack on the 'clk:' patches and Thierry will handle the whole 
series on his own.

> > diff --git a/drivers/clk/tegra/clk-tegra20.c
> > b/drivers/clk/tegra/clk-tegra20.c index cc857d4d4a86..2bd35418716a 100644
> > --- a/drivers/clk/tegra/clk-tegra20.c
> > +++ b/drivers/clk/tegra/clk-tegra20.c
> > @@ -799,6 +798,31 @@ static struct tegra_periph_init_data
> > tegra_periph_nodiv_clk_list[] = {> 
> >         TEGRA_INIT_DATA_NODIV("disp2",  mux_pllpdc_clkm, CLK_SOURCE_DISP2,
> >         30, 2, 26,  0, TEGRA20_CLK_DISP2),>  
> >  };
> > 
> > +static void __init tegra20_emc_clk_init(void)
> > +{
> > +       struct clk *clk;
> > +
> > +       clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
> > +                              ARRAY_SIZE(mux_pllmcp_clkm),
> > +                              CLK_SET_RATE_NO_REPARENT,
> > +                              clk_base + CLK_SOURCE_EMC,
> > +                              30, 2, 0, &emc_lock);
> > +
> > +       clk = tegra_clk_register_mc("mc", "emc_mux", clk_base +
> > CLK_SOURCE_EMC, +                                   &emc_lock);
> > +       clks[TEGRA20_CLK_MC] = clk;
> > +
> > +       /*
> > +        * Note that 'emc_mux' source and 'emc' rate shouldn't be changed
> > at +        * the same time due to a HW bug, this won't happen because
> > we're +        * defining 'emc_mux' and 'emc' as a distinct clocks.
> 
> s/ a//

I can adjust the comment and re-spin the series if something more important 
will pop up, otherwise that could addressed while applying the patch. 
