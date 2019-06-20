From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] dmaengine: tegra-apb: Support per-burst residue
 granularity
Date: Fri, 21 Jun 2019 00:58:51 +0300
Message-ID: <8470f28f-b903-c6ed-23bd-0cbd130f0798@gmail.com>
References: <20190618115035.29250-1-digetx@gmail.com>
 <8f48fcba-df7c-a313-2f84-0fa896e4ccec@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8f48fcba-df7c-a313-2f84-0fa896e4ccec@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

20.06.2019 11:38, Jon Hunter пишет:
> 
> On 18/06/2019 12:50, Dmitry Osipenko wrote:
>> Tegra's APB DMA engine updates words counter after each transferred burst
>> of data, hence it can report transfer's residual with more fidelity which
>> may be required in cases like audio playback. In particular this fixes
>> audio stuttering during playback in a chromiuim web browser. The patch is
>> based on the original work that was made by Ben Dooks. It was tested on
>> Tegra20 and Tegra30 devices.
>>
>> Link: https://lore.kernel.org/lkml/20190424162348.23692-1-ben.dooks@codethink.co.uk/
>> Inspired-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>
>> Changelog:
>>
>> v2:  Addressed review comments made by Jon Hunter to v1. We won't try
>>      to get words count if dma_desc is on free list as it will result
>>      in a NULL dereference because this case wasn't handled properly.
>>
>>      The residual value is now updated properly, avoiding potential
>>      integer overflow by adding the "bytes" to the "bytes_transferred"
>>      instead of the subtraction.
>>
>>  drivers/dma/tegra20-apb-dma.c | 33 ++++++++++++++++++++++++++-------
>>  1 file changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>> index 79e9593815f1..fed18bc46479 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -797,6 +797,28 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
>>  	return 0;
>>  }
>>  
>> +static unsigned int tegra_dma_sg_bytes_xferred(struct tegra_dma_channel *tdc,
>> +					       struct tegra_dma_sg_req *sg_req)
>> +{
>> +	unsigned long status, wcount = 0;
>> +
>> +	if (!list_is_first(&sg_req->node, &tdc->pending_sg_req))
>> +		return 0;
>> +
>> +	if (tdc->tdma->chip_data->support_separate_wcount_reg)
>> +		wcount = tdc_read(tdc, TEGRA_APBDMA_CHAN_WORD_TRANSFER);
>> +
>> +	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
>> +
>> +	if (!tdc->tdma->chip_data->support_separate_wcount_reg)
>> +		wcount = status;
>> +
>> +	if (status & TEGRA_APBDMA_STATUS_ISE_EOC)
>> +		return sg_req->req_len;
>> +
>> +	return get_current_xferred_count(tdc, sg_req, wcount);
>> +}
>> +
>>  static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
>>  	dma_cookie_t cookie, struct dma_tx_state *txstate)
>>  {
>> @@ -806,6 +828,7 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
>>  	enum dma_status ret;
>>  	unsigned long flags;
>>  	unsigned int residual;
>> +	unsigned int bytes = 0;
>>  
>>  	ret = dma_cookie_status(dc, cookie, txstate);
>>  	if (ret == DMA_COMPLETE)
>> @@ -825,6 +848,7 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
>>  	list_for_each_entry(sg_req, &tdc->pending_sg_req, node) {
>>  		dma_desc = sg_req->dma_desc;
>>  		if (dma_desc->txd.cookie == cookie) {
>> +			bytes = tegra_dma_sg_bytes_xferred(tdc, sg_req);
>>  			ret = dma_desc->dma_status;
>>  			goto found;
>>  		}
>> @@ -836,7 +860,7 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
>>  found:
>>  	if (dma_desc && txstate) {
>>  		residual = dma_desc->bytes_requested -
>> -			   (dma_desc->bytes_transferred %
>> +			   ((dma_desc->bytes_transferred + bytes) %
>>  			    dma_desc->bytes_requested);
>>  		dma_set_residue(txstate, residual);
>>  	}
>> @@ -1441,12 +1465,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
>>  		BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
>>  		BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
>>  	tdma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
>> -	/*
>> -	 * XXX The hardware appears to support
>> -	 * DMA_RESIDUE_GRANULARITY_BURST-level reporting, but it's
>> -	 * only used by this driver during tegra_dma_terminate_all()
>> -	 */
>> -	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
>> +	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
>>  	tdma->dma_dev.device_config = tegra_dma_slave_config;
>>  	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
>>  	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
>>
> 
> Looks good to me. Thanks for fixing!
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks to you too for the review :)
