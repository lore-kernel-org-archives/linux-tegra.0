Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831563D811F;
	Wed, 25 Mar 2026 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443488; cv=fail; b=c1s8aT1EOxX5/kM8NQuT53u1BukKy1EHffhhS9xMzcxmKjCGiRJ6GD8+H6VipHNE+U2fGqsAk6qGsLL36IyEw+yPGBRdWVBkM9HsiIw+I0ZkVjz3jjIBafA664bNEaZCsop58xltOs2pGTgM7sCqvnuCVeBzojgwKbKV5Tf4G+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443488; c=relaxed/simple;
	bh=9mTPM24P2grYElLAkIXnOBvQ6fnCGQ8Lla8qwyZTDkc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RrtLtAHIffzhOrW2OgqLvoplATtjnRdMXshWikQO/ROs/qDh/XSG4Ds8GL/oBj32N+ZTzpdAfPRYhMhRvjyRiqTRoRpNMxxZ/w03ohLTYh2yloV/g2U6+xHbzTSBXXKRW94oTdp9u2BGuCeHtWFGRvAOChAbjxJgoa72Tt3tRZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hI9p9UNp; arc=fail smtp.client-ip=40.107.209.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hI9p9UNp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0YjRSRMXi/4IWWKbp7GLSmmtOqsykgh6gvnkwS6NjhwfXDVILeYMScJLBqektr1gLPhvZ+5YRv/4iHgrmVvXMqK+mD2FXKQQKe1t+lK9/pnNPFTitZlf12YJ1urz0ymddYSCSOq1Vo2r5kDbp09utPOYFYUjmDY5yLUgfVQQ56StwFNMFAqCDq+LctB2iuuMwUu+MH7Fi6biuHKUielu6x/+JEbG4DBHeErUatCV950rQBnV39WlUbBGjxLq3gKPdt7kypeDnyvcoGzbwlRhSSYAxugCI8MHgFAd7aiVwKK+8fc4nMZwMJVw9D6nayAKx3o0DXzb2kDss+/90aiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uQQ2kD0jYyvppGS/+9ZKZV0mr1xw2VTs/BC/OQ/qVg=;
 b=N274LZK6ZYXFNr/24e5WIs14SwqOFwluCDYH/8Ob/Ilxg2DFianHMcvPlYm67yh/5nE6XuFI42zyssyIA9ODzN+8TgcTDPXTwTLhaWXeRiA1Hwn4/c1dFrjq2m+CB9SjCUexe9UW0qDgraimGYohnn5gRhwqmVaAoZat4J855sl3MyrlANHP70tw6qthOdNvlG6PZe6TPQ8tfE7AcR/ZFMFp+HBXbKicQWihBZTgY7vkfmWfYPf6US5A5PN+uEqRq9O3uS9u4RUBPEXFICIC17dm5/IFC/0OhM+OkwA0UyRgXPzmjrClkHFGJX1Gan26gqsfWhK5NMpe/TI20q52Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uQQ2kD0jYyvppGS/+9ZKZV0mr1xw2VTs/BC/OQ/qVg=;
 b=hI9p9UNpvrdJXS/UQOXrJ9j/ELq7+xz0J3+VTZoLj2G+QocPkXDWsxm0hQFfKRF3DZvFDMW2lEP97q80+akm7jTomuinEwtvX5v8XfanySQUyY0YpugKUglj4X4pAXZu5/Dy/nAc3V7P5UgMhV1TYsP+0l06FlJQnHX0NxmPLCzpPpXTfC6hsf8VSBOJHjQijT3ULHXg4xnAHSlXJbQoYq1WExX+b4QSJDOD6mPMyma/n/63lHtzz1IK1wgKxHasjLQXfa3ttBRcFrAqWKg+pcizaPTlBRNK8fxIxL6jjDDKarX/tltXXCfRx4wsXj+/SP5Wgi+0BOjN1jZf3njDmg==
Received: from MN2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:208:a8::23)
 by IA1PR12MB7637.namprd12.prod.outlook.com (2603:10b6:208:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 12:58:02 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:a8:cafe::22) by MN2PR12CA0010.outlook.office365.com
 (2603:10b6:208:a8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 12:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 12:58:01 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 05:57:41 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 05:57:41 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 05:57:38 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 2/2] soc/tegra: cbb: Add support for CBB fabrics in Tegra238
Date: Wed, 25 Mar 2026 18:27:26 +0530
Message-ID: <20260325125726.2694144-3-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325125726.2694144-1-sumitg@nvidia.com>
References: <20260325125726.2694144-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|IA1PR12MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ac1dfb-972e-4bed-2d2e-08de8a6e25ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kp/Z15/qT7EKZTdwEKUgN2EhnNCYx3ZUpUV4ji4CgP72afvJ+xzCJPY32Esgu/sXEwvaF4Or0uTtM0Eym2ZNPlGaF5JSCNIEVUbkkHDTsMnDmrWutIvdKTRDak9SP6Q7qK2SymUZ35ZH7hssT6l+BSD1gFGeex4rPuyAltg/T9iWEWHBpgqvHj1zDGGf05aXhQrSTynXTxfW9ydwCcz5tAn/rHqDIWTlZ+qwX8/obOwP5DxROwUGxDPHQrMj0VasEYh/TN9dAtZSVlD25c5HuQOU7prefJ7I1x39w27ewfIqUgvpm4Y1gYycUbAdhc5he22DZm8AGT/PF9UDbRu4ms4ef6BKGMg9JlWmzKdsNlDn9XZVyrNjajjK45d9li97TCV87uXMQZFxc255QfbgGbB55UV8+OUElhQhjs9MslDhvJEzBuT/bItgK83g/J1ptvW9ju235rUmpVOcStmgRz7v8YW1NZqT5PDIcN6y9SGdOejAKcwov71cLYMTqMz8Wsrsn3wuwN+ACckPxu9olw/i6YwWxu7g9vKcS4+ieRPDNL0j8zFkc5+k3wzc4wE+6FTt+c56NLbWDnKzzXFCD1GAoL/aq51VSzrH7xZlKgE1PJvtZK+j9Poq25SvRsWZ7gnwCmhPin9BVTqksywlf7nKiK1N7ZO6GHAHuzwwHNuR3mE55H5retX/niIuem6+stbxWZX1C1Ng3Lb09BHrgZ+EFF7okMKazjHNfbsbWBJixC3BKy/wmEaHcSlzJFfxp7WKACdkcwsYDuv3We9pEg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Bq9wPd76WCs5/7y765ZINerrZalVCMLVLhOot1CGKBPtIdOLWYTvWMVgxlM6zsQcgIYoq0Ke+Ep5PQqX//Z/HKQSSoQVwUgvV4Aodw5rvnL6ni98PrP+Y915lswtGbJSc6y3UmjBJfr4x6ainaTACH47YyVrqyF6xBBqPcxCjH26HMVFA5wEOZc/4hTI2teMM0eDxdW/tfg0fQBTXthN+GZwsyw9F3I91UMPUY6WxjV6yvUfaiFq2l725k1Fyld9vJ+UlcaJ9LJ0PQrDq+0R506Cxpp132RM4mfo++8RRwJTz49rTRD2lR+X6sgYyb8vIJPUc3khdPUksIsB9dHoVFsY4EFoKPAbZygByIRGjGt7fJXy3RvaFEP0/qwYx16w5QwWUGvGUrPagsIx/Dpo+6WKTs0ddT2c+4Oj2B4FhQne/zukfMxGBZjR+si63duv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 12:58:01.9873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ac1dfb-972e-4bed-2d2e-08de8a6e25ff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7637

Add support for CBB 2.0 based fabrics in Tegra238 SoC using DT.
Fabrics reporting errors are: CBB, AON, BPMP, APE.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 134 +++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index a9adbcecd47c..30f421c8e90c 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -89,6 +89,15 @@ enum tegra234_cbb_fabric_ids {
 	T234_MAX_FABRIC_ID,
 };
 
+enum tegra238_cbb_fabric_ids {
+	T238_CBB_FABRIC_ID  = 0,
+	T238_AON_FABRIC_ID  = 4,
+	T238_PSC_FABRIC_ID  = 5,
+	T238_BPMP_FABRIC_ID = 6,
+	T238_APE_FABRIC_ID  = 7,
+	T238_MAX_FABRIC_ID,
+};
+
 enum tegra264_cbb_fabric_ids {
 	T264_SYSTEM_CBB_FABRIC_ID,
 	T264_TOP_0_CBB_FABRIC_ID,
@@ -974,6 +983,127 @@ static const struct tegra234_cbb_fabric tegra234_sce_fabric = {
 	.firewall_wr_ctl = 0x288,
 };
 
+static const struct tegra234_target_lookup tegra238_ape_target_map[] = {
+	{ "AXI2APB", 0x00000 },
+	{ "AGIC",    0x15000 },
+	{ "AMC",     0x16000 },
+	{ "AST0",    0x17000 },
+	{ "AST1",    0x18000 },
+	{ "AST2",    0x19000 },
+	{ "CBB",     0x1A000 },
+};
+
+static const struct tegra234_target_lookup tegra238_cbb_target_map[] = {
+	{ "AON",         0x40000 },
+	{ "APE",         0x50000 },
+	{ "BPMP",        0x41000 },
+	{ "HOST1X",      0x43000 },
+	{ "STM",         0x44000 },
+	{ "CBB_CENTRAL", 0x00000 },
+	{ "PCIE_C0",     0x51000 },
+	{ "PCIE_C1",     0x47000 },
+	{ "PCIE_C2",     0x48000 },
+	{ "PCIE_C3",     0x49000 },
+	{ "GPU",         0x4C000 },
+	{ "SMMU0",       0x4D000 },
+	{ "SMMU1",       0x4E000 },
+	{ "SMMU2",       0x4F000 },
+	{ "PSC",         0x52000 },
+	{ "AXI2APB_1",   0x70000 },
+	{ "AXI2APB_12",  0x73000 },
+	{ "AXI2APB_13",  0x74000 },
+	{ "AXI2APB_15",  0x76000 },
+	{ "AXI2APB_16",  0x77000 },
+	{ "AXI2APB_18",  0x79000 },
+	{ "AXI2APB_19",  0x7A000 },
+	{ "AXI2APB_2",   0x7B000 },
+	{ "AXI2APB_23",  0x7F000 },
+	{ "AXI2APB_25",  0x80000 },
+	{ "AXI2APB_26",  0x81000 },
+	{ "AXI2APB_27",  0x82000 },
+	{ "AXI2APB_28",  0x83000 },
+	{ "AXI2APB_32",  0x87000 },
+	{ "AXI2APB_33",  0x88000 },
+	{ "AXI2APB_4",   0x8B000 },
+	{ "AXI2APB_5",   0x8C000 },
+	{ "AXI2APB_6",   0x93000 },
+	{ "AXI2APB_9",   0x90000 },
+	{ "AXI2APB_3",   0x91000 },
+};
+
+static const struct tegra234_fabric_lookup tegra238_cbb_fab_list[] = {
+	[T238_CBB_FABRIC_ID]  = { "cbb-fabric", true,
+				  tegra238_cbb_target_map,
+				  ARRAY_SIZE(tegra238_cbb_target_map) },
+	[T238_AON_FABRIC_ID]  = { "aon-fabric", true,
+				  tegra234_aon_target_map,
+				  ARRAY_SIZE(tegra234_aon_target_map) },
+	[T238_PSC_FABRIC_ID]  = { "psc-fabric" },
+	[T238_BPMP_FABRIC_ID] = { "bpmp-fabric", true,
+				  tegra234_bpmp_target_map,
+				  ARRAY_SIZE(tegra234_bpmp_target_map) },
+	[T238_APE_FABRIC_ID]  = { "ape-fabric", true,
+				  tegra238_ape_target_map,
+				  ARRAY_SIZE(tegra238_ape_target_map) },
+};
+
+static const struct tegra234_cbb_fabric tegra238_aon_fabric = {
+	.fab_id = T238_AON_FABRIC_ID,
+	.fab_list = tegra238_cbb_fab_list,
+	.initiator_id = tegra234_initiator_id,
+	.errors = tegra234_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0x7,
+	.err_status_clr = 0x3f,
+	.notifier_offset = 0x17000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0x8f0,
+	.firewall_wr_ctl = 0x8e8,
+};
+
+static const struct tegra234_cbb_fabric tegra238_ape_fabric = {
+	.fab_id = T238_APE_FABRIC_ID,
+	.fab_list = tegra238_cbb_fab_list,
+	.initiator_id = tegra234_initiator_id,
+	.errors = tegra234_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x3f,
+	.notifier_offset = 0x1E000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0xad0,
+	.firewall_wr_ctl = 0xac8,
+};
+
+static const struct tegra234_cbb_fabric tegra238_bpmp_fabric = {
+	.fab_id = T238_BPMP_FABRIC_ID,
+	.fab_list = tegra238_cbb_fab_list,
+	.initiator_id = tegra234_initiator_id,
+	.errors = tegra234_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x3f,
+	.notifier_offset = 0x19000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0x8f0,
+	.firewall_wr_ctl = 0x8e8,
+};
+
+static const struct tegra234_cbb_fabric tegra238_cbb_fabric = {
+	.fab_id = T238_CBB_FABRIC_ID,
+	.fab_list = tegra238_cbb_fab_list,
+	.initiator_id = tegra234_initiator_id,
+	.errors = tegra234_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0x3f,
+	.err_status_clr = 0x3f,
+	.notifier_offset = 0x60000,
+	.off_mask_erd = 0x3d004,
+	.firewall_base = 0x10000,
+	.firewall_ctl = 0x2230,
+	.firewall_wr_ctl = 0x2228,
+};
+
 static const char * const tegra241_initiator_id[] = {
 	[0x0] = "TZ",
 	[0x1] = "CCPLEX",
@@ -1480,6 +1610,10 @@ static const struct of_device_id tegra234_cbb_dt_ids[] = {
 	{ .compatible = "nvidia,tegra234-dce-fabric", .data = &tegra234_dce_fabric },
 	{ .compatible = "nvidia,tegra234-rce-fabric", .data = &tegra234_rce_fabric },
 	{ .compatible = "nvidia,tegra234-sce-fabric", .data = &tegra234_sce_fabric },
+	{ .compatible = "nvidia,tegra238-aon-fabric", .data = &tegra238_aon_fabric },
+	{ .compatible = "nvidia,tegra238-ape-fabric", .data = &tegra238_ape_fabric },
+	{ .compatible = "nvidia,tegra238-bpmp-fabric", .data = &tegra238_bpmp_fabric },
+	{ .compatible = "nvidia,tegra238-cbb-fabric", .data = &tegra238_cbb_fabric },
 	{ .compatible = "nvidia,tegra264-sys-cbb-fabric", .data = &tegra264_sys_cbb_fabric },
 	{ .compatible = "nvidia,tegra264-top0-cbb-fabric", .data = &tegra264_top0_cbb_fabric },
 	{ .compatible = "nvidia,tegra264-uphy0-cbb-fabric", .data = &tegra264_uphy0_cbb_fabric },
-- 
2.34.1

