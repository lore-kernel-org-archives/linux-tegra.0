From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 11/31] dma: add channel request API that supports deferred
 probe
Date: Mon, 25 Nov 2013 10:57:09 -0700
Message-ID: <52938F75.7020108@wwwdotorg.org>
References: <1384979000.2067.5.camel@dwillia2-mobl1.amr.corp.intel.com> <528D28A1.2050307@wwwdotorg.org> <CAPcyv4jRYu7iTOuiXuj9F-t5dpF3ErVHT4X-PKrkJAYfn91a0w@mail.gmail.com> <528E4F55.9070204@wwwdotorg.org> <CAPcyv4jTUVjhFFXP8RL2jCqFj1MqxSCKQYvfdLHTj+1PRDDL3Q@mail.gmail.com> <528F95A9.2050305@wwwdotorg.org> <CAPcyv4iXmBmcsHDc7yjxxbH7sO8m1nVoEO6PUibuDeb1Wtge+g@mail.gmail.com> <528F9DF9.6080706@wwwdotorg.org> <20131123003442.GH16735@n2100.arm.linux.org.uk> <5293883A.8050808@wwwdotorg.org> <20131125175330.GQ16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131125175330.GQ16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/25/2013 10:53 AM, Russell King - ARM Linux wrote:
> On Mon, Nov 25, 2013 at 10:26:18AM -0700, Stephen Warren wrote:
>> On 11/22/2013 05:34 PM, Russell King - ARM Linux wrote:
>> [... various discussions re: IS_ERR, IS_ERR_OR_NULL, etc.]
>>
>> Russell, so if we document dma_request_slave_channel() as follows:
>>
>>> /*
>>>  * dma_request_slave_channel - try to allocate an exclusive slave channel
>>> ...
>>>  * Returns pointer to appropriate DMA channel on success or an error pointer.
>>>  * In order to ease compatibility with other DMA request APIs, this function
>>>  * guarantees NEVER to return NULL.
>>>  */
>>
>> Are you then OK with clients doing either of e.g.:
>>
>> chan = dma_request_slave_channel(...);
>> if (IS_ERR(chan))
>> 	// This returns NULL or a valid handle/pointer
>> 	chan = dma_request_channel()
>> if (!chan)
>> 	Here, chan is invalid;
>> 	return;
>> Here, chan is valid
>>
>> or:
>>
>> if (xxx) {
>> 	chan = dma_request_slave_channel(...);
>> 	// Convert to same error value as else{} block generates
>> 	if (IS_ERR(chan))
>> 		chan = NULL
>> } else {
>> 	// This returns NULL or a valid handle/pointer
>> 	chan = dma_request_channel()
>> }
>> if (!chan)
>> 	Here, chan is invalid
>> 	return;
>> Here, chan is valid
> 
> The cleaner way to write this is:
> 
> 	chan = dma_request_slave_channel(...);
> 	if (IS_ERR(chan)) {
> 		chan = dma_request_channel();
> 		if (!chan)
> 			return;
> 	}
> 
> So, if you make it to this point, chan must be valid according to the
> conditions on the API - you've applied the test individally to each
> return function according to its documented behaviour.  If it does
> happen to be NULL, that's not *your* problem as a user of the API.

As Dan pointed out, there are many drivers where DMA is optional, so
there's a lot of this sprinkled through the body of the driver:

if (chan) ...
if (!chan) ...

If we don't convert IS_ERR() values to NULL like I showed above, then
all those tests would need to be converted to something else. Can we
please avoid that?
