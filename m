From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Tue, 30 Jun 2020 20:03:04 +0100
Message-ID: <64ffa84f-a8cf-ae81-6306-b5d8b1ff0618@nvidia.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
 <e6da9661-4e62-6e34-ac21-63ff993ca8bc@nvidia.com>
 <BYAPR12MB282210677459B8D62623C642B36F0@BYAPR12MB2822.namprd12.prod.outlook.com>
 <4037efc7-fbed-e8cf-dac7-212c65014e4e@nvidia.com>
 <eb0ffc7e-f41b-d17c-6a90-049335098cd2@nvidia.com>
 <BYAPR12MB2822B43B0218F6E55C97451BB36F0@BYAPR12MB2822.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BYAPR12MB2822B43B0218F6E55C97451BB36F0-ZGDeBxoHBPlXmIuPQoPGkAdYzm3356FpvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org" <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robin.murphy-5wv7dgnIgG8@public.gmane.org" <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <nicoleotsuka@gmail>
List-Id: linux-tegra@vger.kernel.org


On 30/06/2020 18:16, Krishna Reddy wrote:
>> OK, well I see what you are saying, but if we intended to support all 3 for Tegra194, then we should ensure all 3 are initialised correctly.
> 
> The driver intend to support up to 3 instances. It doesn't really mandate that all three instances be present in same DT node.
> Each mmio aperture in "reg" property is an instance here. reg = <inst0_base, size>, <inst1_base, size>, <inst2_base, size>;
> The reg can have all three or less and driver just configures based on reg and it works fine.

So it sounds like we need at least 2 SMMUs (for non-iso and iso) but we
have up to 3 (for Tegra194). So the question is do we have a use-case
where we only use 2 and not 3? If not, then it still seems that we
should require that all 3 are present.

The other problem I see here is that currently the arm-smmu binding
defines the 'reg' with a 'maxItems' of 1, whereas we have 3. I believe
that this will get caught by the 'dt_binding_check' when we try to
populate the binding.

>> It would be better to query the number of SMMUs populated in device-tree and then ensure that all are initialised correctly.
> 
> Getting the IORESOURCE_MEM is the way to count the instances driver need to support.  
> In a way, It is already querying through IORESOURCE_MEM here. 

Yes I was wondering that. I think we just need to decide if the 3rd SMMU
is optional or not. The DT binding should detail and min and max supported.	

Jon

-- 
nvpublic
