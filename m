From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 12/19] dmaengine: tegra-apb: Remove handling of
 unrealistic error condition
Date: Wed, 5 Feb 2020 01:17:29 +0300
Message-ID: <e89b7319-74c6-4a88-4634-f127aca86851@gmail.com>
References: <20200202222854.18409-1-digetx@gmail.com>
 <20200202222854.18409-13-digetx@gmail.com>
 <b2461a42-5939-b2b1-01fe-6f18c860dbd9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b2461a42-5939-b2b1-01fe-6f18c860dbd9-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

04.02.2020 14:52, Jon Hunter пишет:
> 
> On 02/02/2020 22:28, Dmitry Osipenko wrote:
>> The pending_sg_req list can't ever be empty because:
>>
>> 1. If it was empty, then handle_cont_sngl_cycle_dma_done() shall crash
>>    before of handle_continuous_head_request() invocation.
>>
>> 2. The handle_cont_sngl_cycle_dma_done() can't happen after stopping DMA.
> 
> By this you mean calling terminate_all?

Yes, and also the handle_continuous_head_request() itself because it
stops DMA on error, which clears interrupt status, and thus, ISR handle
returns IRQ_NONE without handling next interrupt.

>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/dma/tegra20-apb-dma.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>> index 62d181bd5e62..c7dc27ef1856 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -564,12 +564,6 @@ static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
>>  {
>>  	struct tegra_dma_sg_req *hsgreq;
>>  
>> -	if (list_empty(&tdc->pending_sg_req)) {
>> -		dev_err(tdc2dev(tdc), "DMA is running without req\n");
>> -		tegra_dma_stop(tdc);
>> -		return false;
>> -	}
>> -
>>  	/*
>>  	 * Check that head req on list should be in flight.
>>  	 * If it is not in flight then abort transfer as
>>
> 
> There is also a list_empty() check in tdc_configure_next_head_desc()
> which is also redundant and could be removed here as well.

Good catch :) I'll squash all these list_empty() removals into a single
patch.
