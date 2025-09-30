Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5709C25393C;
	Tue, 30 Sep 2025 13:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759237517; cv=none; b=Sl7+JR0xDK14Pb8Y5lqQZjPORwuvaAckUM3Yuia5OWASQDpou1z87PoTahocOiXo6xxs8PPysGtm56jGqaQwt+3ZcOYGbMYQwBylN/Cnc5EbYYkcEhPcO0YOlylkFnzyQfMW3PLxDscFh8XDyYnTNJjBQw7Ehw3vNce9O+Sb4ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759237517; c=relaxed/simple;
	bh=uiXMWWIogtIZQU1uo/JNqh9tSNbahBQok3aYJdHcjY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArbMs8BJuN3uSxU7OVO96eScLtskUzxQyPvHHpCOJyZulfnuBAE4PkZVOMK4SJ6b5RrtBnGNHFwhZh8TKYIWi4IyApka6S94uWPQQtII6usoD5C4gvfW6n9BMHYSnOyZ6lJqUKXAqWlC8F8zbKpHhTWyRNZzG54mPEsKzwi/vRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68F57339;
	Tue, 30 Sep 2025 06:05:06 -0700 (PDT)
Received: from [10.1.28.41] (Suzukis-MBP.cambridge.arm.com [10.1.28.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68B9D3F59E;
	Tue, 30 Sep 2025 06:05:12 -0700 (PDT)
Message-ID: <94832766-e408-4485-8397-e48bc23f615c@arm.com>
Date: Tue, 30 Sep 2025 14:05:10 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
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
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
 <20250930002604.346306-2-bwicaksono@nvidia.com>
 <e21159ef-d438-4944-adb3-eb8e7c801d9e@arm.com>
 <SJ0PR12MB5676DD9C94CB7155D3897DEBA01AA@SJ0PR12MB5676.namprd12.prod.outlook.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <SJ0PR12MB5676DD9C94CB7155D3897DEBA01AA@SJ0PR12MB5676.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/09/2025 14:00, Besar Wicaksono wrote:
> 
> 
>> -----Original Message-----
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Sent: Tuesday, September 30, 2025 3:38 AM
>> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
>> robin.murphy@arm.com; ilkka@os.amperecomputing.com
>> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> tegra@vger.kernel.org; mark.rutland@arm.com; Thierry Reding
>> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Vikram Sethi
>> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker Donthineni
>> <sdonthineni@nvidia.com>
>> Subject: Re: [PATCH v3 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 30/09/2025 01:26, Besar Wicaksono wrote:
>> > Add interface to get ACPI device associated with the
>> > PMU. This ACPI device may contain additional properties
>> > not covered by the standard properties.
>> >
>> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
>>
>> Repeat: Where is the user ?
> 
> I thought you were okay if the use case is on future (different) series.
> 
> So, this is a heads up on what I will have in nvidia_cspmu when adding the
> new PMU support. Do you prefer it to be part of this series?

No, I recommended the opposite. Apologies, if that wasn't clear.
Add a helper only when there is a user.

Suzuki


> 
> +static u32 nv_cspmu_get_inst_id(const struct arm_cspmu *cspmu)
> 
> +{
> 
> +     u32 inst_id;
> 
> +     struct fwnode_handle *fwnode;
> 
> +     struct acpi_device *adev;
> 
> +
> 
> +     inst_id = 0;
> 
> +
> 
> +     adev = arm_cspmu_acpi_dev_get(cspmu);
> 
> +     if (!adev)
> 
> +           return 0;
> 
> +
> 
> +     fwnode = acpi_fwnode_handle(adev);
> 
> +     if (fwnode && fwnode_property_read_u32(fwnode, "instance_id", 
> &inst_id))
> 
> +           kstrtou32(acpi_device_uid(adev), 0, &inst_id);
> 
> +
> 
> +     acpi_dev_put(adev);
> 
> +     return inst_id;
> 
> +}
> 
> Thanks,
> Besar
> 
> 

