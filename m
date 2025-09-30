Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD0917A2E6;
	Tue, 30 Sep 2025 00:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759192009; cv=fail; b=cCTKF+dKMo4N6AlYM0I+iMU/KmltWUJ6kiYgyFcF970icOS21xvNHdbrVt8DYCYVXhvb80nd65/tCXV7rtYhTRaXMcgaJYBk4rncDpXUSDFhusYvnIfP1YaWad7iHnRsqgeg/28z3MPXQyMfmKK7qHZ/VcT4xpPNBooWT/DmKnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759192009; c=relaxed/simple;
	bh=1ycY9a0yC2MW9La5g8hI5YaXErdemXyTLrGarAcGENU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I4Ri1Itq/GsuoYC5jYVC33YpUsgyR80QIeAkp7EvQE14hGeKMtkwicZb25qqLtxRhF9LPch3WFE9sLXmTcm0TKIRSpRVEkoa7D9kozkvGiC6gCuUzxBsHjMVxfjEUvJxj9qVJHAsuweis5q5LL2fdAV0SWkeGJnY9PIET2pLLTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qO6m9y2w; arc=fail smtp.client-ip=40.93.198.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qO6m9y2w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUAE8l2zWeMhsIAwaLKa+7NcTLVQ/TELX076gT3u09XTs7NMGET9Y1OK+Q5wdVlZOma3aVinzNkKbCCPdBrTWkPKknj8OIb1AkxOOHbC2mOdyBI6A1frn7hbarTkoclGl0Q1p+6jogb05+Gf0TXPFHB3NYKBWM+nLafQs4m4qCCnVuXy9oJ1cZ4sUzM+s3BAoUFrKNcl/rqIIz0YL+qaSkuSrAS/vZm3FH20+7mENbHqHztxvEA6Tk+k6jJ+gFraHiQ/7cd7mMsXf5KHuAldRLyAYzOyJ7x6myi20UrRS2fcYWEI2wry7EJpQJTirnHEIbbzSHQkjzywf51VYSkAtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmetoKOnyBobBLXxHYNFkmrwPQ0aQpyJYfd4vvXp0ZI=;
 b=hKpgtwQ7KEnXE/ZHo/whwn6LY6Rrz84KvbYygeBq2C4vecRWeArf4EY3iY0or08oE4kYufyZH4pnOMo7DcRYhP3VqD8dCqIuymqGU9lonvOHZCNvoNs/Xjuu78C3wTWv67QBsZJ8n6boeWnBFm/qpPOUjHLXJlI0PkM7m4o/l1ZlLRH4f5qp0SGIP9i3lk3+DN0pDmbH/TyNI6sqzfpwGX0DGghtyFAXh2ejsi7nXLR3TKeOtJT32eAhQANFAwHvseqrFnbxobxjAlbx+2yymM76po49UGL3nN1wMea1A1PhPfm7FMTF6ZXMdr5X2QYah2piRp77q4aOdCmWfnyZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmetoKOnyBobBLXxHYNFkmrwPQ0aQpyJYfd4vvXp0ZI=;
 b=qO6m9y2wRYbZIFDcRW+2M18B8r6MEgSiW+jL35UK5IsDTGYUbifkhnGYqIHbeLiqyoggbinv/kylkdIC1O2NK90XYs/Fpeo/IYsFd4NShDIU+f64eLDIcYGG/ztRatKypjUvf0D/0GLen3d4lDzOxkVlebSCZxflSzCeOyqw9jI7h9gFRm97lzVrCd1QQmwKAh9Ou/iBZR3Su3UsvjwA09WhPU6crKLeumWbgt37HR12Uwqg1AolMQJG6lSmeO7CHyEW+2pZdNlIaT5sWKY8+hCD2pLeduLD74QGm46mmn4e5UCBuvZ4xWxM5UiTAokFp3fM/T5j9Wv2VG/i4WI0Og==
Received: from BLAPR03CA0046.namprd03.prod.outlook.com (2603:10b6:208:32d::21)
 by DS7PR12MB6190.namprd12.prod.outlook.com (2603:10b6:8:99::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 00:26:40 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:32d:cafe::e1) by BLAPR03CA0046.outlook.office365.com
 (2603:10b6:208:32d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Tue,
 30 Sep 2025 00:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 00:26:40 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 29 Sep
 2025 17:26:30 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Sep 2025 17:26:30 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Sep 2025 17:26:30 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <bwicaksono@nvidia.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>
Subject: [PATCH v3 5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 support
Date: Tue, 30 Sep 2025 00:26:04 +0000
Message-ID: <20250930002604.346306-6-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|DS7PR12MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: 05149ba9-3f20-417b-7346-08ddffb80683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pkaXUtVd7QVDl5VkLb186VWKRhybE8iY8f4tXqRumyROKQGdZ8QgLoG1s8nK?=
 =?us-ascii?Q?Gy0I1J0vBiILRKI+SR22D48gtmFR73kNPavCzxaKLmgYyK3Hb/hQPZ1rlg13?=
 =?us-ascii?Q?1DBI8geRvLr0rRmHWI6bHDa+/ormZg7i3QFTRir+FyUmXEadFY2RqxsrraT9?=
 =?us-ascii?Q?h21dr+PFRiqnX8qinl5Kud+QArpREI+L1GyaIXrHr3aLWBPes7MrcWtmTigS?=
 =?us-ascii?Q?836B+I5qxRr8MP6oeWPngwPGqmDiB1sywJthNekyitgkdJ2EcYbR3tUD9pIx?=
 =?us-ascii?Q?fnCVmwObvbeSbGvkITD4PCMW2fT658eZkPAW2SnItcEZ5fWba6WzviCd0fiZ?=
 =?us-ascii?Q?PsB1GuhwERc460yl6nHhg7+hqXsMrs5awEAzC7GATGop6Ssf+7mEOKF0L8s9?=
 =?us-ascii?Q?Y3henDrGqSsfn7rUE7AqOjKilXGXxb7MT03tPMrsZ9hT2YDXY5NdGmWQk4hx?=
 =?us-ascii?Q?VHj+j0FpeYn4+6StcKXfJLGp6pC5TO0dY2IdaAy87S2zYLJZwrKME2W7HsT3?=
 =?us-ascii?Q?EMWcO5+XmFgA4pLmGjo0EYT+Ybgd7E/gn0/0mZf7aFU6Zs19XADlwzCUJo1N?=
 =?us-ascii?Q?1uA+YJOaAMR9xEu/Ux0QaOE83kHeTF1oYk0aGEWRN/+R5glEvo/28ruQ4iRl?=
 =?us-ascii?Q?cnktnS/0jI9Gy0Mg0w3DIDstQO/6SN3v4nY894Won45WmEtTusfb1GtR/q3T?=
 =?us-ascii?Q?gic4B/ApB/or56GKs798uLhKVmFqIEw85T6rwjejg/KBojZrMmsxK3r+KKki?=
 =?us-ascii?Q?sDEB4H7K6QFl3fucopAuDi/gWJgQ+qtmxvmRpeCytTIg3K77qWoy0+6HHXZM?=
 =?us-ascii?Q?SwL04FznPJ/eXh0D/zMsRcEJXnuINFBiVnu8cni1UKrn84NvsP/nvEHjehse?=
 =?us-ascii?Q?iXyrro1Kbz1ILc/54yi7HTKYBlz2Zj8x6chao0lNClS75AH9bdBxfFcvRBq8?=
 =?us-ascii?Q?bSs/9FTRhuFDayh6gRQg/qt+PYkZpq6Lvh9YH9zMRw7taFGTSQaT2aDX9+66?=
 =?us-ascii?Q?ZgV6LKkZyfj6Jr4xWZt+YMNGoRkyRJuo3KAGOmt9tXKG483HD8Sho6OEeBbV?=
 =?us-ascii?Q?PCI6855yWAWjVu+YbT61hUHYO8WjaY9zN+Tv+0nPvboJUDWlgBilZCjfYJD0?=
 =?us-ascii?Q?Kyj8CQdkh8tpQinFQUwiZnf5GvzNsqJ2hsMz5z5H6gjVQ/HwkBMrLoq+KvPe?=
 =?us-ascii?Q?Kvo1XGUhFR7P9G5CoV7j2ovfTfWNB5DIVOSMDob2yoGds9GjX+DpxjJvmdX4?=
 =?us-ascii?Q?7Af8gTyqZp7/IKH1114xvtQPQXltmy/EhLijA6x1Hg1gfW0MB46D1g4kLfan?=
 =?us-ascii?Q?MRUY4lo0LOtRn2bAJcGhymg3LSVJJK0+l4X7Evcb2a8KkV+mZ8xtAWKFWDlh?=
 =?us-ascii?Q?VxodIwN6+M08HJOcmlwfP6129lu9X1L+LKPLjbMDHRIVQjoCwPdFPmqtKHtQ?=
 =?us-ascii?Q?L+f3HN/QcqkXKBy6LTEjmHnLZCzVl+f0s5BWQJYbaT/8YV1cfIxbK7dHJAp0?=
 =?us-ascii?Q?IRrI2aFiRxMG4qVWSJJs9BzI5TEUTkiM+od7oUHJMqAEnTu6ykK/B8RO0l2N?=
 =?us-ascii?Q?sHeTpXR2K8+oD4/O4T0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 00:26:40.3066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05149ba9-3f20-417b-7346-08ddffb80683
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6190

Support NVIDIA PMU that utilizes the optional event filter2 register.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 176 +++++++++++++++++++-------
 1 file changed, 133 insertions(+), 43 deletions(-)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index ac91dc46501d..e06a06d3407b 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -40,10 +40,21 @@
 
 struct nv_cspmu_ctx {
 	const char *name;
-	u32 filter_mask;
-	u32 filter_default_val;
+
 	struct attribute **event_attr;
 	struct attribute **format_attr;
+
+	u32 filter_mask;
+	u32 filter_default_val;
+	u32 filter2_mask;
+	u32 filter2_default_val;
+
+	u32 (*get_filter)(const struct perf_event *event);
+	u32 (*get_filter2)(const struct perf_event *event);
+
+	void *data;
+
+	int (*init_data)(struct arm_cspmu *cspmu);
 };
 
 static struct attribute *scf_pmu_event_attrs[] = {
@@ -144,6 +155,7 @@ static struct attribute *cnvlink_pmu_format_attrs[] = {
 static struct attribute *generic_pmu_format_attrs[] = {
 	ARM_CSPMU_FORMAT_EVENT_ATTR,
 	ARM_CSPMU_FORMAT_FILTER_ATTR,
+	ARM_CSPMU_FORMAT_FILTER2_ATTR,
 	NULL,
 };
 
@@ -184,13 +196,36 @@ static u32 nv_cspmu_event_filter(const struct perf_event *event)
 	return filter_val;
 }
 
+static u32 nv_cspmu_event_filter2(const struct perf_event *event)
+{
+	const struct nv_cspmu_ctx *ctx =
+		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
+
+	const u32 filter_val = event->attr.config2 & ctx->filter2_mask;
+
+	if (filter_val == 0)
+		return ctx->filter2_default_val;
+
+	return filter_val;
+}
+
 static void nv_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
 				   const struct perf_event *event)
 {
-	u32 filter = nv_cspmu_event_filter(event);
-	u32 offset = PMEVFILTR + (4 * event->hw.idx);
+	u32 filter, offset;
+	const struct nv_cspmu_ctx *ctx =
+		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
+	offset = 4 * event->hw.idx;
 
-	writel(filter, cspmu->base0 + offset);
+	if (ctx->get_filter) {
+		filter = ctx->get_filter(event);
+		writel(filter, cspmu->base0 + PMEVFILTR + offset);
+	}
+
+	if (ctx->get_filter2) {
+		filter = ctx->get_filter2(event);
+		writel(filter, cspmu->base0 + PMEVFILT2R + offset);
+	}
 }
 
 static void nv_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
@@ -210,74 +245,120 @@ enum nv_cspmu_name_fmt {
 struct nv_cspmu_match {
 	u32 prodid;
 	u32 prodid_mask;
-	u64 filter_mask;
-	u32 filter_default_val;
 	const char *name_pattern;
 	enum nv_cspmu_name_fmt name_fmt;
-	struct attribute **event_attr;
-	struct attribute **format_attr;
+	struct nv_cspmu_ctx template_ctx;
+	struct arm_cspmu_impl_ops ops;
 };
 
 static const struct nv_cspmu_match nv_cspmu_match[] = {
 	{
 	  .prodid = 0x10300000,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = NV_PCIE_FILTER_ID_MASK,
-	  .filter_default_val = NV_PCIE_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_pcie_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = mcf_pmu_event_attrs,
-	  .format_attr = pcie_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = mcf_pmu_event_attrs,
+		.format_attr = pcie_pmu_format_attrs,
+		.filter_mask = NV_PCIE_FILTER_ID_MASK,
+		.filter_default_val = NV_PCIE_FILTER_ID_MASK,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = NULL,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 	{
 	  .prodid = 0x10400000,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
-	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_nvlink_c2c1_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = mcf_pmu_event_attrs,
-	  .format_attr = nvlink_c2c_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = mcf_pmu_event_attrs,
+		.format_attr = nvlink_c2c_pmu_format_attrs,
+		.filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
+		.filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = NULL,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 	{
 	  .prodid = 0x10500000,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
-	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_nvlink_c2c0_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = mcf_pmu_event_attrs,
-	  .format_attr = nvlink_c2c_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = mcf_pmu_event_attrs,
+		.format_attr = nvlink_c2c_pmu_format_attrs,
+		.filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
+		.filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = NULL,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 	{
 	  .prodid = 0x10600000,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = NV_CNVL_FILTER_ID_MASK,
-	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_cnvlink_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = mcf_pmu_event_attrs,
-	  .format_attr = cnvlink_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = mcf_pmu_event_attrs,
+		.format_attr = cnvlink_pmu_format_attrs,
+		.filter_mask = NV_CNVL_FILTER_ID_MASK,
+		.filter_default_val = NV_CNVL_FILTER_ID_MASK,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = NULL,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 	{
 	  .prodid = 0x2CF00000,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = 0x0,
-	  .filter_default_val = 0x0,
 	  .name_pattern = "nvidia_scf_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = scf_pmu_event_attrs,
-	  .format_attr = scf_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = scf_pmu_event_attrs,
+		.format_attr = scf_pmu_format_attrs,
+		.filter_mask = 0x0,
+		.filter_default_val = 0x0,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = NULL,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 	{
 	  .prodid = 0,
 	  .prodid_mask = 0,
-	  .filter_mask = NV_GENERIC_FILTER_ID_MASK,
-	  .filter_default_val = NV_GENERIC_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_uncore_pmu_%u",
 	  .name_fmt = NAME_FMT_GENERIC,
-	  .event_attr = generic_pmu_event_attrs,
-	  .format_attr = generic_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = generic_pmu_event_attrs,
+		.format_attr = generic_pmu_format_attrs,
+		.filter_mask = NV_GENERIC_FILTER_ID_MASK,
+		.filter_default_val = NV_GENERIC_FILTER_ID_MASK,
+		.filter2_mask = NV_GENERIC_FILTER_ID_MASK,
+		.filter2_default_val = NV_GENERIC_FILTER_ID_MASK,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = nv_cspmu_event_filter2,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 };
 
@@ -310,6 +391,14 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
 	return name;
 }
 
+#define SET_OP(name, impl, match, default_op) \
+	do { \
+		if (match->ops.name) \
+			impl->name = match->ops.name; \
+		else if (default_op != NULL) \
+			impl->name = default_op; \
+	} while (false)
+
 static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 {
 	struct nv_cspmu_ctx *ctx;
@@ -330,20 +419,21 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 			break;
 	}
 
-	ctx->name		= nv_cspmu_format_name(cspmu, match);
-	ctx->filter_mask	= match->filter_mask;
-	ctx->filter_default_val = match->filter_default_val;
-	ctx->event_attr		= match->event_attr;
-	ctx->format_attr	= match->format_attr;
+	/* Initialize the context with the matched template. */
+	memcpy(ctx, &match->template_ctx, sizeof(struct nv_cspmu_ctx));
+	ctx->name = nv_cspmu_format_name(cspmu, match);
 
 	cspmu->impl.ctx = ctx;
 
 	/* NVIDIA specific callbacks. */
-	impl_ops->set_cc_filter			= nv_cspmu_set_cc_filter;
-	impl_ops->set_ev_filter			= nv_cspmu_set_ev_filter;
-	impl_ops->get_event_attrs		= nv_cspmu_get_event_attrs;
-	impl_ops->get_format_attrs		= nv_cspmu_get_format_attrs;
-	impl_ops->get_name			= nv_cspmu_get_name;
+	SET_OP(set_cc_filter, impl_ops, match, nv_cspmu_set_cc_filter);
+	SET_OP(set_ev_filter, impl_ops, match, nv_cspmu_set_ev_filter);
+	SET_OP(get_event_attrs, impl_ops, match, nv_cspmu_get_event_attrs);
+	SET_OP(get_format_attrs, impl_ops, match, nv_cspmu_get_format_attrs);
+	SET_OP(get_name, impl_ops, match, nv_cspmu_get_name);
+
+	if (ctx->init_data)
+		return ctx->init_data(cspmu);
 
 	return 0;
 }
-- 
2.50.1

