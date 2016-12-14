From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v2 1/7] drm/tegra: Add Tegra DRM allocation API
Date: Wed, 14 Dec 2016 15:17:59 +0200
Message-ID: <399ecf92-4980-6df4-e7b7-f4ec9d78f5a1@kapsi.fi>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
 <20161214111617.24548-2-mperttunen@nvidia.com>
 <1481715331.2313.28.camel@pengutronix.de>
 <a578802e-642a-f3c5-7863-1a393e486b6c@kapsi.fi>
 <1481720206.2313.32.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481720206.2313.32.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 14.12.2016 14:56, Lucas Stach wrote:
> Am Mittwoch, den 14.12.2016, 14:36 +0200 schrieb Mikko Perttunen:
>> On 14.12.2016 13:35, Lucas Stach wrote:
>>> Am Mittwoch, den 14.12.2016, 13:16 +0200 schrieb Mikko Perttunen:
>>>> Add a new IO virtual memory allocation API to allow clients to
>>>> allocate non-GEM memory in the Tegra DRM IOMMU domain. This is
>>>> required e.g. for loading client firmware when clients are attached
>>>> to the IOMMU domain.
>>>>
>>>> The allocator allocates contiguous physical pages that are then
>>>> mapped contiguously to the IOMMU domain using the iova_domain
>>>> library provided by the kernel. Contiguous physical pages are
>>>> used so that the same allocator works also when IOMMU support
>>>> is disabled and therefore devices access physical memory directly.
>>>>
>>> Why is this needed? If you use the DMA API for those buffers you should
>>> end up with CMA memory in the !IOMMU case and normal paged memory with
>>> IOMMU enabled. From my understanding this should match the requirements.
>>
>> Yes, memory allocated with the DMA API should work as well, but would
>> also require passing the device pointer for the device that is
>> allocating the memory, which isn't a problem, but this way we don't need
>> that.
>>
> Which in turn would allow you to properly describe the DMA capabilities
> of engines that can address more than 32 bits without the IOMMU, which
> was one of the comments Thierry had the last time around IIRC.

In this case, just the device's DMA mask wouldn't allow that, since 
chips post Tegra132 do have units that support more than 32 bits 
generally but the firmware must still be in the lower 4G.

I guess this means that we would need to set the DMA mask to the lowest 
common denominator which is 32 bits, even though we want to have the 
full 34 bits for the GEM objects. However, this should only be an issue 
when the IOMMU is disabled so it isn't really that much of a problem.

>
>>>
>>> Also how big can those firmware images get? Will __get_free_pages be
>>> able to provide this much contig memory in a long running system with
>>> fragmented memory space? Isn't CMA the better option here?
>>
>> The largest is about 140 kilobytes. The space is also allocated when the
>> device is initialized which usually happens during boot.
>>
> Which is an order 6 allocation, something you almost certainly don't get
> in a fragmented system. I know it may work most of the time, as you are
> allocating those buffers early, but is most of the time really enough?
> What happens on module unload/load at a later time?

Yeah, it's probably worth fixing.

Thanks,
Mikko.

>
>>>
>>> Regards,
>>> Lucas
>>
>> Thanks,
>> Mikko.
>>
>>>
>>>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>  drivers/gpu/drm/tegra/drm.c | 111 +++++++++++++++++++++++++++++++++++++++++---
>>>>  drivers/gpu/drm/tegra/drm.h |  11 +++++
>>>>  2 files changed, 115 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>>>> index b8be3ee..cf714c6 100644
>>>> --- a/drivers/gpu/drm/tegra/drm.c
>>>> +++ b/drivers/gpu/drm/tegra/drm.c
>>>> @@ -1,12 +1,13 @@
>>>>  /*
>>>>   * Copyright (C) 2012 Avionic Design GmbH
>>>> - * Copyright (C) 2012-2013 NVIDIA CORPORATION.  All rights reserved.
>>>> + * Copyright (C) 2012-2016 NVIDIA CORPORATION.  All rights reserved.
>>>>   *
>>>>   * This program is free software; you can redistribute it and/or modify
>>>>   * it under the terms of the GNU General Public License version 2 as
>>>>   * published by the Free Software Foundation.
>>>>   */
>>>>
>>>> +#include <linux/bitops.h>
>>>>  #include <linux/host1x.h>
>>>>  #include <linux/iommu.h>
>>>>
>>>> @@ -23,6 +24,8 @@
>>>>  #define DRIVER_MINOR 0
>>>>  #define DRIVER_PATCHLEVEL 0
>>>>
>>>> +#define CARVEOUT_SZ SZ_64M
>>>> +
>>>>  struct tegra_drm_file {
>>>>  	struct list_head contexts;
>>>>  };
>>>> @@ -127,7 +130,8 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
>>>>
>>>>  	if (iommu_present(&platform_bus_type)) {
>>>>  		struct iommu_domain_geometry *geometry;
>>>> -		u64 start, end;
>>>> +		unsigned long order;
>>>> +		u64 carveout_start, carveout_end, gem_start, gem_end;
>>>>
>>>>  		tegra->domain = iommu_domain_alloc(&platform_bus_type);
>>>>  		if (!tegra->domain) {
>>>> @@ -136,12 +140,25 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
>>>>  		}
>>>>
>>>>  		geometry = &tegra->domain->geometry;
>>>> -		start = geometry->aperture_start;
>>>> -		end = geometry->aperture_end;
>>>> +		gem_start = geometry->aperture_start;
>>>> +		gem_end = geometry->aperture_end - CARVEOUT_SZ;
>>>> +		carveout_start = gem_end + 1;
>>>> +		carveout_end = geometry->aperture_end;
>>>> +
>>>> +		order = __ffs(tegra->domain->pgsize_bitmap);
>>>> +		init_iova_domain(&tegra->carveout.domain, 1UL << order,
>>>> +				 carveout_start >> order,
>>>> +				 carveout_end >> order);
>>>> +
>>>> +		tegra->carveout.shift = iova_shift(&tegra->carveout.domain);
>>>> +		tegra->carveout.limit = carveout_end >> tegra->carveout.shift;
>>>> +
>>>> +		drm_mm_init(&tegra->mm, gem_start, gem_end - gem_start + 1);
>>>>
>>>> -		DRM_DEBUG_DRIVER("IOMMU aperture initialized (%#llx-%#llx)\n",
>>>> -				 start, end);
>>>> -		drm_mm_init(&tegra->mm, start, end - start + 1);
>>>> +		DRM_DEBUG("IOMMU apertures:\n");
>>>> +		DRM_DEBUG("  GEM: %#llx-%#llx\n", gem_start, gem_end);
>>>> +		DRM_DEBUG("  Carveout: %#llx-%#llx\n", carveout_start,
>>>> +			  carveout_end);
>>>>  	}
>>>>
>>>>  	mutex_init(&tegra->clients_lock);
>>>> @@ -208,6 +225,7 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
>>>>  	if (tegra->domain) {
>>>>  		iommu_domain_free(tegra->domain);
>>>>  		drm_mm_takedown(&tegra->mm);
>>>> +		put_iova_domain(&tegra->carveout.domain);
>>>>  	}
>>>>  free:
>>>>  	kfree(tegra);
>>>> @@ -232,6 +250,7 @@ static int tegra_drm_unload(struct drm_device *drm)
>>>>  	if (tegra->domain) {
>>>>  		iommu_domain_free(tegra->domain);
>>>>  		drm_mm_takedown(&tegra->mm);
>>>> +		put_iova_domain(&tegra->carveout.domain);
>>>>  	}
>>>>
>>>>  	kfree(tegra);
>>>> @@ -975,6 +994,84 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
>>>>  	return 0;
>>>>  }
>>>>
>>>> +void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size,
>>>> +			      dma_addr_t *dma)
>>>> +{
>>>> +	struct iova *alloc;
>>>> +	void *virt;
>>>> +	gfp_t gfp;
>>>> +	int err;
>>>> +
>>>> +	if (tegra->domain)
>>>> +		size = iova_align(&tegra->carveout.domain, size);
>>>> +	else
>>>> +		size = PAGE_ALIGN(size);
>>>> +
>>>> +	gfp = GFP_KERNEL | __GFP_ZERO;
>>>> +	if (!tegra->domain) {
>>>> +		/*
>>>> +		 * Many units only support 32-bit addresses, even on 64-bit
>>>> +		 * SoCs. If there is no IOMMU to translate into a 32-bit IO
>>>> +		 * virtual address space, force allocations to be in the
>>>> +		 * lower 32-bit range.
>>>> +		 */
>>>> +		gfp |= GFP_DMA;
>>>> +	}
>>>> +
>>>> +	virt = (void *)__get_free_pages(gfp, get_order(size));
>>>> +	if (!virt)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	if (!tegra->domain) {
>>>> +		/*
>>>> +		 * If IOMMU is disabled, devices address physical memory
>>>> +		 * directly.
>>>> +		 */
>>>> +		*dma = virt_to_phys(virt);
>>>> +		return virt;
>>>> +	}
>>>> +
>>>> +	alloc = alloc_iova(&tegra->carveout.domain,
>>>> +			   size >> tegra->carveout.shift,
>>>> +			   tegra->carveout.limit, true);
>>>> +	if (!alloc) {
>>>> +		err = -EBUSY;
>>>> +		goto free_pages;
>>>> +	}
>>>> +
>>>> +	*dma = iova_dma_addr(&tegra->carveout.domain, alloc);
>>>> +	err = iommu_map(tegra->domain, *dma, virt_to_phys(virt),
>>>> +			size, IOMMU_READ | IOMMU_WRITE);
>>>> +	if (err < 0)
>>>> +		goto free_iova;
>>>> +
>>>> +	return virt;
>>>> +
>>>> +free_iova:
>>>> +	__free_iova(&tegra->carveout.domain, alloc);
>>>> +free_pages:
>>>> +	free_pages((unsigned long)virt, get_order(size));
>>>> +
>>>> +	return ERR_PTR(err);
>>>> +}
>>>> +
>>>> +void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
>>>> +		    dma_addr_t dma)
>>>> +{
>>>> +	if (tegra->domain)
>>>> +		size = iova_align(&tegra->carveout.domain, size);
>>>> +	else
>>>> +		size = PAGE_ALIGN(size);
>>>> +
>>>> +	if (tegra->domain) {
>>>> +		iommu_unmap(tegra->domain, dma, size);
>>>> +		free_iova(&tegra->carveout.domain,
>>>> +			  iova_pfn(&tegra->carveout.domain, dma));
>>>> +	}
>>>> +
>>>> +	free_pages((unsigned long)virt, get_order(size));
>>>> +}
>>>> +
>>>>  static int host1x_drm_probe(struct host1x_device *dev)
>>>>  {
>>>>  	struct drm_driver *driver = &tegra_drm_driver;
>>>> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
>>>> index 0ddcce1..7351dee 100644
>>>> --- a/drivers/gpu/drm/tegra/drm.h
>>>> +++ b/drivers/gpu/drm/tegra/drm.h
>>>> @@ -12,6 +12,7 @@
>>>>
>>>>  #include <uapi/drm/tegra_drm.h>
>>>>  #include <linux/host1x.h>
>>>> +#include <linux/iova.h>
>>>>  #include <linux/of_gpio.h>
>>>>
>>>>  #include <drm/drmP.h>
>>>> @@ -43,6 +44,12 @@ struct tegra_drm {
>>>>  	struct iommu_domain *domain;
>>>>  	struct drm_mm mm;
>>>>
>>>> +	struct {
>>>> +		struct iova_domain domain;
>>>> +		unsigned long shift;
>>>> +		unsigned long limit;
>>>> +	} carveout;
>>>> +
>>>>  	struct mutex clients_lock;
>>>>  	struct list_head clients;
>>>>
>>>> @@ -104,6 +111,10 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
>>>>  int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
>>>>  int tegra_drm_exit(struct tegra_drm *tegra);
>>>>
>>>> +void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size, dma_addr_t *iova);
>>>> +void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
>>>> +		    dma_addr_t iova);
>>>> +
>>>>  struct tegra_dc_soc_info;
>>>>  struct tegra_output;
>>>>
>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>
>
