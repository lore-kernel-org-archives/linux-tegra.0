Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F6236402F;
	Fri, 30 Jan 2026 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794298; cv=fail; b=MXDycixDAFHdApIKE+RxrvMZ3t1Bw9LmYEdMy71J1fyDodBtbW1X4E6sv7/tdyRdq55HqIylLOcg8vxK+rQDvnRZqmd2nf6XhjilMRVL+fG/B/siWDDFZ3gwlPuJCy3kMPCUAJkzbzrS2IxPph6MF3KMhMW1SDvh+wSoFLTT3p0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794298; c=relaxed/simple;
	bh=CBBwQqZxHyW+OKn9lzwHyuWtMfQCzxnA2m+TzEkhWaw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s4q0vU2jWQkrZpkZKPefdmW7fdZHE8ObNyzfKizavKK2ux+gJGCNvB1Wy+TXcU9kmpE2BJ24yw7TyU+czPNc5ysHWmrHoFslCCbYAMdPw+N+QAimMsvuDCzj7h7rlBz5eNqT4FFgJ9MSOsNarJh/5hJEnjfPsNpRGT9LsECrIXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AepjnHkr; arc=fail smtp.client-ip=40.107.209.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AepjnHkr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKAm5VBRvzl8I2zNC+zTXY+8Ca01k9xyRsJuozLfrEwoXN3VSsgL+pvbMblVgAG37Ne60r/Y+Fh6hYdySjlaUK/WkNRgGUT2R6k22s1iDssPOLSFvs8pjMsnetSNu2ofwKqwBKX9F1jOWcFqDim1hPSZk2DP1HGtJFc9HHpDKfw5YiPtkRYHxqpywQHN2lQEQYN9FjfICQNEjBhTfpYyZlSpyrlxEANm7YFApIo0GlvP/ItTDVNq35fTrYd4M/uKZujUDpOJythTAsPjKAZV3Km6TBqpbnQVWbYPPtQVbLtVXojOuqGwKbwQ3avmS3435q8HhL3e5RHf02g/E1w9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0orgAmKDcVUUwmbxpc8vaZUtOs0YpUbY+CdgUCFv4c=;
 b=H/DuqnRfk9VG4yx5LzQ7yXn2p0oyP0KswZoH6NIkDrGRnAdbLBDMqd3jijxZGkCl/CZXmCx+Keh35kLQoVcuJUxRFeCi8jeqXsq09T7Owl8N9WWLa4xQNSAZoEq8e5041b25/tdLijqiTQ1KelbVRxyF8ABamoqRSe2V+BJreT/Lp3a1hjpqP37WIMOMBoEI0t1kfpI3QHDX9JUNTTHBYpvN/hwvuzAstcUhy4dIXjQQbhBC6zJjKqVeTIfT9PVlownHoDDkdKz5OWC5fNOGSjh9wEQPzpKcKa5vyqtB8wYnFvSbbFAdEwIvhOuvt2wjuXN4j/xx3SrWBQnlOKsu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0orgAmKDcVUUwmbxpc8vaZUtOs0YpUbY+CdgUCFv4c=;
 b=AepjnHkroI0I2+Ny8tMIKoNR2N07j6Tz4KaJLUMQkhc9B+UgMwGIAL40vLS79NcQoklC9FlsbJ1Xu9vP4jlt8ktAvY5w5nxt+LcXkzOkR3DjdDPjluxRGo1qQ7EKcAmhyZI13LAI9ydTqutlTW55TIxmpcgzMhx8owdIqyxbiT9cnRMOSMneRMqT1K1RfoX+8OGCeEI4ZJ8rykDR+IOeI873JjbfyJVcMYjY4jsLiDh+6gvEklkFJLsOLlQyko1G8TXJODz4L9R9B/EMrrCbI8zzVZZzR2ga7xudNEMZAqlwY9leCBAy/QQYJyyTjaEjVNv5dPeZxYV0tpngyFLH5g==
Received: from SJ0PR03CA0270.namprd03.prod.outlook.com (2603:10b6:a03:3a0::35)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 17:31:25 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::b4) by SJ0PR03CA0270.outlook.office365.com
 (2603:10b6:a03:3a0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 17:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 17:31:25 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 09:31:12 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 30 Jan 2026 09:31:12 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Fri, 30 Jan 2026 09:31:12 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v6 1/4] memory: tegra: Group error handling related registers
Date: Fri, 30 Jan 2026 17:30:52 +0000
Message-ID: <20260130173055.151255-2-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260130173055.151255-1-ketanp@nvidia.com>
References: <20260130173055.151255-1-ketanp@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|MW5PR12MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b57efe4-9c69-4d8e-2730-08de602564fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wv/Zu2udgwpIocTlG+39ThldvuVHiRm7J4d16B2nmB1lf/vOFKm95vPoyNhM?=
 =?us-ascii?Q?kW6mF3W5NCbLbesJv3ueHCFVJceje5zT2VL41T3Hc6Q/kICL5LXAY1E3FvWO?=
 =?us-ascii?Q?Lkza8o9CR777q3ZV4vtjmPOtj/9ZmZkNmS3n7repltTTqhWx9w+kVGD9IBwg?=
 =?us-ascii?Q?fkikorxj5ttHpf4irEJiUHNyRCkTxUiqEol+qaePTNXjcwpTh+0Ih/A3O7A+?=
 =?us-ascii?Q?d9HX4qBCcpN24bVPYB6x764lJaa5enObkJIJaSZ2TyEo+iUf6IYMrrec8R/6?=
 =?us-ascii?Q?w+ADYH0JVqrSZz7+5cCrXivrDrCjIAQxEAUZKm7NzrYGIEvejn8M5m6WNwcj?=
 =?us-ascii?Q?H5RK8pKDSo4aoMFvhW5Qw9lY0hcNABSc9N2NwkkgMxZHeiFTxWX9RzoN1b3E?=
 =?us-ascii?Q?vIq/rQUJ5QzzknTknAZQVRNbltvwY9REoOvKkjookZlXvSY/1dMNCoYd3bJ9?=
 =?us-ascii?Q?cMGoqGAzXesNTClS4OjX0J2KZ/P4ktNmLhBfeBYBnoIG7g55gz3MDlErDP2e?=
 =?us-ascii?Q?0x9DgPUIe0oAaRGfUtFWB+fCoiFQQQCxJ3ggmYcmtFyWa4K9f3cV/43AtVJ9?=
 =?us-ascii?Q?aJSR38LgoN5UXy4SOX/VlVRbBnAnrOYKHwB2rSs9W7yX1cI2xxkbp4ymhVOG?=
 =?us-ascii?Q?yCc6jfAAe4BB3gtJptfXiY7l3u3duedn3iAlmlHD2z5TNwVoNWh3C5mXqaaN?=
 =?us-ascii?Q?GcMxcpLtjZX8o8MrU8lRkjD/zDlB2bhFmGevQ5WZPC36t2GpPIgsXN6GUwjT?=
 =?us-ascii?Q?u7CFMbznoohDBIxQLfbiTUfp6ZLlyJ5GO4xvZpRVkbaEgsiLhrGqXsFv91Ox?=
 =?us-ascii?Q?sBD60iJrswoByGV7yIYNpbD00bqQk3JALq7XcihqM1NAYeZLtVjQaIpOyd36?=
 =?us-ascii?Q?Qm6Iedcze7nPBPffXGSRFCdqEhwiNVcvtOUP4XqY+VURn1L19eQnF/gvkoGP?=
 =?us-ascii?Q?/fvvr1Q2/84biSYaHYu4WE3IxK/5Op7OZFFd2WpT9IpevjACB8IhWtBJ6K/0?=
 =?us-ascii?Q?XwW8gTpm1CnekJIvZ1Ccj3cp7rE1WF5OGBi2eT8qP5MdmqhY3VvUUZtFeOUq?=
 =?us-ascii?Q?nDrbEyLLTBTGnkD1WtyY7KhRwnugkYL34BbwS9Swigj4PNfg6V4jsLL9dqRd?=
 =?us-ascii?Q?ze5QgedZ4UTUEUHtQVYGDM12UX1jBFpbz6DB3Q7CaNdKjpLFPRjEkWYsG1mN?=
 =?us-ascii?Q?G1NbBorF2p8KC+BuZFWmx6EZuK6h8nXKbrYI8mfjtMItJwjeX0w4UhrJKQmk?=
 =?us-ascii?Q?pSmaYNaFf5AuOvdwXl8jAf9DhloMTlvnKkuoMR4AyUW7lYXvKy/enUZZn5zX?=
 =?us-ascii?Q?QPipXSgEr2FbQnLaT6CbT5+DBocYX+chDsscE8gXMI/NJVJB/ujb7WuWDsm+?=
 =?us-ascii?Q?bcHYTnegq60042PfUlcgch2kZ3/++Nl8NcnIGJQtSlkZ7Z9BCPe3dpTc/YyO?=
 =?us-ascii?Q?/lk1mwjOTFzLZxv7ejKZoOUkIbe+/jCiO+dpYP7Dzh9nFouCbfTZzb6Rn9zU?=
 =?us-ascii?Q?U53OqKdv21w7UKE5H5DxxqpuB6WbjN49i/Gi20eP7vlKqLKV53BBGA5HEU28?=
 =?us-ascii?Q?dsTqL/3r86sB5h+x86/1pH845vaF9i4FM0ZKcoqz1BtlCGa4FwLpvuoJzNkx?=
 =?us-ascii?Q?/NZm1FVfsPHcVsHA4dzy+ewGI0HwXyFltv7e4V6qMKpRV80XHtuLU0ISietX?=
 =?us-ascii?Q?xKsjjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MIiz1n+2PeHKKt8he0zphO2SqXm25s9ePXpiMEqcJLN47y0ukm1VzT93sjKFMb4wTS2wSKcRJaNrwjKU3eD2WHgokb9v0+H/o/F6/xdl1f/t5K/vZC8if2BYi/MIjMlag/S/QJW3OPqA2nP6Ba9hLi/Vp/gyS9fr7sRv4mPbADCtbLPpuPIswxyXswHwm9ep3By2PKScmVUvfzJVaw4V6EOxNOubwZlPKO3O+L9PnY245dXSorbYlAUk2U7OqkLhe9Xs4wrErdFi91vzbSGZILV1EE+ElGxI+zrykBvGVRXB7p934gyPH9FdMGcGWlYHzh0DWe6w1/rq8pGRDNNtlFGWW2dIGfY/awLCuS6aIhLSnaLQ5f/THf8EVpVa1BOmKBEjSbk176wLxOnboz4JOaIjDRmGYu5chdssNE2sse530GdbB1rrhFf08dzmztdi
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:31:25.7391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b57efe4-9c69-4d8e-2730-08de602564fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652

Group MC error related registers into a struct as they could have SoC
specific values. Tegra264 has different register offsets than the
existing devices and so in order to add support for Tegra264 we need to
first make this change.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 47 ++++++++++++++++++++++-----------
 drivers/memory/tegra/mc.h       | 16 +----------
 drivers/memory/tegra/tegra114.c |  3 ++-
 drivers/memory/tegra/tegra124.c |  4 ++-
 drivers/memory/tegra/tegra186.c |  3 ++-
 drivers/memory/tegra/tegra194.c |  3 ++-
 drivers/memory/tegra/tegra20.c  |  3 ++-
 drivers/memory/tegra/tegra210.c |  3 ++-
 drivers/memory/tegra/tegra234.c |  3 ++-
 drivers/memory/tegra/tegra30.c  |  3 ++-
 include/soc/tegra/mc.h          | 22 ++++++++++++++-
 11 files changed, 71 insertions(+), 39 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 6edb210287dc..1dacbe2aba4e 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -56,6 +56,23 @@ static const struct of_device_id tegra_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
+const struct tegra_mc_regs tegra20_mc_regs = {
+	.cfg_channel_enable = 0xdf8,
+	.err_status = 0x08,
+	.err_add = 0x0c,
+	.err_add_hi = 0x11fc,
+	.err_vpr_status = 0x654,
+	.err_vpr_add = 0x658,
+	.err_sec_status = 0x67c,
+	.err_sec_add = 0x680,
+	.err_mts_status = 0x9b0,
+	.err_mts_add = 0x9b4,
+	.err_gen_co_status = 0xc00,
+	.err_gen_co_add = 0xc04,
+	.err_route_status = 0x9c0,
+	.err_route_add = 0x9c4,
+};
+
 static void tegra_mc_devm_action_put_device(void *data)
 {
 	struct tegra_mc *mc = data;
@@ -600,37 +617,37 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 
 		switch (intmask) {
 		case MC_INT_DECERR_VPR:
-			status_reg = MC_ERR_VPR_STATUS;
-			addr_reg = MC_ERR_VPR_ADR;
+			status_reg = mc->soc->regs->err_vpr_status;
+			addr_reg = mc->soc->regs->err_vpr_add;
 			break;
 
 		case MC_INT_SECERR_SEC:
-			status_reg = MC_ERR_SEC_STATUS;
-			addr_reg = MC_ERR_SEC_ADR;
+			status_reg = mc->soc->regs->err_sec_status;
+			addr_reg = mc->soc->regs->err_sec_add;
 			break;
 
 		case MC_INT_DECERR_MTS:
-			status_reg = MC_ERR_MTS_STATUS;
-			addr_reg = MC_ERR_MTS_ADR;
+			status_reg = mc->soc->regs->err_mts_status;
+			addr_reg = mc->soc->regs->err_mts_add;
 			break;
 
 		case MC_INT_DECERR_GENERALIZED_CARVEOUT:
-			status_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS;
-			addr_reg = MC_ERR_GENERALIZED_CARVEOUT_ADR;
+			status_reg = mc->soc->regs->err_gen_co_status;
+			addr_reg = mc->soc->regs->err_gen_co_add;
 			break;
 
 		case MC_INT_DECERR_ROUTE_SANITY:
-			status_reg = MC_ERR_ROUTE_SANITY_STATUS;
-			addr_reg = MC_ERR_ROUTE_SANITY_ADR;
+			status_reg = mc->soc->regs->err_route_status;
+			addr_reg = mc->soc->regs->err_route_add;
 			break;
 
 		default:
-			status_reg = MC_ERR_STATUS;
-			addr_reg = MC_ERR_ADR;
+			status_reg = mc->soc->regs->err_status;
+			addr_reg = mc->soc->regs->err_add;
 
 #ifdef CONFIG_PHYS_ADDR_T_64BIT
 			if (mc->soc->has_addr_hi_reg)
-				addr_hi_reg = MC_ERR_ADR_HI;
+				addr_hi_reg = mc->soc->regs->err_add_hi;
 #endif
 			break;
 		}
@@ -883,7 +900,7 @@ static void tegra_mc_num_channel_enabled(struct tegra_mc *mc)
 	unsigned int i;
 	u32 value;
 
-	value = mc_ch_readl(mc, 0, MC_EMEM_ADR_CFG_CHANNEL_ENABLE);
+	value = mc_ch_readl(mc, 0, mc->soc->regs->cfg_channel_enable);
 	if (value <= 0) {
 		mc->num_channels = mc->soc->num_channels;
 		return;
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 1d97cf4d3a94..bbe3e2690c64 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #ifndef MEMORY_TEGRA_MC_H
@@ -14,8 +14,6 @@
 
 #define MC_INTSTATUS					0x00
 #define MC_INTMASK					0x04
-#define MC_ERR_STATUS					0x08
-#define MC_ERR_ADR					0x0c
 #define MC_GART_ERROR_REQ				0x30
 #define MC_EMEM_ADR_CFG					0x54
 #define MC_DECERR_EMEM_OTHERS_STATUS			0x58
@@ -43,19 +41,7 @@
 #define MC_EMEM_ARB_OVERRIDE				0xe8
 #define MC_TIMING_CONTROL_DBG				0xf8
 #define MC_TIMING_CONTROL				0xfc
-#define MC_ERR_VPR_STATUS				0x654
-#define MC_ERR_VPR_ADR					0x658
-#define MC_ERR_SEC_STATUS				0x67c
-#define MC_ERR_SEC_ADR					0x680
-#define MC_ERR_MTS_STATUS				0x9b0
-#define MC_ERR_MTS_ADR					0x9b4
-#define MC_ERR_ROUTE_SANITY_STATUS			0x9c0
-#define MC_ERR_ROUTE_SANITY_ADR				0x9c4
-#define MC_ERR_GENERALIZED_CARVEOUT_STATUS		0xc00
-#define MC_ERR_GENERALIZED_CARVEOUT_ADR			0xc04
-#define MC_EMEM_ADR_CFG_CHANNEL_ENABLE			0xdf8
 #define MC_GLOBAL_INTSTATUS				0xf24
-#define MC_ERR_ADR_HI					0x11fc
 
 #define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
 #define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 41350570c815..ea7e4c7bb5f8 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1114,4 +1114,5 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.resets = tegra114_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
 	.ops = &tegra30_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 9d7393e19f12..c5529f79fbb4 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1275,6 +1275,7 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1307,5 +1308,6 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index aee11457bf8e..51e2dd628fb4 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017-2025 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2017-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/io.h>
@@ -914,5 +914,6 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 	.ops = &tegra186_mc_ops,
 	.ch_intmask = 0x0000000f,
 	.global_intstatus_channel_shift = 0,
+	.regs = &tegra20_mc_regs,
 };
 #endif
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index 26035ac3a1eb..5b7ff2dd6812 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2017-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <soc/tegra/mc.h>
@@ -1358,4 +1358,5 @@ const struct tegra_mc_soc tegra194_mc_soc = {
 	.icc_ops = &tegra_mc_icc_ops,
 	.ch_intmask = 0x00000f00,
 	.global_intstatus_channel_shift = 8,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index a3022e715dee..227c3336974d 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2012-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/bitfield.h>
@@ -778,4 +778,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra20_mc_resets),
 	.icc_ops = &tegra20_mc_icc_ops,
 	.ops = &tegra20_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 3c2949c16fde..e166b33848e9 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2015 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2015-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <dt-bindings/memory/tegra210-mc.h>
@@ -1287,4 +1287,5 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.resets = tegra210_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra210_mc_resets),
 	.ops = &tegra30_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 5f57cea48b62..512d054d7592 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2022-2023, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2022-2026, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <soc/tegra/mc.h>
@@ -1152,4 +1152,5 @@ const struct tegra_mc_soc tegra234_mc_soc = {
 	 * supported.
 	 */
 	.num_carveouts = 32,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index d3e685c8431f..3f3c7d996b49 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/device.h>
@@ -1400,4 +1400,5 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
 	.icc_ops = &tegra30_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 6ee4c59db620..372f47e824d5 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2014 NVIDIA Corporation
+ * Copyright (C) 2014-2026 NVIDIA Corporation
  */
 
 #ifndef __SOC_TEGRA_MC_H__
@@ -168,6 +168,23 @@ struct tegra_mc_ops {
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
 
+struct tegra_mc_regs {
+	unsigned int cfg_channel_enable;
+	unsigned int err_status;
+	unsigned int err_add;
+	unsigned int err_add_hi;
+	unsigned int err_vpr_status;
+	unsigned int err_vpr_add;
+	unsigned int err_sec_status;
+	unsigned int err_sec_add;
+	unsigned int err_mts_status;
+	unsigned int err_mts_add;
+	unsigned int err_gen_co_status;
+	unsigned int err_gen_co_add;
+	unsigned int err_route_status;
+	unsigned int err_route_add;
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -196,6 +213,7 @@ struct tegra_mc_soc {
 
 	const struct tegra_mc_icc_ops *icc_ops;
 	const struct tegra_mc_ops *ops;
+	const struct tegra_mc_regs *regs;
 };
 
 struct tegra_mc {
@@ -256,4 +274,6 @@ tegra_mc_get_carveout_info(struct tegra_mc *mc, unsigned int id,
 }
 #endif
 
+extern const struct tegra_mc_regs tegra20_mc_regs;
+
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.17.1

