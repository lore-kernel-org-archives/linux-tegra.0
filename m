From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 7/7] DMA: tegra-adma: Add support for Tegra210 ADMA
Date: Sun, 23 Aug 2015 20:03:28 +0530
Message-ID: <20150823143328.GC13546@localhost>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
 <1439905755-25150-8-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439905755-25150-8-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 18, 2015 at 02:49:15PM +0100, Jon Hunter wrote:
> +#define AHUB_TO_MEMORY						2
> +#define MEMORY_TO_AHUB						4

namespace this aptly as well

> +static void tegra_adma_stop(struct tegra_dma_channel *tdc)
> +{
> +	u32 status;
> +
> +	/* TODO: Do we need to disable interrupts here? */

when?

> +static void tegra_adma_start(struct tegra_dma_channel *tdc,
> +		struct tegra_dma_sg_req *sg_req)
> +{
> +	struct tegra_adma_chan_regs *ch_regs = &sg_req->adma_ch_regs;
> +
> +	/* Update transfer done count for position calculation */
> +	tdc->adma_ch_regs.tc = ch_regs->tc;
> +	tdc_write(tdc, ADMA_CH_TC, ch_regs->tc);
> +	tdc_write(tdc, ADMA_CH_CTRL, ch_regs->ctrl);
> +	tdc_write(tdc, ADMA_CH_LOWER_SOURCE_ADDR, ch_regs->src_ptr);
> +	tdc_write(tdc, ADMA_CH_LOWER_TARGET_ADDR, ch_regs->tgt_ptr);
> +	tdc_write(tdc, ADMA_CH_AHUB_FIFO_CTRL, ch_regs->ahub_fifo_ctrl);
> +	tdc_write(tdc, ADMA_CH_CONFIG, ch_regs->config);
empty line here please

> +static int tegra_adma_get_xfer_params(struct tegra_dma_channel *tdc,
> +				      struct tegra_adma_chan_regs *ch_regs,
> +				      enum dma_transfer_direction direction)
> +{
> +	u32 burst_size, ctrl, ctrl_mask, slave_id, fifo_mask, fifo_shift;
> +
> +	ch_regs->ahub_fifo_ctrl = tdc_read(tdc, ADMA_CH_AHUB_FIFO_CTRL);
> +	ch_regs->config = tdc_read(tdc, ADMA_CH_CONFIG);
> +	ch_regs->ctrl = tdc_read(tdc, ADMA_CH_CTRL);
> +	slave_id = tdc->dma_sconfig.slave_id;
> +
> +	switch (direction) {
> +	case DMA_MEM_TO_DEV:
> +		burst_size = fls(tdc->dma_sconfig.dst_maxburst);
> +		ctrl_mask = ADMA_CH_CTRL_TX_REQUEST_SELECT_MASK;
> +		ctrl = MEMORY_TO_AHUB << ADMA_CH_CTRL_TRANSFER_DIRECTION_SHIFT;
> +		ctrl |= slave_id << ADMA_CH_CTRL_TX_REQUEST_SELECT_SHIFT;
> +		fifo_mask = ADMA_CH_AHUB_FIFO_CTRL_TX_FIFO_SIZE_MASK;
> +		fifo_shift = ADMA_CH_AHUB_FIFO_CTRL_TX_FIFO_SIZE_SHIFT;
> +		break;
Empty line here pls

> +	case DMA_DEV_TO_MEM:
> +		burst_size = fls(tdc->dma_sconfig.src_maxburst);
> +		ctrl_mask = ADMA_CH_CTRL_RX_REQUEST_SELECT_MASK;
> +		ctrl = AHUB_TO_MEMORY << ADMA_CH_CTRL_TRANSFER_DIRECTION_SHIFT;
> +		ctrl |= slave_id << ADMA_CH_CTRL_RX_REQUEST_SELECT_SHIFT;
> +		fifo_mask = ADMA_CH_AHUB_FIFO_CTRL_RX_FIFO_SIZE_MASK;
> +		fifo_shift = ADMA_CH_AHUB_FIFO_CTRL_RX_FIFO_SIZE_SHIFT;
> +		break;

here too...

> +	default:
> +		dev_err(tdc2dev(tdc), "Dma direction is not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!burst_size || burst_size > ADMA_BURSTSIZE_16)
> +		burst_size = ADMA_BURSTSIZE_16;
> +
> +	ch_regs->ahub_fifo_ctrl &= ~fifo_mask;
> +	ch_regs->ahub_fifo_ctrl |= ADMA_FIFO_DEFAULT_SIZE << fifo_shift;
> +	ch_regs->config &= ~ADMA_CH_CONFIG_BURST_SIZE_MASK;
> +	ch_regs->config |= burst_size << ADMA_CH_CONFIG_BURST_SIZE_SHIFT;
> +	ch_regs->ctrl &= ~(ctrl_mask | ADMA_CH_CTRL_TRANSFER_DIRECTION_MASK);
> +	ch_regs->ctrl |= ctrl;
> +
> +	return -EINVAL;
??

> +static int tegra_adma_pm_suspend(struct device *dev)
> +{
> +	struct tegra_dma *tdma = dev_get_drvdata(dev);
> +	int i;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(dev);
why is this required :)

> +static int tegra_adma_pm_resume(struct device *dev)
> +{
> +	struct tegra_dma *tdma = dev_get_drvdata(dev);
> +	int i;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(dev);
and this

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
