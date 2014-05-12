From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 1/3] dma: tegra: finer granularity residual for tx_status
Date: Mon, 12 May 2014 11:27:21 -0600
Message-ID: <53710479.2030407@wwwdotorg.org>
References: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com> <1399411343-12222-2-git-send-email-cfreeman@nvidia.com> <536A6145.2080106@wwwdotorg.org> <20140507223745.GB20137@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140507223745.GB20137-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Freeman <cfreeman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/07/2014 04:37 PM, Christopher Freeman wrote:
> On Wed, May 07, 2014 at 09:37:25AM -0700, Stephen Warren wrote:
>> On 05/06/2014 03:22 PM, Christopher Freeman wrote:
>>> Get word-level granularity from hardware for calculating
>>> the transfer count remaining.
>>
>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>>
>>> +static int tegra_dma_wcount_in_bytes(struct dma_chan *dc)

>>> +	/* in case of interrupt, handle it and don't read wcount reg */
>>> +	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
>>> +	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
>>> +		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
>>> +		dev_info(tdc2dev(tdc), "%s():handling isr\n", __func__);
>>> +		tdc->isr_handler(tdc, false);
>>> +		tegra_dma_resume(tdc);
>>> +		return 0;
>>
>> Why resume and return here? Shouldn't those last 2 lines be removed, so
>> the code can simply continue through the balance of the function and
>> return the actual status. tegra_dma_terminate_all() does that.
>>
> Handling the interrupt will increment the transfer count when that segment is completed.  There's no need to read the hardware and in fact, we don't want to run the risk of reading a hardware register that is stale.  For example, the transfer is complete, but the transfer count register has not been zeroed.

(could you line-wrap your email; long lines are hard to read)

OK, I think that makes sense. I suppose "return 0" rather than "return
current_transfer->final_byte_count" is correct since this function
returns the byte count modulo the transfer size, so a complete
transfer's byte count is always 0? But what if another transfer was
already queued into the HW; shouldn't this function return the byte
count of the new current transfer? Perhaps that can't happen since the
channel is paused so a new transfer can't start, so it can also have
only transferred 0 bytes. A comment that mentions these points would be
useful.

>>> @@ -812,9 +851,22 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
>>>  	list_for_each_entry(sg_req, &tdc->pending_sg_req, node) {
>>>  		dma_desc = sg_req->dma_desc;
>>>  		if (dma_desc->txd.cookie == cookie) {
>>> +			hw_byte_count = tegra_dma_wcount_in_bytes(dc);
>>> +
>>> +			if (!list_empty(&tdc->pending_sg_req))
>>
>> Since this code is inside a loop that iterates over that list, I don't
>> think the list can ever be empty.
>
> tegra_dma_wcount_in_bytes may modify the pending_sg_req since it can invoke the ISR.  So the list may become empty.  Explaining that just now made me cringe, shall I rewrite it so we can't modify the list we're iterating over?  Granted, once this code is invoked, we're done iterating.

If it's possible to avoid the list being modified while iterating over
it, then yes, we should.

If it's not, shouldn't the code iterate with list_for_each_entry_safe()
rather than list_for_each_entry()?

>>> +				first_entry =
>>> +					list_first_entry(&tdc->pending_sg_req,
>>> +						typeof(*first_entry), node);
>>> +
>>>  			residual =  dma_desc->bytes_requested -
>>>  					(dma_desc->bytes_transferred %
>>>  						dma_desc->bytes_requested);
>>> +
>>> +			/* hw byte count only applies to current transaction */
>>> +			if (first_entry &&
>>> +				first_entry->dma_desc->txd.cookie == cookie)
>>> +				residual -= hw_byte_count;
>>> +
>>>  			dma_set_residue(txstate, residual);
>>
>> Why not re-order the added code so that all the new code is added in one
>> place, and the hw_byte_count value is only calculated if it's used, i.e.:
>>
>> residual = ...;
>> first_entry = ...;
>> if (sg_reg == first_entry) {
>>     hw_byte_count = ...;
>>     residual -= hw_byte_count;
>> }
>>
> My comment above may shed some light on the ordering reason.  The "first entry" may change when we handle the ISR.

I still suspect the code can be re-ordered, it's just that the if
condition needs to say "if sg_req == current active transfer" in a way
that doesn't rely on "list_first_entry()". Doesn't each req have a
status to say that it's the currently active transfer, and that gets set
when queued and updated when the ISR handles completion?
