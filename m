Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967232E2841;
	Tue, 12 Aug 2025 23:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755041919; cv=fail; b=HNOsXyTyUR1hLkVG/CsQAiYZcWCEfUTnxqu63tBPcKIXeFgDL5KjzZmwgl2dk1+7RvavSnbBScoV3u/BoPHFBaRdMoEmGOb4TI2BuzU/SMp1y9LjZHBcIoFL5hdr8ZP5KeIYkFbV/biz+Mfu4CFZxF1NFsm07xhLiS/Af6VDinE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755041919; c=relaxed/simple;
	bh=ofRgUBVyGEA2F5IfZd6c5rpxQ8fHhTIdOmodKP80trA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gS0WhtOjIsM5R+okkRavhsF7e394tbD0HeicyZapUjfsUUsArmNfdt9TG4jpqxKkhUvJ2zVi9gD2Yyklib3bIs36KHzGI0C8oGk/2yPxY73feVD8o3nAjXvtA7fNMtbgMQOFiaJ50Jv9FQ/MrKoHwIJOjY93qi6cHTH4lEb4wnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RlxhnSpB; arc=fail smtp.client-ip=40.107.236.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RlxhnSpB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3ks3NTP/+e5p8jtpJkaEZTzXK3KHoq1du9q+0WxRuqmkOK3gppVy0Jt3v6lErFQFN6b57xfUMh5ICN/saI6TEyzMZqG8npjl8veFfrWZNEvYj5+tUWVk/2CbK3P2xOXl+j/wYalHxxiBDpkMJwkFXFG0xiU9qhdDkfHdyewJSZ+zvxnF6ZfIGVYYzixzbFHR86UbWbILD8nW9iSJEKquk3K0ty1o9IWRV9iCOPCSnNr4i0HD+vbZFSO0kDzYAcPyYIbFeLAXcMX+m5dntVajmBG5dr/OpR/NIIM+v7DALn900vizhNRj8PPvaTM5ohQPnxIwHtBW3+d7rrv/8JjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdUp20CwHo0CxEW1RUJltgWW6FBhD3qOFzZIfSD7jvY=;
 b=as0SZCTMGmj/ig9AKwy1bIVsmUkDKfspIdtQ4i749ArWaaKMnsxX9Dy1amGvxaLLgZhEWqdYBdQR7J6pOa++7E3BPjqh75cAh2RArSdSynr2N5aaEzX3IeZV1iruxr/n7NEDwUG/QYMaTC9jdSC/RFNl42JtLifvkcxkXyB5YaOCKUtmQ3TR9Z0G+dnCUVnuO47+uFKkwXLwHTKxcbvwnf/DJxCm3LQAVD9EzFbBRYt+Myuqw8y3d2XibZf6GzKyNgMoKyPjAvJKYqpW7j15kJBt9JJQfYaubnTyPf0qnu20n4xcJnVA1qipDi4ZcXKFycziT2HvJbnmvH1DnfJxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdUp20CwHo0CxEW1RUJltgWW6FBhD3qOFzZIfSD7jvY=;
 b=RlxhnSpBfUSRjqAVsTA5cqB/sNBWEUdP2Wb1ByrCXOvs3v219J1ecosAK1E+ZbKOCaN8KfVjbROf6MF0DHNsJj2PdoFtOP3QChy5qr8vG4EPJ1q/GtrILs7lz+63r6svumo3A2sW1IySjI/qlbhp/7R7HaRKKlxZVjxDpINoN0b0V1QtK7o7Spohy1Z3t6yJTaRZ6Mer+RBjQvczCPKeTVE6/n+xoy9F3v5wI/87aCCoIn7i9rwLaf/khcOcDn5bhwopIiSv9LumxlinS9l0mVWlqMvesgCngLHASpoI9uBwDrHpQyiVjLbzviOuJAvKbe29hkHoFbxRxDDyBCbMBw==
Received: from MW4PR04CA0314.namprd04.prod.outlook.com (2603:10b6:303:82::19)
 by SJ5PPF6375781D1.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::995) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Tue, 12 Aug
 2025 23:38:27 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:82:cafe::f9) by MW4PR04CA0314.outlook.office365.com
 (2603:10b6:303:82::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Tue,
 12 Aug 2025 23:38:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 23:38:27 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 16:38:13 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 12 Aug 2025 16:38:13 -0700
Received: from build-bwicaksono-focal-20241114.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Tue, 12 Aug 2025 16:38:13 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 4/5] perf/arm_cspmu: nvidia: Add revision id matching
Date: Tue, 12 Aug 2025 23:34:10 +0000
Message-ID: <20250812233411.1694012-5-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SJ5PPF6375781D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 1484f458-7248-493a-8133-08ddd9f9565a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?61Bx7bUUdob2hcz6dY3DZBUeUQ4/qL9jZ0R6YAC93R4MbHO7d6E+mzPPhB99?=
 =?us-ascii?Q?WbhGtIjP85DF1ZzPnqUZZCIMeBJcVCGRuRnhUWniNjVFgB/7TdLHP1qP4jJd?=
 =?us-ascii?Q?eoNw7rFre2BRRsA/jFvhMmeZOJele/okHxIP9NohcxtHPgB4GtGTPU607WAq?=
 =?us-ascii?Q?otAF/GWqPqJatl9qyskwWsGdl7OfTdg882+cyJqWWHiKeVqd9MSBqXc2YSTY?=
 =?us-ascii?Q?079XKucGhJCq5stI+V8XxM7H35YBKSMTzwb9Zqcw1NUzD/D/5w9o+1of1jEz?=
 =?us-ascii?Q?rspidohe5HXG4Sx6oYAWWC4Eoah9Sd4e7LoxWgEOm07UuV6Bu3ZVFCnoqeHE?=
 =?us-ascii?Q?7xtqkU4WVOJKPCw2j3+B96lM/ne/eqUK/F225tQa/KMJ5GnexY/CK1CcBBwA?=
 =?us-ascii?Q?cI7zoFpSByDPz0Gni44uQXQq4kS6cyRwSXdsw2EkdcjEKXbI4sTPQKBn7DvH?=
 =?us-ascii?Q?xQIpumocZJNjTvKwj+2Ode8k7yWiasdVc/fwN4m8Tk1YBixsrm0phBA+dLIx?=
 =?us-ascii?Q?bhU5GQ/y4b9FIQSn3znJOmbPFCeRyQSGgoPnNaXK98GexZvFMb+UxyP4PUXs?=
 =?us-ascii?Q?ZIe4qVUtYGnqCnw50KDjJyp1HUAi+N3FFlnvDHPuriNPd1XwUpcTJs0vxE9o?=
 =?us-ascii?Q?e9clRg8HTx3zOhUXS/HdeaA/S7xbeFDCp/UtOTEdI0Jq3olljB3ZlH+0MbY0?=
 =?us-ascii?Q?LHj5W6Xm/GT7KOZgnUeDtXMSSxSRfhJ2IJxWBkgrZCtQPBMO9rDQwSeWPFY6?=
 =?us-ascii?Q?YFcgPTiCaUoBfbXgue0P995qjz3q0j8z21jzKNscy6pxojF/xnsi/1MR7BP/?=
 =?us-ascii?Q?066TnDYXenAHS6A2g5IzVRLE4R4r/dviWPdGrr4ae4/Tg/WpUZmnmsErkFVe?=
 =?us-ascii?Q?GDmwg2Exipy8kTl4pfCNYOtTaa9EmOr41gDh4P8SzQI7+dXi56CYO/TRcfjm?=
 =?us-ascii?Q?W7G1A0Xa2zWEViVJxv4vpDrxUGTyqJQdoPh9A7GCXvNAqVGBRjGiqorgXEv0?=
 =?us-ascii?Q?Cf3jg7PoZv3by4/jPiofLpBd3Y2GZ39TlGwDEmtc1uI9B8AgZ8OHN9psRvO9?=
 =?us-ascii?Q?kXCzrXd1+rZ+1TPckpDce9OkrMSdfx2rx8mb5O3QipMUKAyZxObnMx+QpGmO?=
 =?us-ascii?Q?uZQdYyfuXcjblXNDsW2uwy08Lyul97WkCS9Tn9eUtg5JiRJxGfmVgvSjHIgT?=
 =?us-ascii?Q?UJMwJEXTMnBYuzxcs6bm2PK2KDYXdiFYS2U8sm97gJRhk9fs2RWBEJvhKH2r?=
 =?us-ascii?Q?9GBazR/vhYa23e6GowTGPP3T1axcV+/ra/NTV7+Zuxhlkd53FZ3VWwCxIktv?=
 =?us-ascii?Q?4MwP+zUUxQqsElvUxSVP1Kuv6CRm/qp2W82kLfpOmVo0zHo1YoUXYEO5szYj?=
 =?us-ascii?Q?zbsy5q121I9vtfp6H2l+cksNnFC/hAOhmhHb0V7rT6jnDGSgD+0asaAMkn9C?=
 =?us-ascii?Q?2FaKyh8nEXsrVgsUWaxOXbQeCLnonraQwCsvmvNDVJzyopJLtAaZKE4DPd4p?=
 =?us-ascii?Q?ZcW1ACUauLgMZGEtcpsTSbm5fH1orUQVUNbp?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 23:38:27.4470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1484f458-7248-493a-8133-08ddd9f9565a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6375781D1

Distinguish NVIDIA devices by revision and variant bits
in PMIIDR register in addition to product id.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index b6cec351a142..ac91dc46501d 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -23,7 +23,7 @@
 
 #define NV_GENERIC_FILTER_ID_MASK    GENMASK_ULL(31, 0)
 
-#define NV_PRODID_MASK               GENMASK(31, 0)
+#define NV_PRODID_MASK	(PMIIDR_PRODUCTID | PMIIDR_VARIANT | PMIIDR_REVISION)
 
 #define NV_FORMAT_NAME_GENERIC	0
 
@@ -220,7 +220,7 @@ struct nv_cspmu_match {
 
 static const struct nv_cspmu_match nv_cspmu_match[] = {
 	{
-	  .prodid = 0x103,
+	  .prodid = 0x10300000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_PCIE_FILTER_ID_MASK,
 	  .filter_default_val = NV_PCIE_FILTER_ID_MASK,
@@ -230,7 +230,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = pcie_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x104,
+	  .prodid = 0x10400000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
@@ -240,7 +240,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = nvlink_c2c_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x105,
+	  .prodid = 0x10500000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
@@ -250,7 +250,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = nvlink_c2c_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x106,
+	  .prodid = 0x10600000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_CNVL_FILTER_ID_MASK,
 	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
@@ -260,7 +260,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = cnvlink_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x2CF,
+	  .prodid = 0x2CF00000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = 0x0,
 	  .filter_default_val = 0x0,
@@ -312,7 +312,6 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
 
 static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 {
-	u32 prodid;
 	struct nv_cspmu_ctx *ctx;
 	struct device *dev = cspmu->dev;
 	struct arm_cspmu_impl_ops *impl_ops = &cspmu->impl.ops;
@@ -322,13 +321,12 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 	if (!ctx)
 		return -ENOMEM;
 
-	prodid = FIELD_GET(PMIIDR_PRODUCTID, cspmu->impl.pmiidr);
-
 	/* Find matching PMU. */
 	for (; match->prodid; match++) {
 		const u32 prodid_mask = match->prodid_mask;
 
-		if ((match->prodid & prodid_mask) == (prodid & prodid_mask))
+		if ((match->prodid & prodid_mask) ==
+		    (cspmu->impl.pmiidr & prodid_mask))
 			break;
 	}
 
-- 
2.47.0

