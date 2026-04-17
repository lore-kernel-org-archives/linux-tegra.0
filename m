Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842FB36CDEF;
	Fri, 17 Apr 2026 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776451308; cv=none; b=l4FNscTte6Ub9pmXnc66u3sFeLDgXoDE4nzMWAiYA8saT0HTaSp2ggWv9ljol8StxIGpOD5EckMrPeylaNckfaR4/2c9XPFPUJlwZkApwJX2M3UKkAPqYQ8z8ml4h24vMXYXFx+VTevO7kXdgyu69wN2qqP+RWf1X0uQ1FnEEbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776451308; c=relaxed/simple;
	bh=VU2MeVgHxa77WWtE+fhdD44wxcggQrgbHV03gm8eTvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsYGwL/qFA/46sG+pIymB5S/LtDyEQdoY1oUQQfyrqf5tVXfUNDTyRWkJ7iPfIFRg9UouSKtoj5t7l+ntExcsjHaciXLpI8be1gj/NRZc8aVzp5VVp2y4f/bpgn7T9lt/MmT3Rn4eBV+AA5EZnKRaDETIguXs/lEvQT6SPbMjrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTgh01cI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTgh01cI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776451307; x=1807987307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VU2MeVgHxa77WWtE+fhdD44wxcggQrgbHV03gm8eTvg=;
  b=kTgh01cI3YHBHFqr/Zisnq9xWBwUkHo+SYBsp3J+KUidVbGZ+WSLjvHD
   lHM7vLnkvyrbfU+C3yRhQZ7ef6yHDPAuWHKJkY/Eu2UsGa+zhMeXdQbSQ
   q2ImBruLKen/vQKV29Qp7TlVhstRloqjVB3DfWreeHTbcGYFNURfpZ8wL
   /L7oVHDu1jR8LUS4qz+3TUL18z9elf8mI4kGYAQwOTpPxUPYF56tGoeGO
   nhVp+oIS/dISXSSl7o9AuWow9wkR5P9yEyVKYk3x6DdED53oDsEUBGr6m
   1WOoNBKlq/v8mEOBHdeZb86uGaKPYHUgaxdq1wh5MPZ+EM5c5JmXaZOCz
   Q==;
X-CSE-ConnectionGUID: cWCoBJEKQmCTGCddewG5yg==
X-CSE-MsgGUID: +pPGSxpVQSOQOZpzVYz/yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77174196"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77174196"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 11:41:46 -0700
X-CSE-ConnectionGUID: KAoFnF3MSqy9Fe5y772rIA==
X-CSE-MsgGUID: T7n+CjmTRyeYq1EtEBaUrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230248543"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2026 11:41:07 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDo7k-000000000cq-31uK;
	Fri, 17 Apr 2026 18:41:04 +0000
Date: Sat, 18 Apr 2026 02:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
	mark.rutland@arm.com, james.clark@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
	rwiley@nvidia.com, sdonthineni@nvidia.com, mochs@nvidia.com,
	nirmoyd@nvidia.com, skelley@nvidia.com,
	Besar Wicaksono <bwicaksono@nvidia.com>
Subject: Re: [PATCH] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Message-ID: <202604180247.SBxRBqqS-lkp@intel.com>
References: <20260406232034.2566133-1-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406232034.2566133-1-bwicaksono@nvidia.com>

Hi Besar,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v7.0 next-20260416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Besar-Wicaksono/perf-arm_pmu-Skip-PMCCNTR_EL0-on-NVIDIA-Olympus/20260417-021859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260406232034.2566133-1-bwicaksono%40nvidia.com
patch subject: [PATCH] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260418/202604180247.SBxRBqqS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180247.SBxRBqqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604180247.SBxRBqqS-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:145:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_RD'
     145 |         [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:123:65: warning: initialized field overwritten [-Woverride-init]
     123 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR                       0x0041
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:146:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR'
     146 |         [C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:123:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[0][1][0]')
     123 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR                       0x0041
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:146:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR'
     146 |         [C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:125:65: warning: initialized field overwritten [-Woverride-init]
     125 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR                0x0043
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:147:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR'
     147 |         [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:125:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[0][1][1]')
     125 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR                0x0043
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:147:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR'
     147 |         [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:65: warning: initialized field overwritten [-Woverride-init]
     134 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x004E
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:149:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     149 |         [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][0][0]')
     134 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x004E
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:149:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     149 |         [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:65: warning: initialized field overwritten [-Woverride-init]
     135 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x004F
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:150:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     150 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][1][0]')
     135 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x004F
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:150:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     150 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:65: warning: initialized field overwritten [-Woverride-init]
     132 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x004C
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:151:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     151 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][0][1]')
     132 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x004C
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:151:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     151 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:65: warning: initialized field overwritten [-Woverride-init]
     133 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x004D
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:152:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     152 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][1][1]')
     133 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x004D
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:152:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     152 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:65: warning: initialized field overwritten [-Woverride-init]
     149 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x0060
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:154:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     154 |         [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[6][0][0]')
     149 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x0060
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:154:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     154 |         [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:65: warning: initialized field overwritten [-Woverride-init]
     150 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x0061
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:155:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     155 |         [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[6][1][0]')
     150 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x0061
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:155:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     155 |         [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/arm_pmuv3.c:984:26: error: array type has incomplete element type 'struct midr_range'
     984 | static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/arm_pmuv3.c:1000:9: error: implicit declaration of function 'MIDR_ALL_VERSIONS'; did you mean 'MODULE_VERSION'? [-Wimplicit-function-declaration]
    1000 |         MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
         |         ^~~~~~~~~~~~~~~~~
         |         MODULE_VERSION
>> drivers/perf/arm_pmuv3.c:1000:27: error: 'MIDR_NVIDIA_OLYMPUS' undeclared here (not in a function)
    1000 |         MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_pmuv3.c: In function 'armv8pmu_can_use_pmccntr':
>> drivers/perf/arm_pmuv3.c:1042:13: error: implicit declaration of function 'is_midr_in_range_list' [-Wimplicit-function-declaration]
    1042 |         if (is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus))
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_pmuv3.c: At top level:
   drivers/perf/arm_pmuv3.c:984:26: warning: 'armv8pmu_avoid_pmccntr_cpus' defined but not used [-Wunused-variable]
     984 | static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +984 drivers/perf/arm_pmuv3.c

   980	
   981	/*
   982	 * List of CPUs that should avoid using PMCCNTR_EL0.
   983	 */
 > 984	static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
   985		/*
   986		 * The PMCCNTR_EL0 in Olympus CPU may still increment while in WFI/WFE state.
   987		 * This is an implementation specific behavior and not an erratum.
   988		 *
   989		 * From ARM DDI0487 D14.4:
   990		 *   It is IMPLEMENTATION SPECIFIC whether CPU_CYCLES and PMCCNTR count
   991		 *   when the PE is in WFI or WFE state, even if the clocks are not stopped.
   992		 *
   993		 * From ARM DDI0487 D24.5.2:
   994		 *   All counters are subject to any changes in clock frequency, including
   995		 *   clock stopping caused by the WFI and WFE instructions.
   996		 *   This means that it is CONSTRAINED UNPREDICTABLE whether or not
   997		 *   PMCCNTR_EL0 continues to increment when clocks are stopped by WFI and
   998		 *   WFE instructions.
   999		 */
> 1000		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
  1001		{}
  1002	};
  1003	
  1004	static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
  1005					     struct perf_event *event)
  1006	{
  1007		struct arm_pmu *cpu_pmu = to_arm_pmu(event->pmu);
  1008		struct hw_perf_event *hwc = &event->hw;
  1009		unsigned long evtype = hwc->config_base & ARMV8_PMU_EVTYPE_EVENT;
  1010	
  1011		if (evtype != ARMV8_PMUV3_PERFCTR_CPU_CYCLES)
  1012			return false;
  1013	
  1014		/*
  1015		 * A CPU_CYCLES event with threshold counting cannot use PMCCNTR_EL0
  1016		 * since it lacks threshold support.
  1017		 */
  1018		if (armv8pmu_event_get_threshold(&event->attr))
  1019			return false;
  1020	
  1021		/*
  1022		 * PMCCNTR_EL0 is not affected by BRBE controls like BRBCR_ELx.FZP.
  1023		 * So don't use it for branch events.
  1024		 */
  1025		if (has_branch_stack(event))
  1026			return false;
  1027	
  1028		/*
  1029		 * The PMCCNTR_EL0 increments from the processor clock rather than
  1030		 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
  1031		 * counting on a WFI PE if one of its SMT sibling is not idle on a
  1032		 * multi-threaded implementation. So don't use it on SMT cores.
  1033		 */
  1034		if (cpu_pmu->has_smt)
  1035			return false;
  1036	
  1037		/*
  1038		 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
  1039		 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
  1040		 * prevent inconsistency in the results.
  1041		 */
> 1042		if (is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus))
  1043			return false;
  1044	
  1045		return true;
  1046	}
  1047	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
