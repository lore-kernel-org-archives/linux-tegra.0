From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH] clk: tegra: mark TEGRA210_CLK_DBGAPB as always on
Date: Mon, 6 Mar 2017 16:28:50 +0200
Message-ID: <20170306142850.GJ26640@tbergstrom-lnx.Nvidia.com>
References: <1488295191-24038-1-git-send-email-pdeschrijver@nvidia.com>
 <4cf40c25-2ce9-737c-9ccb-06bc2cdb61d7@nvidia.com>
 <20170306083835.GF26640@tbergstrom-lnx.Nvidia.com>
 <6d4dd315-cab6-189d-f383-fb7523fc31bd@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6d4dd315-cab6-189d-f383-fb7523fc31bd@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 06, 2017 at 09:58:29AM +0000, Jon Hunter wrote:
> 
> On 06/03/17 08:38, Peter De Schrijver wrote:
> > On Thu, Mar 02, 2017 at 05:56:49PM +0000, Jon Hunter wrote:
> >>
> >> On 28/02/17 15:19, Peter De Schrijver wrote:
> >>> This is needed to make the JTAG debugging interface work.
> >>>
> >>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> >>> ---
> >>>  drivers/clk/tegra/clk-tegra210.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> >>> index 9a2512a..708f5f1 100644
> >>> --- a/drivers/clk/tegra/clk-tegra210.c
> >>> +++ b/drivers/clk/tegra/clk-tegra210.c
> >>> @@ -2680,6 +2680,7 @@ static void tegra210_cpu_clock_resume(void)
> >>>  	{ TEGRA210_CLK_EMC, TEGRA210_CLK_CLK_MAX, 0, 1 },
> >>>  	{ TEGRA210_CLK_MSELECT, TEGRA210_CLK_CLK_MAX, 0, 1 },
> >>>  	{ TEGRA210_CLK_CSITE, TEGRA210_CLK_CLK_MAX, 0, 1 },
> >>> +	{ TEGRA210_CLK_DBGAPB, TEGRA210_CLK_CLK_MAX, 0, 1 },
> >>>  	{ TEGRA210_CLK_TSENSOR, TEGRA210_CLK_CLK_M, 400000, 0 },
> >>>  	{ TEGRA210_CLK_I2C1, TEGRA210_CLK_PLL_P, 0, 0 },
> >>>  	{ TEGRA210_CLK_I2C2, TEGRA210_CLK_PLL_P, 0, 0 },
> >>
> >> Should there be some dependency on say CONFIG_DEBUG_KERNEL? I am not
> >> sure we always want this on for all cases.
> > 
> > Why would you not want it to be always on?
> 
> Purely for power reasons. I do not know how much power keeping this

I don't expect it to be significant but I don't have any numbers.

> clock running consumes, but I don't like the idea of clocks running all
> the time when they are not needed.
> 

Problem is that in this case there is no easy way to determine if the clock
needs to be on.

Peter.
