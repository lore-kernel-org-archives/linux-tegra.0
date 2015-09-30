From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: tegra-adma: Add support for Tegra210 ADMA
Date: Wed, 30 Sep 2015 10:37:44 -0600
Message-ID: <560C0FD8.3050204@wwwdotorg.org>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com>
 <2496965.bMvvDEqHin@wuerfel> <560A9D9F.2070109@nvidia.com>
 <5513519.ARXvF8rdlP@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5513519.ARXvF8rdlP@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/29/2015 09:34 AM, Arnd Bergmann wrote:
> On Tuesday 29 September 2015 15:18:07 Jon Hunter wrote:
>> On 29/09/15 13:39, Arnd Bergmann wrote:
>>> Ok, that makes more sense then. A few questions still:
>>>
>>> * Would the admaif in turn provide a #dma-cells and have the real slaves
>>>    hooked up to it?
>>
>> I don't think that that would be necessary. If you look at the existing
>> tegra i2s binding [0], there is a ahub-cif-ids property which maps the
>> actual slave to the apbif (equivalent of the adma-if). This ID is used
>> to get the appropriate dma channel for this client interface (cif).
>>
>>> * How do you model the xbar in this scenario?
>>
>> The xbar is common to existing tegra devices and today is configured via
>> the ahub-cif-ids property.
>
> I see, so instead of modeling the xbar as part of the DMA engine in DT, you
> model it as part of the slave. This probably adds a bit of complexity
> and a somewhat nonstandard binding, but it's too late to change that anyway.

The XBAR shouldn't be modelled as part of the DMA engine; it's something 
entirely separate.

The data flow (for TX) is:

There's a FIFO in the ADMA-IF. This has a register address. That address 
can be written to by either PIO (CPU writes) or a DMA engine (in which 
case a "request selector" is used to communicate flow control 
information from the ADMI-IF to the DMA engine). Any DMA engine that may 
be used to write into this FIFO is an entirely separate HW module from 
the ADMA-IF itself.

The ADMA-IF HW drains data from this FIFO and pushes it into the XBAR. 
ADMA-IF is an XBAR data source.

The XBAR is a programmable cross-bar matrix. Many sinks are attached to 
it such as I2S, SPDIF, SRC (sample rate converters), mux/demux, etc. The 
data flow within the XBAR is purely in logic or internal RAM/flops. 
There is no transfer to/from DRAM within the XBAR.

For each XBAR sink, the XBAR has registers to select which XBAR source 
provides data to it.

Thus the ADMA-IF is a DMA sink, and XBAR is unrelated to DMA; it's 
simply part of the HW processing of the data once it gets into the ADMA-IF.

The RX flow is essentially the same in reverse; the I2S RX being an XBAR 
source, and a second FIFO in the ADMA-IF being an XBAR sink.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
