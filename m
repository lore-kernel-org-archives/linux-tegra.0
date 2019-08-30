From: Krishna Reddy <vdumpa@nvidia.com>
Subject: RE: [PATCH 4/7] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Fri, 30 Aug 2019 17:43:45 +0000
Message-ID: <BYAPR12MB2710A68E954049D70832E167B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-5-git-send-email-vdumpa@nvidia.com>
 <5ab7c402-344d-0967-2ecf-21e24ecd0a0f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5ab7c402-344d-0967-2ecf-21e24ecd0a0f@arm.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Timo Alho <talho@nvidia.com>, Thierry Reding <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, Pritesh Raithatha <praithatha@nvidia.com>, "Thomas Zeng (SW-TEGRA)" <thomasz@nvidia.com>, Sachin Nikam <Snikam@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Yu-Huan Hsu <YHsu@nvidia.com>, Juha Tukkinen <jtukkinen@nvidia.com>, Alexander Van Brunt <avanbrunt@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

>> +	if (smmu->impl->global_fault)
>> +		return smmu->impl->global_fault(irq, smmu);

>Can't we just register impl->global_fault (if set) instead of arm_smmu_global_fault as the handler when we first set up the IRQs in arm_smmu_device_probe()?
>Ideally we'd do the same for the context banks as well, although we might need an additional hook from which to request the secondary IRQs that the main flow can't accommodate.

When first implemented theis patch, I think there were compile issues in accessing struct arm_smmu_domain from arm-smmu-nvidia.c as it was part of arm-smmu.c. 
To avoid issues accessing arm_smmu_domain. It did this for context fault and did same for global fault for uniformity.
Now, I see that it is part of arm-smmu.h.  Let me update code to register implementation hooks directly.  Thanks

-KR
