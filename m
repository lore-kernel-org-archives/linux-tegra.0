From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Ce-android-mainline] [RFC][PATCH 1/1] gpu: ion: Add IOMMU heap
 allocator with IOMMU API
Date: Thu, 19 Jan 2012 15:15:38 +0100
Message-ID: <20120119.161538.1686847422348460522.hdoyu@nvidia.com>
References: <20120118.094004.1564213980840408030.hdoyu@nvidia.com><201201191204.35067.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201201191204.35067.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "ce-android-mainline-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ce-android-mainline-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "sumit.semwal-l0cyMroinI0@public.gmane.org" <sumit.semwal-l0cyMroinI0@public.gmane.org>, "m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Arnd,

Thank you for your reivew. Some questions are inlined.

From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [Ce-android-mainline] [RFC][PATCH 1/1] gpu: ion: Add IOMMU heap allocator with IOMMU API
Date: Thu, 19 Jan 2012 13:04:34 +0100
Message-ID: <201201191204.35067.arnd-r2nGTMty4D4@public.gmane.org>

> On Wednesday 18 January 2012, Hiroshi Doyu wrote:
> > Hi,
> >
> > Recently we've implemented IOMMU heap as an attachment which is one of
> > the ION memory manager(*1) heap/backend. This implementation is
> > completely independent of any SoC, and this can be used for other SoC
> > as well. If our implementation is not totally wrong, it would be nice
> > to share some experience/code here since Ion is still not so clear to
> > me yet.
> >
> > I found that Linaro also seems to have started some ION work(*2). I
> > think that some of Ion feature could be supported/replaced with Linaro
> > UMM. For example, presently "ion_iommu_heap" is implemented with the
> > standard IOMMU API, but it could be also implemented with the coming
> > DMA API? Also DMABUF can be used in Ion core part as well, I guess.
> >
> > Currently there's no Ion memmgr code in the upstream
> > "drivers/staging/android"(*3). Is there any plan to support this? Or
> > is this something considered as a completely _temporary_ solution, and
> > never going to be added?
> >
> > It would be nice if we can share some of our effort here since not
> > small Android users need Ion, even temporary.
> >
> > Any comment would be really appreciated.
>
> Hi,
>
> Your implemention looks quite nice overall, but on the high level,
> I don't see what the benefit of using the IOMMU API is here instead
> of the dma-mapping API. I believe that all device drivers should
> by default use the dma-mapping interfaces, which may in turn
> be based on linear mapping (possibly using CMA) or an IOMMU.

Using dma-mapping API could be left for v2 of this patch.

> The main advantage of the IOMMU API is that it is able to separate
> multiple contexts, per user, so one application that is able to
> program a DMA engine cannot access memory that another application
> has mapped. Is that what you do with ion_iommu_heap_create(), i.e.
> that it gets called for each GPU context?

Yes. The concept of this part cames from dma-mapping API code.

> >+#define NUM_PAGES(buf) (PAGE_ALIGN((buf)->size) >> PAGE_SHIFT)
> >+
> >+#define GFP_ION                (GFP_KERNEL | __GFP_HIGHMEM | __GFP_NOWARN)
>
> I find macros like these more confusing than helpful because to the
> casual reader of one driver they don't mean anything. It's better to
> just open-code them.

Ok.

> >+
> >+static int ion_buffer_allocate(struct ion_buffer *buf)
> >+{
> >+       int i, npages = NUM_PAGES(buf);
> >+
> >+       buf->pages = kmalloc(npages * sizeof(*buf->pages), GFP_KERNEL);
> >+       if (!buf->pages)
> >+               goto err_pages;
> >+
> >+       buf->sglist = vzalloc(npages * sizeof(*buf->sglist));
> >+       if (!buf->sglist)
> >+               goto err_sgl;
>
> Using vzalloc here probably goes a bit too far, it's fairly expensive
> to use compared with kzalloc, not only do you have to maintain the
> page table entries for the new mapping, it also means you use up
> precious space in the vmalloc area and have to use small pages for
> accessing the data in it.

Should I use "kzalloc()" instead here?

> Why do you need two arrays here? The sglist already contains
> pointers to each page, right?

This is one of the "FIXME". We wanted to have **pages to use
"vm_map_ram(**page,..)" in "iommu_heap_map_kernel()" later. This
"**pages" are residual.

> >+       sg_init_table(buf->sglist, npages);
> >+
> >+       for (i = 0; i < npages; i++) {
> >+               struct page *page;
> >+               phys_addr_t pa;
> >+
> >+               page = alloc_page(GFP_ION);
> >+               if (!page)
> >+                       goto err_pgalloc;
> >+               pa = page_to_phys(page);
> >+
> >+               sg_set_page(&buf->sglist[i], page, PAGE_SIZE, 0);
> >+
> >+               flush_dcache_page(page);
> >+               outer_flush_range(pa, pa + PAGE_SIZE);
>
> This allocates pages that are contiguous only by page. Note
> that a lot of IOMMUs work only (or at least much better) with
> larger allocations, such as 64KB at a time.

Ok, we need to add support multiple page sizes(4KB & 4MB).

> Further, the code you have here is completely arm specific:
> outer_flush_range() is only available on ARM, and most architectures
> don't require flushing caches here. In fact even on ARM I see no
> reason to flush a newly allocated page -- invalidating should be
> enough.

Right.

Presently Ion API doesn't support cache maintenance API for
performance optimization. This API can be considered to be added
later.

> >+static void *iommu_heap_map_kernel(struct ion_heap *heap,
> >+                                  struct ion_buffer *buf)
> >+{
> >+       int npages = NUM_PAGES(buf);
> >+
> >+       BUG_ON(!buf->pages);
> >+       buf->vaddr = vm_map_ram(buf->pages, npages, -1,
> >+                               pgprot_noncached(pgprot_kernel));
> >+       pr_debug("va:%p\n", buf->vaddr);
> >+       WARN_ON(!buf->vaddr);
> >+       return buf->vaddr;
> >+}
>
> You can't do this on ARMv6 or ARMv7: There is already a cacheable
> mapping of all entries in buf->pages, so you must not install
> a second noncached mapping. Either make sure you have only
> noncached pages, or only cached ones.

Ok, any example to maintain both mappings?

> >+static int iommu_heap_map_user(struct ion_heap *mapper,
> >+                              struct ion_buffer *buf,
> >+                              struct vm_area_struct *vma)
> >+{
> >+       int i = vma->vm_pgoff >> PAGE_SHIFT;
> >+       unsigned long uaddr = vma->vm_start;
> >+       unsigned long usize = vma->vm_end - vma->vm_start;
> >+
> >+       pr_debug("vma:%08lx-%08lx\n", vma->vm_start, vma->vm_end);
> >+       BUG_ON(!buf->pages);
> >+
> >+       vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> >+       do {
> >+               int ret;
> >+               struct page *page = buf->pages[i++];
> >+
> >+               ret = vm_insert_page(vma, uaddr, page);
> >+               if (ret)
> >+                       return ret;
>
> Same here: If you want to have an uncached mapping in user space,
> the pages must not be in a cacheable kernel mapping.
>
> 	Arnd
