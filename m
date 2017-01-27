From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v2 1/7] drm/tegra: Add Tegra DRM allocation API
Date: Sat, 28 Jan 2017 00:45:20 +0200
Message-ID: <e79d351b-0300-8a39-05eb-c7a90c96daf7@kapsi.fi>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
 <20161214111617.24548-2-mperttunen@nvidia.com>
 <1481715331.2313.28.camel@pengutronix.de>
 <20161214134833.GA29981@ulmo.ba.sec>
 <1481724116.2313.39.camel@pengutronix.de>
 <20161214143912.GA30280@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214143912.GA30280-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

So with the userspace question resolved, only this question of memory 
allocation remains. I see the following options:

- Keep the current __get_free_pages-based allocation. This means that 
firmware loading may fail when memory is fragmented. The function can be 
augmented by adding vmalloc support when IOMMU is enabled, which would 
eliminate those failures.

- Move to doing CMA allocation using the DMA API. This way allocations 
would succeed more likely at least if the user has enough CMA memory.
In this case we'll need to pass an additional struct device * to the 
alloc/free functions. This also requires that the CMA memory is always 
allocated from the lower 4GB physical address range, as firmware can 
only be loaded from there (other operations support 34 bits); I don't 
know how the default CMA region is allocated, maybe I should find out.

This option would also require adding a separate path for when the IOMMU 
is enabled and CMA not available - AIUI, on Tegra, the DMA API always 
allocates from CMA, whether IOMMU is enabled or not. (Or, we could make 
CMA mandatory.)

For me, either option works. Also, sorry if I made some stupid mistake, 
my brain is currently too tired to handle multiple address spaces at the 
same time :)

Cheers,
Mikko.

On 12/14/2016 04:39 PM, Thierry Reding wrote:
> On Wed, Dec 14, 2016 at 03:01:56PM +0100, Lucas Stach wrote:
>> Am Mittwoch, den 14.12.2016, 14:48 +0100 schrieb Thierry Reding:
>>> On Wed, Dec 14, 2016 at 12:35:31PM +0100, Lucas Stach wrote:
>>>> Am Mittwoch, den 14.12.2016, 13:16 +0200 schrieb Mikko Perttunen:
>>>>> Add a new IO virtual memory allocation API to allow clients to
>>>>> allocate non-GEM memory in the Tegra DRM IOMMU domain. This is
>>>>> required e.g. for loading client firmware when clients are attached
>>>>> to the IOMMU domain.
>>>>>
>>>>> The allocator allocates contiguous physical pages that are then
>>>>> mapped contiguously to the IOMMU domain using the iova_domain
>>>>> library provided by the kernel. Contiguous physical pages are
>>>>> used so that the same allocator works also when IOMMU support
>>>>> is disabled and therefore devices access physical memory directly.
>>>>>
>>>> Why is this needed? If you use the DMA API for those buffers you should
>>>> end up with CMA memory in the !IOMMU case and normal paged memory with
>>>> IOMMU enabled. From my understanding this should match the requirements.
>>>
>>> We can't currently use the DMA API for these allocations because it
>>> doesn't allow (or at least didn't back when this was first implemented)
>>> us to share a mapping between two devices.
>>
>> Hm, maybe I'm overlooking something, but isn't this just a matter of
>> allocating on one device, then constructing a SG list (dma_get_sgtable)
>> from the buffer you got and use that to dma_map_sg() the buffer on the
>> other device?
>
> Yes, that would work. What I was referring to is sharing framebuffers
> between multiple CRTCs. Back at the time when IOMMU support was first
> added, I tried to use the DMA API. However, the problem with that was
> that we would've had to effectively dma_map_sg() on every page-flip
> since the buffer is imported into the DRM device, but there's no call
> that would import it for each CRTC only once. So when the framebuffer
> is added to a plane, you have to map it to the corresponding display
> controller. And the dma_map_sg() was, if I recall correctly, on the
> order of 5-10 ms, which is prohibitively expensive to do per frame.
>
> It's also completely unnecessary because all CRTCs in a DRM device can
> simply share the same IOMMU domain. I can't think of a reason why you
> would want or need to use separate domains.
>
> Back at the time this was something that the DMA API couldn't do, it
> would simply assign a separate IOMMU domain per device. It's possible
> that this has changed now given that many others must've run into the
> same problem meanwhile.
>
>> Maybe doing the firmware buffer allocation on host1x (with a 4GB upper
>> bound) and then sharing the SG list to the devices?
>
> That's pretty much what this API is doing. Only it's the other way
> around: we don't share the SG list with other devices for mapping, we
> simply reuse the same mapping across multiple devices, since they're
> all in the same IOMMU domain.
>
>>> The reason why we need these patches is that when IOMMU is enabled, then
>>> the units' falcons will read memory through the IOMMU, so we must have
>>> allocations for GEM buffers and the firmware go through the same
>>> mechanism.
>>
>> Sorry for maybe dumb questions.
>>
>> Do you have any engines other than the GPU that can handle SG
>> themselves?
>
> No, I don't think so.
>
>> Wouldn't you want the GEM objects to be backed by CMA in the !MMU
>> case?
>
> That's exactly what's happening already. If no IOMMU is available we
> allocate buffer objects backing store with dma_alloc_wc().
>
>> How are ordinary GEM objects different from the falcon firmware?
>
> They're not. I think we could probably reuse more of the BO allocation
> functions for the firmware as well. I think Mikko already agreed to look
> into that. We might have to add some special cases, or split up the
> helpers a little differently to avoid creating GEM objects from the
> firmware buffers. We wouldn't want userspace to start mmap()'ing those.
>
> Thierry
>
