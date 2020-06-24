From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for Jun 24 [build failure on arm64]
Date: Wed, 24 Jun 2020 13:29:00 +0100
Message-ID: <a7ebe7c1-49ae-5bc9-9c4f-fcc693ca3834@nvidia.com>
References: <20200624165323.3dffcde5@canb.auug.org.au>
 <7a7e31a8-9a7b-2428-ad83-2264f20bdc2d@hisilicon.com>
 <20200624105528.GB6134@willie-the-truck>
 <b561e663-a9aa-d600-e23b-09793199141e@nvidia.com>
 <20200624122242.GA6270@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200624122242.GA6270@willie-the-truck>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shaokun Zhang <zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 24/06/2020 13:22, Will Deacon wrote:
> On Wed, Jun 24, 2020 at 12:57:23PM +0100, Jon Hunter wrote:
>> On 24/06/2020 11:55, Will Deacon wrote:
>>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
>>> index 1e5a940532da..97d3d3632093 100644
>>> --- a/arch/arm64/kernel/vdso/Makefile
>>> +++ b/arch/arm64/kernel/vdso/Makefile
>>> @@ -23,8 +23,9 @@ btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
>>>  # potential future proofing if we end up with internal calls to the exported
>>>  # routines, as x86 does (see 6f121e548f83 ("x86, vdso: Reimplement vdso.so
>>>  # preparation in build-time C")).
>>> -ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv \
>>> -               -Bsymbolic --no-eh-frame-hdr --build-id -n $(btildflags-y) -T
>>> +ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv       \
>>> +            -Bsymbolic $(call ld-option, --no-eh-frame-hdr) --build-id -n      \
>>> +            $(btildflags-y) -T
>>>  
>>>  ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
>>>  ccflags-y += -DDISABLE_BRANCH_PROFILING
>>>
>>
>>
>> I am seeing the same build failure and the above does fix it for me.
> 
> Cheers, Jon. I'll get this into -next with your Tested-by.

Thanks, that will be great.

Jon

-- 
nvpublic
