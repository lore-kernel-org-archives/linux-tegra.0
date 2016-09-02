From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: Add memcpy support
Date: Fri, 2 Sep 2016 16:55:32 +0530
Message-ID: <20160902112532.GG9355@localhost>
References: <1472769797-31650-1-git-send-email-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472769797-31650-1-git-send-email-nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 01, 2016 at 03:43:16PM -0700, Nicolin Chen wrote:

> +#define ADMA_CH_CTRL_MODE_ONCE				(1 << 8)

BIT(8)? You should change the existing ones too :)

>  #define ADMA_CH_CTRL_MODE_CONTINUOUS			(2 << 8)
> +#define ADMA_CH_CTRL_MODE_LINKED_LIST			(4 << 8)
>  #define ADMA_CH_CTRL_FLOWCTRL_EN			BIT(1)
>  
>  #define ADMA_CH_CONFIG					0x28
> @@ -111,6 +115,7 @@ struct tegra_adma_desc {
>  	size_t				buf_len;
>  	size_t				period_len;
>  	size_t				num_periods;
> +	bool				cyclic;

Okay, i think this should be a separate preparatory patch

>  	case DMA_DEV_TO_MEM:
>  		adma_dir = ADMA_CH_CTRL_DIR_AHUB2MEM;
>  		burst_size = fls(tdc->sconfig.src_maxburst);
> -		ch_regs->config = ADMA_CH_CONFIG_TRG_BUF(desc->num_periods - 1);
> -		ch_regs->ctrl = ADMA_CH_CTRL_RX_REQ(tdc->sreq_index);
> +		ch_regs->config = ADMA_CH_CONFIG_TRG_BUF(num_periods - 1);
> +		ch_regs->ctrl = ADMA_CH_CTRL_RX_REQ(tdc->sreq_index) |
> +				ADMA_CH_CTRL_MODE_CONTINUOUS |
> +				ADMA_CH_CTRL_FLOWCTRL_EN;

why is this changing?

> +static struct dma_async_tx_descriptor *tegra_adma_prep_dma_memcpy(
> +	struct dma_chan *dc, dma_addr_t dest, dma_addr_t src,
> +	size_t buf_len, unsigned long flags)
> +{
> +	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
> +	struct device *dev = dc->device->dev;
> +	struct tegra_adma_desc *desc = NULL;
> +
> +	dev_dbg(dev, "%s channel: %d src=0x%llx dst=0x%llx len=%zu\n",
> +		__func__, dc->chan_id, (unsigned long long)src,
> +		(unsigned long long)dest, buf_len);
> +
> +	if (unlikely(!tdc || !buf_len))
> +		return NULL;
> +
> +	desc = kzalloc(sizeof(*desc), GFP_NOWAIT);
> +	if (!desc)
> +		return NULL;
> +
> +	desc->num_periods = 1;
> +	desc->buf_len = buf_len;
> +	desc->period_len = buf_len;

should we perhaps rename this to length rather than period?

-- 
~Vinod
