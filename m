Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D082918DB1E;
	Tue, 30 Sep 2025 00:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759191997; cv=fail; b=okBIt3/Z9DrYqfVSqS1Zk1LfOovLTK0gbRCTLBvxR7nRRw3WivYw6qVc2bbGowhPqu/Dp00ULSlAYfevJDhuzg87AaGYepkieaM5npCKmYxOPFOIEopR6+kA0E4DKjSlafmKWAV/yBsgP6GOOL746vZ2KC4a3K50sre/l3A5O1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759191997; c=relaxed/simple;
	bh=JFERSEupynMX3jBP4gNuvR4+n8HHL+9Tycbku332uLc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sSVhwTYU/aB5x7+tGmSgF5wn1uHBwmV/T3alWTB6Oe2PRMRdGStO2rmEGxegKfeUWgD6fLaY+M8vwZb3Rk3jkV9IV+4CKdHP02aFLwNvTJQeFK7bTnJRpSebGKm+qpFISDhQK1Rs3MIwEuGWDAhvgHc6xTxSmCETm2JujGnYzu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=se+BYk8s; arc=fail smtp.client-ip=52.101.43.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="se+BYk8s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIbQYUXcghHBZyrcOPon+hKO6KiYcxxcG6wLapTJ8HJPGgcB5CnrjrqSTKLFGrv6UsuhP2lv5KVsEwj4Iu98GNVw78Cl1Ut5oXdQ0EIziO+dcpkFlFfBraFEXeSej0wJUQg2hGA77EaVxX8RMTEvuGKR3K9GI8n2eQKUILPrrThazGVysi+jYGhECJdAmfS6h3NFNbenB3q+6gspLh2V241jASCuAxLFyiaOJfgfIng7Fn30unzibZ8NVlGMcux76GB0mvbSjfT3cbaSaRF4PRPHzpN9Mxez0+En5rvROnfeJqfggFpApmS/cN2/3klQniAD5pbNi7TFSmRH4wdFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uw9ddff5EeW40rwZIau4/WS9uvwG8OGYNZUFacjqCGQ=;
 b=UM08Br8o9B9X2ZTjliWaUazwaBPb0aRTYWnRfkXTXYuONL/Qh7PBGkCeJjzV5pMCpVMlvCRG98OqlnOZ0Hx12QDNgsQnoVmXBFaTBh2sEy//ENOtPwSDP6c4eIGiqIv9clwFmy5wJGntNgOe3+AGDL8Cck1XMwMY9KBxLGMvVsSRteg6dfnJ9jZ83/giNMy8aw5wfr66J0R9mRZD7K0r8c0Rj9i+sEzUwu2KpYuqpK1+KyqHaKD7Q5oTtxcA/KqupMgT1ScuEKbmo5vM/VglHZUA1AwreEjlx79mCUuTOpFsRwu5AYFnH8+MKqaU+meOijIwlxxWR2fZE1tDJC61WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw9ddff5EeW40rwZIau4/WS9uvwG8OGYNZUFacjqCGQ=;
 b=se+BYk8slXddTqjuUehPCo74F+L8owZ+dIABEW/CiycEatEuukY3YSWc6NR1ExDW7pU0fPrErH1dlqBwgOWyQe8K6M7GkE2ktyX6aMEKSUKoybNOXGia6GYCRLmTib5POqbn+zQ+CxvT9jIWWlXNNCpX/HUhquHdNvBkCqxZOCKB6j8alr5rYeXJ89FxSpp28HvOoN1Y2BNff4jDouzhrvs5WhMgHmC+4dXw6rP1hyHyfsHwCFuusvnc4A4DtEo7EljOuKnIWc8qyLApNELsY5kWSL9f3EN3Wbmg9cp+M9OVoIXAcyvURTe/g2BFJoTy/QTBs0CZArnT0trcpzeQzg==
Received: from MW4PR03CA0335.namprd03.prod.outlook.com (2603:10b6:303:dc::10)
 by MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 30 Sep
 2025 00:26:32 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::6e) by MW4PR03CA0335.outlook.office365.com
 (2603:10b6:303:dc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Tue,
 30 Sep 2025 00:26:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 00:26:32 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 29 Sep
 2025 17:26:25 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Sep 2025 17:26:25 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Sep 2025 17:26:25 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <bwicaksono@nvidia.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>
Subject: [PATCH v3 3/5] perf/arm_cspmu: Add pmpidr support
Date: Tue, 30 Sep 2025 00:26:02 +0000
Message-ID: <20250930002604.346306-4-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930002604.346306-1-bwicaksono@nvidia.com>
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 211089ab-dd18-405f-6574-08ddffb80195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m+KTqU2eH082SAvVAQJ7hOKMlTo1G2pGyMXX1PkawbIQREeN7ANtEtMFaQt0?=
 =?us-ascii?Q?G1hWF8z30Hsqat9TmrUVnT/36bm2uBjZYY9Uvza9YRVokqVBK18qQxz3r40y?=
 =?us-ascii?Q?1WJMxaJRc/uVqZ4Fx7mwnvmM8nKE1wLwSGgN9PdgXTvBA2uQcKJxXw/3lPZ3?=
 =?us-ascii?Q?JbZgNJJCCPKEeb2BYG0xTHBHRG80BCnTJHvDcevYPmyaTdkRJWg6X/x2grik?=
 =?us-ascii?Q?yJasVTB197aV8/QHs3eEtT1kXoZoF+XLxAHXmxpl17zPQw29C8+3qiUv+mdp?=
 =?us-ascii?Q?vCySWKJJCVqsI1N0xRuBGOAgRv8Juhaaid+dGWgZCKF7H8niSpbam0jtvHEU?=
 =?us-ascii?Q?8AatWhUFzBEnVCRQjqz3QnExyEBQpjdYxY8h7r/0PLmjtjIy3hKOr4HDQltJ?=
 =?us-ascii?Q?qHxJKiBQnwcLdxm4vxdJ5PZHAHrw2M0D8apAPFLO25fpPttx/cvDnRYP6Pwg?=
 =?us-ascii?Q?b7Qb+FpKJvCTTwxXDxYP39NYNtcQtI6d2xgb/5t9vI62wVFE2/k4cxenaqd3?=
 =?us-ascii?Q?WaMj4DYsX0WMGOnyNqnQ9l1mLT/cRIBgGWu7KHY1gKRU4gldjDIGyb7slqqW?=
 =?us-ascii?Q?dR/JMndOX7dd6PsRqvS9mcPQ6kVNIHTXBcjqhsPUlNu4LIZ4I6AC8J8oOcJL?=
 =?us-ascii?Q?aLg1Zmiu1WRH8M2k8PolAxCxvfUvPpwXDRQT14C1nilwl1N/hOU6DlCajZdp?=
 =?us-ascii?Q?mi90/SSNcg9XMiwam7r4//80ZT+TY7iYqNJeTwifc263hTztcAbHWyLKKrxT?=
 =?us-ascii?Q?lnesjbyI2bdcAS109vjA1k15fRtyvGyGSHTd6VbKhPx1xVMcMUWWOKsvTsy8?=
 =?us-ascii?Q?N+vOgbhEBRnQCkA4d5Z5W1/hjn3LbxCoJAlh5BxzOvlsNsQ7UVqqiKNpzR8i?=
 =?us-ascii?Q?s86oSYo/8yC8o/dfnlkFU67tsDz9nYqgRenE2IGw0AKkiX8PjsIkuG+78vzq?=
 =?us-ascii?Q?7THS8Zu0VCdg3vUlfvt7rXVXZoRE9OnZJ5JWd12Tu9fLyZF2b8vW1zP6ZI5q?=
 =?us-ascii?Q?RGhxa/u7nXpt4Bmx3ldO5yuzCPXp9Jrli+9ScSBUrcLKaTq65Q5H5/9HMfk5?=
 =?us-ascii?Q?eeLGfvwKamKR0AgdHxsuI1P4va/yF2El3Vjt/itfXCTDmTbnIl6BQby58kpD?=
 =?us-ascii?Q?Xw42hlDrYM2uqt1ocrK14bbSEBmyWFFChkY0Yg1F5Qm1NT/jYhk8sT8OPAcz?=
 =?us-ascii?Q?CS7oieVRKaXbqake2zsNdiKHawwL50Q8oge9yV0T7+QBg6Y9yBD4RWs3+fm6?=
 =?us-ascii?Q?LrDlgn1poM+laE3Ncsb0We4e9jGFhyX53BFCKegqygdVybymNZ3C+3rJH5xw?=
 =?us-ascii?Q?LFJMRIpDEVmGNoXng87I13tPd87bzASIN392jA2dZRGi35snpkXvpv60fW7Q?=
 =?us-ascii?Q?IRW/lHVO03WWa/xJT2K6TNHG94DG2IzrFX8ZhCy00DWWNT0Zp6L0FaQ9yY3B?=
 =?us-ascii?Q?zDwbr5VcJQ7ToMF/l7TAVnYkZwIPs6Lu93zJEmBZcS4hvJk6IJZePeUcUCQ1?=
 =?us-ascii?Q?PlawGmE40DSGfoOZ/cG5Q2nrdEWoY5+82QlqewoNhBs5mi9rKUxeBi6YTXWl?=
 =?us-ascii?Q?LcaEgL7Smhvi864nh/4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 00:26:32.1161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 211089ab-dd18-405f-6574-08ddffb80195
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

The PMIIDR value is composed by the values in PMPIDR registers.
We can use PMPIDR registers as alternative for device
identification for systems that do not implement PMIIDR.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c    | 44 +++++++++++++++++++++++++--
 drivers/perf/arm_cspmu/arm_cspmu.h    | 35 +++++++++++++++++++--
 drivers/perf/arm_cspmu/nvidia_cspmu.c |  2 +-
 3 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 43770c8ecd14..d0ec1eb8272f 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -322,14 +322,14 @@ static struct arm_cspmu_impl_match impl_match[] = {
 	{
 		.module_name	= "nvidia_cspmu",
 		.pmiidr_val	= ARM_CSPMU_IMPL_ID_NVIDIA,
-		.pmiidr_mask	= ARM_CSPMU_PMIIDR_IMPLEMENTER,
+		.pmiidr_mask	= PMIIDR_IMPLEMENTER,
 		.module		= NULL,
 		.impl_init_ops	= NULL,
 	},
 	{
 		.module_name	= "ampere_cspmu",
 		.pmiidr_val	= ARM_CSPMU_IMPL_ID_AMPERE,
-		.pmiidr_mask	= ARM_CSPMU_PMIIDR_IMPLEMENTER,
+		.pmiidr_mask	= PMIIDR_IMPLEMENTER,
 		.module		= NULL,
 		.impl_init_ops	= NULL,
 	},
@@ -351,6 +351,44 @@ static struct arm_cspmu_impl_match *arm_cspmu_impl_match_get(u32 pmiidr)
 	return NULL;
 }
 
+static u32 arm_cspmu_get_pmiidr(struct arm_cspmu *cspmu)
+{
+	u32 pmiidr, pmpidr;
+
+	pmiidr = readl(cspmu->base0 + PMIIDR);
+
+	if (pmiidr != 0)
+		return pmiidr;
+
+	/* Construct PMIIDR value from PMPIDRs. */
+
+	pmpidr = readl(cspmu->base0 + PMPIDR0);
+	pmiidr |= FIELD_PREP(PMIIDR_PRODUCTID_PART_0,
+				FIELD_GET(PMPIDR0_PART_0, pmpidr));
+
+	pmpidr = readl(cspmu->base0 + PMPIDR1);
+	pmiidr |= FIELD_PREP(PMIIDR_PRODUCTID_PART_1,
+				FIELD_GET(PMPIDR1_PART_1, pmpidr));
+	pmiidr |= FIELD_PREP(PMIIDR_IMPLEMENTER_DES_0,
+				FIELD_GET(PMPIDR1_DES_0, pmpidr));
+
+	pmpidr = readl(cspmu->base0 + PMPIDR2);
+	pmiidr |= FIELD_PREP(PMIIDR_VARIANT,
+				FIELD_GET(PMPIDR2_REVISION, pmpidr));
+	pmiidr |= FIELD_PREP(PMIIDR_IMPLEMENTER_DES_1,
+				FIELD_GET(PMPIDR2_DES_1, pmpidr));
+
+	pmpidr = readl(cspmu->base0 + PMPIDR3);
+	pmiidr |= FIELD_PREP(PMIIDR_REVISION,
+				FIELD_GET(PMPIDR3_REVAND, pmpidr));
+
+	pmpidr = readl(cspmu->base0 + PMPIDR4);
+	pmiidr |= FIELD_PREP(PMIIDR_IMPLEMENTER_DES_2,
+				FIELD_GET(PMPIDR4_DES_2, pmpidr));
+
+	return pmiidr;
+}
+
 #define DEFAULT_IMPL_OP(name)	.name = arm_cspmu_##name
 
 static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
@@ -361,7 +399,7 @@ static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
 
 	/* Start with a default PMU implementation */
 	cspmu->impl.module = THIS_MODULE;
-	cspmu->impl.pmiidr = readl(cspmu->base0 + PMIIDR);
+	cspmu->impl.pmiidr = arm_cspmu_get_pmiidr(cspmu);
 	cspmu->impl.ops = (struct arm_cspmu_impl_ops) {
 		DEFAULT_IMPL_OP(get_event_attrs),
 		DEFAULT_IMPL_OP(get_format_attrs),
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 188a884b4494..2022163959d6 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -87,6 +87,11 @@
 #define PMCFGR				0xE00
 #define PMCR				0xE04
 #define PMIIDR				0xE08
+#define PMPIDR0				0xFE0
+#define PMPIDR1				0xFE4
+#define PMPIDR2				0xFE8
+#define PMPIDR3				0xFEC
+#define PMPIDR4				0xFD0
 
 /* PMCFGR register field */
 #define PMCFGR_NCG			GENMASK(31, 28)
@@ -116,8 +121,34 @@
 #define PMCR_E				BIT(0)
 
 /* PMIIDR register field */
-#define ARM_CSPMU_PMIIDR_IMPLEMENTER	GENMASK(11, 0)
-#define ARM_CSPMU_PMIIDR_PRODUCTID	GENMASK(31, 20)
+#define PMIIDR_IMPLEMENTER		GENMASK(11, 0)
+#define PMIIDR_IMPLEMENTER_DES_0	GENMASK(3, 0)
+#define PMIIDR_IMPLEMENTER_DES_1	GENMASK(6, 4)
+#define PMIIDR_IMPLEMENTER_DES_2	GENMASK(11, 8)
+#define PMIIDR_REVISION			GENMASK(15, 12)
+#define PMIIDR_VARIANT			GENMASK(19, 16)
+#define PMIIDR_PRODUCTID		GENMASK(31, 20)
+#define PMIIDR_PRODUCTID_PART_0		GENMASK(27, 20)
+#define PMIIDR_PRODUCTID_PART_1		GENMASK(31, 28)
+
+/* PMPIDR0 register field */
+#define PMPIDR0_PART_0			GENMASK(7, 0)
+
+/* PMPIDR1 register field */
+#define PMPIDR1_DES_0			GENMASK(7, 4)
+#define PMPIDR1_PART_1			GENMASK(3, 0)
+
+/* PMPIDR2 register field */
+#define PMPIDR2_REVISION		GENMASK(7, 4)
+#define PMPIDR2_DES_1			GENMASK(2, 0)
+
+/* PMPIDR3 register field */
+#define PMPIDR3_REVAND			GENMASK(7, 4)
+#define PMPIDR3_CMOD			GENMASK(3, 0)
+
+/* PMPIDR4 register field */
+#define PMPIDR4_SIZE			GENMASK(7, 4)
+#define PMPIDR4_DES_2			GENMASK(3, 0)
 
 /* JEDEC-assigned JEP106 identification code */
 #define ARM_CSPMU_IMPL_ID_NVIDIA	0x36B
diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index dc6d4e3e2a1b..b6cec351a142 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -322,7 +322,7 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 	if (!ctx)
 		return -ENOMEM;
 
-	prodid = FIELD_GET(ARM_CSPMU_PMIIDR_PRODUCTID, cspmu->impl.pmiidr);
+	prodid = FIELD_GET(PMIIDR_PRODUCTID, cspmu->impl.pmiidr);
 
 	/* Find matching PMU. */
 	for (; match->prodid; match++) {
-- 
2.50.1

