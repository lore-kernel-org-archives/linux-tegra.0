From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: tegra-adma: Add support for Tegra210 ADMA
Date: Tue, 29 Sep 2015 13:18:06 +0100
Message-ID: <560A817E.6010405@nvidia.com>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com>
 <1783348.ocWL5DWVKG@wuerfel> <5609556A.8060908@nvidia.com>
 <2417622.fOrcl680Fe@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2417622.fOrcl680Fe@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 28/09/15 16:07, Arnd Bergmann wrote:
> On Monday 28 September 2015 15:57:46 Jon Hunter wrote:

[snip]

>> Actually, what I mentioned about would not work as it is not the DMA
>> that should assign the requests to the channel.
>>
>> I think that I have poorly described the hardware and how it works, so
>> let me try and explain a bit more.
>>
>> From a hardware perspective it looks like the following ...
>>
>> memory <-> adma <-> adma-if <-> xbar <-> clients
>>
>> where:
>> - memory is the system memory
>> - adma is the dma controller
>> - adma-if is the dma interface to a crossbar
>> - xbar is the crossbar
>> - clients are various audio interfaces, such as i2s, etc
>>
>> The adma-if is essentially a mux with 10 tx and 10 rx ports. Any of the
>> 22 adma channels can be mapped to any of the 10 tx or rx ports. The
>> request signal used by the adma is determined by which port it is
>> configured to use. However, what makes this even more configurable is
>> the xbar is also a mux that can route adma-if ports to the various clients.
>>
>> So potentially, you could use any adma channel and any port to route
>> audio to any of the clients. However, the adma-if needs to know which
>> adma channel is mapped to which port and so it probably makes most sense
>> for the adma-if binding (not in the mainline yet) so specify a mapping
>> even though any mapping could be used.
>>
>> 	admaif@0x702d0000 {
>> 		dmas = <&adma 1>, <&adma 1>, <&adma 2>, <&adma 2>,
>> 		...
>> 		dma-names = "rx1", "tx1", "rx2", "tx2",
>> 		...
>> 	};
>>
>> Alternatively, I was thinking that I could set #dma-cells = 0, but what
>> I should have done is just have something like ...
>>
>> 	admaif@0x702d0000 {
>> 		dmas = <&adma>, <&adma>, <&adma>, <&adma>,
>> 		...
>> 		dma-names = "rx1", "tx1", "rx2", "tx2",
>> 		...
>> 	};
>>
>> In the above case the adma-if driver can just pick whatever channel it
>> wants for each of the ports.
>>
>> Hope this is clearer.
> 
> I think what you are saying here is that the ADMA driver does not talk
> to dma slave devices at all, but only talks to the adma-if, which in
> turn only talks to the xbar.

Yes, this is the use-case that this current version of the driver
supports. However ...

> That is fine, but the result of that is that there is no point in
> using the DMA slave binding for this device, or for the driver to
> register itself as a generic slave driver, which it is not.

... the DMA controller itself has a source and destination register and
from a hardware perspective, the source and/or destination does not need
to be the ADMA-IF. Potentially, we could support memory to memory
transfers, but currently we are not using the DMA for this. So I can see
that with the current usage it may not make sense for it to be
registered as a generic slave driver, but from a hardware perspective I
think it still does.

The current tegra audio drivers use the snd_dmaengine_xxx helpers and so
it would be nice to do the same here.

> We should look at this driver in combination with the adma-if and
> xbar drivers and then define a binding for the combination of those.

Yes that makes sense, but I think that I have confused matters here a
bit and not thought through this entirely. So while we could configure
an audio interface, such as i2s, to use any adma-if port and hence any
dma channel with the appropriate hardware request signal, the mapping
between the adma-if port and request signal is fixed. For example,

adma-if rx1 port uses adma request signal 1
adma-if rx2 port uses adma request signal 2
adma-if rx3 port uses adma request signal 3
...
adma-if rx10 port uses adma request signal 10

and

adma-if tx1 port uses adma request signal 1
adma-if tx2 port uses adma request signal 2
adma-if tx3 port uses adma request signal 3
...
adma-if tx10 port uses adma request signal 10

What is connected to these adma-if tx and rx ports who knows but I think
that is where I was going wrong and made this more complex than it
should have been. So I think that the adma binding should have
#dma-cells = 1 and the adma-if binding have the following ...

 	admaif@0x702d0000 {
 		dmas = <&adma 1>, <&adma 1>, <&adma 2>, <&adma 2>,
 		...
 		dma-names = "rx1", "tx1", "rx2", "tx2",
 		...
 	};


Sorry for all the confusion.

Jon
