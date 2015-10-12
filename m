From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Mon, 12 Oct 2015 14:55:20 +0100
Message-ID: <561BBBC8.5050107@nvidia.com>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-2-git-send-email-jonathanh@nvidia.com>
 <56145369.7040404@wwwdotorg.org> <5614DB41.5080907@nvidia.com>
 <561543A2.2090402@wwwdotorg.org> <56154629.8080205@nvidia.com>
 <5615744E.2060209@wwwdotorg.org> <56163E33.4080303@nvidia.com>
 <56167D4D.2020404@wwwdotorg.org> <56179505.7020301@nvidia.com>
 <5617DC89.7000505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5617DC89.7000505-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 09/10/15 16:26, Stephen Warren wrote:
> On 10/09/2015 04:20 AM, Jon Hunter wrote:
>>
>> On 08/10/15 15:27, Stephen Warren wrote:
>>> On 10/08/2015 03:58 AM, Jon Hunter wrote:
>>
>> [snip]
>>
>>>> That's fine. From my perspective I don't have a strong objection either
>>>> way, however, I can see that given that the name indicates rx or tx,
>>>> then the direction in the binding could be seen as redundant.
>>>>
>>>> So to confirm you are happy with the client bindings being as follows?
>>>>
>>>> tegra_admaif: admaif@0x702d0000 {
>>>>         ...
>>>>        dmas = <&adma 1>, <&adma 1>, <&adma 2>, <&adma 2>,
>>>>               <&adma 3>, <&adma 3>, <&adma 4>, <&adma 4>,
>>>>               <&adma 5>, <&adma 5>, <&adma 6>, <&adma 6>,
>>>>               <&adma 7>, <&adma 7>, <&adma 8>, <&adma 8>,
>>>>               <&adma 9>, <&adma 9>, <&adma 10>, <&adma 10>;
>>>>        dma-names = "rx1", "tx1", "rx2", "tx2", "rx3", "tx3",
>>>>                    "rx4", "tx4", "rx5", "tx5", "rx6", "tx6",
>>>>                    "rx7", "tx7", "rx8", "tx8", "rx9", "tx9",
>>>>                    "rx10", "tx10";
>>>>        ...
>>>> };
>>>
>>> Yes, that looks good for the client binding.
>>
>> One more clarifying question ... should the xlate verify that no other
>> dma channel is using the same hardware request signal?
>>
>> I understand that typically the xlate decodes the binding to get the
>> channel info, but because this is invoked by dmaengine while allocating
>> a channel, I was wondering if we should prevent dmaengine allocating
>> more than one channel to be used with the same hardware request? If so,
>> then passing the direction to the xlate would be necessary (so I can
>> determine in the xlate that no one else is currently using this, which
>> is what I currently do).
>>
>> Alternatively, I could check that no one else is using the request
>> signal at a later when the transfer is being prepared.
> 
> I think that handling this at prepare/usage time is probably most
> appropriate. That is the time when the resource conflict /actually/ occurs.

Although that makes sense, the more I look at this, the more I think it
should be handled during the channel allocate/free phases as it makes
sense to allocate the required resources then. It is probably simpler
and safer too.

> The only time when two clients would be given the same DMA request
> signal is if there are multiple different drivers that can DMA into the
> same FIFO in a time-multiplexed fashion. That seems pretty unlikely off
> the top of my head, but I don't think we want to actively ban that, in
> case we come up with a cunning use-case for it.

I know this is purely an example, but if such a time-multiplexed scheme
was a real use-case, then it would seem more likely to have a shim layer
between the clients that talked to the dmaengine and hence, it would
still only be necessary for one client to interface to a given channel.

What I don't like about the above binding is that someone can request
the dma channel "tx5" and then call dmaengine_prep_dma_cyclic() and say
you know what, I am gonna receive data instead. That seems odd and I
think that such a scenario should be greeted with an error code of
-EINVAL. It seems to me that if channels are uni-directional (in the
sense you either use it for tx or rx), you should request the
appropriate channel for the direction you want and then set the
direction in dmaengine_prep_dma_cyclic() so that it matches and if it
does not then we return an error.

So I still like the idea of the direction of the request being in the
binding so we know what the client intends (sorry to keep changing my
mind). Do you completely deplore the idea?

Jon
