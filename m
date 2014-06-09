From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/nouveau: introduce CPU cache flushing
	macro
Date: Mon, 9 Jun 2014 19:41:39 +0900
Message-ID: <CAAVeFu+KZ9AqB5ji5-AA+qzEFDWd7y0=J1eSEPqQ-OyhmXufig@mail.gmail.com>
References: <1400483458-9648-1-git-send-email-acourbot@nvidia.com>
 <1400483458-9648-5-git-send-email-acourbot@nvidia.com>
 <20140519090202.GC7138@ulmo>
 <1400491331.8467.8.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400491331.8467.8.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 19, 2014 at 6:22 PM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Am Montag, den 19.05.2014, 11:02 +0200 schrieb Thierry Reding:
>> On Mon, May 19, 2014 at 04:10:58PM +0900, Alexandre Courbot wrote:
>> > Some architectures (e.g. ARM) need the CPU buffers to be explicitely
>> > flushed for a memory write to take effect. Not doing so results in
>> > synchronization issues, especially after writing to BOs.
>>
>> It seems to me that the above is generally true for all architectures,
>> not just ARM.
>>
> No, on PCI coherent arches, like x86 and some PowerPCs, the GPU will
> snoop the CPU caches and therefore an explicit cache flush is not
> required.
>
>> Also: s/explicitely/explicitly/
>>
>> > This patch introduces a macro that flushes the caches on ARM and
>> > translates to a no-op on other architectures, and uses it when
>> > writing to in-memory BOs. It will also be useful for implementations of
>> > instmem that access shared memory directly instead of going through
>> > PRAMIN.
>>
>> Presumably instmem can access shared memory on all architectures, so
>> this doesn't seem like a property of the architecture but rather of the
>> memory pool backing the instmem.
>>
>> In that case I wonder if this shouldn't be moved into an operation that
>> is implemented by the backing memory pool and be a noop where the cache
>> doesn't need explicit flushing.
>>
>> > diff --git a/drivers/gpu/drm/nouveau/core/os.h b/drivers/gpu/drm/nouveau/core/os.h
>> > index d0ced94ca54c..274b4460bb03 100644
>> > --- a/drivers/gpu/drm/nouveau/core/os.h
>> > +++ b/drivers/gpu/drm/nouveau/core/os.h
>> > @@ -38,4 +38,21 @@
>> >  #endif /* def __BIG_ENDIAN else */
>> >  #endif /* !ioread32_native */
>> >
>> > +#if defined(__arm__)
>> > +
>> > +#define nv_cpu_cache_flush_area(va, size)  \
>> > +do {                                               \
>> > +   phys_addr_t pa = virt_to_phys(va);      \
>> > +   __cpuc_flush_dcache_area(va, size);     \
>> > +   outer_flush_range(pa, pa + size);       \
>> > +} while (0)
>>
>> Couldn't this be a static inline function?
>>
>> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> [...]
>> > index 0886f47e5244..b9c9729c5733 100644
>> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> > @@ -437,8 +437,10 @@ nouveau_bo_wr16(struct nouveau_bo *nvbo, unsigned index, u16 val)
>> >     mem = &mem[index];
>> >     if (is_iomem)
>> >             iowrite16_native(val, (void __force __iomem *)mem);
>> > -   else
>> > +   else {
>> >             *mem = val;
>> > +           nv_cpu_cache_flush_area(mem, 2);
>> > +   }
>> >  }
>> >
>> >  u32
>> > @@ -461,8 +463,10 @@ nouveau_bo_wr32(struct nouveau_bo *nvbo, unsigned index, u32 val)
>> >     mem = &mem[index];
>> >     if (is_iomem)
>> >             iowrite32_native(val, (void __force __iomem *)mem);
>> > -   else
>> > +   else {
>> >             *mem = val;
>> > +           nv_cpu_cache_flush_area(mem, 4);
>> > +   }
>>
>> This looks rather like a sledgehammer to me. Effectively this turns nvbo
>> into an uncached buffer. With additional overhead of constantly flushing
>> caches. Wouldn't it make more sense to locate the places where these are
>> called and flush the cache after all the writes have completed?
>>
> I don't think the explicit flushing for those things makes sense. I
> think it is a lot more effective to just map the BOs write-combined on
> PCI non-coherent arches. This way any writes will be buffered. Reads
> will be slow, but I don't think nouveau is reading back a lot from those
> buffers.
> Using the write-combining buffer doesn't need any additional
> synchronization as it will get flushed on pushbuf kickoff anyways.

I tried to go that way, and something interesting happened.

What I did: remove this patch and instead set the following caching
parameters for the TTM_PL_TT case in nouveau_bo_init_mem_type():

    man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
    man->default_caching = TTM_PL_FLAG_WC;

What happened: no runtime errors as what happened when caching is
enabled. However, many of the vertex and texture buffers seem to be
partially corrupted. In glmark2 the 3d models had many vertices (but
not all) at the wrong position. Note that not all the scenes ended up
being corrupted - in particular, when two consecutive scenes used the
same model, the second instance would be uncorrupted.

Forcing the caching to TTM_PL_FLAG_UNCACHED led to the same result.
What is interesting is that while data like vertices and textures got
corrupted, pushbuffers and shader programs seem to be just fine, as I
could not see any runtime error.

I don't really understand what kind of caching behavior could lead to
that. If anyone has any idea, I'd love to hear.

Thanks,
Alex.
