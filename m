From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for Jun 24 [build failure on arm64]
Date: Wed, 24 Jun 2020 12:57:23 +0100
Message-ID: <b561e663-a9aa-d600-e23b-09793199141e@nvidia.com>
References: <20200624165323.3dffcde5@canb.auug.org.au>
 <7a7e31a8-9a7b-2428-ad83-2264f20bdc2d@hisilicon.com>
 <20200624105528.GB6134@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200624105528.GB6134@willie-the-truck>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shaokun Zhang <zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 24/06/2020 11:55, Will Deacon wrote:
> On Wed, Jun 24, 2020 at 05:08:56PM +0800, Shaokun Zhang wrote:
>> +Will Deacon,
>>
>> Hi Will,
>>
>> There's a build failure on arm64:
>>
>>   CALL    scripts/atomic/check-atomics.sh
>>   CALL    scripts/checksyscalls.sh
>>   LD      arch/arm64/kernel/vdso/vdso.so.dbg
>> ld: unrecognized option '--no-eh-frame-hdr'
>> ld: use the --help option for usage information
>> arch/arm64/kernel/vdso/Makefile:64: recipe for target
>> 'arch/arm64/kernel/vdso/vdso.so.dbg' failed
>> make[1]: *** [arch/arm64/kernel/vdso/vdso.so.dbg] Error 1
>> arch/arm64/Makefile:175: recipe for target 'vdso_prepare' failed
>> make: *** [vdso_prepare] Error 2
>>
>> GCC version is followed:
>> gcc (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609
>>
>> It seems caused by
>> 87676cfca141 arm64: vdso: Disable dwarf unwinding through the sigreturn
>> trampoline
> 
> Urgh, binutils quality strikes again. If you're able to reproduce locally,
> can you try the diff below, please? All the linkers I have kicking around
> seem to support --no-eh-frame-hdr.
> 
> Will
> 
> --->8
> 
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 1e5a940532da..97d3d3632093 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -23,8 +23,9 @@ btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
>  # potential future proofing if we end up with internal calls to the exported
>  # routines, as x86 does (see 6f121e548f83 ("x86, vdso: Reimplement vdso.so
>  # preparation in build-time C")).
> -ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv \
> -               -Bsymbolic --no-eh-frame-hdr --build-id -n $(btildflags-y) -T
> +ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv       \
> +            -Bsymbolic $(call ld-option, --no-eh-frame-hdr) --build-id -n      \
> +            $(btildflags-y) -T
>  
>  ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
>  ccflags-y += -DDISABLE_BRANCH_PROFILING
> 


I am seeing the same build failure and the above does fix it for me.

Thanks
Jon

-- 
nvpublic
