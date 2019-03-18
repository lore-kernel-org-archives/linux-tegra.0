From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/5] reset: add acquired/released state for exclusive
 reset controls
Date: Mon, 18 Mar 2019 17:40:50 +0100
Message-ID: <1552927250.7558.10.camel@pengutronix.de>
References: <20190221152557.8534-1-thierry.reding@gmail.com>
         <20190221152858.GA8652@ulmo> <20190318091216.GB14465@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318091216.GB14465@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Mon, 2019-03-18 at 10:12 +0100, Thierry Reding wrote:
> On Thu, Feb 21, 2019 at 04:28:58PM +0100, Thierry Reding wrote:
> > On Thu, Feb 21, 2019 at 04:25:53PM +0100, Thierry Reding wrote:
> > > From: Philipp Zabel <p.zabel@pengutronix.de>
> > > 
> > > There are cases where a driver needs explicit control over a reset line
> > > that is exclusively conneted to its device, but this control has to be
> > > temporarily handed over to the power domain controller to handle reset
> > > requirements during power transitions.
> > > Allow multiple exclusive reset controls to be requested in 'released'
> > > state for the same physical reset line, only one of which can be
> > > acquired at the same time.
> > > 
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  drivers/reset/core.c  | 139 ++++++++++++++++++++++++++++++++++++++----
> > >  include/linux/reset.h |  93 ++++++++++++++++++++++------
> > >  2 files changed, 200 insertions(+), 32 deletions(-)
> > 
> > Hi Philipp,
> > 
> > the bulk of this is unchanged relative to what you had posted
> > originally. I squashed in the few things that we had already discussed
> > earlier (EINVAL -> EPERM) and a couple of minor fixes for issues that I
> > found while working with this.
> > 
> > Attached is my fixup patch which contains all the changes I made on top
> > of your version and that I squashed into this.
> > 
> > Thierry
> 
> Hi Philipp,
> 
> do you have any further comments on this series?

Sorry for the delay, I'll have a closer look tomorrow. I obviously don't
disagree on the implementation and I appreciate the added documentation.

As for how to merge this, would you be fine with me providing a stable
branch that contains the first three patches? That could then go into
both reset/next and tegra trees.

regards
Philipp
