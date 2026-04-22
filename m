Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466137F8A1
	for <linux-tegra@vger.kernel.org>; Wed, 22 Apr 2026 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853963; cv=none; b=poIAL13Me6XtBJ/tOwqUIt4pDYYbW5+1eCgC9sf4tZZihDyXKW2U98ymS7UwmDkSoGNLsVBmXbK4R4mB7PRQt0+XpdjAIfIEA0YNgvJtp7VQcXgDfzIOF4GwhEd3pTr5Vmvx+AdleDOi/IK0LzHI2UHCVdNd0PlEt0ZzcE2tVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853963; c=relaxed/simple;
	bh=t6q5Qy7h7H/U5E8yMH1XxtOUcF14nGntGTCUibgUkjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b78IRCGSdPaxmiu4a6DVo/+eS6gcGVaJE3fdHBnQx8HvmvmHgQFrgJPZR5J337AqOB9sLJ994VHWRKqjHGX3yftJcFeeMYeTUNUkho9Lsn8AQ+r/eXHmPaGp451YvaW84wcJ5tZBk1wyY5WHQSrj/gYuspoprdrzlhGEMAO++mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0PStOUV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0PStOUV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so43376885e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 22 Apr 2026 03:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776853960; x=1777458760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rgqXLVy6xqukPgPXJSs1dZ6Rd18H2YCjcgP2MCGRmo=;
        b=o0PStOUVyhBL87vhl3+lwUgXux/ET18Ehzzi2iU/JBvD4YGWHOUinhZi/sKE9TSoGd
         2Dl38kdkZzJIk9OowwgkeaApsg+qvhlmRwjRaoz3Br585wf8a5WZvD97WAAcP1GTNkhj
         8TrG8zfBrQimFRQtjnIJJwX2gghsBVCF0SiGvURmyryadUYQ8DTH6dn1RdnUs0+R1WoG
         ulV0qZ5QzuNWKfMbn6cELm7dEfWC9yU2mGVKDOd7Gj/t7i1c1eIjYN+07RKhChFZMVoN
         CvIBwteSOiiGSjyEk98Upw2+XR9gX/rzCyMMRMfi274X1H6ja6WJdz25JUlZp8Poxkgo
         XfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853960; x=1777458760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rgqXLVy6xqukPgPXJSs1dZ6Rd18H2YCjcgP2MCGRmo=;
        b=sol8bIEeuqBSNISY4S1qdf2JhTnVskLOOPq0ZTaUwjJ5/rooDetVYp0ideEQnIyyx6
         8qfbDjgyeTAz5J5rAtZHrqD9JpsMVC0Tez0UfxibTm+A0TQA7wyECQAk+BXSDXCZs865
         V+YwFc8IqrO91bv1OaXqrSqcyURTp/aH3hAc0vCiIqhGBjBlHCsek87pPassZJZyX9A1
         AFz2M/0Bkg23lh/7ThsjlykcZtSXKscE1wLDv8dhQn3Z/HELGASX+O2USnQnYShRTd9V
         vdoVc9d0HFTTIc3rVimWm+SmpEqsXrYDRKLtPXmun7IQCfZ53752krF1a/yS0afRihas
         WUlA==
X-Forwarded-Encrypted: i=1; AFNElJ/8KXecXObLJNo89WfyjXF/OOrWr85eFaXEUjwvG1lM7syVgJT3/JTaaPPM92vJmYNdKPEwDSi9r3HDyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3GqIgrAXQz9WwiEFSGyKvGHZNeQqT4KSvArgmld2MlUhL8r/q
	WDIvN4BvdVDpgjo/cXc94BQKg3gcl/GH4Wl74tiktbctQiAZmQ8C162EWPQau0/MgsI=
X-Gm-Gg: AeBDiesG1gDlgvVLyDLrm2reEC7L/Ehhqw0Xi8esSwzeGV6GEFMWQam0ltiEUTl4t7V
	dGL7iXQNiq0lQD71j1KvnjLfHQDlG444xNK/uA/xFhfxjH2Ifwkp8cGvgrp09CdDZYw1cGRZbIY
	MLPQ/9Dw0BnCnoDDVq+I3P8jk9Twz1bKkSe17TpU7V5XYrfotnTq4QJhTNYVD+Kkywctjd2GatC
	hWXVxZja2U22arTCZo/A9b+JTXDv2vR0H4ph9BTGoU66cf25Y7MmVYnx+ioQyL5/pHEFkc/b4a/
	YOpmfc/MTllMGUTbjW92ZZCfEeO67T0N4kWh6nv9CfghLY0O0IubyL9bPP2yHD+o8FHKkDayT2b
	kdX7KiBGT1OBfHsipuiyDlb0jzJTS8PDb2cU2KZaLvoJzzc+dMuVQWPafbO6l/CVBvuFo2s7x5z
	jFsclkEul33R4tRN+Nz/WC9kjlxTj/CxAf58RMTYE+EFg=
X-Received: by 2002:a05:600c:4895:b0:488:ffad:6728 with SMTP id 5b1f17b1804b1-488ffad67f4mr155484265e9.19.1776853960414;
        Wed, 22 Apr 2026 03:32:40 -0700 (PDT)
Received: from [192.168.178.64] ([84.246.200.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm463372455e9.2.2026.04.22.03.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:32:39 -0700 (PDT)
Message-ID: <b1458bc3-0449-4f0f-b346-d25547dd4c97@linaro.org>
Date: Wed, 22 Apr 2026 11:32:39 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
 mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
 vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com,
 mochs@nvidia.com, nirmoyd@nvidia.com, skelley@nvidia.com
References: <20260421203856.3539186-1-bwicaksono@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260421203856.3539186-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/04/2026 21:38, Besar Wicaksono wrote:
> The PMCCNTR_EL0 in NVIDIA Olympus CPU may increment while
> in WFI/WFE, which does not align with counting CPU_CYCLES
> on a programmable counter. Add a MIDR range entry and
> refuse PMCCNTR_EL0 for cycle events on affected parts so
> perf does not mix the two behaviors.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
> 
> Changes from v1:
>    * add CONFIG_ARM64 check to fix build error found by kernel test robot
>    * add explicit include of <asm/cputype.h>
> v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-bwicaksono@nvidia.com/
> 
> ---
>   drivers/perf/arm_pmuv3.c | 44 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..7c39d0804b9f 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -8,6 +8,7 @@
>    * This code is based heavily on the ARMv7 perf event code.
>    */
>   
> +#include <asm/cputype.h>
>   #include <asm/irq_regs.h>
>   #include <asm/perf_event.h>
>   #include <asm/virt.h>
> @@ -978,6 +979,41 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
>   	return -EAGAIN;
>   }
>   
> +#ifdef CONFIG_ARM64
> +/*
> + * List of CPUs that should avoid using PMCCNTR_EL0.
> + */
> +static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
> +	/*
> +	 * The PMCCNTR_EL0 in Olympus CPU may still increment while in WFI/WFE state.
> +	 * This is an implementation specific behavior and not an erratum.
> +	 *
> +	 * From ARM DDI0487 D14.4:
> +	 *   It is IMPLEMENTATION SPECIFIC whether CPU_CYCLES and PMCCNTR count
> +	 *   when the PE is in WFI or WFE state, even if the clocks are not stopped.
> +	 *
> +	 * From ARM DDI0487 D24.5.2:
> +	 *   All counters are subject to any changes in clock frequency, including
> +	 *   clock stopping caused by the WFI and WFE instructions.
> +	 *   This means that it is CONSTRAINED UNPREDICTABLE whether or not
> +	 *   PMCCNTR_EL0 continues to increment when clocks are stopped by WFI and
> +	 *   WFE instructions.
> +	 */
> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
> +	{}
> +};
> +
> +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
> +{
> +	return is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus);
> +}
> +#else
> +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
> +{
> +	return false;
> +}
> +#endif
> +
>   static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>   				     struct perf_event *event)
>   {
> @@ -1011,6 +1047,14 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>   	if (cpu_pmu->has_smt)
>   		return false;
>   
> +	/*
> +	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
> +	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
> +	 * prevent inconsistency in the results.
> +	 */
> +	if (armv8pmu_is_in_avoid_pmccntr_cpus())
> +		return false;
> +

Hi Besar,

This is called from armpmu_event_init() before the event is scheduled on 
the CPU so I don't think reading the MIDR at this point is safe.

When the PMU is probed you probably need to do an SMP call to get the 
MIDR of CPUs in that PMU's mask and then cache the "avoid pmccntr" 
result like has_smt. Or even rename has_smt to avoid_pmccntr and combine 
the two results there.

I don't know what will happen if none of those CPUs are online when the 
PMU is probed though...

James



>   	return true;
>   }
>   

