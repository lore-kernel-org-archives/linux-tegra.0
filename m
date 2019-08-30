From: Krishna Reddy <vdumpa@nvidia.com>
Subject: RE: [PATCH 4/7] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Fri, 30 Aug 2019 19:16:34 +0000
Message-ID: <BYAPR12MB27106FD6B6CC9E148B65EC00B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-5-git-send-email-vdumpa@nvidia.com>
 <20190830111707.GD23902@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830111707.GD23902@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>, Sachin Nikam <Snikam@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, Timo Alho <talho@nvidia.com>, Alexander Van Brunt <avanbrunt@nvidia.com>, "Thomas Zeng (SW-TEGRA)" <thomasz@nvidia.com>, "olof@lixom.net" <olof@lixom.net>, Juha Tukkinen <jtukkinen@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "joro@8bytes.org" <joro@8byte>
List-Id: linux-tegra@vger.kernel.org

>> +static irqreturn_t nsmmu_context_fault_inst(int irq,
>> +					    struct arm_smmu_device *smmu,
>> +					    int idx, int inst);

>More of these signed integers that could be unsigned. Also why the need to=
 predeclare this? Can you not just put the definition of the function up he=
re?

The singed integers are based on original function prototype from arm-smmu.=
c.  inst can be updated to unsigned.
This is because I was checking context faults from global fault handler as =
well.  This can avoided by using interrupt lines of all the instances acros=
s global and context irq entries.  Let me update.
=20
> +	if (smmu->impl->global_fault)
> +		return smmu->impl->global_fault(irq, smmu);
>>... and here about the extra level of indirection.

Fixing in next version.

-KR
