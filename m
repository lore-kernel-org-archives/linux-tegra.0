Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C7C3D332B
	for <linux-tegra@vger.kernel.org>; Tue,  5 May 2026 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777969084; cv=none; b=WOeJhfsIvHrzu/N5yubg7SW0CX4Rw/ayT6MTaIZsTz/wVhzs/Dkp7FAG5hfRSly6SChVLgd5O5PN00XWUtr/pgxx7M9/Nug0xAtZs8x6KZW0HNwRXk6Hbr/OxX1x9S8vXuZBiy07CyxZCDC28ZUBVBRRgB5v7/GKjdd/tuEXB6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777969084; c=relaxed/simple;
	bh=9KjEowsSrfNuDc34XIHnCFYiwPvoIkn4Cmfg24LBogg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKhgthCJxizkP+WCB18xEksZ/H1ZS737AYAWLhjsrNS1Se/qnfHuQDsWyx17usgnreGybqk7BXreUIjtjKPqe84KI34OXBUjhTyNKx1ahshDtHirbPdKAag0apT9YwwRORvY6QwvGv2wZCPRxdh++CYTCR+BZ/9VRgeATi9kT1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qICRl1ny; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qICRl1ny"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso39693885e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 05 May 2026 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777969081; x=1778573881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6dKffTbpLbKEDPe+UffKpyUA1sFGASwva52i+iVTLA=;
        b=qICRl1nycUNFU5KaL0SpXotJG+aT9CjTQEy9TQnnsHAIDdldzMPeVJ+Q6XIU8vByHY
         JlBC/Y4ckpOq6Oq6jOmm1avbfvgDVMY5AKdzSAPtVEf/QY7mjQ/7EUslwW7A0N/oV77P
         oay9lRkHqFHLnDjyNM+vEyv7QVgcWgcH5oRK58JTspOF0TEbFwMgAw5uYFKsIJo3wel5
         9eD0NtRpfXF1NWJDqapmjB4lCzmW8PgplpOCNxIR/3vBheWwbS7vRZtVjDWmIh/iHAFB
         408LBteAASQQVzyN8mlAR+Dm/Jy5aKkRR6nBH+O4hfHBmqxIkRWyjpXLMMMxrt5EN85C
         7xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777969081; x=1778573881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6dKffTbpLbKEDPe+UffKpyUA1sFGASwva52i+iVTLA=;
        b=JMCNye3DJxwJ5ohlIgtxkFjDxpIeESt71KicPpdqGgg4WflGm2xkuG4rYRUqK2lHcy
         RP0HjvnQtxwV91INYCGkzT2R1QkPEf3pLEg99UO7Vs+233YKUOBzinkn7fDZrzrmpqA4
         EetcibglUyJIoObV7vXopnkDUorVg7HcK+817Qi1/uhhsNbe7nF8cR+tmG5a232DHua0
         kZ1gEEiP5JuOLWX7mjirlNgxbYjnCUH+9x6dZyGd0+Glc3f+gzysFxYc8GoKPQeEL6ZI
         jGyVTF8eGnJ4KI6glfESDMN0yXckeeEpOtQmY7A546+ujzeC1MhlYodIM6323VTHF8pg
         2FAA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZXvJcjmq7PtGcbKHnvVAsog0fLPiE5Hf8XhzV8qdAs3262AIHDqbEcK7s1jKbUhXe3WbBVcYifYL9pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDF4893Zlli5pfXkRE3yIm20ObM0ZJI8WL5U1z0I/GPtbX11Bo
	PnuZAZU8URNk5RSd0Gn4LLAvtdYW6e+TZQW8T8gTsDA3mbTe66NVVmj5wGWLNOtXzlw=
X-Gm-Gg: AeBDieuWns4YZFSTNzYQE0eD/tlmpG4WB6N4lSBPl0As6FbI2Ww88V9JoIEuduqF1zX
	e4aT1rwLxVmQ6BM0/6i61uQl9XK9OXkZ997+0WJcLnRW1oWD43/+86kH4r0w4bfKvfHKF8zjWK2
	KOQPg84m9eBoGWzVt0Wfy1SxrHp2w56kA5cA7NgRRFc95IxAOIbErmEppIapTpGW4uQY4Kte/oZ
	qbIra11aVXPcgLiZm+gHwPzDB1akJhnuXHpGjYmTXvqjC+h6KPxeUihgrOZ2HaEQQHI44Uz4h8r
	PtgVKcWI95sQlCqmA2dUJVVXm1K1BvWEPaj3z7NQIgSQTsfr8K8/f1cfTnbBgqXTDVYfuDXNFhj
	5FvcHoFdk+/CEa34FdrE2jG6P+wFYSTELwgVFsPwC1B6jYTNfjNQw51uDoWql60Pd6fMYgZy1Aq
	mOammlSDJDqKHcVxerEpFlhvHRCTKzqRl3MnrzQJ8=
X-Received: by 2002:a05:600c:a302:b0:48a:568f:ae8a with SMTP id 5b1f17b1804b1-48a98638a65mr150958495e9.8.1777969080461;
        Tue, 05 May 2026 01:18:00 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a48b23sm2925732f8f.14.2026.05.05.01.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:18:00 -0700 (PDT)
Message-ID: <19058847-4eaf-4d1d-8786-47f75d739b26@linaro.org>
Date: Tue, 5 May 2026 09:17:58 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
 vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com,
 mochs@nvidia.com, nirmoyd@nvidia.com, skelley@nvidia.com, will@kernel.org,
 mark.rutland@arm.com, yangyccccc@gmail.com
References: <20260504175204.3122979-1-bwicaksono@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260504175204.3122979-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/05/2026 6:52 pm, Besar Wicaksono wrote:
> PMCCNTR_EL0 may continue to increment on NVIDIA Olympus CPUs while the
> PE is in WFI/WFE. That does not necessarily match the CPU_CYCLES event
> counted by a programmable counter, so using PMCCNTR_EL0 for cycles can
> give results that differ from the programmable counter path.
> 
> Extend the existing PMCCNTR avoidance decision from the SMT case to
> also cover Olympus. Store the result in the common arm_pmu state at
> registration time, so arm_pmuv3 can keep using a single flag when
> deciding whether CPU_CYCLES may use PMCCNTR_EL0.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
> 
> Changes from v1:
>    * add CONFIG_ARM64 check to fix build error found by kernel test robot
>    * add explicit include of <asm/cputype.h>
> v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-bwicaksono@nvidia.com/
> 
> Changes from v2:
>    * Move the Olympus PMCCNTR avoidance check from arm_pmuv3.c to the
>      common arm_pmu registration path.
>    * Replace the PMUv3-only has_smt flag with avoid_pmccntr, covering both
>      the existing SMT restriction and the Olympus MIDR restriction.
>    * Use the cached per-CPU MIDR from cpu_data instead of calling
>      is_midr_in_range_list() from armv8pmu_can_use_pmccntr().
>    * Add the required asm/cpu.h include for cpu_data.
> v2: https://lore.kernel.org/linux-arm-kernel/20260421203856.3539186-1-bwicaksono@nvidia.com/#t
> 
> Changes from v3:
>    * Move avoidance check based on MIDR to __armv8pmu_probe_pmu() to make sure
>      the MIDR is retrieved from the correct online CPU.
> v3: https://lore.kernel.org/linux-arm-kernel/20260429215614.1793131-1-bwicaksono@nvidia.com/
> 
> ---
>   drivers/perf/arm_pmu.c       |  7 ++++-
>   drivers/perf/arm_pmuv3.c     | 51 +++++++++++++++++++++++++++++++-----
>   include/linux/perf/arm_pmu.h |  2 +-
>   3 files changed, 51 insertions(+), 9 deletions(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>

> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 939bcbd433aa..aa1dac0b440f 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -931,8 +931,13 @@ int armpmu_register(struct arm_pmu *pmu)
>   	/*
>   	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
>   	 * detect the SMT implementation.
> +	 * On SMT CPUs, the PMCCNTR_EL0 increments from the processor clock rather
> +	 * than the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> +	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> +	 * multi-threaded implementation. So don't use it on SMT cores.
>   	 */
> -	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
> +	pmu->avoid_pmccntr |=
> +		topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
>   
>   	if (!pmu->set_event_filter)
>   		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..1ee4a09d0dcc 100644
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
> @@ -1002,13 +1003,7 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>   	if (has_branch_stack(event))
>   		return false;
>   
> -	/*
> -	 * The PMCCNTR_EL0 increments from the processor clock rather than
> -	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> -	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> -	 * multi-threaded implementation. So don't use it on SMT cores.
> -	 */
> -	if (cpu_pmu->has_smt)
> +	if (cpu_pmu->avoid_pmccntr)
>   		return false;
>   
>   	return true;
> @@ -1299,6 +1294,41 @@ static int armv8_vulcan_map_event(struct perf_event *event)
>   				       &armv8_vulcan_perf_cache_map);
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
>   struct armv8pmu_probe_info {
>   	struct arm_pmu *pmu;
>   	bool present;
> @@ -1348,6 +1378,13 @@ static void __armv8pmu_probe_pmu(void *info)
>   	else
>   		cpu_pmu->reg_pmmir = 0;
>   
> +	/*
> +	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
> +	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
> +	 * prevent inconsistency in the results.
> +	 */
> +	cpu_pmu->avoid_pmccntr |= armv8pmu_is_in_avoid_pmccntr_cpus();
> +
>   	brbe_probe(cpu_pmu);
>   }
>   
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index 52b37f7bdbf9..02d2c7f45b52 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -119,7 +119,7 @@ struct arm_pmu {
>   
>   	/* PMUv3 only */
>   	int		pmuver;
> -	bool		has_smt;
> +	bool		avoid_pmccntr;
>   	u64		reg_pmmir;
>   	u64		reg_brbidr;
>   #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40

