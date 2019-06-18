From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v1] dmaengine: tegra-apb: Support per-burst residue
 granularity
Date: Tue, 18 Jun 2019 23:22:53 +0100
Message-ID: <f2290604-12f4-019b-47e7-4e4e29a433d4@codethink.co.uk>
References: <20190613210849.10382-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613210849.10382-1-digetx@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 13/06/2019 22:08, Dmitry Osipenko wrote:
> Tegra's APB DMA engine updates words counter after each transferred burst
> of data, hence it can report transfer's residual with more fidelity which
> may be required in cases like audio playback. In particular this fixes
> audio stuttering during playback in a chromiuim web browser. The patch is
> based on the original work that was made by Ben Dooks [1]. It was tested
> on Tegra20 and Tegra30 devices.
> 
> [1] https://lore.kernel.org/lkml/20190424162348.23692-1-ben.dooks@codethink.co.uk/
> 
> Inspired-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>   drivers/dma/tegra20-apb-dma.c | 35 ++++++++++++++++++++++++++++-------
>   1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 79e9593815f1..c5af8f703548 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -797,12 +797,36 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
>   	return 0;
>   }
>   
> +static unsigned int tegra_dma_update_residual(struct tegra_dma_channel *tdc,
> +					      struct tegra_dma_sg_req *sg_req,
> +					      struct tegra_dma_desc *dma_desc,
> +					      unsigned int residual)
> +{
> +	unsigned long status, wcount = 0;
> +
> +	if (!list_is_first(&sg_req->node, &tdc->pending_sg_req))
> +		return residual;
> +
> +	if (tdc->tdma->chip_data->support_separate_wcount_reg)
> +		wcount = tdc_read(tdc, TEGRA_APBDMA_CHAN_WORD_TRANSFER);
> +
> +	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
> +
> +	if (!tdc->tdma->chip_data->support_separate_wcount_reg)
> +		wcount = status;
> +
> +	if (status & TEGRA_APBDMA_STATUS_ISE_EOC)
> +		return residual - sg_req->req_len;
> +
> +	return residual - get_current_xferred_count(tdc, sg_req, wcount);
> +}

I am unfortunately nowhere near my notes, so can't completely
review this. I think the complexity of my patch series is due
to an issue with the count being updated before the EOC IRQ
is actually flagged (and most definetly before it gets to the
CPU IRQ handler).

The test system I was using, which i've not really got any
access to at the moment would show these internal inconsistent
states every few hours, however it was moving 48kHz 8ch 16bit
TDM data.

Thanks for looking into this, I am not sure if I am going to
get any time to look into this within the next couple of
months.

>   static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
>   	dma_cookie_t cookie, struct dma_tx_state *txstate)
>   {
>   	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
> +	struct tegra_dma_sg_req *sg_req = NULL;
>   	struct tegra_dma_desc *dma_desc;
> -	struct tegra_dma_sg_req *sg_req;
>   	enum dma_status ret;
>   	unsigned long flags;
>   	unsigned int residual;
> @@ -838,6 +862,8 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
>   		residual = dma_desc->bytes_requested -
>   			   (dma_desc->bytes_transferred %
>   			    dma_desc->bytes_requested);
> +		residual = tegra_dma_update_residual(tdc, sg_req, dma_desc,
> +						     residual);
>   		dma_set_residue(txstate, residual);
>   	}
>   
> @@ -1441,12 +1467,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
>   		BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
>   		BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
>   	tdma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
> -	/*
> -	 * XXX The hardware appears to support
> -	 * DMA_RESIDUE_GRANULARITY_BURST-level reporting, but it's
> -	 * only used by this driver during tegra_dma_terminate_all()
> -	 */
> -	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
> +	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
>   	tdma->dma_dev.device_config = tegra_dma_slave_config;
>   	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
>   	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
