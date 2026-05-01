Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E34D1F5437
	for <linux-tegra@vger.kernel.org>; Fri,  1 May 2026 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777644108; cv=none; b=DRksEhTt40WHxN3CMuDbLdsOY7G0GRjCqeVgLKBPcJ79Z1kvzAyrwLs4LoAGu8ir2VtxyWxViKyAjKnwF9nb0PRofpOQqdNmhFio3YaaC4HJ8e+A3Y/TRJa9MGphZL0tQiRT0laeZol0vDj8VCYD31A9Mof8OEtEp6iGEKcc3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777644108; c=relaxed/simple;
	bh=PRNsPyl09oUyyWjLi2xKEknc/I1AzkFHfQwdV4WU5rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3irrBbEtRd12XNVuFz+o43lH2ouXtlxSDI8gf3POpu4uPsHZ4uztOCRalLpSmwlXLXo1/2RuSjr72vPnV92G6qtShWac6Zuhruj+i/L9RubPYHzVYF36yo9sfFETOE9XaLr5mZd8EhFjacMDLZ9uGkml41vG8SSb2j5gZyuqog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHvDN6LE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHvDN6LE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43eb012ac4fso1105119f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 01 May 2026 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777644105; x=1778248905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HG7O0lHSRscMsCiZTAkBaQVsH7ojMjtgb6J5wme+v7Y=;
        b=kHvDN6LEd+xPjBAQyeGGBXbov0IdsESEueOqTU5az684g2r7iuvQAswZWGH0iSMIqe
         j1bTIRu4vGVsyNEUsHuWhuqY9h0aF1uPbO/zXBxVZuPVC+56yr7hIKQrvdoRoMrzFmpq
         wmUPWWkpRBteMSqJSUVKSdBrSlKREnf7SZu67deZX30udn0MBNcgeTw+WUMyH+EkIM6C
         zdCfI1uWZhZLNczUDmY1kxxqLr+ls/3DIijMuxxHzWv1BS9oztdtZ1wmTNhTvJvTX2/L
         WyXa7WSj/slG2+PLyJ/QwzDF35ElqSijEcKTeLmSbrxXrxPfVJuhYoZLIIDQYhlNwRC4
         Y50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644105; x=1778248905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HG7O0lHSRscMsCiZTAkBaQVsH7ojMjtgb6J5wme+v7Y=;
        b=pi776PqpCiu8W1qc03RE2P6I8+fJg83eztFxmgC7LLjGguIebuJIa6vWbvJ8leOfOx
         r6SQvIoSAJDlNl9Gn32/1Oq8uOBraUlICtumO/kuQoJGFR27znLk2WvwfwzrkzSrYNJj
         8Mb4hnBZG4HXT912mm/vEH+yE0wnTl23gpFPSnHHyUNMmaGjCITqhqUCNN/2SxDjHwLv
         XhruXsLX3EU0c3KEsvge81oeXk3OK09DOOhl0yLyCDf11fDFZiR52kPQyW5hvxoWpdw2
         rhhfol78Sl6d9wZuXLBiORu5qML751p2oCfq4rqsMBm79gt44f8KUE3hESg165q0l87G
         gFdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IMLDSp/lCVWkRQIgCYLv3RMKR/XyeUJX0a3ZEKFqqL4tN0goPVs0LRAkSmDpn4oP8sghGSYSWtezLEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdJSHSexJMH8Bi6zNUB0sG0i822PvzgLMs+cLJOcmIzZx2W648
	ggGbhksjmMHHdLaDHFNfdxnfPjmCr5HGW4wYr2Y0jfPvVh3Aun0RgpynClwl9dRzYDc=
X-Gm-Gg: AeBDiespZvU6ZpRYSLi4i9ZkiMEFW1b3/GdjHGiyMTbaIeUEuvBVZlNhAIWR1ABW0tK
	rx9qmjc+hBh1Jr2Mvl10AxtORET9pfO7fj++zbeISWExYPIub5UKA05GueIg8s0GYFay3RnK3vk
	dMhR1O29XsFMk3graswb0yKGfa1WbqcsKv/gy7U3rPyAsbn4V5AOcLPzz1j62U0qTgLqeLo5NoE
	gppm7c8hrzHvyDsZ15ykBvJIY3CHO1FxW1xNeNiJPgZFEdtUIXDvVIQpZt22yO4X8cJNrOar+7b
	GbkP/xCkaAdoEqLLX5+y+YDWExqy2/kF/sV07mgwPsu3+2JUinWS24sfakkmKDeXWXjc7gf8IQL
	qfnxY2ZfF/tK67sAs+Jg6D4aZwTsISmT+ORn0/1QDA+Rbi8rGvjgaN6Wr5RjZx5i/fdO8+LIA/4
	uDsBa1r3Mi5tHONQ6HLk2AUVKJmA1siTeR7Y1yPAIjQlS+KmMK+A==
X-Received: by 2002:a5d:5c89:0:b0:43c:f583:126a with SMTP id ffacd0b85a97d-4493d412141mr12783250f8f.14.1777644104559;
        Fri, 01 May 2026 07:01:44 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ef50e59sm5185538f8f.10.2026.05.01.07.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 07:01:43 -0700 (PDT)
Message-ID: <0fc8ae87-a941-4dfe-9c14-c851c6a29514@linaro.org>
Date: Fri, 1 May 2026 15:01:42 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
 vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com,
 mochs@nvidia.com, nirmoyd@nvidia.com, skelley@nvidia.com, will@kernel.org,
 mark.rutland@arm.com, yangyccccc@gmail.com
References: <20260429215614.1793131-1-bwicaksono@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260429215614.1793131-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/04/2026 10:56 pm, Besar Wicaksono wrote:
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
> Use the cached MIDR from cpu_data to identify Olympus parts and avoid
> reading MIDR_EL1 in the event path.
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
>    * Drop the use_pmccntr override patch from this revision.
> v2: https://lore.kernel.org/linux-arm-kernel/20260421203856.3539186-1-bwicaksono@nvidia.com/#t
> 
> ---
>   drivers/perf/arm_pmu.c       | 78 +++++++++++++++++++++++++++++++++---
>   drivers/perf/arm_pmuv3.c     |  8 +---
>   include/linux/perf/arm_pmu.h |  2 +-
>   3 files changed, 75 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 939bcbd433aa..7df185ee7b74 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -24,6 +24,8 @@
>   #include <linux/irq.h>
>   #include <linux/irqdesc.h>
>   
> +#include <asm/cpu.h>
> +#include <asm/cputype.h>
>   #include <asm/irq_regs.h>
>   
>   static int armpmu_count_irq_users(const struct cpumask *affinity,
> @@ -920,6 +922,76 @@ void armpmu_free(struct arm_pmu *pmu)
>   	kfree(pmu);
>   }
>   
> +#ifdef CONFIG_ARM64
> +/*
> + * List of CPUs that should avoid using PMCCNTR_EL0.
> + */
> +static struct midr_range armpmu_avoid_pmccntr_cpus[] = {
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
> +static bool armpmu_is_in_avoid_pmccntr_cpus(int cpu)
> +{
> +	struct midr_range const *r = armpmu_avoid_pmccntr_cpus;
> +	u32 midr = (u32)per_cpu(cpu_data, cpu).reg_midr;

Hi Besar,

This is still fragile to the thing I mentioned on V2 about some of the 
CPUs not being online, then cpu_data isn't initialized for those CPUs.

Sashiko suggests to use cpumask_any_and(&pmu->supported_cpus, 
cpu_online_mask), and currently the Arm PMUs do require at least one CPU 
online so it's probably fine. Although it could be fragile if we added 
deferred probing in the future.

The other alternative is to put this in __armv8pmu_probe_pmu(), although 
then you end up with both arm_pmuv3 and arm_pmu initializing 
cpu_pmu->has_smt, but I'm sure there is a way to make it fit somehow.

James

> +
> +	while (r->model) {
> +		if (midr_is_cpu_model_range(midr, r->model, r->rv_min, r->rv_max))
> +			return true;
> +		r++;
> +	}
> +
> +	return false;
> +}
> +#else
> +static bool armpmu_is_in_avoid_pmccntr_cpus(int cpu)
> +{
> +	return false;
> +}
> +#endif
> +
> +static bool armpmu_avoid_pmccntr(struct arm_pmu *pmu)
> +{
> +	int cpu = cpumask_first(&pmu->supported_cpus);
> +
> +	/*
> +	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
> +	 * detect the SMT implementation.
> +	 * On SMT CPUs, the PMCCNTR_EL0 increments from the processor clock rather
> +	 * than the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> +	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> +	 * multi-threaded implementation. So don't use it on SMT cores.
> +	 */
> +	if (topology_core_has_smt(cpu))
> +		return true;
> +
> +	/*
> +	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
> +	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
> +	 * prevent inconsistency in the results.
> +	 */
> +	if (armpmu_is_in_avoid_pmccntr_cpus(cpu))
> +		return true;
> +
> +	return false;
> +}
> +
>   int armpmu_register(struct arm_pmu *pmu)
>   {
>   	int ret;
> @@ -928,11 +1000,7 @@ int armpmu_register(struct arm_pmu *pmu)
>   	if (ret)
>   		return ret;
>   
> -	/*
> -	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
> -	 * detect the SMT implementation.
> -	 */
> -	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
> +	pmu->avoid_pmccntr = armpmu_avoid_pmccntr(pmu);
>   
>   	if (!pmu->set_event_filter)
>   		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..60f159a51992 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -1002,13 +1002,7 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
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

