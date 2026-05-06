Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7304630AAA9
	for <linux-tegra@vger.kernel.org>; Wed,  6 May 2026 18:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091271; cv=none; b=LfHo619OAWmrT6V1BWez1p/snTLGxJw6NUWTpSwuQLUo+ebfE3BuzS4lTCE+GOKJhYIO3NqmKYB7Ce4MZlZ+aIoPQpoqqrC5q2LqEj41CFZpT86ua9X52VrDgB2ZyCbVYn+EqLUd/pAGIU4TzbKHbZzY7xHH1hXHv9/G9MHl5SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091271; c=relaxed/simple;
	bh=uXtMx1xgsaXnK2aVQa1ZAC75dEjrrFOa6blF4HaMAKQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AXTXTjJKPMLmarT9ltbsZzpmPQBhZ5eRo1E8o7YiGnVJkd6rb65PI9UXLG0RSumjNrJl8c4DRqG4BhuaS5lvb2LjVekcpa36cc/xCrpruJHC27lnrpfyHSsC/OYTqvkVMmPM9eOUbmE8QbCWaDu7ajm8MGFCO3gDwJ6xFv3a6Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHhlCKMV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHhlCKMV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba25c9bb9fso11245ad.2
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778091268; x=1778696068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuJNK74FZbqVhPeAZpglZhE5OEb6jkb4N0hZVB1Zah4=;
        b=UHhlCKMVTq4MXs6FUzN/Q5a+sybdXyVfNe0FjYzxzuAGS2BRWSq6wIbzotpDiE3Mz8
         OhNU0MzOhuep684dqBob4P9c4w0VYiMOh3WZqcTiqOXGUG6ivgomm2Vjx2U6+3Kt6bEM
         xckp2fND3VQzkZ57VAcuZQJdO1BRPtT0LbgrIrbaSBNNOHFXFJ/u12UHC52YUGyaKMZx
         jYOGQTvmrvvA197sf3VouoEfOkRuBiNCqLmMRbHCB8Q+fbB64nEnFr6tEAP+GedrhIYo
         K0mfTyugO5zner7stzZs0UCfXNxiSyS2jGtfBIOau7UIu2bT4QHIf/2fiLyQImXzgqsc
         5mKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091268; x=1778696068;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuJNK74FZbqVhPeAZpglZhE5OEb6jkb4N0hZVB1Zah4=;
        b=s6II2kVMJ0sX5g/7b+Q5tnqR0tTe8cJjaSel16cueqW4gVpkuDeNEA06nfOAce3dbh
         ILqGxqPo7b94KkuV0t+tpSpVArtYo+QzuZFvyGaQkLhJxDwrTlsZkzxwViigv7dVmoBa
         Yj1ii4LoDDk6byudu399zZDl/3B3Lq5Weu4qK2JTWRTeh7HyxWqaKVDOb9YmcArqz+RJ
         WvMT7ZZOfsUnoaxuez8X0y9R8f+0x00FDJEYpFbfpykPM8prRbNLSm/huY0Avuk5hdZ9
         Y1Pa+zqm2tnj7ZwrARP7aB6m5398R3F0vo8kYsc1vWC/HYPFfhK5wumfonCls18iZZt5
         IJ6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/547Hn/+w4dDj5GvE6tYSB5Mb+Aeox0l8SS32siKr1ZsQ9wifPFw+hhawYwSQtP4nZYQ8MszObwLbAAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWE4kQvg97rkkbPnwRYBWaDn6ZfDuE1+7tijXtEZN79LBhNeaA
	SoqIzcJrA9oDC8s6cInEQWOPLPhblkMIceEJQQkDLsoHBx8nk/xIe8fi
X-Gm-Gg: AeBDiesjUSJjwEOu5xcyKk1269q3FM7n0xh4ZJXl+bhGXDDVgEo0aTl8oRCW/0cF5Dy
	ySVIdVV/W3RVNPxlIj55gGIuV3Ae/suxpLpSBSSld1oXWrN0I1zuAy/9ZtqpPycwHAEBtyWctfA
	NuC3NNTKZt/qMGHncyrwFpumeFA9dHKhdYkI77tQFCF+ysSJNBxZE5fP9MxahQNd18D8JT8jrIW
	Ld3yST0RWdbtcJSG4SzJPK7ZfELlf7wGiOA8PI2OKVS9b63ZenyNNycj1/FmSvxT7wyGi38WZET
	anDqJFASnIFRlcTvF1GF2tI5wo6ednQDTxHeZGMAX08NdUCcHCA2gdgPdrB7UlKto3Ad0nciAYD
	xI+JQEUuotHFBurJzt+SntwJ4UMu3vPGY5CRyUWqmJATkhKQzSBXLWic0X/aXqoADb7i3GUCk4T
	ebNcoQK0k3ryvK4pynNke7R3wZzrfgVS3IWbeQIaWT2Yqohn7TNSRyqVwjsFJd
X-Received: by 2002:a05:6a21:a44:b0:39b:8b8b:39de with SMTP id adf61e73a8af0-3aa6099f8fbmr2146121637.5.1778091267709;
        Wed, 06 May 2026 11:14:27 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.164.28])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242b7f35esm3574705a12.18.2026.05.06.11.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:14:26 -0700 (PDT)
Message-ID: <ebc36f4f-db33-44dc-893b-8693ed85305f@gmail.com>
Date: Thu, 7 May 2026 02:14:16 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: will@kernel.org, mark.rutland@arm.com, james.clark@linaro.org,
 yangyccccc@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
 rwiley@nvidia.com, sdonthineni@nvidia.com, mochs@nvidia.com,
 nirmoyd@nvidia.com, skelley@nvidia.com
Subject: Re: [PATCH v4] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
To: Besar Wicaksono <bwicaksono@nvidia.com>
References: <20260504175204.3122979-1-bwicaksono@nvidia.com>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <20260504175204.3122979-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/5/5 01:52, Besar Wicaksono wrote:
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

Reviewed-by: Yicong Yang <yangyccccc@gmail.com>

> ---
>
> Changes from v1:
>   * add CONFIG_ARM64 check to fix build error found by kernel test robot
>   * add explicit include of <asm/cputype.h>
> v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-bwicaksono@nvidia.com/
>
> Changes from v2:
>   * Move the Olympus PMCCNTR avoidance check from arm_pmuv3.c to the
>     common arm_pmu registration path.
>   * Replace the PMUv3-only has_smt flag with avoid_pmccntr, covering both
>     the existing SMT restriction and the Olympus MIDR restriction.
>   * Use the cached per-CPU MIDR from cpu_data instead of calling
>     is_midr_in_range_list() from armv8pmu_can_use_pmccntr().
>   * Add the required asm/cpu.h include for cpu_data.
> v2: https://lore.kernel.org/linux-arm-kernel/20260421203856.3539186-1-bwicaksono@nvidia.com/#t
>
> Changes from v3:
>   * Move avoidance check based on MIDR to __armv8pmu_probe_pmu() to make sure
>     the MIDR is retrieved from the correct online CPU.
> v3: https://lore.kernel.org/linux-arm-kernel/20260429215614.1793131-1-bwicaksono@nvidia.com/
>
> ---
>  drivers/perf/arm_pmu.c       |  7 ++++-
>  drivers/perf/arm_pmuv3.c     | 51 +++++++++++++++++++++++++++++++-----
>  include/linux/perf/arm_pmu.h |  2 +-
>  3 files changed, 51 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 939bcbd433aa..aa1dac0b440f 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -931,8 +931,13 @@ int armpmu_register(struct arm_pmu *pmu)
>  	/*
>  	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
>  	 * detect the SMT implementation.
> +	 * On SMT CPUs, the PMCCNTR_EL0 increments from the processor clock rather
> +	 * than the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> +	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> +	 * multi-threaded implementation. So don't use it on SMT cores.
>  	 */
> -	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
> +	pmu->avoid_pmccntr |=
> +		topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
>  
>  	if (!pmu->set_event_filter)
>  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..1ee4a09d0dcc 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -8,6 +8,7 @@
>   * This code is based heavily on the ARMv7 perf event code.
>   */
>  
> +#include <asm/cputype.h>
>  #include <asm/irq_regs.h>
>  #include <asm/perf_event.h>
>  #include <asm/virt.h>
> @@ -1002,13 +1003,7 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>  	if (has_branch_stack(event))
>  		return false;
>  
> -	/*
> -	 * The PMCCNTR_EL0 increments from the processor clock rather than
> -	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> -	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> -	 * multi-threaded implementation. So don't use it on SMT cores.
> -	 */
> -	if (cpu_pmu->has_smt)
> +	if (cpu_pmu->avoid_pmccntr)
>  		return false;
>  
>  	return true;
> @@ -1299,6 +1294,41 @@ static int armv8_vulcan_map_event(struct perf_event *event)
>  				       &armv8_vulcan_perf_cache_map);
>  }
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
>  struct armv8pmu_probe_info {
>  	struct arm_pmu *pmu;
>  	bool present;
> @@ -1348,6 +1378,13 @@ static void __armv8pmu_probe_pmu(void *info)
>  	else
>  		cpu_pmu->reg_pmmir = 0;
>  
> +	/*
> +	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
> +	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
> +	 * prevent inconsistency in the results.
> +	 */
> +	cpu_pmu->avoid_pmccntr |= armv8pmu_is_in_avoid_pmccntr_cpus();
> +
>  	brbe_probe(cpu_pmu);
>  }
>  
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index 52b37f7bdbf9..02d2c7f45b52 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -119,7 +119,7 @@ struct arm_pmu {
>  
>  	/* PMUv3 only */
>  	int		pmuver;
> -	bool		has_smt;
> +	bool		avoid_pmccntr;
>  	u64		reg_pmmir;
>  	u64		reg_brbidr;
>  #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40

