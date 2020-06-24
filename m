From: Will Deacon <will@kernel.org>
Subject: Re: linux-next: Tree for Jun 24 [build failure on arm64]
Date: Wed, 24 Jun 2020 13:22:42 +0100
Message-ID: <20200624122242.GA6270@willie-the-truck>
References: <20200624165323.3dffcde5@canb.auug.org.au>
 <7a7e31a8-9a7b-2428-ad83-2264f20bdc2d@hisilicon.com>
 <20200624105528.GB6134@willie-the-truck>
 <b561e663-a9aa-d600-e23b-09793199141e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b561e663-a9aa-d600-e23b-09793199141e@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 24, 2020 at 12:57:23PM +0100, Jon Hunter wrote:
> On 24/06/2020 11:55, Will Deacon wrote:
> > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> > index 1e5a940532da..97d3d3632093 100644
> > --- a/arch/arm64/kernel/vdso/Makefile
> > +++ b/arch/arm64/kernel/vdso/Makefile
> > @@ -23,8 +23,9 @@ btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
> >  # potential future proofing if we end up with internal calls to the exported
> >  # routines, as x86 does (see 6f121e548f83 ("x86, vdso: Reimplement vdso.so
> >  # preparation in build-time C")).
> > -ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv \
> > -               -Bsymbolic --no-eh-frame-hdr --build-id -n $(btildflags-y) -T
> > +ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv       \
> > +            -Bsymbolic $(call ld-option, --no-eh-frame-hdr) --build-id -n      \
> > +            $(btildflags-y) -T
> >  
> >  ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
> >  ccflags-y += -DDISABLE_BRANCH_PROFILING
> > 
> 
> 
> I am seeing the same build failure and the above does fix it for me.

Cheers, Jon. I'll get this into -next with your Tested-by.

Will
