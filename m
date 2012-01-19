From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [Ce-android-mainline] [RFC][PATCH 1/1] gpu: ion: Add IOMMU heap
 allocator with IOMMU API
Date: Thu, 19 Jan 2012 10:45:49 -0800
Message-ID: <401E54CE964CD94BAE1EB4A729C7087E378DEBDD56@HQMAIL04.nvidia.com>
References: <20120118.094004.1564213980840408030.hdoyu@nvidia.com>
 <201201191204.35067.arnd@arndb.de>
 <20120119.161538.1686847422348460522.hdoyu@nvidia.com>
 <201201191627.19732.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201201191627.19732.arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "ce-android-mainline-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ce-android-mainline-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "sumit.semwal-l0cyMroinI0@public.gmane.org" <sumit.semwal-l0cyMroinI0@public.gmane.org>, "m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> > > The main advantage of the IOMMU API is that it is able to separate
> > > multiple contexts, per user, so one application that is able to
> > > program a DMA engine cannot access memory that another application
> > > has mapped. Is that what you do with ion_iommu_heap_create(), i.e.
> > > that it gets called for each GPU context?
> >
> > Yes. The concept of this part cames from dma-mapping API code.
> 
> I don't understand. The dma-mapping code on top of IOMMU does *not*
> use one iommu context per GPU context, it uses one IOMMU context for
> everything together.

Let me add more details on how IOMMU heap allocator is intended to use.
IOMMU heap allocator would be a part of ION memory manager.  Clients
from user space call Ion memory manger ioctl to allocate memory from
Ion IOMMU heap.  IOMMU heap allocator would allocate the
 non-contiguous pages based on the alloc size requested. 
 The user space clients can pass the Ion memory handle to kernel stack/drivers.
 Kernel drivers would get sg list from Ion memory manager api based
on the mem handle received.  The sg list would be used to sync memory,
 map the  physical pages memory into desired iommu space using dma-mapping
 API's before passing memory to H/W module.

The allocation logic is IOMMU heap allocator can use dma-mapping api to 
allocate, if possible. As of now, it doesn't seem possible. The dma alloc
apis tries to alloc virtual space in kernel along with phys memory during alloc.
The user can alloc arbitrarily large amounts of memory, which would not fit into
virtual space of kernel. So, the IOMMU should alloc pages itself and 
IOMMU heap allocator should take care of conflicting mapping issue.

The Ion IOMMU Heap allocator shouldn't be doing any IOMMU mapping using
 direct IOMMU API's.  Moreover, IOMMU heap allocator has no info on
which dev is going to access the mapping.  So, it can't do proper mapping.


> > > Using vzalloc here probably goes a bit too far, it's fairly
> > > expensive to use compared with kzalloc, not only do you have to
> > > maintain the page table entries for the new mapping, it also means
> > > you use up precious space in the vmalloc area and have to use small
> > > pages for accessing the data in it.
> >
> > Should I use "kzalloc()" instead here?
> 
> Yes, that would be better, at least if you can prove that there is a reasonable
> upper bound on the size of the allocation. kmalloc/kzalloc usually work ok up
> to 16kb or at most 128kb. If you think the total allocation might be larger than
> that, you have to use vzalloc anyway but that should come with a long
> comment explaining what is going on.

Kzalloc doesn't guarantee any size bigger than PAGE_SIZE when the system memory
Is fully fragmented. It should only be used for sizes less than or equal to PAGE_SIZE.
Otherwise vzalloc() should be used to avoid failures due to fragmentation.

-KR

--nvpublic
