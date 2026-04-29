Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D435030EF82;
	Wed, 29 Apr 2026 21:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777499812; cv=fail; b=Mbg85f29NboGY5jRhGZeIJT76B+RMCk3mX7D/VM28IME4VdP4BXB90+lx5JdpneVs/v3DWIvgCi11Z1wQBcf5uam7MfB3x7mTFAqcjOwwr9xl4ThvoQYVrgT41I249fuUWHuHtzPgKr/n0bwuar/6vmJaTfs7+5AFzrbGrpgl1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777499812; c=relaxed/simple;
	bh=BVmXyScYwTBH328Zqf1uraLtkC2sOs6su9O2aFiDClk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IfU6sniMv2X//PsMd5AnaEjL8esuV81JRPZ6k0I/JtO2AKemMMHxHPmOkcg5bor8xaeBLyq3HxUb/scUOZfRQJqhg/+pey2IkFuz1bcKFUFzeNkLVptSoYBBc/9tBo8SSYU0cjRBZiw27+UKE8igkGS5XIczKc9Lhyf5cR3GODo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DMYNw2S7; arc=fail smtp.client-ip=52.101.52.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DMYNw2S7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmSjDkYISVR21z/N50GMgX519JFZFaVJl6rrLFpzSBpw+aAZpVhK2if7ng3FA3SBO/I55v/K7rxvdxJJ+Wni6bFjct4ecBIGnCZfwANg5rFONzk8oACLQQNuX9NeclmOxXxNTsLRvYABj+QVlmCFOpCyGItJZtsKAIgUKnC/KqtTkRTXDSuGKV+mPTcjgn0LDbwYJN6IfZvgSO0oyFYyS7ZMJTejQeqRpRCbtC8c4o5MJiB1iNSJwL+ZHCsIV6964+Ijpqj5UaAK5H+i5VJwuKQOZf1vkotz+LrakA7MRdNPXFrtlxj22M3ny0mOgwai5TuqJjOyO0+TAhHMeZ42Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIt5F7TntgBDb/Bs4D9Ij7OPaAtFtXqF/sqzcpUCNyk=;
 b=J7hKpKJqJcMzHZsOxwxoxZIQRtKAsUaFRFF/YpqDbJa6u1M10PSYGm5QHDRd9kVIQfuMNYEC+uaEB3EfqYAwyq3ShW63vviqpjvr2IHctaUL+rrD8ezRRR1y87Pi7KSS9Oe1vzkfjkz2h/vB2iTyN/qQI7ajSXPT46QwVSbaKGRU+evL9MiubSMRjNVZWNnjjjSf6oTgN6pLU4wxP/+njd/lulWy1RCBlBXOxfRGxlmh0X9Rd0rYm/Rm1TFzPNDSXszUT85aYzLCkZM8wt6z2CI0Ae6aDqFQ//Ozn/VQvKp9sS0Y4Z7zPfVcjwEQT3vBHp9HtNBBVGehijbuf09tEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIt5F7TntgBDb/Bs4D9Ij7OPaAtFtXqF/sqzcpUCNyk=;
 b=DMYNw2S7/sVo7fKoIqt32OGMG/Hj60asR02xttm4HEG7pZ97k4V2anTlNG7a4TMJiirnlc2TCD/52R6KNizATuf3owKziFDLSQkI570KEAX8GLojmJTM793zvrkBy4S72u/oENr13j0sTHlOneGtDFNuEtwwh54wjVtw0WmzIf2dVshSslVSUj6oCEKiPCauNNtE2zg9cGWtWRBDiL0I1Jdb85gc9M0/P9SVRd6RWFaoqT4PWkaWGMchfA6el2gxBawc1pekW1JYyMCdv8B3mCCv/cKU6bEgKh0mKDb6zYYXY1IF8Cnbxl0mmWxEhiVdJGbl2x+xHYjssB9uPRN6fQ==
Received: from MN0P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::27)
 by SN7PR12MB8002.namprd12.prod.outlook.com (2603:10b6:806:34b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 21:56:43 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:531:cafe::25) by MN0P222CA0023.outlook.office365.com
 (2603:10b6:208:531::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 21:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 21:56:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 14:56:24 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 14:56:24 -0700
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 29 Apr 2026 14:56:23 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <james.clark@linaro.org>,
	<yangyccccc@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, <skelley@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v3] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Date: Wed, 29 Apr 2026 21:56:14 +0000
Message-ID: <20260429215614.1793131-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|SN7PR12MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: d02e2cdc-e4ff-43cd-cb45-08dea63a32f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	FC+/3YeyV4eNhEjsuqBAugq0tYtfTzb5whoBYSyeBXlq9Bp8Mp5pgzLR5RR4nWS3ImKPD5kVmgP3CDoFC9ktB8rt+eGv7vPUNvHE0JvFNJJmnDCqvaEnS17loa5oIkyfQCQyL0r74PWy2BgnIhGGEWZXDswiHrL+Jr0Tj/1K3InBfNJ7QzZUF/sTSVndnATIqNjrf4TGtak7NTai49a4ugzJ5ICvgBe/g11kvFgLVWBHdiJ10hK7ZZBKVlcsDCbnpYsUmLId5ryfZCJEGDZu0+AhxQGxS67fMCG1IBg9qFfC1tc5DdctxSN6ckFCu/VbmYwieh0iATEPd6ScehX6MKm0/4upgfr0uSGkF/PwTk7JLgM0icladqBn12OrCWoD14mGA8aioaRJSt6UmA+EoIbaFENZGF5CzQon9DfRenVj2Wzvl+PztWF2qOWi8x81n1LotPSVUygp9x2E+A9OcoJRzEt0kaKpBciojRpWO2feLbqOQo4uD5xMD1l5dBHOWoPfz+N9wq1AljJJjXvWo8vpSyHXjUHpoJTsku5QMZwfHdAKNRZcW9/ropPg6lAzjjTasRd10cfuxiGG7qNGRgOnN9EE7o5qUgpTySrjz+dE4+zHQLJrrLeADWElUYqdVF4bKR40Fqhic5LNQtX8L2TgBwmIkwkNSGktgLfdtb3CKkhqoBi0JrNhz8NT3zZmnHbtRo/Bd2FhxxBhM3T1LgmxNo/du4FSrvjFrrm5aOk+4rxRCJPaOBhXrRZTu6xK
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yPTSiPLt7bnmxP5CiZORK1J0eDZi8z0PavULK+MelmZ5hs0fmI0IA95q86nH6ADb5/tlbZnLxIugTxr2hN5rYmaCCutw24eUiQCoHBFFMqiZ1w0gC/RBxid62dBcdyF3nRRZpEfduYnc9GM1kVgsuIiqD9HwPEzHciKaUYOHMAT0z8F+Fph3UIM9Mpe+AohxjI0PMj1+BvLLSBeLVPjtypXvhuH21nYFkGX8V7QBP4MY6NTM9N2EOuOYjUJQ9291+4FqbTREWt8bC3bXWQhhcGmutCtsb4a/MAqztBdDuJlBXdBz1iq286xhYQeDzBN7m2GqvVXPQcMDzN2ymgNubCz9Skz2sliuwVDKUmnHKWtncuMd7+K0SBB+OKLrv0PvqAE7bq/l4v3VMyMvLNqTmKrbpfMVpde8dh0zMYfCAwRarBt9u3XqP1Occ2Oc7y7/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 21:56:42.4554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d02e2cdc-e4ff-43cd-cb45-08dea63a32f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002

PMCCNTR_EL0 may continue to increment on NVIDIA Olympus CPUs while the
PE is in WFI/WFE. That does not necessarily match the CPU_CYCLES event
counted by a programmable counter, so using PMCCNTR_EL0 for cycles can
give results that differ from the programmable counter path.

Extend the existing PMCCNTR avoidance decision from the SMT case to
also cover Olympus. Store the result in the common arm_pmu state at
registration time, so arm_pmuv3 can keep using a single flag when
deciding whether CPU_CYCLES may use PMCCNTR_EL0.

Use the cached MIDR from cpu_data to identify Olympus parts and avoid
reading MIDR_EL1 in the event path.

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
  * Drop the use_pmccntr override patch from this revision.
v2: https://lore.kernel.org/linux-arm-kernel/20260421203856.3539186-1-bwicaksono@nvidia.com/#t

---
 drivers/perf/arm_pmu.c       | 78 +++++++++++++++++++++++++++++++++---
 drivers/perf/arm_pmuv3.c     |  8 +---
 include/linux/perf/arm_pmu.h |  2 +-
 3 files changed, 75 insertions(+), 13 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 939bcbd433aa..7df185ee7b74 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -24,6 +24,8 @@
 #include <linux/irq.h>
 #include <linux/irqdesc.h>
 
+#include <asm/cpu.h>
+#include <asm/cputype.h>
 #include <asm/irq_regs.h>
 
 static int armpmu_count_irq_users(const struct cpumask *affinity,
@@ -920,6 +922,76 @@ void armpmu_free(struct arm_pmu *pmu)
 	kfree(pmu);
 }
 
+#ifdef CONFIG_ARM64
+/*
+ * List of CPUs that should avoid using PMCCNTR_EL0.
+ */
+static struct midr_range armpmu_avoid_pmccntr_cpus[] = {
+	/*
+	 * The PMCCNTR_EL0 in Olympus CPU may still increment while in WFI/WFE state.
+	 * This is an implementation specific behavior and not an erratum.
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
+static bool armpmu_is_in_avoid_pmccntr_cpus(int cpu)
+{
+	struct midr_range const *r = armpmu_avoid_pmccntr_cpus;
+	u32 midr = (u32)per_cpu(cpu_data, cpu).reg_midr;
+
+	while (r->model) {
+		if (midr_is_cpu_model_range(midr, r->model, r->rv_min, r->rv_max))
+			return true;
+		r++;
+	}
+
+	return false;
+}
+#else
+static bool armpmu_is_in_avoid_pmccntr_cpus(int cpu)
+{
+	return false;
+}
+#endif
+
+static bool armpmu_avoid_pmccntr(struct arm_pmu *pmu)
+{
+	int cpu = cpumask_first(&pmu->supported_cpus);
+
+	/*
+	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
+	 * detect the SMT implementation.
+	 * On SMT CPUs, the PMCCNTR_EL0 increments from the processor clock rather
+	 * than the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
+	 * counting on a WFI PE if one of its SMT sibling is not idle on a
+	 * multi-threaded implementation. So don't use it on SMT cores.
+	 */
+	if (topology_core_has_smt(cpu))
+		return true;
+
+	/*
+	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
+	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
+	 * prevent inconsistency in the results.
+	 */
+	if (armpmu_is_in_avoid_pmccntr_cpus(cpu))
+		return true;
+
+	return false;
+}
+
 int armpmu_register(struct arm_pmu *pmu)
 {
 	int ret;
@@ -928,11 +1000,7 @@ int armpmu_register(struct arm_pmu *pmu)
 	if (ret)
 		return ret;
 
-	/*
-	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
-	 * detect the SMT implementation.
-	 */
-	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
+	pmu->avoid_pmccntr = armpmu_avoid_pmccntr(pmu);
 
 	if (!pmu->set_event_filter)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8014ff766cff..60f159a51992 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1002,13 +1002,7 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
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

