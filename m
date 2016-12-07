From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 1/8] drm/tegra: Add Tegra DRM allocation API
Date: Wed, 7 Dec 2016 11:23:57 +0200
Message-ID: <b3dbcb59-ec72-8ee5-6ae2-ce4284a66a7d@kapsi.fi>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
 <20161110182345.31777-2-mperttunen@nvidia.com>
 <20161205183726.GA22918@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161205183726.GA22918-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 05.12.2016 20:37, Thierry Reding wrote:
> On Thu, Nov 10, 2016 at 08:23:38PM +0200, Mikko Perttunen wrote:
>> Add a new IO virtual memory allocation API to allow clients to
>> allocate non-GEM memory in the Tegra DRM IOMMU domain. This is
>> required e.g. for loading client firmware when clients are attached
>> to the IOMMU domain.
>>
>> The allocator allocates contiguous physical pages that are then
>> mapped contiguously to the IOMMU domain using the iova_domain
>> library provided by the kernel. Contiguous physical pages are
>> used so that the same allocator works also when IOMMU support
>> is disabled and therefore devices access physical memory directly.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/drm.c | 98 ++++++++++++++++++++++++++++++++++++++++++---
>>  drivers/gpu/drm/tegra/drm.h |  7 ++++
>>  2 files changed, 100 insertions(+), 5 deletions(-)
>
> This looks mostly good, just a few comments below...
>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index b8be3ee..ecfe7ba 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -1,12 +1,13 @@
>>  /*
>>   * Copyright (C) 2012 Avionic Design GmbH
>> - * Copyright (C) 2012-2013 NVIDIA CORPORATION.  All rights reserved.
>> + * Copyright (C) 2012-2015 NVIDIA CORPORATION.  All rights reserved.
>
> It's almost 2017 now, I think this is out of date. =)
>
>>   *
>>   * This program is free software; you can redistribute it and/or modify
>>   * it under the terms of the GNU General Public License version 2 as
>>   * published by the Free Software Foundation.
>>   */
>>
>> +#include <linux/bitops.h>
>>  #include <linux/host1x.h>
>>  #include <linux/iommu.h>
>>
>> @@ -23,6 +24,8 @@
>>  #define DRIVER_MINOR 0
>>  #define DRIVER_PATCHLEVEL 0
>>
>> +#define IOVA_AREA_SZ (1024 * 1024 * 64) /* 64 MiB */
>
> SZ_64M?

Fixed.

>
>> +
>>  struct tegra_drm_file {
>>  	struct list_head contexts;
>>  };
>> @@ -127,7 +130,8 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
>>
>>  	if (iommu_present(&platform_bus_type)) {
>>  		struct iommu_domain_geometry *geometry;
>> -		u64 start, end;
>> +		unsigned long order;
>> +		u64 iova_start, start, end;
>
> Can we be a little more explicit and keep an additional iova_end to
> simplify the code a little?

Good idea. I replaced this with gem_{start,end} and carveout_{start,end} 
and it looks nicer.

>
>>  		tegra->domain = iommu_domain_alloc(&platform_bus_type);
>>  		if (!tegra->domain) {
>> @@ -138,10 +142,17 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
>>  		geometry = &tegra->domain->geometry;
>>  		start = geometry->aperture_start;
>>  		end = geometry->aperture_end;
>> +		iova_start = end - IOVA_AREA_SZ + 1;
>> +
>> +		order = __ffs(tegra->domain->pgsize_bitmap);
>> +		init_iova_domain(&tegra->iova, 1UL << order,
>> +				 iova_start >> order,
>> +				 end >> order);
>
> I hadn't seen this IOVA domain thing and it looks rather handy.

Yes, definitely nicer than rolling by hand. Could be a bit easier still 
though :) Too many "<< order" everywhere.

>
>>
>> -		DRM_DEBUG_DRIVER("IOMMU aperture initialized (%#llx-%#llx)\n",
>> -				 start, end);
>> -		drm_mm_init(&tegra->mm, start, end - start + 1);
>> +		drm_mm_init(&tegra->mm, start, iova_start - start);
>> +
>> +		DRM_DEBUG("IOMMU apertures initialized (GEM: %#llx-%#llx, IOVA: %#llx-%#llx)\n",
>> +			  start, iova_start-1, iova_start, end);
>
> Might be worth splitting this into two, or perhaps even three lines:
>
> 	IOMMU apertures:
> 	  GEM: %#llx-%#llx
> 	  IOVA: %#llx-%#llx
>
> Maybe also find a better name for IOVA, since GEM will be using I/O
> virtual addresses as well. Perhaps just name it "carveout" or something
> like that?

Done and renamed to carveout.

>
>>  	}
>>
>>  	mutex_init(&tegra->clients_lock);
>> @@ -208,6 +219,7 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
>>  	if (tegra->domain) {
>>  		iommu_domain_free(tegra->domain);
>>  		drm_mm_takedown(&tegra->mm);
>> +		put_iova_domain(&tegra->iova);
>>  	}
>>  free:
>>  	kfree(tegra);
>> @@ -232,6 +244,7 @@ static int tegra_drm_unload(struct drm_device *drm)
>>  	if (tegra->domain) {
>>  		iommu_domain_free(tegra->domain);
>>  		drm_mm_takedown(&tegra->mm);
>> +		put_iova_domain(&tegra->iova);
>>  	}
>>
>>  	kfree(tegra);
>> @@ -975,6 +988,81 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
>>  	return 0;
>>  }
>>
>> +void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size,
>> +			      dma_addr_t *iova)
>
> Maybe name the iova parameter phys? iova implies that it's always
> translated, whereas according to the code it can be physical, too.

How about something like "dma"? I find the use of "phys" for device 
addresses slightly confusing since sometimes they are and sometimes not 
and it's hard to say at a glance if the code in question actually 
assumes that the addresses are physical or not. "dma" should convey the 
meaning of "address used by device" a bit better.

>
>> +{
>> +	struct iova *alloc;
>> +	unsigned long shift;
>> +	void *virt;
>> +	gfp_t gfp;
>> +	int err;
>> +
>> +	if (tegra->domain)
>> +		size = iova_align(&tegra->iova, size);
>> +	else
>> +		size = PAGE_ALIGN(size);
>> +
>> +	gfp = GFP_KERNEL | __GFP_ZERO;
>> +	if (!tegra->domain) {
>> +		/*
>> +		 * Tegra210 has 64-bit physical addresses but units only support
>> +		 * 32-bit addresses, so if we don't have an IOMMU to do
>> +		 * translation, force allocations to be in the 32-bit range.
>> +		 */
>> +		gfp |= GFP_DMA;
>
> Technically we do support Tegra132 and that already has 64-bit physical
> addresses, so perhaps include that in the comment, or make it more
> generic:
>
> 	/*
> 	 * Many units only support 32-bit addresses, even on 64-bit SoCs.
> 	 * If there is no IOMMU to translate into a 32-bit IO virtual address
> 	 * address space, force allocations to be in the lower 32-bit range.
> 	 */
>

Will fix.

>> +	}
>> +
>> +	virt = (void *)__get_free_pages(gfp, get_order(size));
>> +	if (!virt)
>> +		return NULL;
>
> Perhaps we want to return an ERR_PTR()-encoded error code here so we can
> differentiate between out-of-memory and out-of-virtual-address-space
> conditions in the caller? Or perhaps other conditions as well.

Sure.

>
> Also, is __get_free_pages() the right API here? I thought that it always
> returned contiguous memory, which, in the presence of an IOMMU, will be
> completely unnecessary.

That is true. However, this API is intended only for a few small 
allocations is done by the kernel, so it shouldn't be that bad. And 
sources on the internet say that vmalloc should only be used when 
absolutely necessary :)

>
>> +
>> +	if (!tegra->domain) {
>> +		/*
>> +		 * If IOMMU is disabled, devices address physical memory
>> +		 * directly.
>> +		 */
>> +		*iova = virt_to_phys(virt);
>> +		return virt;
>> +	}
>> +
>> +	shift = iova_shift(&tegra->iova);
>> +	alloc = alloc_iova(&tegra->iova, size >> shift,
>> +			   tegra->domain->geometry.aperture_end >> shift, true);
>
> This is fairly cumbersome to use. Maybe a drm_mm would be easier in this
> case? If not, could we at least store the upper limit of the carveout so
> that we don't have to use the really long expression above?

Stored shift and aperture_end >> shift.

>
> Thierry
>

Thanks,
Mikko.
