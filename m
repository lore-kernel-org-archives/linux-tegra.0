Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B35301702;
	Mon,  6 Apr 2026 23:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775517667; cv=fail; b=dGdZa/SjEdgZPFNW+hwuaTXbfkVY2FlqdVoIlDAt4hXIiVBtWUdrFBiiuRs56i6EHyu1u1yGVYNvVG+jRDEFPh1216xy1RzxX24GoMENnRJTli/qs8qjiX3ZoRV+QpsKeyCMwN3CoVznqnslxpGfHAfUbU7SJJQa6FbVYAHSzYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775517667; c=relaxed/simple;
	bh=Y7qlFcq2Sy6MiDPZ6ozG0vkOMxnIwtLffkNo5RYK17Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q3SKEUC29gEqSEe/XofNWX2BmBhCAJlo7qBqU+SMhYv/u1NhbB5b6rW4cEEYMdrFiwlxqG3XcOG2iVksV8fP9GFH3kpL2+Fnx6UruD61MKVY1R3bYIXaxO2qyOdie+CET7vmgEp7Q39en5rwIWnHb6ywWVtT1IkqwxZZaNFnzac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N0yl54eq; arc=fail smtp.client-ip=40.107.200.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N0yl54eq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOjZLXW/AFRflL5iHhEahztxe2RMVRtiVTiSOA4B3Pw8xXr6+uo7bh5GSGm0yQyyzwPAiJiolfSw5o/GnBna9DbKgYR/TMUFkbsL2M2C5DfmEGfWrd5rohlX8wQWhW61nCnZAwzu6VcwwaGFUKbvPmabvGNliE48bWO1PKiNDdh/mstiPQlj2opwG8MeiLqppa/Km4Z91O05qzl7uTQ//6qXGp66nPYpxi44ZAaue2JMTW/SmTQJ/vn2eVB+WJXnUjJK6CryYmbgv0lHT5wWp/Jxvko6RNnzBMA7sTo/Wmi0cwIGPDkVsJCuWLYVpaXjE/NJACdSlBrbCbKE6seJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+h81nrMBw9ME7lijugY27w3aaTpXKUJu6PS0fvzaps=;
 b=D9pnM5UDFVaZc0dmRRTFZFer6cl7RXGF9hzBwvtHsb0UFsLlTVHCiww6FaIvEjXSKJRvLipZMvWwsO+RB86FM3s9Cr+8SnTHIQtcOVer8lUpyNTNlR0Y350Y9HBoB7GjRZ9Vjyy2YdO5SxX9uhfp+d4BPLD5W7K580CXwj5P89h4x1/gdnwE5RiZsVl8Iwc9ASlz4BbuKisX4HpPWPRG3SyeGEmkZv8UJUYaV9HiG3vLEw9BUvlCDt6VfYYNJTTIJlogrFjb0w0WgtssqyjJmdqYPorU4ct+bAFmpPbXabXH5Y+yVx2tqlboWeGxwo/8CgtTjmqS0UspMZc1tNhDyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+h81nrMBw9ME7lijugY27w3aaTpXKUJu6PS0fvzaps=;
 b=N0yl54eqWPgyEFWb03Dz5Q+nDsNSei0H7FxzpOMib77L7nPX/mHsNsVnVHwu6G/jOQwjR6+RzED4UdroKRnYRt++szHGGXxmp2yvSlv3LX3V0AaBNSq72LciKPm7eimLlWxgafiSLf6dy6wf2nxD8IpQlDpBJf+GgQENTGYt2Vm4q2Cg40sLgfM14/0Um0iMq+CJa926NWtjpq0USPLOboL2FBsg/jxDROKtHQRoH9HDuM/sx/NEVJelGlOnTemBsi0GUAJcwGUBV49ugXOYYmr9jdi5CCZHMRCgmukFu7pDaowJyw6lVXrn2dRoP06aGW6FeaydZtwf46o/scrYRg==
Received: from CH2PR18CA0060.namprd18.prod.outlook.com (2603:10b6:610:55::40)
 by PH8PR12MB6843.namprd12.prod.outlook.com (2603:10b6:510:1ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 23:21:00 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::22) by CH2PR18CA0060.outlook.office365.com
 (2603:10b6:610:55::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.31 via Frontend Transport; Mon,
 6 Apr 2026 23:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 23:21:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 16:20:45 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 16:20:44 -0700
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 6 Apr 2026 16:20:43 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <james.clark@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, <skelley@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Date: Mon, 6 Apr 2026 23:20:34 +0000
Message-ID: <20260406232034.2566133-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|PH8PR12MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0d3098-7dbc-4b22-77db-08de94332a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Yof1GB0YcJxeWlj4n1GpeawgPPEVxNJn1SPgm4al6Hxf9Vdf8rvIn9ak3C4Z3UWN9OVgELS1+l0JvFwD2ujzMCq5/u0auMZj9fdAy2X9uAdgKVJsuMHxA673lIwtwHQ7lfBw0ALI8sog0hPB3kv3Tbv2qXkf6/3wNCW/kebVjzXvVHrc+Y6zS19e0sPFAv1YzUQQOwHHFWEBm0J1Z7EEplxHilR6Rdba+Y3ZnLwAV3LRxqlxL2BulNoDQXHqOQ8+y15HwrHEyajkhumdM/tlpiOmbFPA4GRnqbBwGwDbhmXl79XIDPR/KAXWRGOGE2XmecR2SsbuNANN1cJHDxJLFD7lI1ivbpTOOzhcSb9wUCNAijdbWQexJWY21vzHP6mLKgTykluWGCKoz25gjSif3psemX8/Es7ZahAQbNjzQ/4OKRJVKtWuuO8DTFbBEJgb2fUQPS/Rb0VhURo33jydtv/sXEMEy5M93d3p4ylVoN7LSyAtWY9WNhBN0btP9+P/YR6zMxCTGPdURQET+kofowOypz3JPEVPUPzjg6gk5riLH6z8cKLL8VvzWbdIY823vYAWPkcWRyjEcceUT/4lCeNIUq5nE79hTYgf/FRKKu+meOuJ+NY5bGdaUKCMGrsbKcEombqCvQ9UMw9uhrfeewBkb30YCEvJv/6Bhz2gT4awBphB2bmOK1VIF9j7TMviCmqmCr78l/jzDzZupLkNx9eHXE7NqEIxEMgtAcp37vbTMFDsipqHP0T48Sct+SaZhZMSr9ZZbSsLUmL2Q1a+fg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	osQvFUVY7WpOvhjAQjinlorZjvJK3l1vbbjw1E7DiaT/HXxycxUP04xdhYNzvKw5tFiEyR4CEZWHZDWzDlIsREWdqubTKiK+5sWyiahm4/2xVaBHMez26AS7nIcZn00oInmtBnoYsKtr0Gvn3MyTd9NfOGQ5v/iJwsxIXtzF8O6G1w24aCZwznPnO8MJzgCRDuFUmQLydweWgOZ4ojvOkzNeP4EMKFzNin64g69ycg+3p7Jr2eeusOYBwDbafmUcNKXuASwc+M8p1rkHWKCfaPy8rQ2FkfSWXnoul7ueKQEKaIToHsAT4tWpNXG5rqebcaXaNlOMPDXIpZ0B1qHFlrWFHTOtqlfC/v8vfJDK7LqvSoWhE76xP9poVccSCjbvaCoUi+rdFXLqlmV1H32+sKypmD3fgjRzlkCMxT43ALoXBjsg7SdazJhQKODlru6d
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 23:21:00.0721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0d3098-7dbc-4b22-77db-08de94332a05
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6843

The PMCCNTR_EL0 in NVIDIA Olympus CPU may increment while
in WFI/WFE, which does not align with counting CPU_CYCLES
on a programmable counter. Add a MIDR range entry and
refuse PMCCNTR_EL0 for cycle events on affected parts so
perf does not mix the two behaviors.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_pmuv3.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8014ff766cff..b5d2f60af6f0 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -978,6 +978,29 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 	return -EAGAIN;
 }
 
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
 static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 				     struct perf_event *event)
 {
@@ -1011,6 +1034,14 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (cpu_pmu->has_smt)
 		return false;
 
+	/*
+	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
+	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
+	 * prevent inconsistency in the results.
+	 */
+	if (is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus))
+		return false;
+
 	return true;
 }
 
-- 
2.43.0

