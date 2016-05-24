From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V3 0/2] Add support for Tegra210 ADMA
Date: Tue, 24 May 2016 09:23:30 +0530
Message-ID: <20160524035329.GO2735@localhost>
References: <1444980919-20331-1-git-send-email-jonathanh@nvidia.com>
 <CAP=VYLpnREnW1a6++0qW=1N6EcUpKTTfiCnfbuA3DHktKmf22Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP=VYLpnREnW1a6++0qW=1N6EcUpKTTfiCnfbuA3DHktKmf22Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 20, 2016 at 02:51:14PM -0400, Paul Gortmaker wrote:
> On Fri, Oct 16, 2015 at 3:35 AM, Jon Hunter <jonathanh@nvidia.com> wrote:
> > Add support for the Tegra210 Audio DMA (ADMA) controller. This was
> > originally distributed as an RFC [0] based upon the existing tegra
> > APB-DMA driver. Since then the driver has been significantly
> > re-worked to remove a lot of the unused/unnecessary functionality
> > that was carried over from the APB-DMA. This version is no longer
> > derived from the APB-DMA driver and has been updated to use the
> > virt-dma helpers.
> 
> Does this driver make sense to support modular use?  I ask because
> it inherits the inconsistency of being a bool Kconfig but using some
> modular infrastructure from the APB driver.
> 
> Sometime ago  when I sent patches to dma/* to "demodularize" other
> bools, the general consensus of reviewers/maintainers was that
> (to paraphrase) "if it can be modular, it should be modular" -- in
> order to keep the multi platform bzImage size as small as can be.
> 
> I did a quick test with it tristate, but that fails as follows:
> 
> ERROR: "pm_clk_add_clk" [drivers/dma/tegra210-adma.ko] undefined!
> ERROR: "pm_clk_create" [drivers/dma/tegra210-adma.ko] undefined!
> ERROR: "pm_clk_destroy" [drivers/dma/tegra210-adma.ko] undefined!
> ERROR: "pm_clk_suspend" [drivers/dma/tegra210-adma.ko] undefined!
> ERROR: "pm_clk_resume" [drivers/dma/tegra210-adma.ko] undefined!
> 
> ...since drivers/base/power/clock_ops.c does not currently have any of
> those fcns as EXPORT_SYMBOL.  Not a show-stopper, but I don't
> want to blindly export those fcns if it doesn't make sense.

Sure, patch is welcome!

-- 
~Vinod
