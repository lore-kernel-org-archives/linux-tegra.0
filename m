From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] soc/tegra: pmc: fix child-node lookup
Date: Mon, 13 Aug 2018 16:33:17 +0200
Message-ID: <20180813143317.GI24218@localhost>
References: <20171115094458.31666-1-johan@kernel.org>
 <20180322142432.GA5853@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180322142432.GA5853@ulmo>
Sender: stable-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Thu, Mar 22, 2018 at 03:24:32PM +0100, Thierry Reding wrote:
> On Wed, Nov 15, 2017 at 10:44:58AM +0100, Johan Hovold wrote:
> > Fix child-node lookup during probe, which ended up searching the whole
> > device tree depth-first starting at the parent rather than just matching
> > on its children.
> > 
> > To make things worse, the parent pmc node could end up being prematurely
> > freed as of_find_node_by_name() drops a reference to its first argument.
> > 
> > Fixes: 3568df3d31d6 ("soc: tegra: Add thermal reset (thermtrip) support to PMC")
> > Cc: stable <stable@vger.kernel.org>     # 4.0
> > Cc: Mikko Perttunen <mperttunen@nvidia.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/soc/tegra/pmc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied, thanks.

I noticed this one still hasn't made it into linux-next. Looks like it
wasn't included in you 4.17 pull request and is still sitting in the
tegra for-4.17/soc branch.

Johan
