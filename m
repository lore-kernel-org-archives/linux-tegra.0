From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Wed, 7 Oct 2015 10:09:06 -0600
Message-ID: <561543A2.2090402@wwwdotorg.org>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-2-git-send-email-jonathanh@nvidia.com>
 <56145369.7040404@wwwdotorg.org> <5614DB41.5080907@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5614DB41.5080907-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2015 02:43 AM, Jon Hunter wrote:
>
> On 07/10/15 00:04, Stephen Warren wrote:
>> On 10/05/2015 06:10 AM, Jon Hunter wrote:
>>> Add device-tree binding documentation for the Tegra210 Audio DMA
>>> controller.
>>
>>> diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt
>>> b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
>>
>>> +- #dma-cells : Must be <2>. The first cell denotes the transmit or
>>> +  receive request number and should be between 1 and the maximum number
>>> +  of requests supported (see properties "dma-rx-requests" and
>>> +  "dma-tx-requests"). This value corresponds to the RX/TX_REQUEST_SELECT
>>> +  fields in the ADMA_CHn_CTRL register. The second cell denotes whether
>>> +  the channel is a receive or transmit channel and must be either 2 for
>>> +  a receive channel and 4 for a transmit channel. These values
>>> correspond
>>> +  to the TRANSFER_DIRECTION field of the ADMA_CHn_CTRL register.
>>
>> Is it typical to encode the direction into the dma cells? I would have
>> thought the client would provide that information at run-time when
>> requesting a DMA channel.
>
> I have seen other dma bindings that do [0]. If we don't put the
> direction in the client binding, then it would appear as ...
>
> tegra_admaif: admaif@0x702d0000 {
>      ...
>      dmas = <&adma 1>, <&adma 1>, <&adma 2>, <&adma 2>,
>             <&adma 3>, <&adma 3>, <&adma 4>, <&adma 4>,
>             <&adma 5>, <&adma 5>, <&adma 6>, <&adma 6>,
>             <&adma 7>, <&adma 7>, <&adma 8>, <&adma 8>,
>             <&adma 9>, <&adma 9>, <&adma 10>, <&adma 10>;
>      dma-names = "rx1", "tx1", "rx2", "tx2", "rx3", "tx3",
>                  "rx4", "tx4", "rx5", "tx5", "rx6", "tx6",
>                  "rx7", "tx7", "rx8", "tx8", "rx9", "tx9",
>                  "rx10", "tx10";
>      ...
> };
>
> ... where "rxN" and "txN" appear to use the same request, but the
> reality is that "rxN" is using rx-request-N and "txN" is using
> tx-request-N. Arnd questioned this before. Obviously I can explain this
> in the binding document if the above is preferred. However, given that
> they are named "rx1", "rx2", etc, why not put the direction in the binding?

Why would we need to duplicate the request IDs? I'd expect to have the 
following property content:

dmas = <&adma 1>, <&adma 2>, <&adma 3>, ...;
dma-names = "1", "2", "3"...;

*and* not have a cell to represent the direction in DT. After all, the 
direction of the channel is 100% implied by the use-case (and hence 
defined by the DMA client's own DT binding); it is known by the client 
driver and can be supplied at run-time.

Perhaps the core DMA DT bindings are not designed that way though, in 
which case I suppose the patch you sent makes sense. If so though, that 
seems like a bug in the core DMA DT bindings.
