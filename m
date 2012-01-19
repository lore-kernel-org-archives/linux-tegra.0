From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Ce-android-mainline] [RFC][PATCH 1/1] gpu: ion: Add IOMMU heap
 allocator with IOMMU API
Date: Thu, 19 Jan 2012 20:47:27 +0100
Message-ID: <20120119.214727.1128931600518351333.hdoyu@nvidia.com>
References: <201201191204.35067.arnd@arndb.de><20120119.161538.1686847422348460522.hdoyu@nvidia.com><201201191627.19732.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201201191627.19732.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "ce-android-mainline-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ce-android-mainline-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "sumit.semwal-l0cyMroinI0@public.gmane.org" <sumit.semwal-l0cyMroinI0@public.gmane.org>, "m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Arnd,

From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [Ce-android-mainline] [RFC][PATCH 1/1] gpu: ion: Add IOMMU heap allocator with IOMMU API
Date: Thu, 19 Jan 2012 17:27:19 +0100
Message-ID: <201201191627.19732.arnd-r2nGTMty4D4@public.gmane.org>

> On Thursday 19 January 2012, Hiroshi Doyu wrote:
> 
> > > The main advantage of the IOMMU API is that it is able to separate
> > > multiple contexts, per user, so one application that is able to
> > > program a DMA engine cannot access memory that another application
> > > has mapped. Is that what you do with ion_iommu_heap_create(), i.e.
> > > that it gets called for each GPU context?
> > 
> > Yes. The concept of this part cames from dma-mapping API code.
> 
> I don't understand. The dma-mapping code on top of IOMMU does *not*
> use one iommu context per GPU context, it uses one IOMMU context
> for everything together.

Tegra30 has a IOMMU("SMMU") which has 4 ASID(domain)(*1) and currently
each "smmu_iommu_domain_init()" call allocates a
ASID. "smmu_iommu_attach_dev()" assigns a client device to an
allocated domain. For example, I think that the following "dev[i]"
could be  per GPU/device context(?), and our SMMU "iommu_ops" supports
multiple device to be attached to a domain. This is configurable in SMMU.

  for (i = 0; i < 4; i++) {
      map[i] = arm_iommu_create_mapping();
      arm_iommu_attach_device(&dev[i], map[i]);
  }

Here,
 map[i] == asid == domain
 dev[i] == client

So I thought that theoretically DMA mapping API could support one
iommu context(domain) per GPU/device context. 1-to-1 and 1-to-n
too. Also there's the simple version of DMA mapping test(*2).

Anyway, my previous answer was wrong. ion_iommu_heap does NOT support
multiple contexts but only single right now. It needs something more
to support multiple context.

*1 https://lkml.org/lkml/2012/1/5/27
*2 https://lkml.org/lkml/2012/1/5/28

> > > >+
> > > >+static int ion_buffer_allocate(struct ion_buffer *buf)
> > > >+{
> > > >+       int i, npages = NUM_PAGES(buf);
> > > >+
> > > >+       buf->pages = kmalloc(npages * sizeof(*buf->pages), GFP_KERNEL);
> > > >+       if (!buf->pages)
> > > >+               goto err_pages;
> > > >+
> > > >+       buf->sglist = vzalloc(npages * sizeof(*buf->sglist));
> > > >+       if (!buf->sglist)
> > > >+               goto err_sgl;
> > >
> > > Using vzalloc here probably goes a bit too far, it's fairly expensive
> > > to use compared with kzalloc, not only do you have to maintain the
> > > page table entries for the new mapping, it also means you use up
> > > precious space in the vmalloc area and have to use small pages for
> > > accessing the data in it.
> > 
> > Should I use "kzalloc()" instead here?
> 
> Yes, that would be better, at least if you can prove that there is
> a reasonable upper bound on the size of the allocation. kmalloc/kzalloc
> usually work ok up to 16kb or at most 128kb. If you think the total
> allocation might be larger than that, you have to use vzalloc anyway
> but that should come with a long comment explaining what is going
> on.
> 
> More likely if you end up needing vzalloc because of the size of the
> allocation, you should see that as a sign that you are doing something
> wrong and you should use larger chunks than single allocations in
> order to cut down the number of sglist entries.
> 
> Another option would be to just use sg_alloc_table(), which was
> made for this exact purpuse ;-)

Good to know;)

> > > >+static void *iommu_heap_map_kernel(struct ion_heap *heap,
> > > >+                                  struct ion_buffer *buf)
> > > >+{
> > > >+       int npages = NUM_PAGES(buf);
> > > >+
> > > >+       BUG_ON(!buf->pages);
> > > >+       buf->vaddr = vm_map_ram(buf->pages, npages, -1,
> > > >+                               pgprot_noncached(pgprot_kernel));
> > > >+       pr_debug("va:%p\n", buf->vaddr);
> > > >+       WARN_ON(!buf->vaddr);
> > > >+       return buf->vaddr;
> > > >+}
> > >
> > > You can't do this on ARMv6 or ARMv7: There is already a cacheable
> > > mapping of all entries in buf->pages, so you must not install
> > > a second noncached mapping. Either make sure you have only
> > > noncached pages, or only cached ones.
> > 
> > Ok, any example to maintain both mappings?
> 
> The dma_mapping implementation on ARM takes care of this by unmapping
> any allocation that goes through dma_alloc_coherent() from the linear
> mapping, at least in the CMA version that Marek did.
> In order to take advantage of this, you either need to call
> dma_alloc_coherent on a kernel that provides CMA, or call the CMA
> allocator directly (not generally recommended). Without CMA support,
> your only option is to use memory that was never part of the
> linear kernel mapping, but that would remove the main advantage of
> your patch, which is aimed at removing the need to take out memory
> from the linear mapping.
> 
> Using only cacheable memory would be valid here, but is probably
> not desired for performance reasons, or even allowed in ION because
> it requires explicit cache management functions for flushing
> the caches while handing data back and forth between software
> and the device.
> 
> 	Arnd
