From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 1/4] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Tue, 23 Jun 2020 12:16:55 +0100
Message-ID: <5f29c794-406a-db13-d6d0-75dcb0d0b0cc@arm.com>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-2-vdumpa@nvidia.com> <20200623102927.GD4098287@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20200623102927.GD4098287@ulmo>
Content-Language: en-GB
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 2020-06-23 11:29, Thierry Reding wrote:
[...]
>> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
>> index c75b9d957b702..52c84c30f83e4 100644
>> --- a/drivers/iommu/arm-smmu-impl.c
>> +++ b/drivers/iommu/arm-smmu-impl.c
>> @@ -160,6 +160,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>>   	 */
>>   	switch (smmu->model) {
>>   	case ARM_MMU500:
>> +		if (of_device_is_compatible(smmu->dev->of_node,
>> +					    "nvidia,tegra194-smmu-500"))
>> +			return nvidia_smmu_impl_init(smmu);
> 
> Should NVIDIA_TEGRA194_SMMU be a separate value for smmu->model,
> perhaps? That way we avoid this somewhat odd check here.

No, this is simply in the wrong place. The design here is that we pick 
up anything related to the basic SMMU IP (model) first, then make any 
platform-specific integration checks. That way a platform-specific init 
function can see the model impl set and subclass it if necessary 
(although nobody's actually done that yet). The setup for Cavium is just 
a short-cut since their model is unique to their integration, so the 
lines get a bit blurred and there's little benefit to trying to separate 
it out.

In short, put this down below with the other of_device_is_compatible() 
checks.

>>   		smmu->impl = &arm_mmu500_impl;
>>   		break;
>>   	case CAVIUM_SMMUV2:
>> diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidia.c
> 
> I wonder if it would be better to name this arm-smmu-tegra.c to make it
> clearer that this is for a Tegra chip. We do have regular expressions in
> MAINTAINERS that catch anything with "tegra" in it to make this easier.

There was a notion that these would be grouped by vendor, but if there's 
a strong preference for all NVIDIA-SoC-related stuff to be named "Tegra" 
then I'm not going to complain too much.

>> new file mode 100644
>> index 0000000000000..dafc293a45217
>> --- /dev/null
>> +++ b/drivers/iommu/arm-smmu-nvidia.c
>> @@ -0,0 +1,161 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Nvidia ARM SMMU v2 implementation quirks
> 
> s/Nvidia/NVIDIA/
> 
>> +// Copyright (C) 2019 NVIDIA CORPORATION.  All rights reserved.
> 
> I suppose this should now also include 2020.
> 
>> +
>> +#define pr_fmt(fmt) "nvidia-smmu: " fmt
> 
> Same here. Might be worth making this "tegra-smmu: " for consistency.

On the other hand, a log prefix that is literally the name of a 
completely unrelated driver seems more confusing to users than useful. 
Same for the function naming - the tegra_smmu_* namespace is already 
owned by that driver.

Robin.
