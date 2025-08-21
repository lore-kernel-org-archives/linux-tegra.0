Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D430327B51C;
	Thu, 21 Aug 2025 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792280; cv=none; b=SvQbWBsE1vvRMCgxIZLJUKxMmvja3eLIAA1k9+PW1GKZ/OYlejkdhPqIgcID7VSg4VUZ9D1CDGOnFHyk0T9nVzhWtldX7QhgS5RjWCFwZ+9ujHezS4dRrmpiplLYP0bizbq+9x3UQGQfYCK2VRi9f++xXJpVS982wmm0SE6rCnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792280; c=relaxed/simple;
	bh=HALvVvb0gXqFcWEkglCftIHTCcB2sGPCCyVzcrgmOBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBFFyWjxt66SdJtNvy+91x+LwQ/7GUAlfNLYJSoSsHRCHhuqtxzyRtp428blqpLJUqP8aHeF0QpgX9ficHg7vdAWgklqajaYUyAZdesa9yoFyyLdz4lf59IP3W9Dcftj3f9LixDRUfn/pRbZFULjF1+6cJsif9cqAv9qfgdVzH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2870A152B;
	Thu, 21 Aug 2025 09:04:29 -0700 (PDT)
Received: from [10.57.1.114] (unknown [10.57.1.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84EDD3F738;
	Thu, 21 Aug 2025 09:04:35 -0700 (PDT)
Message-ID: <35ff1e0e-5810-49c4-8a1a-d58ad7a5cc31@arm.com>
Date: Thu, 21 Aug 2025 17:04:33 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] perf/arm_cspmu: Export arm_cspmu_apmt_node
To: Besar Wicaksono <bwicaksono@nvidia.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250812233411.1694012-1-bwicaksono@nvidia.com>
 <20250812233411.1694012-2-bwicaksono@nvidia.com>
 <88a25a26-109d-b5cc-4bd2-776c3c2ba113@os.amperecomputing.com>
 <SJ0PR12MB567600C6753A076E2ECD6FC6A033A@SJ0PR12MB5676.namprd12.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <SJ0PR12MB567600C6753A076E2ECD6FC6A033A@SJ0PR12MB5676.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-20 8:07 pm, Besar Wicaksono wrote:
> Hi Ilkka,
> 
> Thanks for the feedback. Please see my comment inline.
> 
>> -----Original Message-----
>> From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>> Sent: Tuesday, August 19, 2025 3:16 PM
>> To: Besar Wicaksono <bwicaksono@nvidia.com>
>> Cc: will@kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; linux-tegra@vger.kernel.org;
>> suzuki.poulose@arm.com; robin.murphy@arm.com;
>> ilkka@os.amperecomputing.com; mark.rutland@arm.com; Thierry Reding
>> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Vikram Sethi
>> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker Donthineni
>> <sdonthineni@nvidia.com>
>> Subject: Re: [PATCH 1/5] perf/arm_cspmu: Export arm_cspmu_apmt_node
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Ben,
>>
>> On Tue, 12 Aug 2025, Besar Wicaksono wrote:
>>> Make arm_cspmu_apmt_node API accessible to vendor driver.
>>
>> I think I haven't seen the latest version of the spec. So, I'm curious,
>> what kind of information the table has that the vendor drivers needs to
>> have access to it?
>>
> 
> The vendor driver may need the node instance primary and secondary
> fields to get additional properties of the PMU that is not covered
> by the standard properties. For example, the PMU device entry in
> APMT can be defined as ACPI node type. The node instance primary
> and secondary will contain the HID and UID of an ACPI device object
> that is associated with the PMU. This ACPI object can have more info
> to supplement the standard props.

Rather than exposing the raw APMT data, maybe then cspmu should just 
encapsulate a method for retrieving the associated ACPI device, if any? 
I guess it could be a generalised "firmware device" notion - even though 
for DT that should mostly be cspmu->dev already - since that could then 
work neatly for generic device properties, but perhaps we don't expect 
many sub-drivers to support both ACPI and DT...

Thanks,
Robin.

>>>
>>> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
>>> ---
>>> drivers/perf/arm_cspmu/arm_cspmu.c | 3 ++-
>>> drivers/perf/arm_cspmu/arm_cspmu.h | 4 ++++
>>> 2 files changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c
>> b/drivers/perf/arm_cspmu/arm_cspmu.c
>>> index efa9b229e701..e4b98cfa606c 100644
>>> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
>>> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
>>> @@ -70,12 +70,13 @@ static void arm_cspmu_set_ev_filter(struct
>> arm_cspmu *cspmu,
>>> static void arm_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
>>>                                    const struct perf_event *event);
>>>
>>> -static struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev)
>>> +struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev)
>>> {
>>>        struct acpi_apmt_node **ptr = dev_get_platdata(dev);
>>>
>>>        return ptr ? *ptr : NULL;
>>> }
>>> +EXPORT_SYMBOL_GPL(arm_cspmu_apmt_node);
>>
>> Rather than exporting the function, wouldn't it be better to move it to
>> arm_cspmu.h instead?
> 
> Sounds good to me. I will make the change on the next revision.
> 
> Thanks,
> Besar
> 
>>
>> Cheers, Ilkka
>>
>>>
>>> /*
>>>   * In CoreSight PMU architecture, all of the MMIO registers are 32-bit except
>>> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h
>> b/drivers/perf/arm_cspmu/arm_cspmu.h
>>> index 19684b76bd96..36c1dcce33d6 100644
>>> --- a/drivers/perf/arm_cspmu/arm_cspmu.h
>>> +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
>>> @@ -8,6 +8,7 @@
>>> #ifndef __ARM_CSPMU_H__
>>> #define __ARM_CSPMU_H__
>>>
>>> +#include <linux/acpi.h>
>>> #include <linux/bitfield.h>
>>> #include <linux/cpumask.h>
>>> #include <linux/device.h>
>>> @@ -222,4 +223,7 @@ int arm_cspmu_impl_register(const struct
>> arm_cspmu_impl_match *impl_match);
>>> /* Unregister vendor backend. */
>>> void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match
>> *impl_match);
>>>
>>> +/* Get ACPI APMT node. */
>>> +struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev);
>>> +
>>> #endif /* __ARM_CSPMU_H__ */
>>> --
>>> 2.47.0
>>>
>>>
