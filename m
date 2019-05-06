From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [RFC 6/7] iommu/vt-d: convert the intel iommu driver to the
 dma-iommu ops api
Date: Mon, 6 May 2019 09:34:59 +0800
Message-ID: <2419e94d-bfdb-e70d-bbfd-425671886e99@linux.intel.com>
References: <20190504132327.27041-1-tmurphy@arista.com>
 <20190504132327.27041-7-tmurphy@arista.com>
 <602b77a2-9c68-ad14-b64f-904a7ff27a15@linux.intel.com>
 <CAPL0++57nyLYP1fq=-6zvNS0z_iCqjWLbQ1MsG5F60ODkmRCQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPL0++57nyLYP1fq=-6zvNS0z_iCqjWLbQ1MsG5F60ODkmRCQQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tom Murphy <tmurphy@arista.com>
Cc: baolu.lu@linux.intel.com, iommu@lists.linux-foundation.org, Tom Murphy <murphyt7@tcd.ie>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Gerald Schaefer <gerald.schaefer@de.ibm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Alex Williamson <alex.williamson@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Marc
List-Id: linux-tegra@vger.kernel.org

Hi,

On 5/6/19 1:03 AM, Tom Murphy wrote:
> On Sun, May 5, 2019 at 3:44 AM Lu Baolu<baolu.lu@linux.intel.com>  wrote:
>> Hi,
>>
>> On 5/4/19 9:23 PM, Tom Murphy wrote:
>>> static int intel_iommu_add_device(struct device *dev)
>>>    {
>>> +     struct dmar_domain *dmar_domain;
>>> +     struct iommu_domain *domain;
>>>        struct intel_iommu *iommu;
>>>        struct iommu_group *group;
>>> -     struct iommu_domain *domain;
>>> +     dma_addr_t base;
>>>        u8 bus, devfn;
>>>
>>>        iommu = device_to_iommu(dev, &bus, &devfn);
>>> @@ -4871,9 +4514,12 @@ static int intel_iommu_add_device(struct device *dev)
>>>        if (IS_ERR(group))
>>>                return PTR_ERR(group);
>>>
>>> +     base = IOVA_START_PFN << VTD_PAGE_SHIFT;
>>>        domain = iommu_get_domain_for_dev(dev);
>>> +     dmar_domain = to_dmar_domain(domain);
>>>        if (domain->type == IOMMU_DOMAIN_DMA)
>>> -             dev->dma_ops = &intel_dma_ops;
>>> +             iommu_setup_dma_ops(dev, base,
>>> +                             __DOMAIN_MAX_ADDR(dmar_domain->gaw) - base);
>> I didn't find the implementation of iommu_setup_dma_ops() in this
>> series. Will the iova resource be initialized in this function?
> Ah sorry, I should've mentioned this is based on the
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-iommu-ops.3
> branch with the "iommu/vt-d: Delegate DMA domain to generic iommu" and
> "iommu/amd: Convert the AMD iommu driver to the dma-iommu api" patch
> sets applied.
> 
>> If so, will this block iommu_group_create_direct_mappings() which
>> reserves and maps the reserved iova ranges.
> The reserved regions will be reserved by the
> iova_reserve_iommu_regions function instead:
> (https://github.com/torvalds/linux/blob/6203838dec05352bc357625b1e9ba0a10d3bca35/drivers/iommu/dma-iommu.c#L238
> )
> iommu_setup_dma_ops calls iommu_dma_init_domain which calls
> iova_reserve_iommu_regions.
> iommu_group_create_direct_mappings will still execute normally but it
> won't be able to call the intel_iommu_apply_resv_region function
> because it's been removed in this patchset.
> This shouldn't change any behavior and the same regions should be reserved.
> 

Okay, I understand it now. Thanks for the explanation.

Best regards,
Lu Baolu
