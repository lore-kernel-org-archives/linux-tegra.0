From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] dmaengine: tegra-apb: Support per-burst residue
 granularity
Date: Tue, 18 Jun 2019 12:45:20 +0300
Message-ID: <69cb064c-2a8e-9421-35b0-4a2273f62365@gmail.com>
References: <20190613210849.10382-1-digetx@gmail.com>
 <5fbe4374-cc9a-8212-017e-05f4dee64443@nvidia.com>
 <7ab96aa5-0be2-dc01-d187-eb718093eb99@nvidia.com>
 <840fcf60-8e24-ff44-a816-ef63a5f18652@gmail.com>
 <d34c100d-e82a-bb00-22c6-c5f2f6cdb03a@nvidia.com>
 <b47b7b89-e830-0b3e-026d-c6c7d67d3324@gmail.com>
 <255f92e8-df61-5e9c-ba4f-e52a0bd11451@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <255f92e8-df61-5e9c-ba4f-e52a0bd11451@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.06.2019 11:47, Jon Hunter пишет:
> 
> On 17/06/2019 13:41, Dmitry Osipenko wrote:
>> 17.06.2019 13:57, Jon Hunter пишет:
>>>
>>> On 14/06/2019 17:44, Dmitry Osipenko wrote:
>>>> 14.06.2019 18:24, Jon Hunter пишет:
>>>>>
>>>>> On 14/06/2019 16:21, Jon Hunter wrote:
>>>>>>
>>>>>> On 13/06/2019 22:08, Dmitry Osipenko wrote:
>>>>>>> Tegra's APB DMA engine updates words counter after each transferred burst
>>>>>>> of data, hence it can report transfer's residual with more fidelity which
>>>>>>> may be required in cases like audio playback. In particular this fixes
>>>>>>> audio stuttering during playback in a chromiuim web browser. The patch is
>>>>>>> based on the original work that was made by Ben Dooks [1]. It was tested
>>>>>>> on Tegra20 and Tegra30 devices.
>>>>>>>
>>>>>>> [1] https://lore.kernel.org/lkml/20190424162348.23692-1-ben.dooks@codethink.co.uk/
>>>>>>>
>>>>>>> Inspired-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>>> ---
>>>>>>>  drivers/dma/tegra20-apb-dma.c | 35 ++++++++++++++++++++++++++++-------
>>>>>>>  1 file changed, 28 insertions(+), 7 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>>>>>>> index 79e9593815f1..c5af8f703548 100644
>>>>>>> --- a/drivers/dma/tegra20-apb-dma.c
>>>>>>> +++ b/drivers/dma/tegra20-apb-dma.c
>>>>>>> @@ -797,12 +797,36 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
>>>>>>>  	return 0;
>>>>>>>  }
>>>>>>>  
>>>>>>> +static unsigned int tegra_dma_update_residual(struct tegra_dma_channel *tdc,
>>>>>>> +					      struct tegra_dma_sg_req *sg_req,
>>>>>>> +					      struct tegra_dma_desc *dma_desc,
>>>>>>> +					      unsigned int residual)
>>>>>>> +{
>>>>>>> +	unsigned long status, wcount = 0;
>>>>>>> +
>>>>>>> +	if (!list_is_first(&sg_req->node, &tdc->pending_sg_req))
>>>>>>> +		return residual;
>>>>>>> +
>>>>>>> +	if (tdc->tdma->chip_data->support_separate_wcount_reg)
>>>>>>> +		wcount = tdc_read(tdc, TEGRA_APBDMA_CHAN_WORD_TRANSFER);
>>>>>>> +
>>>>>>> +	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
>>>>>>> +
>>>>>>> +	if (!tdc->tdma->chip_data->support_separate_wcount_reg)
>>>>>>> +		wcount = status;
>>>>>>> +
>>>>>>> +	if (status & TEGRA_APBDMA_STATUS_ISE_EOC)
>>>>>>> +		return residual - sg_req->req_len;
>>>>>>> +
>>>>>>> +	return residual - get_current_xferred_count(tdc, sg_req, wcount);
>>>>>>> +}
>>>>>>> +
>>>>>>>  static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
>>>>>>>  	dma_cookie_t cookie, struct dma_tx_state *txstate)
>>>>>>>  {
>>>>>>>  	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
>>>>>>> +	struct tegra_dma_sg_req *sg_req = NULL;
>>>>>>>  	struct tegra_dma_desc *dma_desc;
>>>>>>> -	struct tegra_dma_sg_req *sg_req;
>>>>>>>  	enum dma_status ret;
>>>>>>>  	unsigned long flags;
>>>>>>>  	unsigned int residual;
>>>>>>> @@ -838,6 +862,8 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
>>>>>>>  		residual = dma_desc->bytes_requested -
>>>>>>>  			   (dma_desc->bytes_transferred %
>>>>>>>  			    dma_desc->bytes_requested);
>>>>>>> +		residual = tegra_dma_update_residual(tdc, sg_req, dma_desc,
>>>>>>> +						     residual);
>>>>>>
>>>>>> I had a quick look at this, I am not sure that we want to call
>>>>>> tegra_dma_update_residual() here for cases where the dma_desc is on the
>>>>>> free_dma_desc list. In fact, couldn't this be simplified a bit for case
>>>>>> where the dma_desc is on the free list? In that case I believe that the
>>>>>> residual should always be 0.
>>>>>
>>>>> Actually, no, it could be non-zero in the case the transfer is aborted.
>>>>
>>>> Looks like everything should be fine as-is.
>>>
>>> I am still not sure we want to call this for the case where dma_desc is
>>> on the free list.
>>
>> You're right! It's a bug there! The sg_req=NULL if dma_desc is on the free list, hence
>> it will result in a NULL dereference. I'll fix it in v2 and will avoid the offending
>> call, like you're suggesting.
>>
>>>> BTW, it's a bit hard to believe that there is any real benefit from the
>>>> free_dma_desc list at all, maybe worth to just remove it?
>>>
>>> I think you need to elaborate a bit more here. I am not a massive fan of
>>> this driver, but I am also not in the mood for changing unless there is
>>> a good reason.
>>
>> It looks like the whole point of the free list is to have a cache of preallocated
>> dma_desc's, but dma_desc allocation and initialization doesn't cost anything in
>> comparison to the free list because memory is allocated from a SLAB cache and then the
>> initialization will happen on CPU's cache.
>>
>> So the free list is quite pointless in terms of optimization. Moreover what if driver
>> allocates a lot of dma_desc's and uses them just once? Looks like it will be quite a
>> lot of wasted memory on the free list.
> 
> Yes indeed and for the ADMA we allocate and free on-demand as you are
> suggesting. I don't know why it was done like this, but to make the
> change it would be good to get some data about how much memory it is
> consuming to see if it is actually worth it.

Yeah, that's something to check in the future.
