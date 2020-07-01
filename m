From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v8 3/3] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Wed, 1 Jul 2020 20:14:10 +0100
Message-ID: <446ffe79-3a44-5d41-459f-b698a1cc361b@arm.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-4-vdumpa@nvidia.com>
 <4b4b20af-7baa-0987-e40d-af74235153f6@nvidia.com>
 <6c2ce909-c71b-351f-79f5-b1a4b4c0e4ac@arm.com>
 <BYAPR12MB282244D2B008E1C8CA57916BB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BYAPR12MB282244D2B008E1C8CA57916BB36C0-ZGDeBxoHBPlXmIuPQoPGkAdYzm3356FpvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 2020-07-01 19:48, Krishna Reddy wrote:
>>>> +    for (inst = 0; inst < nvidia_smmu->num_inst; inst++) {
>>>> +            irq_ret = nvidia_smmu_global_fault_inst(irq, smmu, inst);
>>>> +            if (irq_ret == IRQ_HANDLED)
>>>> +                    return irq_ret;
>>>
>>> Any chance there could be more than one SMMU faulting by the time we
>>> service the interrupt?
> 
>> It certainly seems plausible if the interconnect is automatically load-balancing requests across the SMMU instances - say a driver bug caused a buffer to be unmapped too early, there could be many in-flight accesses to parts of that buffer that aren't all taking the same path and thus could now fault in parallel.
>> [ And anyone inclined to nitpick global vs. context faults, s/unmap a buffer/tear down a domain/ ;) ]
>> Either way I think it would be easier to reason about if we just handled these like a typical shared interrupt and always checked all the instances.
> 
> It would be optimal to check at the same time across all instances.
> 
>>>> +            for (idx = 0; idx < smmu->num_context_banks; idx++) {
>>>> +                    irq_ret = nvidia_smmu_context_fault_bank(irq, smmu,
>>>> +                                                             idx,
>>>> + inst);
>>>> +
>>>> +                    if (irq_ret == IRQ_HANDLED)
>>>> +                            return irq_ret;
>>>
>>> Any reason why we don't check all banks?
> 
>> As above, we certainly shouldn't bail out without checking the bank for the offending domain across all of its instances, and I guess the way this works means that we would have to iterate all the banks to achieve that.
> 
> With shared irq line, the context fault identification is not optimal already.  Reading all the context banks all the time can be additional mmio read overhead. But, it may not hurt the real use cases as these happen only when there are bugs.

Right, I did ponder the idea of a whole programmatic 
"request_context_irq" hook that would allow registering the handler for 
both interrupts with the appropriate context bank and instance data, but 
since all interrupts are currently unexpected it seems somewhat hard to 
justify the extra complexity. Obviously we can revisit this in future if 
you want to start actually doing something with faults like the qcom GPU 
folks do.

Robin.
