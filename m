From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Wed, 1 Jul 2020 19:56:17 +0100
Message-ID: <9ae6b6e6-bd64-9c89-49ca-1f5785ef3f0c@arm.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
 <53bfa5c8-c32d-6fa3-df60-a18ab33ca1c2@nvidia.com>
 <d59b7220-168c-419f-db16-194307e11065@arm.com>
 <BYAPR12MB2822FC263456303302EF30BEB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BYAPR12MB2822FC263456303302EF30BEB36C0-ZGDeBxoHBPlXmIuPQoPGkAdYzm3356FpvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 2020-07-01 19:18, Krishna Reddy wrote:
>>> + * When Linux kernel supports multiple SMMU devices, the SMMU
>>> device +used for + * isochornous HW devices should be added as a
>>> separate ARM MMU-500 +device + * in DT and be programmed
>>> independently for efficient TLB invalidates.
> 
>> I don't understand the "When" there - the driver has always
>> supported multiple independent SMMUs, and it's not something that
>> could be configured out or otherwise disabled. Plus I really don't
>> see why you would ever want to force unrelated SMMUs to be
>> >programmed together - beyond the TLB thing mentioned it would also
>> waste precious context bank resources and might lead to weird
>> device grouping via false stream ID aliasing, with no obvious
>> upside at all.
> 
> Sorry, I missed this comment. During the initial patches, when the
> iommu_ops were different between, support multiple SMMU drivers at
> the same is not possible as one of them(that gets probed last)
> overwrites the platform bus ops. On revisiting the original issue,
> This problem is no longer relevant. At this point, It makes more
> sense to just get rid of 3rd instance programming in
> arm-smmu-nvidia.c and just limit it to the SMMU instances that need
> identical programming.

Yeah, I realised later last night that this probably originated from 
forking the whole driver downstream. But even then you could have 
treated the other one as a separate nsmmu with a single instance ;)

Since it does add a bit of confusion to the code and comments, let's 
just keep things simple. I do like Jon's suggestion of actually 
enforcing that the number of "reg" regions exactly matches the number 
expected for the given compatible - I guess for now that means just 
hard-coding 2 and hoping the hardware folks don't cook up any more of 
these...

Robin.
