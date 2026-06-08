Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98052F0673;
	Mon,  8 Jun 2026 23:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780962125; cv=fail; b=hQiiiJVY9Q6gPufms8iKjubOywDy0//9IXhjR9ZeptzBGaZn0KQ5/o9PAKqw8QDfEGNS6tjm5mPDYzXX1N+2EyKEEzBakxWHQiAI56StvFNiWr2zw8RDG2sjMbizHKG+q5+M4ur6w6IZeMG5XzveVStSTGRp6Q53495Tkr4bYuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780962125; c=relaxed/simple;
	bh=DIgXENbCe58ghDcEwG5wxdPxZ43xmynn7fBOsAs3caI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rIGrvLf6w5XVLYH2KET2trk8SmGxXB3ZVsZ+6dyDjB4vtHzX5NHfcG+OdsCUZGtZkSBYL/oXGYumNi8V8CvaNgHv8dbzWh/Cx1x+Jud4hQseUMfG2JPTBIl9V3OA41xXYogPaga7Z5rrKtvRiya8u+cnVtyJawWfhbOzJq9Z9AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m5YbwQ2q; arc=fail smtp.client-ip=52.101.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m5YbwQ2q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPlALWJET+cnNgtaLl2UeveaeWXWBOw3YcBZI69lz5zBfHMTt3bvNws6ep0fEXX48JFUPVRW+stcljUr6XW+Mq+1bvVK/NpJumepn0H01qGBWiI9KGUtcYO3EKtm+lx9zF9BRfxVRbP20euMngdAFyCObhsiZX/HD0yfm0YXGPtLdfb2MFxUKMAxoB+shCT7lkPaxa19MHfNu1VpjSF2ruCPrFEiqHOZ/BNxUFFIn+9/PrCxhqMLbL814QgMy6HLjGaleNzMIRTJD1LLdgMo3ismkKVa1XZlbenubxrU2WxH409ASeeA4PjGK0QTKGqrocwG5XqM/qmNTohFU680sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AW12F2aijeltt0kDbNlPBAOVeA5da1nLhYrosa0aRps=;
 b=X9ETQAYdNWKkp8zTRMGRwALUjauFrrwifhfA3fMj2EjfINomKdq5j45I7yhPpIrXbxvoqaBxhTs+qzUbkvrdyz3S0vchf/8EYlH3rcjz5U54CjBI5DCdCQkAIWy+3auBhAYdmAdVXij7NKZvQkXMVTGSjG1+dXn5qiI60H5/iIf57/cxgtXyjMKxNctuDv7n5H3gk1/hB0xmK26GJN3HPckP3H/QKUTbns1wlb1M/ax9D8hLMJkWVq2S6rpRuJPR0S2ZYmPoAL5NO6YlKL541MCKJSblYboCye+e3j922aiej/Y9ZW1OMZauub7A1AyDz7U8IfHJUQ34YNg7rfShxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AW12F2aijeltt0kDbNlPBAOVeA5da1nLhYrosa0aRps=;
 b=m5YbwQ2q+aqkmE6ef1m5e3dPHNajIa+weslguQlZZ5HTgMZRoHHZc3b/digG7Ucya7UpNMSL3+tGmJi31rPsw0gkP2gTSuO8A084ZocsjW+KLnEAR+SeBF4+D6PvJwNVPKzP0owN67vXubIvFAqowiyOBzmgmlO+4LJ252o4Rx+6E6IS8/iaGb48zW2qupx1k6KvxJGbZM6Wny3GQNv9BsOxvFSA8eH+Q8KUpc0yFREs14fzv3Uejlh9wtwoVcZtStL7YESu2NsWPkCmrr9xcqpzOnCvlFfGdin9rtLvWYWPxdwctd6kHBpE7wrOlHfERNp2S9PT7I+huiEMr6KJxQ==
Received: from PH8P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::10)
 by IA1PR12MB6482.namprd12.prod.outlook.com (2603:10b6:208:3a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 23:41:55 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::58) by PH8P223CA0007.outlook.office365.com
 (2603:10b6:510:2db::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 23:41:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 23:41:53 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Jun
 2026 16:41:38 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Jun
 2026 16:41:37 -0700
Received: from build-bwicaksono-noble-20260528.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 8 Jun 2026 16:41:37 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <james.clark@linaro.org>,
	<yangyccccc@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, <skelley@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v5] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Date: Mon, 8 Jun 2026 23:41:35 +0000
Message-ID: <20260608234135.1856911-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|IA1PR12MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a65408-9579-45cf-2278-08dec5b784f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|11063799006|56012099006|6133799003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	Y6r70/6SBT5Bh6eYU8pA897oKs0EoZjKxxFvBm9DbTkBZko2t51zVAGdjn99TzE/7UEaAVPuE5qRcT0zmm+hKElQ5Znjgu/gUVtigRZHKbq+ZqJniDnML2aHuCPyJzG8GSFDWtbwcayWKzGJCmyRJcHuWmlS132ukOJ+uA+5OTEMT4QJJ57XuZQtesBePS18M/3MH4KddrHGNSqjkgBbeK0a9smOK2d+KzsyBN3wCLz6F3AmWx4ZrXmpUvhvlK9yWIwWVrW4pu2HPdk9RM9VBWhcYiMx0ncKPymX3a2msLiXbdUOu73EWMTLI3HijUDohGkBB4Q8C1GCmHVXB0cTJJCPxO104OvMe9vi7zx7xzBhoLr4bcpcJaz/wHjvHROc/nPlHayynl+AnrBkPUsksu2NvnmFkLGv06rVTB64kFUhqCmHi7mziCWP4NNzyeFn+Fpq9x/eggcJoL8MWTEK3evXSu5TNRMH2w+h+JRZ0Em/UMGDoiF1LUF05uxFMDoZi3meW0xz1AoTxPW7bD9pwM5Hxm9de/312D/pRK030fRaIQurW+V3S8QqFPifEpZjJpnVaQZ+ZT4WN7SgygyBhc1SaJZ358OQ8k0h8Pza2+Al5hBfpSD+0zVs8puTAisVQwFQHHunD7g/cze4ju13KGpJz33+wP5xxNlJVOqE4II11fgOZ00U3ElizAk0gS/9VlHRcYf70d/kk+dOMnhW3p60BOARkBEQHTajht2X97E=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(11063799006)(56012099006)(6133799003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eYAuuibN4lINjTA4d0rx0GcuCCYfI1O9lJn8iY4FcJzOf4prCcZybSedY2+zh+mzKIs+/M+Ws6i0o1GCQISwrRashMJHFSDXY7HWgDkgnLw79xqjYN7fTcj5vRSaVfSv5Sgkf/x4m6CE8P6kBta5QuzhufIEc/iaull/ktnPmMFdjRbiE6OeD72JxqtKHJGzdX1HS0hMPX11jyXk6VHKXo+Zeo6g6wdQR4j8F1eAdVeKmNVmn+mSVwfz/j6QD26COiDkqzsPpfuV98uNPYbYTEx9z+Vox2jryy9zINs/XOYGzB0VwZAV8Aq/Nr7AW1b5ehwQoPUNoBjxosT/dixxXSbWsS1g9/GBO6tt8l2XDfLPrWjz4d4yCs4tQUGXl3xuZ1ga0du+Igd/fI1bq2AfaUZMU6K6xy7K6v24k+U+1vmZ7o5ijfQkpq3nU0/learO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 23:41:53.2145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a65408-9579-45cf-2278-08dec5b784f1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6482

The PMCCNTR_EL0 in NVIDIA Olympus CPU may increment while
in WFI/WFE, which does not align with counting CPU_CYCLES
on a programmable counter. Add a MIDR range entry and refuse
PMCCNTR_EL0 for cycle events on affected parts so perf does
not mix the two behaviors.

Also keep PMCCNTR_EL0 unavailable to EL0 direct counter reads
on affected CPUs. When userspace counter access is enabled,
avoid setting PMUSERENR_EL0.CR for PMUs that must avoid
PMCCNTR_EL0, while still allowing direct reads from programmable
event counters. For 64-bit userspace CPU_CYCLES events on PMUs
without native long event counters, reject the event if the only
valid direct-read path would be PMCCNTR_EL0.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---

Changes from v1:
  * add CONFIG_ARM64 check to fix build error found by kernel test robot
  * add explicit include of <asm/cputype.h>
v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-bwicaksono@nvidia.com/

Changes from v2:
  * Move the Olympus PMCCNTR avoidance check from arm_pmuv3.c to the
    common arm_pmu registration path.
  * Replace the PMUv3-only has_smt flag with avoid_pmccntr, covering both
    the existing SMT restriction and the Olympus MIDR restriction.
  * Use the cached per-CPU MIDR from cpu_data instead of calling
    is_midr_in_range_list() from armv8pmu_can_use_pmccntr().
  * Add the required asm/cpu.h include for cpu_data.
v2: https://lore.kernel.org/linux-arm-kernel/20260421203856.3539186-1-bwicaksono@nvidia.com/#t

Changes from v3:
  * Move avoidance check based on MIDR to __armv8pmu_probe_pmu() to make sure
    the MIDR is retrieved from the correct online CPU.
v3: https://lore.kernel.org/linux-arm-kernel/20260429215614.1793131-1-bwicaksono@nvidia.com/

Changes from v4:
  * Avoid granting PMCCNTR_EL0 direct userspace access by leaving
    PMUSERENR_EL0.CR clear on PMUs that must avoid PMCCNTR_EL0.
  * Keep direct userspace access available for programmable event counters.
  * Reject 64-bit userspace CPU_CYCLES events on PMUs without native long
    counters when the only valid direct-read path would be PMCCNTR_EL0.
  * Expand the Olympus comment to describe the mismatch with programmable
    CPU_CYCLES counters.
v4: https://lore.kernel.org/linux-arm-kernel/20260504175204.3122979-1-bwicaksono@nvidia.com/

---
 drivers/perf/arm_pmu.c       |  7 +++-
 drivers/perf/arm_pmuv3.c     | 64 +++++++++++++++++++++++++++++++-----
 include/linux/perf/arm_pmu.h |  2 +-
 3 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 939bcbd433aa..aa1dac0b440f 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -931,8 +931,13 @@ int armpmu_register(struct arm_pmu *pmu)
 	/*
 	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
 	 * detect the SMT implementation.
+	 * On SMT CPUs, the PMCCNTR_EL0 increments from the processor clock rather
+	 * than the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
+	 * counting on a WFI PE if one of its SMT sibling is not idle on a
+	 * multi-threaded implementation. So don't use it on SMT cores.
 	 */
-	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
+	pmu->avoid_pmccntr |=
+		topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
 
 	if (!pmu->set_event_filter)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8014ff766cff..6d4d57342352 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -8,6 +8,7 @@
  * This code is based heavily on the ARMv7 perf event code.
  */
 
+#include <asm/cputype.h>
 #include <asm/irq_regs.h>
 #include <asm/perf_event.h>
 #include <asm/virt.h>
@@ -795,6 +796,7 @@ static void armv8pmu_disable_user_access(void)
 static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 {
 	int i;
+	u64 userenr = ARMV8_PMU_USERENR_ER | ARMV8_PMU_USERENR_UEN;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 
 	if (is_pmuv3p9(cpu_pmu->pmuver)) {
@@ -817,7 +819,10 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 		}
 	}
 
-	update_pmuserenr(ARMV8_PMU_USERENR_ER | ARMV8_PMU_USERENR_CR | ARMV8_PMU_USERENR_UEN);
+	if (!cpu_pmu->avoid_pmccntr)
+		userenr |= ARMV8_PMU_USERENR_CR;
+
+	update_pmuserenr(userenr);
 }
 
 static void armv8pmu_enable_event(struct perf_event *event)
@@ -1002,13 +1007,7 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (has_branch_stack(event))
 		return false;
 
-	/*
-	 * The PMCCNTR_EL0 increments from the processor clock rather than
-	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
-	 * counting on a WFI PE if one of its SMT sibling is not idle on a
-	 * multi-threaded implementation. So don't use it on SMT cores.
-	 */
-	if (cpu_pmu->has_smt)
+	if (cpu_pmu->avoid_pmccntr)
 		return false;
 
 	return true;
@@ -1250,7 +1249,8 @@ static int __armv8_pmuv3_map_event(struct perf_event *event,
 		if (!(event->attach_state & PERF_ATTACH_TASK))
 			return -EINVAL;
 		if (armv8pmu_event_is_64bit(event) &&
-		    (hw_event_id != ARMV8_PMUV3_PERFCTR_CPU_CYCLES) &&
+		    (hw_event_id != ARMV8_PMUV3_PERFCTR_CPU_CYCLES ||
+		     armpmu->avoid_pmccntr) &&
 		    !armv8pmu_has_long_event(armpmu))
 			return -EOPNOTSUPP;
 
@@ -1299,6 +1299,45 @@ static int armv8_vulcan_map_event(struct perf_event *event)
 				       &armv8_vulcan_perf_cache_map);
 }
 
+#ifdef CONFIG_ARM64
+/*
+ * List of CPUs that should avoid using PMCCNTR_EL0.
+ */
+static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
+	/*
+	 * NVIDIA Olympus may expose different WFI/WFE behaviour between the
+	 * PMCCNTR_EL0 and the CPU_CYCLES event on programmable counters.
+	 * While the CPU is in WFI/WFE state, the PMCCNTR_EL0 may still increment
+	 * but the programmable counter may not. This is an implementation specific
+	 * behavior and not an erratum. Perf assumes those two paths are
+	 * interchangeable, so avoid using PMCCNTR_EL0 for CPU_CYCLES event.
+	 *
+	 * From ARM DDI0487 D14.4:
+	 *   It is IMPLEMENTATION SPECIFIC whether CPU_CYCLES and PMCCNTR count
+	 *   when the PE is in WFI or WFE state, even if the clocks are not stopped.
+	 *
+	 * From ARM DDI0487 D24.5.2:
+	 *   All counters are subject to any changes in clock frequency, including
+	 *   clock stopping caused by the WFI and WFE instructions.
+	 *   This means that it is CONSTRAINED UNPREDICTABLE whether or not
+	 *   PMCCNTR_EL0 continues to increment when clocks are stopped by WFI and
+	 *   WFE instructions.
+	 */
+	MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
+	{}
+};
+
+static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
+{
+	return is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus);
+}
+#else
+static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
+{
+	return false;
+}
+#endif
+
 struct armv8pmu_probe_info {
 	struct arm_pmu *pmu;
 	bool present;
@@ -1348,6 +1387,13 @@ static void __armv8pmu_probe_pmu(void *info)
 	else
 		cpu_pmu->reg_pmmir = 0;
 
+	/*
+	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
+	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
+	 * prevent inconsistency in the results.
+	 */
+	cpu_pmu->avoid_pmccntr |= armv8pmu_is_in_avoid_pmccntr_cpus();
+
 	brbe_probe(cpu_pmu);
 }
 
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 52b37f7bdbf9..02d2c7f45b52 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -119,7 +119,7 @@ struct arm_pmu {
 
 	/* PMUv3 only */
 	int		pmuver;
-	bool		has_smt;
+	bool		avoid_pmccntr;
 	u64		reg_pmmir;
 	u64		reg_brbidr;
 #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
-- 
2.43.0

