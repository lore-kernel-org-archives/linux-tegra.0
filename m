From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/2] memory: tegra: EMC scaling is not a clock provider
Date: Mon, 11 May 2020 12:17:43 -0500
Message-ID: <20200511171743.GA16850@bogus>
References: <20200506123236.7463-1-geert+renesas@glider.be>
 <20200507200718.GD2981633@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200507200718.GD2981633@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Jonathan Hunter <jonathanh@nvidia.com>, Frank Rowand <frowand.list@gmail.com>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 07, 2020 at 10:07:18PM +0200, Thierry Reding wrote:
> On Wed, May 06, 2020 at 02:32:34PM +0200, Geert Uytterhoeven wrote:
> > 	Hi all,
> > 
> > The Tegra EMC scaling support code is not a clock provider, but merely a
> > clock consumer, and thus does not need to include
> > <linux/clk-provider.h>.
> > 
> > However, drivers/memory/tegra/tegra210-emc-table.c relies on
> > tegra210-emc.h to include <linux/of.h> through <linux/clk-provider.h>.
> > Hence the first patch makes <linux/of_reserved_mem.h> self-contained
> > first.
> > 
> > Thanks for your comments!
> > 
> > Geert Uytterhoeven (2):
> >   of: Make <linux/of_reserved_mem.h> self-contained
> >   memory: tegra: Drop <linux/clk-provider.h>
> > 
> >  drivers/memory/tegra/tegra210-emc-core.c | 1 -
> >  drivers/memory/tegra/tegra210-emc.h      | 1 -
> >  include/linux/of_reserved_mem.h          | 1 +
> >  3 files changed, 1 insertion(+), 2 deletions(-)
> 
> Ah... I should've read the cover letter first. Looks like I need to take
> that first patch through the Tegra tree as well to avoid introducing the
> build error in the second patch.
> 
> Rob, do you mind if I pick up patch 1 of this into the same OF branch
> that I already carry the memory-region-names patches on?

No, it's fine.

Acked-by: Rob Herring <robh@kernel.org>
