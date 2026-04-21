Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9027FB0E;
	Tue, 21 Apr 2026 20:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803964; cv=fail; b=BvHgvghb+P3v6/R4ZeToGGwRX2i4zN5CxUBuqf8Imvc7lrc4KNYd4x3hBzUuytlRFJrUEe0GL72ID5XalN2sFznehap02o/dcMGd+yYDJ/CwBhOf2D7bZ6QqYnnBnFwtr6P0a+wJQsy+aLtOVr2U3308LEurTAVxsQNEOyqN194=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803964; c=relaxed/simple;
	bh=sHZYJb6teOoAtCp77LjkxoYStHyP0w3oUnRdC7+efgo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qjvxHryvkNbXGtmDpZsZHDKYbQ0EpLT5tEEw4/cXe1YblhyaZzSj48++VtGLkMLjeRPmOzD3qk3ZzN4IhLHeIGYxlZerznUHMjfX7ecKX60UYI7ovHEpOIp7PFXENwKJSLclIorFtkenug24UEMRvMGUmeNVp43iuj1s2NzMxLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oRNR9hgB; arc=fail smtp.client-ip=52.101.85.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oRNR9hgB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCzwOvP5Bf8x614IRmFjgL8QUY/FVCARJQx2YX7uVGoxehvTz76oa7xydGD9e2x0dMi1EhE9B6sCBZZgdy9MSOKSpnw0db82IgfeVXynY81zQ6P7aaCI/WFjBCU8xnYapXap6nTPTNGxbkoj7jEMuO14SKxUOym25OcAmp6x7bo0Uyp4GO4K+qOx5Ymn8mofAZ1kW7QR9vlnvjnknGjRT+oPASAMKrIj5lYiaZ3v5JMpngKYJC9a1h7o5FqWViWq/2wCWZ5sDGwICEdEniOSQ6oHHfjUr0isq7ZWsEnksoIBkAw8NMHTk1eo3PGl43LN35+AcTsL+zhz3usGU0Ns2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLQD/bHn08XpHg7HbA43UdSwR5dHTkh3qrSmQeO9Qxs=;
 b=h6gCxHNQdeNPSoYqZ3j65YhENp7yu4qHyC+JgeycKni20k1eIQ/i78jPm3JIejw97Wjwa3HlFzj+qXhWglC+JHdqi4ImxZEi0B6YTWeBALP7GPzkDogAkQ0v0vJ91gUl/04Zq9T/kwqfQZKsRENGFPUqtoGLjLiCrbrGrC7nvLgWVQR9qLkBFMTzchClI8pFYlqU/XJJaLwZ5BgCoNgrDrRaXgl8p/zerwcDAtcwQfMY9gxrZZiuaA8LuFLdGh5BTLBeyxHysE1OC2iP73lE4bOi7SRe2sdLSPPeT3BoisMx48+XAjlC2W+1bCVJllauNlkf5AalbD8KJGznD3Ya+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLQD/bHn08XpHg7HbA43UdSwR5dHTkh3qrSmQeO9Qxs=;
 b=oRNR9hgBXglum6LoRq897m8e22NziAdVz96sZOk2cEDwTl9b3njwZENvmh/OMez4XrVQbtX6ahIOcCa7Z5M+SaRFn/Qt/Zv+Yy+QoyfQRhjLInZnY7WjUKuExNFFJ1ZahuxqEtTTuvOWLgzeO4OojiloQVBP4O82ccNIgdHFs9P6dOincUWtusIW/QyxXsIeh0nxVB/J2GGIsGg5arimKmTZjsBwl8/1mQWosZWM/C6txYIKbzLMxbjavAuR0ote7Uhtvfb6Ml9AH0EJNVIhLoiUWAf9IF9JAlaOw9FSDoaD4iQMjiplgydtrwUk08Khy+/8YQr8wbhbT7Lpn06Vcw==
Received: from CY5PR04CA0006.namprd04.prod.outlook.com (2603:10b6:930:1e::8)
 by SJ5PPFFA661D690.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9ab) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Tue, 21 Apr
 2026 20:39:20 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:1e:cafe::5c) by CY5PR04CA0006.outlook.office365.com
 (2603:10b6:930:1e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 20:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 21 Apr 2026 20:39:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 13:39:01 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 13:39:01 -0700
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 21 Apr 2026 13:38:59 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <james.clark@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, <skelley@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v2] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Date: Tue, 21 Apr 2026 20:38:56 +0000
Message-ID: <20260421203856.3539186-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SJ5PPFFA661D690:EE_
X-MS-Office365-Filtering-Correlation-Id: 133db09d-71f4-4876-ef98-08de9fe6109a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WXc5LZB8bkvMXw6BYm8Et+H5QdeNguJCX8AB0r2bDQHsvW9YMILVQIEtVnbUHo8DfLsWHL5jLIFwbKlWdB8aZYb+mzBHc7SvPW7rVN9W3sGqfN7nUpNjTsDF3ohT0LBQwCTe4Lax/P9lPs7O66foEVGRYd+m28YWJw3ATNcasRr+Xm3cDeXOrMZyDLpMi9Vn89rHWbXXPYecIeX4pImOtTTSisS4qOL1II3mALGKreZLG5IYPM4Bi6dYHa+z8e6WSMMcBAjWTTWPAWj+6Z8ts/3mz0U38pg8muW7k6srh77/zl7W8GTGCYWrHpAsVX+XtxPVYddLJZvt0IeGKuuMiohdllFMdRLFJTZaOJM6bX1E6fApgHdrrJ2IardzvTIuvOOs+Q1FvojoViGwd7VVEkILVw/9CAZ5L1NtsJK2fIlcAP3W/kTM9rHmFvstS+IXWwBFqJX2avDeTP3T1J9PHbCps9xYXvrGy0J0Px4tQqz03i3outesgOH115HkI9pfmWueNOlWjr9fFg4hzxoM0GO4d5GsK6l2bMcqzW7K1pHZlc/Hmajb98FyXlz5efYK+GzlIruWry9qPaBhYBIRS08esvggB/ddPti62SVbL9l0CuTDocsNSpPxJEFJIG75z5ThAm52FCdtUyrSY1g81UkmnChG1/ssBRxyywTEL5jj5Swc1smuVTjjEYySTJAxdj4K4331M6pO4aqwFGHmmBfPwN+6NcNU6oc452tMzf/uGws1kMaIMrhfqfMsnwdeG5EmBzZnvjT2v4RSnvkvrA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cocbFsb2GU6PKGP0KuzZMaxOfTNwBsqJ7tlKAjggLnKWu2LjnY/jRHWvar99VWE5/KYatWhY3fRywoPgL1VtW94B413GCAgwBUwBvVbtlRUsrjoh3nE+yz6EO+hc814R/mssidBzF/KTGKd35ME5NC0cZ7x6zvFoyxtaCKnAybN2byI756rEGpCqeeTwH7iSblXbLLe91pXWJTRgjKyB3pPSfsZuGbV2E+GwPW7SBIpRGUD1tBs7UmGw+lnA31X0rkJM8zfi13gAXR3/1dPv0Wkib4dzRTr7pFu70sypjRH5O6eSwhYTRVeN9UNMdTHzAhpCp81gQeDof4Vt4i+5JJhQChz6GCZW3CxjDTXijh0Lxi4KbhpmU0xUFwNqnlXb3k0sN23fEf+frBhOYK9I3K48e0VJgTpifBF23UtTHswVYEvv2SAihx6eqs+gsCw1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 20:39:20.1956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 133db09d-71f4-4876-ef98-08de9fe6109a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFFA661D690

The PMCCNTR_EL0 in NVIDIA Olympus CPU may increment while
in WFI/WFE, which does not align with counting CPU_CYCLES
on a programmable counter. Add a MIDR range entry and
refuse PMCCNTR_EL0 for cycle events on affected parts so
perf does not mix the two behaviors.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---

Changes from v1:
  * add CONFIG_ARM64 check to fix build error found by kernel test robot
  * add explicit include of <asm/cputype.h>
v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-bwicaksono@nvidia.com/

---
 drivers/perf/arm_pmuv3.c | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8014ff766cff..7c39d0804b9f 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -8,6 +8,7 @@
  * This code is based heavily on the ARMv7 perf event code.
  */
 
+#include <asm/cputype.h>
 #include <asm/irq_regs.h>
 #include <asm/perf_event.h>
 #include <asm/virt.h>
@@ -978,6 +979,41 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 	return -EAGAIN;
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
 static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 				     struct perf_event *event)
 {
@@ -1011,6 +1047,14 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (cpu_pmu->has_smt)
 		return false;
 
+	/*
+	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
+	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
+	 * prevent inconsistency in the results.
+	 */
+	if (armv8pmu_is_in_avoid_pmccntr_cpus())
+		return false;
+
 	return true;
 }
 
-- 
2.43.0

