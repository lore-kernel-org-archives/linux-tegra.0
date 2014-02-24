From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra clockframework fixes for 3.14
Date: Mon, 24 Feb 2014 15:43:19 +0200
Message-ID: <20140224134319.GG19389@tbergstrom-lnx.Nvidia.com>
References: <20140220172744.GA4378@tbergstrom-lnx.Nvidia.com>
 <20140224010211.22529.99924@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140224010211.22529.99924@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 24, 2014 at 02:02:11AM +0100, Mike Turquette wrote:
> Quoting Peter De Schrijver (2014-02-20 09:27:44)
> > Hi Mike,
> > 
> > Could you merge these fixes still for 3.14?
> 
> No problem, but can you provide a list of the regressions fixed? I'll
> add those to my merge commit message. No need for you to respin
> anything. Next time if you could submit a signed tag with the
> regressions listed in the message it would be a great help.
> 

This fixes the following issues:

clk: tegra124: remove gr2d and gr3d clocks - accesses to undefined registers
clk: tegra: Fix vic03 mux index - wrong parent when PLLC3 is selected (because clk_m is actually selected)
clk: tegra: use max divider if divider overflows - make tegra fractional divider match the clk-div.c behaviour
clk: tegra: cclk_lp has a pllx/2 divider - pllx runs at half the programmed rate
clk: tegra: fix sdmmc clks on Tegra1x4 - wrong parent selection
clk: tegra: fix host1x clock on Tegra124 - wrong parent selection
clk: tegra: PLLD2 fixes for hdmi - PLL runs at wrong rate
clk: tegra: Fix PLLD mnp table - PLL runs at wrong rate
clk: tegra: Fix PLLP rate table - kernel panic when using coreboot
clk: tegra: Correct clock number for UARTE - wrong clock when using UARTE
clk: tegra: Add missing Tegra20 fuse clks - fuse driver broken

Cheers,

Peter.
