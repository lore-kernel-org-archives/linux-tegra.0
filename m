From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 2/2] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Wed, 14 Oct 2015 16:57:59 +0530
Message-ID: <20151014112759.GS27370@localhost>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444047007-30494-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 05, 2015 at 01:10:07PM +0100, Jon Hunter wrote:

> +static enum dma_status tegra_adma_tx_status(struct dma_chan *dc,
> +					    dma_cookie_t cookie,
> +					    struct dma_tx_state *txstate)
> +{
> +	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
> +	struct tegra_adma_desc *desc;
> +	struct virt_dma_desc *vd;
> +	enum dma_status ret;
> +	unsigned long flags;
> +	unsigned int residual;
> +
> +	spin_lock_irqsave(&tdc->lock, flags);
> +
> +	ret = dma_cookie_status(dc, cookie, txstate);
> +	if (ret == DMA_COMPLETE) {
> +		spin_unlock_irqrestore(&tdc->lock, flags);
> +		return ret;
> +	}

txstate can be NULL, upon which below code doesn't help in getting executed
so bailing here or above case is fine

> +static struct dma_async_tx_descriptor *tegra_adma_prep_dma_cyclic(
> +	struct dma_chan *dc, dma_addr_t buf_addr, size_t buf_len,
> +	size_t period_len, enum dma_transfer_direction direction,
> +	unsigned long flags)
> +{
> +	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
> +	struct tegra_adma_desc *desc = NULL;
> +
> +	if (!tdc->config_valid) {
> +		dev_err(tdc2dev(tdc), "ADMA slave configuration not set\n");
> +		return NULL;
> +	}
> +
> +	if (!buf_len || !period_len || period_len > ADMA_CH_TC_COUNT_MASK) {
> +		dev_err(tdc2dev(tdc), "invalid buffer/period len\n");
> +		return NULL;
> +	}
> +
> +	if (buf_len % period_len) {
> +		dev_err(tdc2dev(tdc), "buf_len not a multiple of period_len\n");
> +		return NULL;
> +	}
> +
> +	if (!IS_ALIGNED(buf_addr, 4)) {
> +		dev_err(tdc2dev(tdc), "invalid buffer alignment\n");
> +		return NULL;
> +	}
> +
> +	desc = kzalloc(sizeof(*desc), GFP_ATOMIC);

we recommend GFP_NOWAIT for the subsystem

> +static int tegra_adma_remove(struct platform_device *pdev)
> +{
> +	struct tegra_adma *tdma = platform_get_drvdata(pdev);
> +	struct tegra_adma_chan *tdc;
> +	int i;
> +
> +	dma_async_device_unregister(&tdma->dma_dev);
> +
> +	for (i = 0; i < tdma->nr_channels; ++i) {
> +		tdc = &tdma->channels[i];
> +		tasklet_kill(&tdc->vc.task);
> +	}
this is good, but your irq is still active and can fire and thus trigger
more tasklets!

-- 
~Vinod
