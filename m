From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Tue, 6 Oct 2015 16:57:23 -0600
Message-ID: <561451D3.2070605@wwwdotorg.org>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-2-git-send-email-jonathanh@nvidia.com>
 <20151005131215.GN19064@leverpostej> <56139181.4090706@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56139181.4090706-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/06/2015 03:16 AM, Jon Hunter wrote:
>
> On 05/10/15 14:12, Mark Rutland wrote:
>> On Mon, Oct 05, 2015 at 01:10:06PM +0100, Jon Hunter wrote:
>>> Add device-tree binding documentation for the Tegra210 Audio DMA
>>> controller.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   .../devicetree/bindings/dma/tegra210-adma.txt      | 63 ++++++++++++++++++++++
>>>   1 file changed, 63 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
>>> new file mode 100644
>>> index 000000000000..df0e46868a63
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
>>> @@ -0,0 +1,63 @@
>>> +* NVIDIA Tegra Audio DMA (ADMA) controller
>>> +
>>> +Required properties:
>>> +- compatible: Must be "nvidia,tegra210-adma".
>>> +- reg: Should contain DMA registers location and length. This should be
>>> +  a single entry that includes all of the per-channel registers in one
>>> +  contiguous bank.
>>> +- interrupt-parent: Phandle to the interrupt parent controller.
>>> +- interrupts: Should contain all of the per-channel DMA interrupts in
>>> +  ascending order with respect to the DMA channel index.
>>> +- clocks: Must contain one entry for the ADMA module clock, "adma_ape".
>>> +- clock-names: Must contain the entry "adma_ape".
>>> +- dma-channels: Must be 22. Defines the number of DMA channels supported
>>> +  by the DMA controller.
>>
>> If this has to be a fixed value, why is it necessary? Why does the
>> driver not just know this?
>>
>> Are there other instances of this IP block where this differs?
>
> So this will change for future devices and yes it may seem silly now to
> have something that fixed and appears to be constant but I was trying to
> future proof the binding. May be the comment should read "For tegra210
> must be 22", however, I thought the compatible string would imply this.

Typically you'd want a table in the driver that maps from compatible 
value to the set of per-SoC data that's associated with the compatible 
value. Then, you don't need to put this data into the DT.

Even if you don't want to do that (e.g. so the driver can work on future 
HW without code changes), then you can always add this property in the 
future if needed; if the property is present the value in it will be 
used, but if missing, any driver should default to the value in use 
for/on HW  before the binding update.
