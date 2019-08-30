From: Krishna Reddy <vdumpa@nvidia.com>
Subject: RE: [PATCH 3/7] iommu/arm-smmu: Add tlb_sync implementation hook
Date: Fri, 30 Aug 2019 19:00:05 +0000
Message-ID: <BYAPR12MB27106B630A0E1A2A0CBC79D9B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-4-git-send-email-vdumpa@nvidia.com>
 <20190830111446.GC23902@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830111446.GC23902@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>, Sachin Nikam <Snikam@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, Timo Alho <talho@nvidia.com>, Alexander Van Brunt <avanbrunt@nvidia.com>, "Thomas Zeng (SW-TEGRA)" <thomasz@nvidia.com>, "olof@lixom.net" <olof@lixom.net>, Juha Tukkinen <jtukkinen@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "joro@8bytes.org" <joro@8byte>
List-Id: linux-tegra@vger.kernel.org

>Wouldn't it work if you replaced all calls of __arm_smmu_tlb_sync() by
>smmu->impl->tlb_sync() and assign __arm_smmu_tlb_sync() as default for
>devices that don't need to override it? That makes this patch slightly lar=
ger, but it saves us one level of indirection.

The tlb_ops->tlb_sync can be overridden directly in arm-smmu-nvidia.c speci=
fic implementation as pointed by Robin. Will be updating in next patch.


>> +	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
>> +			 int status);

>Can't page, sync and status all be unsigned?

This is to be uniform with original tlb_sync definition is arm-smmu.c.  Any=
way, this hook is not necessary as tlb_ops->tlb_sync can be overridden dire=
ctly.

-KR
