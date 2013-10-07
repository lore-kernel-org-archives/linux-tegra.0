From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: tegra114: Rename gr_2d/gr_3d to gr2d/gr3d
Date: Mon, 7 Oct 2013 17:28:39 +0300
Message-ID: <20131007142839.GC3973@tbergstrom-lnx.Nvidia.com>
References: <1380748361-32459-1-git-send-email-treding@nvidia.com>
 <524EF436.4000704@wwwdotorg.org>
 <20131007001433.7445.7915@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131007001433.7445.7915@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 07, 2013 at 02:14:33AM +0200, Mike Turquette wrote:
> Quoting Stephen Warren (2013-10-04 10:00:38)
> > On 10/02/2013 03:12 PM, Thierry Reding wrote:
> > > These clocks were named gr2d and gr3d on Tegra20 and Tegra30, so use the
> > > same names on Tegra114 for consistency.
> > 
> > The series,
> > Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Although I wonder if there will be merge conflicts with Peter's "clk:
> > tegra: replace enum tegra114_clk by binding header"?
> 
> There are merge conflicts in other places too. The latest clk-next
> branch is based on -rc3 with only a few patches (publicly) applied so
> far. As of the time of this writing the top-most commit is
> 96a7ed9079a3483c5681b17f4713c37c1cf2b1c9.
> 
> Can the Tegra folks send me a pull request with the following
> patches applied? (likely in this order):
> 
> ARM: tegra114: add missing clocks to binding
> clk: tegra: replace enum tegra114_clk by binding header
> [PATCH v2] clk: tegra: Correct sbc mux width & parent
> clk: tegra: Fix vde/2d/3d clock src offset
> clk: tegra: Set the clock parent of gr2d/gr3d to pll_c2
> clk: tegra: Set the clk parent of host1x to pll_p
> clk: tegra114: Rename gr_2d/gr_3d to gr2d/gr3d
> clk: tegra114: Initialize gr2d clock

This conflicts with 'clk: tegra: Set the clock parent of gr2d/gr3d to pll_c2'
I suggest we drop 'clk: tegra114: Initialize gr2d clock' and use pll_c2 to clock gr2d.

> The set of patches above (with their functional dependencies) were
> giving me some conflict resolution issues (e.g. large data tables that
> needed to be updated in clk-tegra-114.c) against the latest clk-next.
> 
> Additionally I've looked at the following patches on the list which can
> be added to the pull request if you want (these patches all look fine
> but I haven't yet Acked each individually):
> 
> clk: tegra30: Don't wait for PLL_U lock bit

This is already part of next-20130927.

> clk: tegra114: Initialize host1x and related clocks

This conflicts with 'clk: tegra: Set the clk parent of host1x to pll_p'. I
suggest we drop 'clk: tegra: Set the clk parent of host1x to pll_p' and run
host1x from pll_c. Mark, Thierry, is this ok?

> clk: tegra: PLLE spread spectrum control (with updated changelog)
> 
> If there are plans to spin a v3 of "Introduce common infra for tegra
> clocks" then basing it on top of this tegra pull request would be nice.
> 
> Let me know if this is a problem for you.
> 
> Regards,
> Mike
