From: Shardar Mohammed <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] dmaengine: tegra-apb: proper default init of channel
 slave_id
Date: Fri, 22 Apr 2016 13:58:03 +0000
Message-ID: <f683ecd6d18e46b0a33090dfca27f919@bgmail102.nvidia.com>
References: <1461329093-20300-1-git-send-email-smohammed@nvidia.com>
 <20160422133551.GP9047@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160422133551.GP9047-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> On Fri, Apr 22, 2016 at 06:14:53PM +0530, Shardar Shariff Md wrote:
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
> Should this check happen before the channel is requested? As it is, you're
> setting up the private data of the channel with a slave_id and error out after
> that. As I understand the channel would already have its ID set to the invalid
> ID, but without going too deep into the DMA engine core code it looks as
> though once requested, the channel needs to be released again (which the
> invalid ID handling code here doesn't).	
[Shardar] Thanks will correct this.
> 
> Thierry
> 
> * Unknown Key
> * 0x7F3EB3A1
