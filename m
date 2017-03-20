From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: rework pll_u
Date: Mon, 20 Mar 2017 16:37:05 +0200
Message-ID: <20170320143705.GJ21907@tbergstrom-lnx.Nvidia.com>
References: <1489500769-28694-1-git-send-email-pdeschrijver@nvidia.com>
 <20170320132021.GH22463@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170320132021.GH22463-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 20, 2017 at 02:20:21PM +0100, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Mar 14, 2017 at 04:12:49PM +0200, Peter De Schrijver wrote:
> > In normal operation pll_u is under hardware control and has a fixed rate of
> > 480MHz. Hardware will turn on pll_u on whenever any of the XUSB
> > powerdomains is on. From a software point of view we model this is if pll_u
> > is always on using a fixed rate clock. However the bootloader might or
> > might not have configured pll_u this way. So we will check the current
> > state of pll_u at boot and reconfigure it if required.
> > 
> > There are 3 possiblities at kernel boot:
> > 1) pll_u is under hardware control: do nothing
> > 2) pll_u is under hardware control and enabled: enable hardware control
> > 3) pll_u is disabled: enable pll_u and enable hardware control
> > 
> > In all cases we also check if UTMIPLL is under hardware control at boot
> > and configure it for hardware control if that is not the case.
> > The same is done during SC7 resume.
> > 
> > Thanks to Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> for bug fixes.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/clk-pll.c      | 174 -----------------------
> >  drivers/clk/tegra/clk-tegra210.c | 295 ++++++++++++++++++++++++++++++++++++---
> >  2 files changed, 272 insertions(+), 197 deletions(-)
> 
> Applied, thanks.
> 
> Do you think this actually fixes a bug? We've had a long standing issue
> with booting Debian on a Jetson TX1 which is due to some USB related PLL
> failing to lock. This sounds like it could fix that particular issue.
> 

I think the current approach does have problems if the PLL is already under
hw control.

Cheers,

Peter.
