From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] dma: add channel request API that supports deferred
 probe
Date: Tue, 26 Nov 2013 09:37:48 -0700
Message-ID: <5294CE5C.1090901@wwwdotorg.org>
References: <1385416039-3170-1-git-send-email-swarren@wwwdotorg.org> <1385474368.1871.6.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385474368.1871.6.camel@smile>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "Williams, Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/26/2013 06:59 AM, Shevchenko, Andriy wrote:
> On Mon, 2013-11-25 at 14:47 -0700, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> dma_request_slave_channel() simply returns NULL whenever DMA channel
>> lookup fails. Lookup could fail for two distinct reasons:
>>
>> a) No DMA specification exists for the channel name.
>>    This includes situations where no DMA specifications exist at all, or
>>    other general lookup problems.
>>
>> b) A DMA specification does exist, yet the driver for that channel is not
>>    yet registered.
>>
>> Case (b) should trigger deferred probe in client drivers. However, since
>> they have no way to differentiate the two situations, it cannot.
>>
>> Implement new function dma_request_slave_channel_or_err(), which performs
>> identically to dma_request_slave_channel(), except that it returns an
>> error-pointer rather than NULL, which allows callers to detect when
>> deferred probe should occur.
>>
>> Eventually, all drivers should be converted to this new API, the old API
>> removed, and the new API renamed to the more desirable name. This patch
>> doesn't convert the existing API and all drivers in one go, since some
>> drivers call dma_request_slave_channel() then dma_request_channel() if
>> that fails. That would require either modifying dma_request_channel() in
>> the same way, or adding extra error-handling code to all affected
>> drivers, and there are close to 100 drivers using the other API, rather
>> than just the 15-20 or so that use dma_request_slave_channel(), which
>> might be tenable in a single patch.
>>
>> acpi_dma_request_slave_chan_by_name() doesn't currently implement
>> deferred probe. It should, but this will be addressed later.
> 
> Couple of comments below.
> 
> []
> 
>> --- a/drivers/dma/of-dma.c
>> +++ b/drivers/dma/of-dma.c
> 
> []
> 
>> @@ -152,17 +152,18 @@ struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
>>  	struct of_dma		*ofdma;
>>  	struct dma_chan		*chan;
>>  	int			count, i;
>> +	int			ret_no_channel = -ENODEV;
> 
> Could we re-use chan for the error as well?

No, because that gets over-written each time ofdma->of_dma_xlate() is
called, and that could fail and cause the result not to be returned, and
then we would have lost any -EPROBE_DEFERRED value that was stored there
to be returned in the nothing-found case.

>> @@ -174,8 +175,10 @@ struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
>>  
>>  		if (ofdma)
> 
> if (ofdma) {
> ...
> 
>>  			chan = ofdma->of_dma_xlate(&dma_spec, ofdma);
>> -		else
>> +		else {
> 
> } else {
> 
> to keep style.

OK, I've fixed that up locally. I assume it's not worth a repost just
for that change, although I will repost if the DMA maintainers want to
create the topic branches rather than me, but there's been no word on
that yet.
