From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v1 1/3] dma: tegra: finer granularity residual for
 tx_status
Date: Wed, 21 May 2014 11:30:12 +0530
Message-ID: <20140521060012.GL21128@intel.com>
References: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com>
 <1399411343-12222-2-git-send-email-cfreeman@nvidia.com>
 <536A6145.2080106@wwwdotorg.org>
 <20140507223745.GB20137@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140507223745.GB20137@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christopher Freeman <cfreeman@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@nvidia.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 07, 2014 at 03:37:45PM -0700, Christopher Freeman wrote:
> On Wed, May 07, 2014 at 09:37:25AM -0700, Stephen Warren wrote:
> > On 05/06/2014 03:22 PM, Christopher Freeman wrote:
> > > Get word-level granularity from hardware for calculating
> > > the transfer count remaining.
> > 
> > > diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> > 
> > > +static int tegra_dma_wcount_in_bytes(struct dma_chan *dc)
> > 
> > A lot of the code in this function is identical to the code in
> > tegra_dma_terminate_all() which does the same thing. Can this be pulled
> > out into a shared utility function?
> > 
> I'll look at making utility functions for ISR handling and the calculations for the byte counts.
> 
> > > +	tegra_dma_pause(tdc, true);
> > 
> > Is this continual pausing/resuming of the DMA operation going to
> > negatively affect performance?
> > 
> I tried testing the performance impact and each call took about 20 uS.  And of
> course, the client would have to be calling this constantly.
But why do we need to pause, cant we read the status form HW and report..?

-- 
~Vinod
