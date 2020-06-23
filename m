From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 3/4] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Tue, 23 Jun 2020 12:30:16 +0100
Message-ID: <2dda4530-39cc-d549-1124-26337dd9afbe@arm.com>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-4-vdumpa@nvidia.com> <20200623083643.GB4098287@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200623083643.GB4098287@ulmo>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 2020-06-23 09:36, Thierry Reding wrote:
[...]
>> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>> index 243bc4cb2705b..d720e1e191176 100644
>> --- a/drivers/iommu/arm-smmu.c
>> +++ b/drivers/iommu/arm-smmu.c
>> @@ -673,6 +673,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>>   	enum io_pgtable_fmt fmt;
>>   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>> +	irqreturn_t (*context_fault)(int irq, void *dev);
>>   
>>   	mutex_lock(&smmu_domain->init_mutex);
>>   	if (smmu_domain->smmu)
>> @@ -835,7 +836,9 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>>   	 * handler seeing a half-initialised domain state.
>>   	 */
>>   	irq = smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
>> -	ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
>> +	context_fault = (smmu->impl && smmu->impl->context_fault) ?
>> +			 smmu->impl->context_fault : arm_smmu_context_fault;
> 
> A simpler way might have been to assign arm_smmu_context_fault to all
> implementations. That way we wouldn't have to perform this check here
> and instead just always using smmu->impl->context_fault.

But smmu->impl can still be NULL...

Everything in impl, including the presence of impl itself, is optional, 
so the notion of overriding a default with the same default doesn't 
really make much sense, and would go against the pattern everywhere else.

Robin.

>> +	ret = devm_request_irq(smmu->dev, irq, context_fault,
>>   			       IRQF_SHARED, "arm-smmu-context-fault", domain);
>>   	if (ret < 0) {
>>   		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
>> @@ -2107,6 +2110,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	struct arm_smmu_device *smmu;
>>   	struct device *dev = &pdev->dev;
>>   	int num_irqs, i, err;
>> +	irqreturn_t (*global_fault)(int irq, void *dev);
>>   
>>   	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>>   	if (!smmu) {
>> @@ -2193,9 +2197,12 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   		smmu->num_context_irqs = smmu->num_context_banks;
>>   	}
>>   
>> +	global_fault = (smmu->impl && smmu->impl->global_fault) ?
>> +			smmu->impl->global_fault : arm_smmu_global_fault;
>> +
> 
> Same as above.
> 
> Thierry
> 
