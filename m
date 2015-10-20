From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Tue, 20 Oct 2015 09:54:21 +0100
Message-ID: <5626013D.80602@nvidia.com>
References: <1444980919-20331-1-git-send-email-jonathanh@nvidia.com>
 <1444980919-20331-2-git-send-email-jonathanh@nvidia.com>
 <56212139.4080101@wwwdotorg.org> <5624D28B.70803@nvidia.com>
 <56251B56.70007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56251B56.70007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 19/10/15 17:33, Stephen Warren wrote:
> On 10/19/2015 05:22 AM, Jon Hunter wrote:
>>
>> On 16/10/15 17:09, Stephen Warren wrote:
>>> On 10/16/2015 01:35 AM, Jon Hunter wrote:
>>>> Add device-tree binding documentation for the Tegra210 Audio DMA
>>>> controller.
>>>
>>>> diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt
>>>> b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
>>>
>>>> +Required properties:
>>>
>>>> +- interrupt-parent: Phandle to the interrupt parent controller.
>>>
>>> Nit: Since that is more of a "system level"/standard property, it's
>>> typical not to document it. The property is not actually required if the
>>> inherited value is already correct. Still, it's obvious enough what this
>>> means, so I'd only suggest fixing this if you have to respin for some
>>> other reason.
>>
>> Ok.
>>
>>>> +- clocks: Must contain one entry for the ADMA module clock,
>>>> "adma_ape".
>>>> +- clock-names: Must contain the entry "adma_ape".
>>>
>>> Which clock is this in the CAR? I don't see any adma_ape clock
>>> documented in the TRM.
>>
>> Darn. I thought I had checked this. Yes it should be the AHUB clock and
>> looking at the current t210 clock patches for mainline this is
>> TEGRA210_CLK_D_AUDIO. Ok will fix this.
>>
>>> Is there a dedicated reset signal for this module? If so, we should
>>> require a resets property.
>>
>> No there does not appear to be. Looking at the documentation the ADMA
>> would be reset by the main APE reset. Seems to be one reset that resets
>> most modules in the APE.
>>
>> That raises another issue, the ADMA is in the audio power partition and
>> currently our downstream driver assumes that this is on. I should at
>> least check this.
> 
> IIRC the situation downstream w.r.t. the audio power partition is
> something like:
> 
> The AGIC is in that power partition. The Linux kernel AGIC driver gets
> probed before the power domain driver for that domain. (I think)
> deferred probe doesn't work for the AGIC driver for some reason (perhaps
> this is just a bug or oversight in our downstream AGIC driver?). So, the
> AGIC driver can't turn on the audio power domain. So, there's a hack in
> the bootloader to turn the power domain on. So, everything in the kernel
> assumes that power domain is on at boot and so drivers don't have to
> explicitly control/request that power domain.
> 
> We should fix this properly so that upstream doesn't make the assumption
> that the audio power domain is magically on before the kernel boots.

Yes, I agree. Ok, I will look at that some more.

Jon
