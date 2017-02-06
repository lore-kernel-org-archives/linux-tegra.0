From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] clk: tegra: Add BPMP clock driver
Date: Mon, 6 Feb 2017 14:52:24 -0800
Message-ID: <20170206225224.GI25384@codeaurora.org>
References: <20161115161129.29722-1-thierry.reding@gmail.com>
 <20161117154731.29528-1-thierry.reding@gmail.com>
 <20170125074112.GC13025@ulmo.ba.sec>
 <20170203204302.GF25384@codeaurora.org>
 <20170206111342.GI27607@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170206111342.GI27607-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/06, Thierry Reding wrote:
> On Fri, Feb 03, 2017 at 12:43:02PM -0800, Stephen Boyd wrote:
> > On 01/25, Thierry Reding wrote:
> > > On Thu, Nov 17, 2016 at 04:47:31PM +0100, Thierry Reding wrote:
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > 
> > > > This driver uses the services provided by the BPMP firmware driver to
> > > > implement a clock driver based on the MRQ_CLK request. This part of the
> > > > BPMP ABI provides a means to enumerate and control clocks and should
> > > > allow the driver to work on any chip that supports this ABI.
> > > > 
> > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > > Changes in v2:
> > > > - rename ->prepare() and ->unprepare() implementations for consistency
> > > > - implement ->is_prepared() instead of ->is_enabled() to avoid the need
> > > >   for atomic operations
> > > > - rename tegra_bpmp_clk_message.clk member to id
> > > > - remove a double semi-colon and a stray ampersand
> > > > - drop extra check for validity of parent index, the core does it
> > > >   already
> > > > - make struct tegra_bpmp carry an array of struct tegra_bpmp_clk instead
> > > >   of struct clk_hw to simplify some driver code
> > > > - zero out struct clk_init_data to avoid potentially uninitialized data
> > > > - use devm_clk_hw_register() instead of clk_register() because we never
> > > >   need the opaque struct clk cookie
> > > > - rearrange functions so that they appear in the order specified by
> > > >   struct clk_ops
> > > > 
> > > >  drivers/clk/tegra/Kconfig    |   4 +
> > > >  drivers/clk/tegra/Makefile   |   1 +
> > > >  drivers/clk/tegra/clk-bpmp.c | 620 +++++++++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 625 insertions(+)
> > > >  create mode 100644 drivers/clk/tegra/clk-bpmp.c
> > > 
> > > Stephen, Mike,
> > > 
> > > we missed the last merge window with this, but it would be nice to get
> > > it in this time. Any more comments?
> > > 
> > 
> > Don't think so. Shall I merge it into clk-next?
> 
> Yeah, let me know if you do, then I can drop it from the Tegra tree.

Ok. I've applied it to clk-next now.

> 
> > Sadly it's not easy to test compile this single driver on the
> > commandline. Grumble.
> 
> Any way I could help with that? I did put this into the Tegra tree a
> while ago after not getting any further responses to at least get it
> some broader build coverage.
> 
> I personally use a set of scripts to make sure the proper drivers are
> compiled. If you can provide information about what you use, perhaps I
> can work with you to make this easier for you.

Ideally I'd like to compile the driver with

make drivers/clk/tegra/clk-bmpm.o

and have that just work. To do so, I have to make sure my config
has the right settings, which is the annoying part. If it wasn't
one-off APIs with #ifdefs to make things compile out when configs
aren't set it would work better.

Similar problems happen for I2C drivers. I should probably just
put the work into making a script figure out the right config to
compile a file or something. If you have a good solution here it
would be great if I could incorporate it into my flow.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
