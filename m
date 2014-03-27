From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/12] drm/nouveau: support for GK20A, cont'd
Date: Thu, 27 Mar 2014 12:50:16 +0900
Message-ID: <CAAVeFu+2u-x-jw3DQtY1uztFbF_sqkGeRociAD0zELrdNectkQ@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395667191.5062.18.camel@weser.hi.pengutronix.de> <CAAVeFu+s+hrKdiHqxvxAOSnq-Jm_g3PY1wT3TgwpX1OGP-Niog@mail.gmail.com>
 <1395830031.7930.8.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395830031.7930.8.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 26, 2014 at 7:33 PM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> > It does so by doing the necessary manual cache flushes/invalidates on
>> > buffer access, so costs some performance. To avoid this you really want
>> > to get writecombined mappings into the kernel<->userspace interface.
>> > Simply mapping the pushbuf as WC/US has brought a 7% performance
>> > increase in OpenArena when I last tested this. This test was done with
>> > only one PCIe lane, so the perf increase may be even better with a more
>> > adequate interconnect.
>>
>> Interestingly if I allow writecombined mappings in the kernel I get
>> faults when attempting the read the mapped area:
>>
> This is most likely because your handling of those buffers produces
> conflicting mappings (if my understanding of what you are doing is
> right).
>
> At first you allocate memory from CMA without changing the pgprot flags.
> This yields pages which are mapped uncached or cached (when moveable
> pages are purged from CMA to make space for your buffer) into the
> kernels linear space.
>
> Later you regard this memory as iomem (it isn't!) and let TTM remap
> those pages into the vmalloc area with pgprot set to writecombined.
>
> I don't know exactly why this is causing havoc, but having two
> conflicting virtual mappings of the same physical memory is documented
> to at least produce undefined behavior on ARMv7.

IIUC this is not exactly what happens with GK20A, so let me explain
how VRAM is currently accessed to make sure we are in sync.

VRAM pages are allocated by nvea_ram_get(), which allocates chunks of
contiguous memory using dma_alloc_from_contiguous(). At that time I
don't think the pages are mapped anywhere for the CPU to see (contrary
to dma_alloc_coherent() for instance). Nouveau will then map the
memory into the GPU context's address space, but it is only when
nouveau_ttm_io_mem_reserve() is called that a BAR mapping is created,
making the memory accessible to the CPU through the BAR window (which
I consider as I/O memory).

The area of the BAR window pointing to the VRAM is then mapped to the
kernel (using ioremap_wc() or ioremap_nocache()) or user-space (where
ttm_io_prot() is called to get the pgprot_t to use). It is when this
mapping is writecombined that I get the faults.

So as far as I can tell, only at most one CPU mapping exists at any
time for VRAM memory, which goes through the BAR to access the actual
physical memory. It would probably be faster and more logical to map
the RAM directly so the CPU can address it, but going through the BAR
reduces CPU/GPU synchronization issues and there are a few cases where
we would need to map through the BAR anyway (e.g. tiled memory to be
made linear for the CPU).

I don't know if that help understanding what the issue might be - I
just wanted to make sure we are talking about the same thing. :)

Thanks,
Alex.
