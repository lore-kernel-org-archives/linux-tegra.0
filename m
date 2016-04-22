From: Shardar Mohammed <smohammed@nvidia.com>
Subject: RE: [PATCH v2] dmaengine: tegra-apb: proper default init of channel
 slave_id
Date: Fri, 22 Apr 2016 13:57:16 +0000
Message-ID: <a73db69dcb9e4ca484d9dbb947966fa4@bgmail102.nvidia.com>
References: <1461329093-20300-1-git-send-email-smohammed@nvidia.com>
 <571A2A7C.5010305@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <571A2A7C.5010305@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> On 22/04/16 13:44, Shardar Shariff Md wrote:
> > Initialize default channel slave_id(req_sel) to invalid id (i.e max
> > supported slave id + 1) to avoid overwriting of slave_id during
> > tegra_dma_slave_config() with client data if slave_id is not
> > initialized through DT
> >
> > Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
> >
> > ---
> > - Instead of initializing the slave id to -1 define macros for
> >   max slave id and invalid slave id and do the checks accordingly.
> > ---
> >  drivers/dma/tegra20-apb-dma.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/tegra20-apb-dma.c
> > b/drivers/dma/tegra20-apb-dma.c index 3871f29..2957e26 100644
> > --- a/drivers/dma/tegra20-apb-dma.c
> > +++ b/drivers/dma/tegra20-apb-dma.c
> > @@ -114,6 +114,9 @@
> >  /* Channel base address offset from APBDMA base address */
> >  #define TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET	0x1000
> >
> > +#define TEGRA_APBDMA_SLAVE_ID_MAX		31
> > +#define TEGRA_APBDMA_SLAVE_ID_INVALID
> 	(TEGRA_APBDMA_SLAVE_ID_MAX + 1)
> > +
> >  struct tegra_dma;
> >
> >  /*
> > @@ -353,7 +356,7 @@ static int tegra_dma_slave_config(struct dma_chan
> *dc,
> >  	}
> >
> >  	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
> > -	if (!tdc->slave_id)
> > +	if (tdc->slave_id == TEGRA_APBDMA_SLAVE_ID_INVALID)
> >  		tdc->slave_id = sconfig->slave_id;
> >  	tdc->config_init = true;
> >  	return 0;
> > @@ -1236,7 +1239,7 @@ static void
> tegra_dma_free_chan_resources(struct dma_chan *dc)
> >  	}
> >  	pm_runtime_put(tdma->dev);
> >
> > -	tdc->slave_id = 0;
> > +	tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
> >  }
> >
> >  static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args
> > *dma_spec, @@ -1253,6 +1256,11 @@ static struct dma_chan
> *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
> >  	tdc = to_tegra_dma_chan(chan);
> >  	tdc->slave_id = dma_spec->args[0];
> >
> > +	if (tdc->slave_id > TEGRA_APBDMA_SLAVE_ID_MAX) {
> > +		dev_err(tdc2dev(tdc), "Invalid slave id\n");
> > +		return NULL;
> > +	}
> 
> Please move this test to before the dma_get_any_slave_channel(),
> otherwise we could leak the DMA channel!

[Shardar] Will take care of this.
> 
> Cheers
> Jon
