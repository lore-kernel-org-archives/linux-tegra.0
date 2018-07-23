From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 6/8] clk: tegra30: add 2d and 3d idle clocks
Date: Mon, 23 Jul 2018 14:33:26 +0300
Message-ID: <22870833.4JC6Is3odW@dimapc>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk> <1721645.6LMGIEI4vR@dimapc> <ca29f065814a22f46b9b1683165548cb@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca29f065814a22f46b9b1683165548cb@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, pdeschrijver@nvidia.com
Cc: jonathanh@nvidia.co, thierry.reding@gmail.com, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, pgaikwad@nvidia.com, linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org

On Monday, 23 July 2018 11:28:25 MSK Ben Dooks wrote:
> On 2018-07-22 12:55, Dmitry Osipenko wrote:
> > On Friday, 20 July 2018 16:45:30 MSK Ben Dooks wrote:
> >> The 2D and 3D clocks have an IDLE field in bits 15:8 so add these
> >> clocks by making a 2D and 3D mux, and split the divider into the
> >> standard 2D/3D ones and 2D/3D idle clocks.
> >> 
> >> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> [snip]

> @@ -658,8 +658,12 @@ static struct tegra_devclk devclks[] __initdata = {
>  	{ .dev_id = "mpe", .dt_id = TEGRA30_CLK_MPE },
>  	{ .dev_id = "host1x", .dt_id = TEGRA30_CLK_HOST1X },
>  	{ .dev_id = "3d", .dt_id = TEGRA30_CLK_GR3D },
> +	{ .dev_id = "3d", .con_id = "mux", .dt_id = TEGRA30_CLK_GR3D_MUX },
> +	{ .dev_id = "3d", .con_id = "idle", .dt_id = TEGRA30_CLK_GR3D_IDLE },
>  	{ .dev_id = "3d2", .dt_id = TEGRA30_CLK_GR3D2 },

The  "3d2" also has the "idle" divisor, why have you skipped it?

>  	{ .dev_id = "2d", .dt_id = TEGRA30_CLK_GR2D },
> +	{ .dev_id = "2d", .con_id = "mux", .dt_id = TEGRA30_CLK_GR2D_MUX },
> +	{ .dev_id = "2d", .con_id = "idle", .dt_id = TEGRA30_CLK_GR2D_IDLE },
>  	{ .dev_id = "se", .dt_id = TEGRA30_CLK_SE },
>  	{ .dev_id = "mselect", .dt_id = TEGRA30_CLK_MSELECT },
>  	{ .dev_id = "tegra-nor", .dt_id = TEGRA30_CLK_NOR },

[snip]

> 
> > According to TRM, Tegra20 and Tegra114 have these "idle-mode" clock
> > dividers
> > as well. Why only T30 should have them?
> 
> I've got a separate series to sort t20 bits out, i've not used the
> tegra114
> 

This makes this series to look a bit inconsistent, please send out all the 
patches to give a consistent view.

I don't see anything that could really stop you from adding the clocks for 
T114, its 2d/3d clocks definition pretty matches to T20/30.

> >> a/include/dt-bindings/clock/tegra30-car.h
> >> b/include/dt-bindings/clock/tegra30-car.h index
> >> 3c90f1535551..eda4ca60351e
> >> 100644
> >> --- a/include/dt-bindings/clock/tegra30-car.h
> >> +++ b/include/dt-bindings/clock/tegra30-car.h
> >> @@ -269,6 +269,11 @@
> >> 
> >>  #define TEGRA30_CLK_AUDIO3_MUX 306
> >>  #define TEGRA30_CLK_AUDIO4_MUX 307
> >>  #define TEGRA30_CLK_SPDIF_MUX 308
> >> 
> >> -#define TEGRA30_CLK_CLK_MAX 309
> >> +
> >> +#define TEGRA30_CLK_GR2D_MUX	309
> >> +#define TEGRA30_CLK_GR3D_MUX	310
> >> +#define TEGRA30_CLK_GR2D_IDLE	311
> >> +#define TEGRA30_CLK_GR3D_IDLE	312
> >> +#define TEGRA30_CLK_CLK_MAX 313
> >> 
> >>  #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
> > 
> > IIUC, that "idle-mode" divisor is just some kind of power-safe feature,
> > is
> > there any real use-case for these clocks? Why not to just pre-configure
> > the
> > "idle-mode" bits during the clocks initialization?
> 
> It is is nice to have it available after to check,

Please initialize the "idle" clock rate via the tegra_clk_init_table in the 
patch that adds the clock or in a followup patch within the same patchset.

> other than that we're
> not
> using any drivers that currently dynamically change the values of this.

All changes made to upstream kernel must be justified, the only acceptable 
justification is that a change is required for the upstream driver.
