From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH] clk: tegra: fix disable unused for clocks sharing enable
 bit
Date: Mon, 20 Mar 2017 16:29:22 +0200
Message-ID: <20170320142922.GI21907@tbergstrom-lnx.Nvidia.com>
References: <1489587055-23722-1-git-send-email-pdeschrijver@nvidia.com>
 <20170320132746.GK22463@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170320132746.GK22463@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 20, 2017 at 02:27:46PM +0100, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Mar 15, 2017 at 04:10:54PM +0200, Peter De Schrijver wrote:
> > In case 2 clocks share an enable bit and one of them is enabled by a driver
> > and the other one is not, CCF will think it's enabled because it will only
> > look at the hw state. Therefor it will disable the clock and thus also
> > disable the other clock which was enabled. Solve this by reading the
> > initial state of the enable bit and incrementing the refcount if it's set.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-periph-gate.c | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> I think you had already sent a version of this patch a couple of weeks
> ago. I've applied the first version since I couldn't spot any delta
> between them.

Hmm. Could be.

Cheers,

Peter.
