From: Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v6 3/8] clk: tegra: Have EMC clock implement determine_rate()
Date: Fri, 10 Apr 2015 18:48:50 -0700
Message-ID: <20150411014850.19585.55239@quantum>
References: <1426584991-11110-1-git-send-email-tomeu.vizoso@collabora.com>
 <1426584991-11110-4-git-send-email-tomeu.vizoso@collabora.com>
 <20150324103834.GF18115@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150324103834.GF18115@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <mikko.perttunen@kapsi.fi>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2015-03-24 03:38:35)
> On Tue, Mar 17, 2015 at 10:36:13AM +0100, Tomeu Vizoso wrote:
> > instead of round_rate, so we can take rate constraints into account when
> > choosing the best rate.
> > 
> > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > ---
> >  drivers/clk/tegra/clk-emc.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> Mike, Stephen,
> 
> I'd like to take this into the Tegra tree because other patches depend
> on this (albeit as far as I can tell it's only a runtime dependency).
> This patch also depends on the EMC frequency scaling patches (that Mike
> Acked) that I have in a separate branch. Alternatively I can provide a
> stable branch with my current stash of patches that you can pull into
> the clk tree.

Patch looks fine to me. Please add:

Acked-by: Michael Turquette <mturquette@linaro.org>

Regards,
Mike

> 
> Thanks,
> Thierry
> 
> > diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
> > index 704fff7..615da43 100644
> > --- a/drivers/clk/tegra/clk-emc.c
> > +++ b/drivers/clk/tegra/clk-emc.c
> > @@ -117,8 +117,11 @@ static unsigned long emc_recalc_rate(struct clk_hw *hw,
> >   * safer since things have EMC rate floors. Also don't touch parent_rate
> >   * since we don't want the CCF to play with our parent clocks.
> >   */
> > -static long emc_round_rate(struct clk_hw *hw, unsigned long rate,
> > -                 unsigned long *parent_rate)
> > +static long emc_determine_rate(struct clk_hw *hw, unsigned long rate,
> > +                            unsigned long min_rate,
> > +                            unsigned long max_rate,
> > +                            unsigned long *best_parent_rate,
> > +                            struct clk_hw **best_parent_hw)
> >  {
> >       struct tegra_clk_emc *tegra;
> >       u8 ram_code = tegra_read_ram_code();
> > @@ -133,7 +136,15 @@ static long emc_round_rate(struct clk_hw *hw, unsigned long rate,
> >  
> >                  timing = tegra->timings + i;
> >  
> > -                if (timing->rate >= rate)
> > +             if (timing->rate > max_rate) {
> > +                     i = min(i, 1);
> > +                     return tegra->timings[i - 1].rate;
> > +             }
> > +
> > +             if (timing->rate < min_rate)
> > +                     continue;
> > +
> > +             if (timing->rate >= rate)
> >                          return timing->rate;
> >          }
> >  
> > @@ -452,7 +463,7 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
> >  
> >  static const struct clk_ops tegra_clk_emc_ops = {
> >       .recalc_rate = emc_recalc_rate,
> > -     .round_rate = emc_round_rate,
> > +     .determine_rate = emc_determine_rate,
> >       .set_rate = emc_set_rate,
> >       .get_parent = emc_get_parent,
> >  };
> > -- 
> > 2.1.0
> > 
