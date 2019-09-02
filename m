From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 3/7] iommu/arm-smmu: Add tlb_sync implementation hook
Date: Mon, 2 Sep 2019 14:00:07 +0100
Message-ID: <3d734164-51c9-3465-cddd-276093389797@arm.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-4-git-send-email-vdumpa@nvidia.com>
 <554f8de1-1638-4eb9-59ae-8e1f0d786c44@arm.com>
 <BYAPR12MB2710AF5DDCB687C7E78362E5B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
 <BYAPR12MB271010C629D8DD7AEC0123D4B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB271010C629D8DD7AEC0123D4B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Reddy <vdumpa@nvidia.com>
Cc: Sachin Nikam <Snikam@nvidia.com>, "Thomas Zeng (SW-TEGRA)" <thomasz@nvidia.com>, Juha Tukkinen <jtukkinen@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Timo Alho <talho@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Alexander Van Brunt <avanbrunt@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "joro@8bytes.org" <joro@8bytes.org>
List-Id: linux-tegra@vger.kernel.org

On 30/08/2019 23:49, Krishna Reddy wrote:
>>> +	if (smmu->impl->tlb_sync) {
>>> +		smmu->impl->tlb_sync(smmu, page, sync, status);
> 
>> What I'd hoped is that rather than needing a hook for this, you could just override smmu_domain->tlb_ops from .init_context to wire up the alternate .sync method directly. That would save this extra level of indirection.
> 
> Hi Robin,  overriding tlb_ops->tlb_sync function is not enough here.
> There are direct references to arm_smmu_tlb_sync_context(),  arm_smmu_tlb_sync_global() functions.
> In arm-smmu.c.  we can replace these direct references with tlb_ops->tlb_sync() function except in one function arm_smmu_device_reset().
> When arm_smmu_device_reset() gets called, domains are not initialized and tlb_ops is not available.
> Should we add a new hook for arm_smmu_tlb_sync_global() or make this as a responsibility of impl->reset() hook as it gets
> called at the same place?

Ah, right, I'd forgotten about the TLB maintenance on reset. Looking 
again, though, I think you might need to implement impl->reset anyway 
for the sake of clearing GFSR correctly - since the value read from the 
base instance technically may not match whatever bits might happen to be 
set in the other instances - so I don't see any issue with just calling 
nsmmu_tlb_sync() from there as well.

Robin.
