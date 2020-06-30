From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Tue, 30 Jun 2020 11:23:30 +0100
Message-ID: <b353b3f0-ee7f-f777-4d38-c595bc990564@nvidia.com>
References: <20200629022838.29628-1-vdumpa@nvidia.com>
 <20200629022838.29628-2-vdumpa@nvidia.com>
 <20200629215124.GD27967@Asurada-Nvidia>
 <BYAPR12MB2822B08564C7BD7212DCCEFEB36E0@BYAPR12MB2822.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BYAPR12MB2822B08564C7BD7212DCCEFEB36E0-ZGDeBxoHBPlXmIuPQoPGkAdYzm3356FpvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org" <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robin.murphy-5wv7dgnIgG8@public.gmane.org" <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 29/06/2020 23:49, Krishna Reddy wrote:
>>> +     if (!nvidia_smmu->bases[0])
>>> +             nvidia_smmu->bases[0] = smmu->base;
>>> +
>>> +     return nvidia_smmu->bases[inst] + (page << smmu->pgshift); }
> 
>> Not critical -- just a nit: why not put the bases[0] in init()?
> 
> smmu->base is not available during nvidia_smmu_impl_init() call. It is set afterwards in arm-smmu.c.
> It can't be avoided without changing the devm_ioremap() and impl_init() call order in arm-smmu.c.


Why don't we move the call to devm_ioremap_resource() to before
arm_smmu_impl_init() in arm_smmu_device_probe()? From a quick look I
don't see why we cannot do this and seems better than what we are
currently doing which is quite confusing and hard to understand.

Jon


-- 
nvpublic
