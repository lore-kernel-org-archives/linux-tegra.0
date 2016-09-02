From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] dmaengine: tegra210-adma: Add memcpy support
Date: Fri, 2 Sep 2016 11:34:20 -0700
Message-ID: <20160902183419.GB3180@Asurada-Nvidia>
References: <1472769797-31650-1-git-send-email-nicoleotsuka@gmail.com>
 <20160902112532.GG9355@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160902112532.GG9355@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org, gnurou@gmail.com, thierry.reding@gmail.com, swarren@wwwdotorg.org, ldewangan@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Hi Vinod,

On Fri, Sep 02, 2016 at 04:55:32PM +0530, Vinod Koul wrote:
> On Thu, Sep 01, 2016 at 03:43:16PM -0700, Nicolin Chen wrote:
> 
> > +#define ADMA_CH_CTRL_MODE_ONCE				(1 << 8)
> 
> BIT(8)? You should change the existing ones too :)

Ah..right...Will change them all in the v2.

> >  #define ADMA_CH_CTRL_MODE_CONTINUOUS			(2 << 8)
> > +#define ADMA_CH_CTRL_MODE_LINKED_LIST			(4 << 8)
> >  #define ADMA_CH_CTRL_FLOWCTRL_EN			BIT(1)
> >  
> >  #define ADMA_CH_CONFIG					0x28
> > @@ -111,6 +115,7 @@ struct tegra_adma_desc {
> >  	size_t				buf_len;
> >  	size_t				period_len;
> >  	size_t				num_periods;
> > +	bool				cyclic;
> 
> Okay, i think this should be a separate preparatory patch

Hmm..I could do that, but the driver only had a cyclic support
so the boolean property here would look useless without having
the prep_dma_memcpy().

> >  	case DMA_DEV_TO_MEM:
> >  		adma_dir = ADMA_CH_CTRL_DIR_AHUB2MEM;
> >  		burst_size = fls(tdc->sconfig.src_maxburst);
> > -		ch_regs->config = ADMA_CH_CONFIG_TRG_BUF(desc->num_periods - 1);
> > -		ch_regs->ctrl = ADMA_CH_CTRL_RX_REQ(tdc->sreq_index);
> > +		ch_regs->config = ADMA_CH_CONFIG_TRG_BUF(num_periods - 1);
> > +		ch_regs->ctrl = ADMA_CH_CTRL_RX_REQ(tdc->sreq_index) |
> > +				ADMA_CH_CTRL_MODE_CONTINUOUS |
> > +				ADMA_CH_CTRL_FLOWCTRL_EN;
> 
> why is this changing?

The reference manual says M2M is non-flow controlled, and it
would not use the MODE_CONTINUOUS but MODE_ONCE, I should have
mentioned this in the commit log though.

> > +static struct dma_async_tx_descriptor *tegra_adma_prep_dma_memcpy(
> > +	struct dma_chan *dc, dma_addr_t dest, dma_addr_t src,
> > +	size_t buf_len, unsigned long flags)
> > +{
> > +	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
> > +	struct device *dev = dc->device->dev;
> > +	struct tegra_adma_desc *desc = NULL;
> > +
> > +	dev_dbg(dev, "%s channel: %d src=0x%llx dst=0x%llx len=%zu\n",
> > +		__func__, dc->chan_id, (unsigned long long)src,
> > +		(unsigned long long)dest, buf_len);
> > +
> > +	if (unlikely(!tdc || !buf_len))
> > +		return NULL;
> > +
> > +	desc = kzalloc(sizeof(*desc), GFP_NOWAIT);
> > +	if (!desc)
> > +		return NULL;
> > +
> > +	desc->num_periods = 1;
> > +	desc->buf_len = buf_len;
> > +	desc->period_len = buf_len;
> 
> should we perhaps rename this to length rather than period?

The MODE_ONCE should support multiple buffers/chunks/periods
as well according to the reference manual but I just couldn't
make that work and the manual doesn't provide much detail.

I think it could be better to have a TODO comment here.

Thank you
