Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012011.outbound.protection.outlook.com [40.107.200.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC4D37D12F;
	Mon,  4 May 2026 17:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777917164; cv=fail; b=Jpb5Wztf8uLJ+Tys/JJqHtyHTeZGkKckG0uU/4Bzx7/s7KBodLaj7kapNnqPYc8//5Ym2L5oGxij7We8MdDsDZGdxr2iRPqk1DGIcOaO3YTGA6L1VJfjcPFVmNz55cGLcM8s1LF11sG+gpZv501440k6Jxd17AhcVK6zg/NmIAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777917164; c=relaxed/simple;
	bh=xVAJz2exW4xofmECxarephQQ2fiZcDWKaUQIWWB865Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pJuB12Fz2o2QFSs8E0RKMfaJ0g5M58B2PNpGFCOOWcPxe6NHYTo53MeolT/iecbsMliAgM8JQSgivke+FYc9gkd7W2SJE3b7pbfKRl3pKgSCrFWu8BpalzyS+lAEmWR0poBJHqs0fTxiF7b1xkp5Tp0TISRtq/4prNaDk+BTmG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WYQN/qrq; arc=fail smtp.client-ip=40.107.200.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WYQN/qrq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/eqV00mIHTPHLRORP4rqdt4DtU6McAC2v82TIDW3zAf+fJl15D5pyMmvfqEDrmSKBtICDdCtVnp357H2MG7fDZfRU7Kh4v2ROtQhdWbdLARFxHsBrN2QVFyVO5zmTy6ldHPwXypgX4IcQJxf0sEFofg6z8ZufjJUlJYMn1QAgzD6rO2YroRxqcFG0a495LqnNXHCheKPZdGQ/Houu7udcMQKevLxwXXMmpkk8o4UvQOa5GCpZe4TJhiUdicEjtTL8b0aAza8qEmuFxcOj4AupC7wFjI5UkoFts9xnhgCuI2pGsXH5Ht7kg/9OnwgS+ZCQLX9Ghzbgcu0zj185gbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mUlUsMZQbqOKKdwd4r/DzRMo6SS4RXPnjCKqYKXLOU=;
 b=HYlVPdmWYhhMBd8qYktAlIz5SOdZt0qjbHDFWhnHBDxM9M03FuqWVW3IXAdRsUSCA1OxbHERaqdrzEZx/K7s3tD6+7LLa37DKN0QqPUxY5rZoNEeyrB+K5C3myWsy7X95V+veM8Pc8KViVS97S6rkjjmZAWnuyKlTwPytM1jvha7YLAmCqWbdkeLVsSRMrTEvt1dWbdS432wk7eyfMrJgohcBucDfw4nnBBNvtO5iflVZsGM0H59rX3QzzDk3XSWn3rdDS9kt2e19ELyCQh5j08MyB5QTnCOCABmBKWOFXHB042OQPHaK2xV/bem3jToWYh7JlB0VvIF3xx4pemxLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mUlUsMZQbqOKKdwd4r/DzRMo6SS4RXPnjCKqYKXLOU=;
 b=WYQN/qrqYTJIzbK/IAsHd+eFbOMOav3rNI+rh4maJl4zBjwsMe532ekgKxGpoRQMglRcGAMjs19PMRxowoBFZpUntxcHpY/WBZG1MX4FqE7miphPPyedRD9JryqPCZKwKtP8E8mCGk9Ixnt4h1yqm7q2zi4yghMYcxMy2XeD1YBACS+sltF4ymd1bnmDo6kMhUGqIZAzU++ShhOKKEktKbYbcz5eHTnfrK6QcwzID48qpUxcieb57iKEGP8qEHevYNUgSUhoX2/CdB7U+thbKmQS4v9mqTIgN96jq6AhKuFzVhfwJxyqHKYBZOTniRToQfnCjhsxAJeR3YQhmLwH9A==
Received: from CYZPR14CA0010.namprd14.prod.outlook.com (2603:10b6:930:8f::18)
 by DM6PR12MB4434.namprd12.prod.outlook.com (2603:10b6:5:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 17:52:36 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:930:8f:cafe::1b) by CYZPR14CA0010.outlook.office365.com
 (2603:10b6:930:8f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 17:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 17:52:35 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 10:52:12 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 10:52:11 -0700
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 4 May 2026 10:52:10 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <james.clark@linaro.org>,
	<yangyccccc@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, <skelley@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v4] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Date: Mon, 4 May 2026 17:52:04 +0000
Message-ID: <20260504175204.3122979-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DM6PR12MB4434:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f00f0b-d08c-4826-380e-08deaa05eca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	g9TeO6tShVWxEz8VJGoa03PS2h8Q0QQgNGMRC2zzHJDwnuAgEhotKj8PGnOjdzN2LlqXPC1ny4DSASbTkhLWYOC/FQA73JbSyvZ700e47VTOihdwf4TqFJBbhxXMpIFcKRKv9kKvLZT1QyXmivsiRx2nw8cLAkFGyJBoKgsD+1LUUx7JBLG4DzSB+Yd2Kq9rcVEjrKc6mo9TteZOh3/M6uaAT2wg/Fr4ddt/CO4x56RjuYnBWL0PBpgZgv82SAYA8Trk7izoIBxJs7twZmfWDN62jC40cJDOXYEJ6m+dx8kFxid/B/d+v9HgmG9oi4aMvHpLHHE9C4W3YV9mFayM9Vb2ykl9EWKJU99Ryl5CgQ6afZhHxeVngHtU4Gde/xePwXZzTRhzKvuIIeHSk9IxqRp7Zwl7aXoyOfuYboYFEi7KWLkk5CCycShdRqv7ODjXCzmXHfxuuV270Yl5UbpL5zbLYPHeGjcqEXTfMrIDrZPrjrPQXSkGeabiqpf9N0nN8p2vLNPHRlbaOm9NpVBeFn3ohjVeAc8imWHbdo01Q0vF1aVzBTYeH87a14DOQsM1fxS12Z+gtS3i990jkbWtpqjBSOKOoIvjPwjzVBKzHmn0HoVmelBlUiq24CXVjhQzlgTaC+OB7Y3Pxnyy1q4q0bRQbOrTW+8Xedz86e1VR1CM6q/EN6d5V4jguKbHuYJQKfe8S/sk2yxZApvv8Ai12qh6zEbB4UHAtKLqjnjVlXc+V7+X5mKEPpqXL4iDYVEg
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	icfUU3rOFaDQdRc8zsF4el2MqxNxWbiS8vEermJ2MIFM8N6Wq3ymLCUg/VTnyzuUtOG9GUYp8ttwCTETYhRh4S8pXhgrQb9pWw6f0Mz5/tmYQxShf37wP2WT6MEanCWNItOJB0YGXrES6zusiii2YT3ucNL3uu7LNqvIQXR6QGR9Q9Mbcz5EbHPubRp80Dxg6B11G49jKjn7DvTaT3ImTluE9nkBbCooKyQhxfsF4VjxxeBsDSJ2jRXRN3txxdYfQmCKJSvG5KpfiX5pn6AT1DtnUzYqoJTQvRPzj3hWInxXufMjOq8crWgjr45WrFjnodRSIwux9d/9y2HrM/2nc86w5flX4zjoz0+2Qt6Uy5KbaR4Jp2IhCcGP3uDsG1f6vsf/iPDqGt4Vy4scVYGB2Rws1JH9ry9InKOnY8RswfRGkKns+DEH8MdTFbN7Xtg6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 17:52:35.3301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f00f0b-d08c-4826-380e-08deaa05eca8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4434

PMCCNTR_EL0 may continue to increment on NVIDIA Olympus CPUs while the
PE is in WFI/WFE. That does not necessarily match the CPU_CYCLES event
counted by a programmable counter, so using PMCCNTR_EL0 for cycles can
give results that differ from the programmable counter path.

Extend the existing PMCCNTR avoidance decision from the SMT case to
also cover Olympus. Store the result in the common arm_pmu state at
registration time, so arm_pmuv3 can keep using a single flag when
deciding whether CPU_CYCLES may use PMCCNTR_EL0.

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

---
 drivers/perf/arm_pmu.c       |  7 ++++-
 drivers/perf/arm_pmuv3.c     | 51 +++++++++++++++++++++++++++++++-----
 include/linux/perf/arm_pmu.h |  2 +-
 3 files changed, 51 insertions(+), 9 deletions(-)

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
index 8014ff766cff..1ee4a09d0dcc 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -8,6 +8,7 @@
  * This code is based heavily on the ARMv7 perf event code.
  */
 
+#include <asm/cputype.h>
 #include <asm/irq_regs.h>
 #include <asm/perf_event.h>
 #include <asm/virt.h>
@@ -1002,13 +1003,7 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
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
@@ -1299,6 +1294,41 @@ static int armv8_vulcan_map_event(struct perf_event *event)
 				       &armv8_vulcan_perf_cache_map);
 }
 
+#ifdef CONFIG_ARM64
+/*
+ * List of CPUs that should avoid using PMCCNTR_EL0.
+ */
+static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
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
@@ -1348,6 +1378,13 @@ static void __armv8pmu_probe_pmu(void *info)
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

