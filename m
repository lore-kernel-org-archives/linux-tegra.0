Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C5B6A8D2;
	Thu, 19 Feb 2026 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771494030; cv=none; b=hOCgVIFzPxFjaM4J14N178zgXB35pjYRT5dtc+heM3R21Lf6FabRV7hO9D5UfBmEtsqvWMi1NDJPQcp+ZOZJhbHSCODltJUPfIwFF+syK1sQKaoPJ6DvcAz9Hwuvih6nsIV8W87YHygU0X/PrGvJowiTBheKZDbynMPl1beXO1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771494030; c=relaxed/simple;
	bh=O9A62UZYVCQd00W6K9cEgotwzC6b7jDjES67GKeH5MI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bD8Krp5lRkiKTKYTgsLjWv4DSXjv21V2hZKy9m3HTSQQpn1ysK5IEqEtp9oPgvbcMLQmTTH27jpt0kYZpCuyR1VN3tVNRaKUVWLUbQsYsxV+sE55UsBdPl0aX03c/ZtVxN1BTZbn7z3++w7Km9qTwcaIi8PNRuhgrrNm06DksKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fGpJV5YvHzJ46Zg;
	Thu, 19 Feb 2026 17:40:10 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id E984340569;
	Thu, 19 Feb 2026 17:40:23 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Feb
 2026 09:40:23 +0000
Date: Thu, 19 Feb 2026 09:40:21 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
CC: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<skelley@nvidia.com>, <ywan@nvidia.com>, <mochs@nvidia.com>,
	<nirmoyd@nvidia.com>
Subject: Re: [PATCH v2 3/8] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Message-ID: <20260219094021.0000465d@huawei.com>
In-Reply-To: <20260218145809.1622856-4-bwicaksono@nvidia.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
	<20260218145809.1622856-4-bwicaksono@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)

On Wed, 18 Feb 2026 14:58:04 +0000
Besar Wicaksono <bwicaksono@nvidia.com> wrote:

> Add interface to get ACPI device associated with the
> PMU. This ACPI device may contain additional properties
> not covered by the standard properties.
> 
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
Hi Besar,

A drive by review as I was curious.

A few comments inline.
> ---
>  drivers/perf/arm_cspmu/arm_cspmu.c | 22 +++++++++++++++++++++-
>  drivers/perf/arm_cspmu/arm_cspmu.h | 17 ++++++++++++++++-
>  2 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 34430b68f602..ab2479c048bb 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -16,7 +16,7 @@
>   * The user should refer to the vendor technical documentation to get details
>   * about the supported events.
>   *
> - * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
>   *
>   */
>  
> @@ -1132,6 +1132,26 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>  
>  	return 0;
>  }
> +
> +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
> +{
> +	char hid[16];
> +	char uid[16];

Might as well do
	char hid[16] = { };
	char uid[16] = { };

and drop the memsets below.

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
> +	snprintf(uid, sizeof(uid), "%u", apmt_node->inst_secondary);
> +
> +	return acpi_dev_get_first_match_dev(hid, uid, -1);
> +}
> +EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
>  #else
>  static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>  {
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
> index cd65a58dbd88..320096673200 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> @@ -1,13 +1,14 @@
>  /* SPDX-License-Identifier: GPL-2.0
>   *
>   * ARM CoreSight Architecture PMU driver.
> - * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
>   *
>   */
>  
>  #ifndef __ARM_CSPMU_H__
>  #define __ARM_CSPMU_H__
>  
> +#include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/cpumask.h>
>  #include <linux/device.h>
> @@ -255,4 +256,18 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
>  /* Unregister vendor backend. */
>  void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match);
>  
> +#if defined(CONFIG_ACPI)
This isn't the same gate as used for whether the function is built. I think that's 
#if defined(CONFIG_ACPI) && defined(CONFIG_ARM64)

Whilst it might work to have them different today I think this is a little more
fragile than would be ideal.

The ARM64 bit seems to be there to allow COMPILE_TEST for
ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU  and to me that smells like a stub or Kconfig
dependency missing.

> +/**
> + * Get ACPI device associated with the PMU.
> + * The caller is responsible for calling acpi_dev_put() on the returned device.
> + */
> +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu);
> +#else
> +static inline struct acpi_device *
> +arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
> +{
> +	return NULL;
> +}
> +#endif
> +
>  #endif /* __ARM_CSPMU_H__ */

