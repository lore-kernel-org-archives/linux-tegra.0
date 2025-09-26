Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD3A11713;
	Fri, 26 Sep 2025 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758880888; cv=none; b=E0+b6GcuBzIPOOKPSKMUKMMdfnyDofj5QroVcr37NqdL6JwvtJuFVGESlVhbMPIELmPcsK04B4/zKJApWZdGT5x1NYsZ4sGQclP+KpE8Fh2UifsMWGs4FYvPXaMEjGewm9yoR6IyzrFQcoeoHTCMtHLVUNuw3pMTHeO2MyMcg5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758880888; c=relaxed/simple;
	bh=QA5vuZ5yvjgvoc5CaM4hg5rjrbchE+TqeVmGnWMYFzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJG9Fvr+brJmyevhll/2X+2ovZdqKhDBUyYmOFhxeK0QgdZY/xDvKz9tD/zcDkTthRTOCNitOH/0m5SkvIL/2zOZJR3B/qMN0WHkzVlw0VM+MKNl7AgRSw+SjtsbBLpQa/b+1cIeomm+7wTBPfZLhi8WQu8d6jRxI8qNhHtFe1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B110168F;
	Fri, 26 Sep 2025 03:01:17 -0700 (PDT)
Received: from [10.57.2.143] (unknown [10.57.2.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B90893F5A1;
	Fri, 26 Sep 2025 03:01:23 -0700 (PDT)
Message-ID: <f8ce489b-e4dc-47d5-b66b-b0dbc8bc92b3@arm.com>
Date: Fri, 26 Sep 2025 11:01:22 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Content-Language: en-GB
To: Besar Wicaksono <bwicaksono@nvidia.com>, "will@kernel.org"
 <will@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
 <20250923001840.1586078-2-bwicaksono@nvidia.com>
 <331bea5f-cfab-49fb-87e4-7ec31523c2c3@arm.com>
 <SJ0PR12MB56769D95623AA45135F113A8A01FA@SJ0PR12MB5676.namprd12.prod.outlook.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <SJ0PR12MB56769D95623AA45135F113A8A01FA@SJ0PR12MB5676.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 18:13, Besar Wicaksono wrote:
> 
> 
>> -----Original Message-----
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Sent: Thursday, September 25, 2025 3:31 AM
>> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
>> robin.murphy@arm.com; ilkka@os.amperecomputing.com
>> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> tegra@vger.kernel.org; mark.rutland@arm.com; Thierry Reding
>> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Vikram Sethi
>> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker Donthineni
>> <sdonthineni@nvidia.com>
>> Subject: Re: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 23/09/2025 01:18, Besar Wicaksono wrote:
>>> Add interface to get ACPI device associated with the
>>> PMU. This ACPI device may contain additional properties
>>> not covered by the standard properties.
>>>
>>
>> Ok, but who needs this ? I couldn't see any users in the series.
>> Did I miss something ?
> 
> NVIDIA will need it to support upcoming PMU devices.
> I am still preparing the follow up patch series containing the use case
> on these new devices.

Thanks for the explanation. It would be good to post something with a 
user. You could post this patch, with the future series then.

Suzuki

