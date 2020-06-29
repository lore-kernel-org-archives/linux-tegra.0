From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v7 1/3] iommu/arm-smmu: add NVIDIA implementation for
 dual ARM MMU-500 usage
Date: Mon, 29 Jun 2020 16:52:20 -0700
Message-ID: <20200629235219.GA14616@Asurada-Nvidia>
References: <20200629022838.29628-1-vdumpa@nvidia.com>
 <20200629022838.29628-2-vdumpa@nvidia.com>
 <20200629215124.GD27967@Asurada-Nvidia>
 <BYAPR12MB2822B08564C7BD7212DCCEFEB36E0@BYAPR12MB2822.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2822B08564C7BD7212DCCEFEB36E0@BYAPR12MB2822.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Reddy <vdumpa@nvidia.com>
Cc: "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>, Sachin Nikam <Snikam@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, Timo Alho <talho@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>, Bryan Huntsman <bhuntsman@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 29, 2020 at 10:49:31PM +0000, Krishna Reddy wrote:
> >> +     if (!nvidia_smmu->bases[0])
> >> +             nvidia_smmu->bases[0] = smmu->base;
> >> +
> >> +     return nvidia_smmu->bases[inst] + (page << smmu->pgshift); }
> 
> >Not critical -- just a nit: why not put the bases[0] in init()?
> 
> smmu->base is not available during nvidia_smmu_impl_init() call. It is set afterwards in arm-smmu.c.
> It can't be avoided without changing the devm_ioremap() and impl_init() call order in arm-smmu.c. 

I see...just checked arm_ssmu_impl_init().
