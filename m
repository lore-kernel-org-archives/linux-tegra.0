From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 2/3] drm/ttm: introduce dma cache sync helpers
Date: Thu, 26 Jun 2014 23:50:04 +0900
Message-ID: <CAAVeFu+74HhBQM3Zr3O5Must5-SX8OGi9wwmegQfHcFnKiyG=w@mail.gmail.com>
References: <1403603667-11302-1-git-send-email-acourbot@nvidia.com>
 <1403603667-11302-3-git-send-email-acourbot@nvidia.com> <20140624100220.GK32514@n2100.arm.linux.org.uk>
 <53A953E6.2030503@nvidia.com> <53A95910.20104@nvidia.com> <CAAVeFu+rbCViC87kYCLfxGV18iYq=Pa0ABb+L=iNiYPLn+mR8Q@mail.gmail.com>
 <53A96EC5.3030701@canonical.com> <1403616338.4230.8.camel@weser.hi.pengutronix.de>
 <CAAVeFuLcC30BdWierY8Bg0vBmfNCaB=Qs34h790jGB=BRYvGAg@mail.gmail.com> <1403618295.4230.13.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403618295.4230.13.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 24, 2014 at 10:58 PM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> =
wrote:
> Am Dienstag, den 24.06.2014, 22:52 +0900 schrieb Alexandre Courbot:
>> On Tue, Jun 24, 2014 at 10:25 PM, Lucas Stach <l.stach@pengutronix.d=
e> wrote:
>> > Am Dienstag, den 24.06.2014, 14:27 +0200 schrieb Maarten Lankhorst=
:
>> >> op 24-06-14 14:23, Alexandre Courbot schreef:
>> >> > On Tue, Jun 24, 2014 at 7:55 PM, Alexandre Courbot <acourbot@nv=
idia.com> wrote:
>> >> >> On 06/24/2014 07:33 PM, Alexandre Courbot wrote:
>> >> >>> On 06/24/2014 07:02 PM, Russell King - ARM Linux wrote:
>> >> >>>> On Tue, Jun 24, 2014 at 06:54:26PM +0900, Alexandre Courbot =
wrote:
>> >> >>>>> From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> >> >>>>>
>> >> >>>>> On architectures for which access to GPU memory is non-cohe=
rent,
>> >> >>>>> caches need to be flushed and invalidated explicitly at the
>> >> >>>>> appropriate places. Introduce two small helpers to make thi=
ngs
>> >> >>>>> easy for TTM-based drivers.
>> >> >>>>
>> >> >>>> Have you run this with DMA API debugging enabled?  I suspect=
 you haven't,
>> >> >>>> and I recommend that you do.
>> >> >>>
>> >> >>> # cat /sys/kernel/debug/dma-api/error_count
>> >> >>> 162621
>> >> >>>
>> >> >>> (=E2=95=AF=C2=B0=E2=96=A1=C2=B0=EF=BC=89=E2=95=AF=EF=B8=B5 =E2=
=94=BB=E2=94=81=E2=94=BB)
>> >> >>
>> >> >> *puts table back on its feet*
>> >> >>
>> >> >> So, yeah - TTM memory is not allocated using the DMA API, henc=
e we cannot
>> >> >> use the DMA API to sync it. Thanks Russell for pointing it out=
=2E
>> >> >>
>> >> >> The only alternative I see here is to flush the CPU caches whe=
n syncing for
>> >> >> the device, and invalidate them for the other direction. Of co=
urse if the
>> >> >> device has caches on its side as well the opposite operation m=
ust also be
>> >> >> done for it. Guess the only way is to handle it all by ourselv=
es here. :/
>> >> > ... and it really sucks. Basically if we cannot use the DMA API=
 here
>> >> > we will lose the convenience of having a portable API that does=
 just
>> >> > the right thing for the underlying platform. Without it we woul=
d have
>> >> > to duplicate arm_iommu_sync_single_for_cpu/device() and we woul=
d only
>> >> > have support for ARM.
>> >> >
>> >> > The usage of the DMA API that we are doing might be illegal, bu=
t in
>> >> > essence it does exactly what we need - at least for ARM. What a=
re the
>> >> > alternatives?
>> >> Convert TTM to use the dma api? :-)
>> >
>> > Actually TTM already has a page alloc backend using the DMA API. I=
t's
>> > just not used for the standard case right now.
>>
>> Indeed, and Nouveau even already makes use of it if CONFIG_SWIOTLB i=
s
>> set apparently.
>>
>> > I would argue that we should just use this page allocator (which h=
as the
>> > side effect of getting pages from CMA if available -> you are actu=
ally
>> > free to change the caching) and do away with the other allocator i=
n the
>> > ARM case.
>>
>> Mm? Does it mean that CMA memory is not mapped into lowmem? That wou=
ld
>> certainly help in the present case, but I wonder how useful it will =
be
>> once the iommu support is in place. Will also need to consider
>> performance of such coherent memory for e.g. user-space mappings.
>>
>> Anyway, I will experiment a bit with this tomorrow, thanks!
>
> CMA memory is reserved before the lowmem section mapping is set up. I=
t
> is then mapped with individual 4k pages before giving it back to the
> buddy allocator.
> This means CMA pages in use by the kernel are mapped into lowmem, but
> they are actually unmapped from lowmem once you allocate them as DMA
> memory.

Tried enabling the DMA page allocation for GK20A. The great news is
that with it caching works as expected and that DMA API debugging does
not complain anymore when calling the sync functions. Actually, since
the DMA page allocator returns coherent memory, there is no need for
these sync functions anymore, which makes things easier. This seems to
be the simplest way towards enabling GK20A - albeit performance
suffers a little, but we can revisit that later once we have IOMMU
support.

I would not claim that we are fully compliant with what the DMA API
expects though. For instance, pages allocated for TTM via
dma_alloc_coherent() are later re-mapped in ttm_bo_kmap_ttm() using
vmap(), potentially with a different pgprot. The waste of address
space produced by these two simultaneous mappings aside, is this even
allowed? And when it comes to mapping these pages to user-space, TTM
does it without calling dma_mmap_coherent(), and again with whatever
flags we give it. IIUC memory allocated through the DMA API should
only be touched through the vaddr returned by dma_alloc_coherent(), or
through mappings provided by other DMA API functions. So is TTM
misusing the DMA API here?

In general, should we still be afraid of non-identical mappings on
modern CPUs like the A15 found in Tegra K1? I have heard contradictory
information so far and would really like to be able to understand this
once and for all, as it would give us more choices as for which memory
provider we can use.

Thanks,
Alex.
