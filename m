From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Tue, 30 Jun 2020 11:46:39 +0100
Message-ID: <be484deb-efc9-72cd-f83f-e11713539023@arm.com>
References: <20200629022838.29628-1-vdumpa@nvidia.com>
 <20200629022838.29628-2-vdumpa@nvidia.com>
 <20200629215124.GD27967@Asurada-Nvidia>
 <BYAPR12MB2822B08564C7BD7212DCCEFEB36E0@BYAPR12MB2822.namprd12.prod.outlook.com>
 <b353b3f0-ee7f-f777-4d38-c595bc990564@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b353b3f0-ee7f-f777-4d38-c595bc990564-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org" <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 2020-06-30 11:23, Jon Hunter wrote:
> 
> On 29/06/2020 23:49, Krishna Reddy wrote:
>>>> +     if (!nvidia_smmu->bases[0])
>>>> +             nvidia_smmu->bases[0] = smmu->base;
>>>> +
>>>> +     return nvidia_smmu->bases[inst] + (page << smmu->pgshift); }
>>
>>> Not critical -- just a nit: why not put the bases[0] in init()?
>>
>> smmu->base is not available during nvidia_smmu_impl_init() call. It is set afterwards in arm-smmu.c.
>> It can't be avoided without changing the devm_ioremap() and impl_init() call order in arm-smmu.c.
> 
> 
> Why don't we move the call to devm_ioremap_resource() to before
> arm_smmu_impl_init() in arm_smmu_device_probe()? From a quick look I
> don't see why we cannot do this and seems better than what we are
> currently doing which is quite confusing and hard to understand.

Yeah, I don't see any problem with adding a patch to do that. 
impl_init() does need to happen before generic probe starts touching any 
registers, but it wouldn't have any business overriding the platform 
resources or anything that would affect the ioremap itself. Plus it's 
reasonable that some theoretical future impl_init() might want to check 
registers for, say, a particular hardware revision, so having 
smmmu->base mapped and valid at that point would be no bad thing.

Robin.
