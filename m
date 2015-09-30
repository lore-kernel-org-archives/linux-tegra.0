From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: tegra-adma: Add support for Tegra210 ADMA
Date: Wed, 30 Sep 2015 10:27:56 -0600
Message-ID: <560C0D8C.2060309@wwwdotorg.org>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com>
 <1783348.ocWL5DWVKG@wuerfel> <5609556A.8060908@nvidia.com>
 <2417622.fOrcl680Fe@wuerfel> <560A817E.6010405@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <560A817E.6010405-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/29/2015 06:18 AM, Jon Hunter wrote:
> On 28/09/15 16:07, Arnd Bergmann wrote:
>> On Monday 28 September 2015 15:57:46 Jon Hunter wrote:
...
> Yes that makes sense, but I think that I have confused matters here a
> bit and not thought through this entirely. So while we could configure
> an audio interface, such as i2s, to use any adma-if port and hence any
> dma channel with the appropriate hardware request signal, the mapping
> between the adma-if port and request signal is fixed. For example,
>
> adma-if rx1 port uses adma request signal 1
> adma-if rx2 port uses adma request signal 2
> adma-if rx3 port uses adma request signal 3
> ...
> adma-if rx10 port uses adma request signal 10
>
> and
>
> adma-if tx1 port uses adma request signal 1
> adma-if tx2 port uses adma request signal 2
> adma-if tx3 port uses adma request signal 3
> ...
> adma-if tx10 port uses adma request signal 10
>
> What is connected to these adma-if tx and rx ports who knows but I think
> that is where I was going wrong and made this more complex than it
> should have been. So I think that the adma binding should have
> #dma-cells = 1 and the adma-if binding have the following ...
>
>   	admaif@0x702d0000 {
>   		dmas = <&adma 1>, <&adma 1>, <&adma 2>, <&adma 2>,
>   		...
>   		dma-names = "rx1", "tx1", "rx2", "tx2",
>   		...
>   	};

Yes, that sounds about right.
