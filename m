From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v2 01/11] clk: tegra: Switch to using critical clks
Date: Mon, 27 Jun 2016 11:35:31 +0300
Message-ID: <20160627083531.GA12863@tbergstrom-lnx.Nvidia.com>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
 <1464381494-27096-2-git-send-email-rklein@nvidia.com>
 <20160622121630.GB26943@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160622121630.GB26943@ulmo.ba.sec>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rhyland Klein <rklein@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 22, 2016 at 02:16:30PM +0200, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, May 27, 2016 at 04:38:04PM -0400, Rhyland Klein wrote:
> > Mark some of the required-to-be-enabled clks as critical clks. These
> > need to be kept on through the disabling of unused clks during init.
> > They may not get any reference before or after init, but are required
> > to be on, therefore let the core enable them.
> > 
> > Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> > ---
> > v2:
> >  - Remove mention of HAND_OFF clks as they are not supported yet.
> > 
> >  drivers/clk/tegra/clk-tegra-periph.c     | 21 ++++++++++++++-------
> >  drivers/clk/tegra/clk-tegra-super-gen4.c | 12 +++++++-----
> >  2 files changed, 21 insertions(+), 12 deletions(-)
> 
> I have some difficulty to follow why some of these clocks are critical.
> It might help if the commit message mentioned why each of these need to
> remain enabled forever, even if never used.
> 
> Also, it's fairly unlikely that pll_p for example would ever get
> disabled because a bunch of others are derived from it. I'm also not
> quite convinced yet that it really is critical. What does it drive which
> isn't claimed by any drivers?
> 

mselect and sclk are clocked from pll_p, however we don't have drivers for
those. Most other peripherals clocked from pll_p can be clockgated by their
driver which can lead to pll_p being turned off causing the system to hang.

Cheers,

Peter.

