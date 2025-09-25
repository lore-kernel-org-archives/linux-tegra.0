Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391D84A1E;
	Thu, 25 Sep 2025 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758789064; cv=none; b=a+Hhi0/dXUjcgJ/wv1DX2qd+66Hi7uJw9gnXFVLC3flU0fU7o8aN28GeiyDTJBFEDk7m9w63oHi1bkrzTvfCK/5ZWWfCckvkY2uVmPOzXshRbfovqdUPmtAhFjzb0kcR7AmTCbvFE7hz/5hcSd+zUTb867GH1+LgWOSq1hBcr58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758789064; c=relaxed/simple;
	bh=+uJqoi3SYoxurYDCKXDjHIF1Tvq4+DywBDsjroC94+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZPSSeHNz9uJfghT4fypWl+k4rXIczLzPpntEnBINDj0kclq10HB27w/Pnxa7h5inJZ0gLjrGJbZLJDyJLAtz5Gs/L0SqIlr1K0XOyrvOO1Q9GEPkmcARuGmleT4SMJYIUprwWrq+JrlxaVeHbmCGIQm20KKPklh1gWhOWFM6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF5251692;
	Thu, 25 Sep 2025 01:30:52 -0700 (PDT)
Received: from [10.57.1.72] (unknown [10.57.1.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B97F53F694;
	Thu, 25 Sep 2025 01:30:57 -0700 (PDT)
Message-ID: <331bea5f-cfab-49fb-87e4-7ec31523c2c3@arm.com>
Date: Thu, 25 Sep 2025 09:30:55 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Content-Language: en-GB
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, ilkka@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, mark.rutland@arm.com, treding@nvidia.com,
 jonathanh@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com,
 sdonthineni@nvidia.com
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
 <20250923001840.1586078-2-bwicaksono@nvidia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250923001840.1586078-2-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2025 01:18, Besar Wicaksono wrote:
> Add interface to get ACPI device associated with the
> PMU. This ACPI device may contain additional properties
> not covered by the standard properties.
> 

Ok, but who needs this ? I couldn't see any users in the series.
Did I miss something ?

> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>   drivers/perf/arm_cspmu/arm_cspmu.c | 22 ++++++++++++++++++++++
>   drivers/perf/arm_cspmu/arm_cspmu.h |  9 +++++++++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index efa9b229e701..75b2d80f783e 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -1090,6 +1090,28 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>   
>   	return 0;
>   }
> +
> +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
> +{
> +	char hid[16];
> +	char uid[16];
> +	struct acpi_device *adev;
> +	const struct acpi_apmt_node *apmt_node;
> +
> +	apmt_node = arm_cspmu_apmt_node(cspmu->dev);
> +	if (!apmt_node || apmt_node->type != ACPI_APMT_NODE_TYPE_ACPI)
> +		return NULL;
> +
> +	memset(hid, 0, sizeof(hid));
> +	memset(uid, 0, sizeof(uid));
> +
> +	memcpy(hid, &apmt_node->inst_primary, sizeof(apmt_node->inst_primary));
> +	sprintf(uid, "%u", apmt_node->inst_secondary);
> +
> +	adev = acpi_dev_get_first_match_dev(hid, uid, -1);
> +	return adev;
> +}
> +EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
>   #else
>   static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>   {
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
> index 19684b76bd96..9c5f11f98acd 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> @@ -8,6 +8,7 @@
>   #ifndef __ARM_CSPMU_H__
>   #define __ARM_CSPMU_H__
>   
> +#include <linux/acpi.h>
>   #include <linux/bitfield.h>
>   #include <linux/cpumask.h>
>   #include <linux/device.h>
> @@ -222,4 +223,12 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
>   /* Unregister vendor backend. */
>   void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match);
>   
> +#if defined(CONFIG_ACPI)
> +/**
> + * Get ACPI device associated with the PMU.
> + * The caller is responsible for calling acpi_dev_put() on the returned device.
> + */
> +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu);
> +#endif
If we need this, why not add an empty stub for !CONFIG_ACPI case ? 
Similar to what we do for other cases.

Suzuki

> +
>   #endif /* __ARM_CSPMU_H__ */

