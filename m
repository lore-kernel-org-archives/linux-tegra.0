From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] dma: tegra: add accurate reporting of dma state
Date: Wed, 24 Apr 2019 21:17:00 +0300
Message-ID: <dbe7c256-c7ad-a172-9e63-9251bec6f182@gmail.com>
References: <20190424162348.23692-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424162348.23692-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@lists.codethink.co.uk
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.04.2019 19:23, Ben Dooks пишет:
> The tx_status callback does not report the state of the transfer
> beyond complete segments. This causes problems with users such as
> ALSA when applications want to know accurately how much data has
> been moved.
> 
> This patch addes a function tegra_dma_update_residual() to query
> the hardware and modify the residual information accordinly. It
> takes into account any hardware issues when trying to read the
> state, such as delays between finishing a buffer and signalling
> the interrupt.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Hello Ben,

Thank you very much for keeping it up. I have couple comments, please see them below.

> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Laxman Dewangan <ldewangan@nvidia.com> (supporter:TEGRA DMA DRIVERS)
> Cc: Jon Hunter <jonathanh@nvidia.com> (supporter:TEGRA DMA DRIVERS)
> Cc: Vinod Koul <vkoul@kernel.org> (maintainer:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM)
> Cc: Dan Williams <dan.j.williams@intel.com> (reviewer:ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API)
> Cc: Thierry Reding <thierry.reding@gmail.com> (supporter:TEGRA ARCHITECTURE SUPPORT)
> Cc: dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM)
> Cc: linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
> Cc: linux-kernel@vger.kernel.org (open list)
> ---
>  drivers/dma/tegra20-apb-dma.c | 92 ++++++++++++++++++++++++++++++++---
>  1 file changed, 86 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index cf462b1abc0b..544e7273e741 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -808,6 +808,90 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
>  	return 0;
>  }
>  
> +static unsigned int tegra_dma_update_residual(struct tegra_dma_channel *tdc,
> +					      struct tegra_dma_sg_req *sg_req,
> +					      struct tegra_dma_desc *dma_desc,
> +					      unsigned int residual)
> +{
> +	unsigned long status = 0x0;
> +	unsigned long wcount;
> +	unsigned long ahbptr;
> +	unsigned long tmp = 0x0;
> +	unsigned int result;

You could pre-assign ahbptr=0xffffffff and result=residual here, then you could remove all the duplicated assigns below. 

> +	int retries = TEGRA_APBDMA_BURST_COMPLETE_TIME * 10;
> +	int done;
> +
> +	/* if we're not the current request, then don't alter the residual */
> +	if (sg_req != list_first_entry(&tdc->pending_sg_req,
> +				       struct tegra_dma_sg_req, node)) {
> +		result = residual;
> +		ahbptr = 0xffffffff;
> +		goto done;
> +	}
> +
> +	/* loop until we have a reliable result for residual */
> +	do {
> +		ahbptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBPTR);
> +		status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
> +		tmp =  tdc_read(tdc, 0x08);	/* total count for debug */

The "tmp" variable isn't used anywhere in the code, please remove it.

> +
> +		/* check status, if channel isn't busy then skip */
> +		if (!(status & TEGRA_APBDMA_STATUS_BUSY)) {
> +			result = residual;
> +			break;
> +		}

This doesn't look correct because TRM says "Busy bit gets set as soon as a channel is enabled and gets cleared after transfer completes", hence a cleared BUSY bit means that all transfers are completed and result=residual is incorrect here. Given that there is a check for EOC bit being set below, this hunk should be removed.

> +
> +		/* if we've got an interrupt pending on the channel, don't
> +		 * try and deal with the residue as the hardware has likely
> +		 * moved on to the next buffer. return all data moved.
> +		 */
> +		if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
> +			result = residual - sg_req->req_len;
> +			break;
> +		}
> +
> +		if (tdc->tdma->chip_data->support_separate_wcount_reg)
> +			wcount = tdc_read(tdc, TEGRA_APBDMA_CHAN_WORD_TRANSFER);
> +		else
> +			wcount = status;
> +
> +		/* If the request is at the full point, then there is a
> +		 * chance that we have read the status register in the
> +		 * middle of the hardware reloading the next buffer.
> +		 *
> +		 * The sequence seems to be at the end of the buffer, to
> +		 * load the new word count before raising the EOC flag (or
> +		 * changing the ping-pong flag which could have also been
> +		 * used to determine a new buffer). This  means there is a
> +		 * small window where we cannot determine zero-done for the
> +		 * current buffer, or moved to next buffer.
> +		 *
> +		 * If done shows 0, then retry the load, as it may hit the
> +		 * above hardware race. We will either get a new value which
> +		 * is from the first buffer, or we get an EOC (new buffer)
> +		 * or both a new value and an EOC...
> +		 */
> +		done = get_current_xferred_count(tdc, sg_req, wcount);
> +		if (done != 0) {
> +			result = residual - done;
> +			break;
> +		}
> +
> +		ndelay(100);

Please use udelay(1) because there is no ndelay on arm32 and ndelay(100) is getting rounded up to 1usec. AFAIK, arm64 doesn't have reliable ndelay on Tegra either because timer rate changes with the CPU frequency scaling.

Secondly done=0 isn't a error case, technically this could be the case when tegra_dma_update_residual() is invoked just after starting the transfer. Hence I think this do-while loop and timeout checking aren't needed at all since done=0 is a perfectly valid case.


Altogether seems the tegra_dma_update_residual() could be reduced to:

static unsigned int tegra_dma_update_residual(struct tegra_dma_channel *tdc,
					      struct tegra_dma_sg_req *sg_req,
					      struct tegra_dma_desc *dma_desc,
					      unsigned int residual)
{
	unsigned long status, wcount;

	if (list_is_first(&sg_req->node, &tdc->pending_sg_req))
		return residual;

	if (tdc->tdma->chip_data->support_separate_wcount_reg)
		wcount = tdc_read(tdc, TEGRA_APBDMA_CHAN_WORD_TRANSFER);

	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);

	if (!tdc->tdma->chip_data->support_separate_wcount_reg)
		wcount = status;

	if (status & TEGRA_APBDMA_STATUS_ISE_EOC)
		return residual - sg_req->req_len;

	return residual - get_current_xferred_count(tdc, sg_req, wcount);
}
