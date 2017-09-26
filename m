From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] staging: Introduce NVIDIA Tegra20 video decoder
 driver
Date: Tue, 26 Sep 2017 15:02:44 +0300
Message-ID: <113675da-6b85-ef2f-03a9-84e5cb93c31b@gmail.com>
References: <cover.1506377430.git.digetx@gmail.com>
 <5c8b83775b982e6ee851c127444a8e839f422ad0.1506377430.git.digetx@gmail.com>
 <38daee0d-0595-a7e4-69bb-5a2ddbd832b5@wwwdotorg.org>
 <d19d709b-7451-0cdc-8bd0-913dc9c0a27d@gmail.com>
 <52f5c05f-7060-4d0f-355f-6da372c9ded0@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52f5c05f-7060-4d0f-355f-6da372c9ded0-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 26.09.2017 08:11, Stephen Warren wrote:
> On 09/25/2017 05:45 PM, Dmitry Osipenko wrote:
>> On 26.09.2017 02:01, Stephen Warren wrote:
>>> On 09/25/2017 04:15 PM, Dmitry Osipenko wrote:
>>>> Video decoder, found on NVIDIA Tegra20 SoC, supports a standard set of
>>>> video formats like H.264 / MPEG-4 / WMV / VC1. Currently driver supports
>>>> decoding of CAVLC H.264 only.
>>>
>>> Note: I don't know anything much about video decoding on Tegra (just NV desktop
>>> GPUs, and that was a while ago), but I had a couple small comments on the DT
>>> binding:
>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
>>>> b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
>>>
>>>> +NVIDIA Tegra Video Decoder Engine
>>>> +
>>>> +Required properties:
>>>> +- compatible : "nvidia,tegra20-vde"
>>>> +- reg : Must contain 2 register ranges: registers and IRAM area.
>>>> +- reg-names : Must include the following entries:
>>>> +  - regs
>>>> +  - iram
>>>
>>> I think the IRAM region needs more explanation: What is the region used for and
>>> by what? Can it be moved, and if so does the move need to be co-ordinated with
>>> any other piece of SW?
>>
>> IRAM region is used by Video Decoder HW for internal use and some of decoding
>> parameters are supplied via IRAM, like frames order list. AFAIK IRAM addresses
>> are hardwired in HW and aren't movable, it is not 100% but I'm pretty sure.
>> Should it be explained in the binding?
> 
> I think this should be briefly mentioned, yes. Otherwise at least people
> who don't know the VDE HW well (like me) will wonder why on earth VDE
> interacts with IRAM at all. I would have assumed all parameters were
> supplied via registers or via descriptors in DRAM.
> 
> Thanks.
> 

I also forgot to mention that VDE scrubs that IRAM region on HW reset. So yeah,
it's definitely a part of HW definition. I'll add a brief explanation to the
binding.

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
