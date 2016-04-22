From: Shardar Mohammed <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] dmaengine: tegra-apb: proper default init of channel
 slave_id
Date: Fri, 22 Apr 2016 13:56:31 +0000
Message-ID: <36d59e91fa72417d94ae2672e423ebb4@bgmail102.nvidia.com>
References: <1461329093-20300-1-git-send-email-smohammed@nvidia.com>
 <571A2819.9000507@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571A2819.9000507-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thanks for the review, please check my comments inline in [Shardar].

> On 22/04/16 13:44, Shardar Shariff Md wrote:
> > Initialize default channel slave_id(req_sel) to invalid id (i.e max
> > supported slave id + 1) to avoid overwriting of slave_id during
> > tegra_dma_slave_config() with client data if slave_id is not
> > initialized through DT
> >
> > Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
> 
> Sorry, thinking about this some more, given that the ID is programmed into a
> field in the CSR register could we just define as mask here for the CSR field ...
> 
> #define TEGRA_APBDMA_CSR_REQ_SEL_MASK	0x1f
> 
> Note this should be defined with the other CSR register field definitions.
[Shardar] Will take care of it. One doubt do you mean below.
Will define this with other CSR register fields.
#define TEGRA_APBDMA_CSR_REQ_SEL_MASK	0x1f

#define TEGRA_APBDMA_SLAVE_ID_MAX		TEGRA_APBDMA_CSR_REQ_SEL_MASK

> 
> > +#define TEGRA_APBDMA_SLAVE_ID_INVALID
> 	(TEGRA_APBDMA_SLAVE_ID_MAX + 1)
> >
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
> 
> I believe I mentioned before that here we should ...
> 
> 	if (tdc->slave_id != TEGRA_APBDMA_SLAVE_ID_INVALID)
> 		return -EBUSY;

[Shardar] By the time this function tegra_dma_slave_config is called, slave_id here is already initialized through DT(provided option) through function tegra_dma_of_xlate().
And filling up the slave id here from sconfig structure that is provided by dma client driver is used here if it dma client is not initialized through DT. 
Please correct me if am wrong.

> 
> 	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
> 	tdc->slave_id = sconfig->slave_id;
> 
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
> > +
> >  	return chan;
> >  }
> >
> > @@ -1389,6 +1397,7 @@ static int tegra_dma_probe(struct
> platform_device *pdev)
> >  				&tdma->dma_dev.channels);
> >  		tdc->tdma = tdma;
> >  		tdc->id = i;
> > +		tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
> >
> >  		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
> >  				(unsigned long)tdc);
> 
> Otherwise looks good.
> 
> Cheers
> Jon
