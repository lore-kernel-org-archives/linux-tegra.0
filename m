From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 13/19] dmaengine: tegra-apb: Don't stop cyclic DMA in a
 case of error condition
Date: Tue, 4 Feb 2020 18:55:03 +0300
Message-ID: <ad86f2a4-6fa0-7958-aad7-1b18f02cabfe@gmail.com>
References: <20200202222854.18409-1-digetx@gmail.com>
 <20200202222854.18409-14-digetx@gmail.com>
 <332e8e86-dca5-19f2-9ef1-6d89a55f3651@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <332e8e86-dca5-19f2-9ef1-6d89a55f3651-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

04.02.2020 15:02, Jon Hunter пишет:
> 
> On 02/02/2020 22:28, Dmitry Osipenko wrote:
>> There is no harm in keeping DMA active in the case of error condition,
>> which should never happen in practice anyways. This will become useful
>> for the next patch, which will keep RPM enabled only during of DMA
>> transfer, and thus, it will be much nicer if cyclic DMA handler could
>> not touch the DMA-enable state.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/dma/tegra20-apb-dma.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>> index c7dc27ef1856..50abce608318 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -571,9 +571,7 @@ static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
>>  	 */
>>  	hsgreq = list_first_entry(&tdc->pending_sg_req, typeof(*hsgreq), node);
>>  	if (!hsgreq->configured) {
>> -		tegra_dma_stop(tdc);
>> -		dev_err(tdc2dev(tdc), "Error in DMA transfer, aborting DMA\n");
>> -		tegra_dma_abort_all(tdc);
>> +		dev_err_ratelimited(tdc2dev(tdc), "Error in DMA transfer\n");
> 
> While we are at it, a more descriptive error message could be good here.
> I believe that this condition would indicate a potential underrun condition.

Yes, this error indicates the underrun and indeed the error message
could be improved. I'll change it in v8.

>>  		return false;
>>  	}
>>  
>> @@ -772,7 +770,10 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
>>  	if (!list_empty(&tdc->pending_sg_req) && was_busy) {
>>  		sgreq = list_first_entry(&tdc->pending_sg_req, typeof(*sgreq),
>>  					 node);
>> -		sgreq->dma_desc->bytes_transferred +=
>> +		dma_desc = sgreq->dma_desc;
>> +
>> +		if (dma_desc->dma_status != DMA_ERROR)
>> +			dma_desc->bytes_transferred +=
>>  				get_current_xferred_count(tdc, sgreq, wcount);
> 
> I am wondering if we need to check this here? I assume that the transfer
> count would still reflect the amount of data transferred, even if some
> was dropped. We will never know how much data was lost.

I'm wondering too.. stopping DMA in a error case removes this ambiguity
and that's why in my previous answer to v6 I suggested to drop this patch.

Do you think it's worth to keep this patch?
