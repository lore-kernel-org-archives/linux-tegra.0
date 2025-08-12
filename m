Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B352D7817;
	Tue, 12 Aug 2025 23:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755041910; cv=fail; b=RHhg/GXLXFNLfrEh4fvxElmJ6cugLs6Dla4WzSjAlxvk3MaXxIOLnHZq/yqZY+9nAoSVdn6+Vdb7burmzUgH8YD/6XrUwc/PXymwELEMc5ocviLR3k+AK0LRu3kegL2F8UvDUTszngBd+DIomPDote0nju9BV+i5uCsyURG9nD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755041910; c=relaxed/simple;
	bh=tRMMbliGRt3qDWq9qcYj6mPpINF4OEINWRm5l/ijz5w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kavTk+Dpjuo18AWQ27zkoPXD93KvgBXtkKfzgOhod6IKTTdcpaZZk4Jv36tmWj3sNnXq7VQBZyFDo1qd5GVbhDj0cJRPEE9OP4rLz4MQh5+nxftA3wJebvjHNaH3FujDEaf0uGIKs/6RqSWQL7tIl+yWDzSE1RXo7zJzNIJgYnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XAGwfr2N; arc=fail smtp.client-ip=40.107.243.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XAGwfr2N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qV+LQnTVy9A/ajjWVkKeX8z9CJWidUugKjnmEhsSKS1hNdpa47Olv5Kp0CYwywSEi1fdEHk+TxtSnelL3wc2Wd0qGs9F7xu4JpnGwfYPaX1Ewv6bB6mmGHUrQLTQt12MRbJjCh1USm+cF+bRIZV6TwPEwy0syFOk59t44lWJcCaVY22DDb3cwZErrBPpBwWWuBCImQ+lH/DRxupxnwCM6jV/e6s5KBhBw0ekrgnVjWfInEMCkJ772eWdz5vuMM2gQXtpwCtxxEwoCOr2FVD/LbV+be0rWnt2Tr2HI2qXbxErfnjX4c3gpSD9BZQkL948GUbAs3dtV/5jegdmMijCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzDzDJeBZoAP8HwBpIf/Koyyztj9/rRxu1JuawWohfM=;
 b=yld0cg9eVYy2TxJcAlNfKdouyeWAe8ZquFiO/WuOKTXrXlJY0FzOOx2y3vSZAWqsOtbHHJw/C3t0A663S7L32Wn9L4kHojhbiZYhrB2jDr2zIQKwOlDQCIRBtAbUrjQNFoY7hdA2u/j33h+8sM+89gvFFmlu6blDxFtgVE+5fSuAxHUaSDwHDRx4R4vv+r8j8K7cRkSQt1389il29hv15/8uliqyPY7lxGRK/a0CcFYou2+QV4+udCHoYace0oZA++rjaaEFuabUepsLjoGS8g0i0c3OzZfkyQmPXaXu+bGvGOvsf0Cxp3x/krrGgBaQxN7qbWiVrSBH7BZgGWRLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzDzDJeBZoAP8HwBpIf/Koyyztj9/rRxu1JuawWohfM=;
 b=XAGwfr2NjKrLyxCn1G728wJGFUERVZ7DKLmVkyYtmnNyNlfQvW/y1vhl1fOwNtGl0miaeId2d0tQWfy265V8fGRXvVYHhaJUu01wDRviPZkftc7AGpdxtjGO2ODRbjDRHqcQmII+Y2BvBQD8ZFiv8HqXZeCbv/OVYdfEgC1Wfs9TlBAqfXRNOYtCGEpu6y9ZmWt3UszI5TGMMhb78JDn9u98IDuOBZQc4YEzKbA/MgxverHkva0ukGLohSzLeyYDXKgdhQ0olLsl2wQgqZCsUICd0nvxVilmsF7W0C/WJlK1wynU1YfiL+GiefMCmJASaDV9713E0vO2mvhqYYbN7g==
Received: from MW4PR04CA0307.namprd04.prod.outlook.com (2603:10b6:303:82::12)
 by BL4PR12MB9722.namprd12.prod.outlook.com (2603:10b6:208:4ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 23:38:25 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:82:cafe::71) by MW4PR04CA0307.outlook.office365.com
 (2603:10b6:303:82::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Tue,
 12 Aug 2025 23:38:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 23:38:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 16:38:11 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 12 Aug 2025 16:38:10 -0700
Received: from build-bwicaksono-focal-20241114.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Tue, 12 Aug 2025 16:38:10 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 3/5] perf/arm_cspmu: Add pmpidr support
Date: Tue, 12 Aug 2025 23:34:09 +0000
Message-ID: <20250812233411.1694012-4-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812233411.1694012-1-bwicaksono@nvidia.com>
References: <20250812233411.1694012-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|BL4PR12MB9722:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d32f47-b23c-4cb7-06f9-08ddd9f95522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iTWCoNWErRZDfcAUXn0v39OdWspv7AowONHf0GylEpCj1Q52NPdO8eYs/pyF?=
 =?us-ascii?Q?T6c0nKoOTPAqHlW8Xmxz/35tLVncFrBF3T/v93gC5ZBVnPXghl4GTEhYhM6v?=
 =?us-ascii?Q?SaJCPxXUGn/Jy59lwVGwg0tqGIp6oZ/1ht8XcmJAPPZPsN+dkiAlSctBwh1n?=
 =?us-ascii?Q?V/uM9k4jP+CxR1VIK8vbly66pnhXUlzSY6iXHXouWK2/8NEaHzQ8dsCNtVUh?=
 =?us-ascii?Q?OWI1P6x/u8He5kIVcusnADM98lURmEUn14DlenzSfk52wdGy6Kfl/9p8ydNJ?=
 =?us-ascii?Q?/5/yo2BHnHiXz9oTgs7lxLol4YwG5NBSgLTut4AMwkpdY7lkSGu9tkLarfN1?=
 =?us-ascii?Q?VwsHs2OL9FLPlgllLcwvzFPa89WRv3vcWKbcp7c5mEHzV25nWi1HvIHYGJoc?=
 =?us-ascii?Q?AeRb9jMoH9w+0TzJtV4+9NP5y+rVx1KkttckdNd92YKxX3irXohN0LA1tny8?=
 =?us-ascii?Q?MSqRotwR8yeX8k4jLcKh4Jg+ToO7JEWYqtmiY3M3pakAqlofjaGLuTNpd978?=
 =?us-ascii?Q?miVuqsKIC3seORUOQP/ndBbFmBRODmVVx/wFESxN239Msj7v+6sjC+L4EJho?=
 =?us-ascii?Q?7y5qeWEVzGaJpVelPvQ+n5gJXkfOn3QhodHG4bPYdxm72ZQ5/ctbrl/vB4I4?=
 =?us-ascii?Q?W917ErtbPvGTYHALFXoOLC/15ETiUd1BQ/jjECupxjlr3KVXI8s8DMbs6GKd?=
 =?us-ascii?Q?mtA+jyrDI6DMdu/rc0BoEi+ocM6iB/6ZL+1q6Eur2HPt04ajXEIHdYJrnlWl?=
 =?us-ascii?Q?JlyyLUTQJ9/K0GKfBglmsW6jZ2xdXZoQWTDSMWZsnysK5+QnObRe/YANjbGo?=
 =?us-ascii?Q?WcPW9sNgCD4Uy7eP/UJshfG6xe9N9dNUcLzOKqcreaTHBu+J3ewCbT+tcIBs?=
 =?us-ascii?Q?9RLl7YmSrD3iZF/wrfdPBYuXxzbBnrHvro0SwOW9HcZKqZ6MG3X4Nat+en4t?=
 =?us-ascii?Q?pj5KwdGU/QSqunjGkEUXwX9Ns2gp2UNYaa6JcwNYLEwEYbKIvdLZPi7xSzK8?=
 =?us-ascii?Q?78/cNsZ8a9ApU3vwRgQo6qE+2gdq3yYdyoe2ltCisC9evAZ2hhYhGouLUYUV?=
 =?us-ascii?Q?GjAFPYhB2kOziWMkEFnns1vorq4XwpMZ0Dd53k4Mrkd9bLBI2lOPg/YLKMgy?=
 =?us-ascii?Q?dda4cekIHIXKB2P0QahD8jjd5rBg2s8BGHq8+LDMKicvfyL8nnZJPTvy9a25?=
 =?us-ascii?Q?7Ydn4psYqM0V7oy1hrdEN7raY71Ce7DhRwXGs83gTbcPyw0QbqFPIpya2RMV?=
 =?us-ascii?Q?akqsMR0ojKYyH8G/91o9p/G519JNtx0nUfrJEHIJ0Ofh/HePLOX2Ha/21R6v?=
 =?us-ascii?Q?Mh0aUbDBh9oiQbghIlaXZ0e+gZm+usGYq7d9Iqug61pwJTLqIVq+sTSYGmuN?=
 =?us-ascii?Q?UzLEjGNe0/f/ITS3c1972ALNVvI4rtiERKTa1mplS0Vq07zasR9Y2b+2vLPc?=
 =?us-ascii?Q?59GJB8sFqwmwg5X9Lrk/noaliP3fLBzhZGUpkDXN6EzGdYt7TR04qQDmmXhh?=
 =?us-ascii?Q?IrK3fhHj1RxgTt3emNb34Sf9YFIOpER8vQf8?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 23:38:25.3843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d32f47-b23c-4cb7-06f9-08ddd9f95522
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9722

The PMIIDR value is composed by the values in PMPIDR registers.
We can use PMPIDR registers as alternative for device
identification for systems that do not implement PMIIDR.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c    | 44 +++++++++++++++++++++++++--
 drivers/perf/arm_cspmu/arm_cspmu.h    | 35 +++++++++++++++++++--
 drivers/perf/arm_cspmu/nvidia_cspmu.c |  2 +-
 3 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 595e4bdd0b4b..347aefbd1704 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -323,14 +323,14 @@ static struct arm_cspmu_impl_match impl_match[] = {
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
@@ -352,6 +352,44 @@ static struct arm_cspmu_impl_match *arm_cspmu_impl_match_get(u32 pmiidr)
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
@@ -362,7 +400,7 @@ static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
 
 	/* Start with a default PMU implementation */
 	cspmu->impl.module = THIS_MODULE;
-	cspmu->impl.pmiidr = readl(cspmu->base0 + PMIIDR);
+	cspmu->impl.pmiidr = arm_cspmu_get_pmiidr(cspmu);
 	cspmu->impl.ops = (struct arm_cspmu_impl_ops) {
 		DEFAULT_IMPL_OP(get_event_attrs),
 		DEFAULT_IMPL_OP(get_format_attrs),
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index e3a4dd068805..7eb150abc3b7 100644
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
2.47.0

