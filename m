From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Linaro-mm-sig] [RFC 0/2] DMA-mapping & IOMMU - physically
 contiguous allocations
Date: Tue, 16 Oct 2012 20:11:40 +0900
Message-ID: <CAAQKjZPf5RYJ75Zsqo=+gadXH1Jx9BFuFUuDCrsrhLKO1_frfg@mail.gmail.com>
References: <1350309832-18461-1-git-send-email-m.szyprowski@samsung.com>
	<CAAQKjZMYFNMEnb2ue2aR+6AEbOixnQFyggbXrThBCW5VOznePg@mail.gmail.com>
	<20121016090434.7d5e088152a3e0b0606903c8@nvidia.com>
	<CAAQKjZNQFfxpr-7dFb4cgNB2Gkrxxrswds_fSrYgssxXaqRF7g@mail.gmail.com>
	<20121016103109.GA21164@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121016103109.GA21164-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Russell,

2012/10/16 Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>:
> On Tue, Oct 16, 2012 at 07:12:49PM +0900, Inki Dae wrote:
>> Hi Hiroshi,
>>
>> I'm not sure I understand what you mean but we had already tried this
>> way and for this, you can refer to below link,
>>                http://www.mail-archive.com/dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org/msg22555.html
>>
>> but this way had been pointed out by drm guys because the pages could
>> be used through gem object after that pages had been freed by free()
>> anyway their pointing was reasonable and I'm trying another way, this
>> is the way that the pages to user space has same life time with dma
>> operation. in other word, if dma completed access to that pages then
>> also that pages will be freed. actually drm-based via driver of
>> mainline kernel is using same way
>
> I don't know about Hiroshi, but the above "sentence" - and I mean the 7
> line sentence - is very difficult to understand and wears readers out.
>

Sorry for this. Please see below comments.

> If your GPU hardware has a MMU, then the problem of dealing with userspace
> pages is very easy.  Do it the same way that the i915 driver and the rest
> of DRM does.  Use shmem backed memory.
>
> I'm doing that for the Dove DRM driver and it works a real treat, and as
> the pages are backed by page cache pages, you can use all the normal
> page refcounting on them to prevent them being freed until your DMA has
> completed.  All my X pixmaps are shmem backed drm objects, except for
> the scanout buffers which are dumb drm objects (because they must be
> contiguous.)
>
> In fact, get_user_pages() will take the reference for you before you pass
> them over to dma_map_sg().  On completion of DMA, you just need to use
> dma_unmap_sg() and release each page.
>

It's exactly same as ours. Besides, I know get_user_pages() takes 2
reference counts if the user process has never accessed user region
allocated by malloc(). Then, if the user calls free(), the page
reference count becomes 1 and becomes 0 with put_page() call. And the
reverse holds as well. This means how the pages backed are used by dma
and freed. dma_map_sg() just does cache operation properly and maps
these pages with iommu table. There may be my missing point.

Thanks,
Inki Dae

> If you don't want to use get_user_pages() (which other drivers don't) then
> you need to following the i915 example and get each page out of shmem
> individually.
>
> (My situation on the Dove hardware is a little different, because the
> kernel DRM driver isn't involved with the GPU - it merely provides the
> memory for pixmaps.  The GPU software stack, being a chunk of closed
> source userspace library with open source kernel driver, means that
> things are more complicated; the kernel side GPU driver uses
> get_user_pages() to pin them prior to building the GPU's MMU table.)
>
> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo-Bw31MaZKKs0EbZ0PF+XxCw@public.gmane.org  For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=mailto:"dont-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org"> email-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org </a>
