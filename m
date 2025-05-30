Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D4618DB34;
	Fri, 30 May 2025 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612183; cv=fail; b=slA3Ka1B5kNNb+/ugQ67kPeiNu3t2w4rdZzwHMeyxxtiIbJruLhoBO61Zz+4czgwvpBF6yLm+6oURF2iOH3J7zaTdaZ4RaWRjg8df7atzsrGdp7YkIp4UgvSNRnZ2ELB/BxMA2w/juTOyBPqhifpQXFlnsSTnpbQutGyFS5z7Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612183; c=relaxed/simple;
	bh=hlOffJ8O9EsUjjp2yaTyvVKDK7N1kRzN985RtrEQGBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFt4CKxVIF8yfIia6mJ9pFH+5+vpjZ/MFvb8zr/OQgwU2e4Ax0+8O+FH8rltOq6V4UYfmWiKoMuJ+bKZqpEY09gwY8W+nOGwWVvGjBUiV1wVmngaV5EU5tZO+innTLlAgWNhVN1FKZTa1HmqoQY7SLK/DMoV88GXYffjT/ZhlBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cfk5vrZy; arc=fail smtp.client-ip=40.107.223.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cfk5vrZy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+lbllWRkyeE6WW4Gj+JC+7OA3zz5kB4GlPX6n8SpakJQFow5DIYN8TBV4N6lBOweEoW2aVLI9C6IamVgohxeWHblfLuA1VgzDXkjYWhxdeR2hbcwMFhziaVriOX2DdzyhsQYEbUmyv3YfqthHwhWviRUYw2KqPZaDCmIB57YKOeZikIKMDqN6sTK8bVThgWAoBdUv6etM6tSajFTCkus19JSGvQBkgTv9nQNT+xlRIblnsHZnvvOZQNya+X14qTHfATQppq5+hH9Qg2sFN8ucPqwPuhZaJCGieMJz9AlsDymmu8y4AO0C+yqy9+Q0lCLiwBPIdKzl4kt59lyg1MTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZZcif8gFtyfz8IjxUPZVBSqXELmGVCu5UvJfn/Impw=;
 b=B+GmZtBvgWHH5Ogcppxudyd/fxziI4+qJINjLsiUBTRzRuTow+6qujddVene4D9BvMdCTKSc+/2ZHIbdvzdUvMKFNIr1M54jH3e78Dz0J9bNyQ/ZvHhBARpKvAbQ7zAaEgYIatNOld1NK54ZeUrx7cjj6uD4ITe2gC2slNsD1CcHTiRmJL3LnoLnUj/0U6R+tLEOBivnxzDNAEQpiRCzoTIXawHaySc0psZ5wyIF9jkGko35ME0oXuGnkAvG72EoN83X/gQnuwA6+zZIPDdnT64bbYJHaOCr7QTJZjSbdOz+2W7ptSZBuTtSuoCM5dkBig/e2I+o7MsnYqlrj8RnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZZcif8gFtyfz8IjxUPZVBSqXELmGVCu5UvJfn/Impw=;
 b=cfk5vrZy/t+t6blWHSEUnmqYLWlxAUg/Uo7Ih/ctDYXrCPx1LSouL+kJeZ64xmNSNyxalN4I7kM37mVkSerUDwznNbj2MIM8Z93NzhdVFR7CvlVjknaSBIxJCk8xvm78GtIG/Qn7kEkTTZr5Go1VS0j8d952mATbY3sV61LvjBFlanlg3x3YTyIHKmMM5WL8lISZhRKSAhrE+klHXLE7OkadEtqCK6jtL25NYL7D1ZjAU9D69AS/ywMK+c075aKpEF36DVMNLbpepkJ1Bd/40I5/hJLmPKcE3S62/Uev52C/WzNm/nUtTakQAhGcJ6wyX2xK8o0mCm9MkJBr5A0cJQ==
Received: from BN9PR03CA0572.namprd03.prod.outlook.com (2603:10b6:408:10d::7)
 by SJ0PR12MB6782.namprd12.prod.outlook.com (2603:10b6:a03:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 30 May
 2025 13:36:13 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::a0) by BN9PR03CA0572.outlook.office365.com
 (2603:10b6:408:10d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 30 May 2025 13:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 13:36:12 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 06:36:02 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 30 May
 2025 06:36:01 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 06:35:58 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <--to=tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [Patch 8/8] soc: tegra: cbb: add support for cbb fabrics in GB10
Date: Fri, 30 May 2025 19:03:36 +0530
Message-ID: <20250530133336.1419971-9-sumitg@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530133336.1419971-1-sumitg@nvidia.com>
References: <20250530133336.1419971-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SJ0PR12MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 35db59a4-6b7c-40a1-716f-08dd9f7ef1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xwEmGb8EFGUd5H4L8wF7kZNhC8cIIWACm4jTdAZQCFzPvclW6x4PzOYVq1v1?=
 =?us-ascii?Q?oQmcEZYjyxdisCKUA4muEI0RWLKr7lDIYbWTUR7MQdKyHy1qcPJH1yELefAs?=
 =?us-ascii?Q?yRjKs4OvV65jR7OZVcWQeH9veGf+7FJkaJXY0K7EHQbLzFTlS9WzLJcSxs/H?=
 =?us-ascii?Q?O/jgLhHoGUPO6DeNhUEasynBZ3NvfD6eXlBokhRq5ov8auq3OhD/Qs7JttW5?=
 =?us-ascii?Q?XWiKuwd23I32PIHWswH2szJLROntPX6o7Wt70LiBJM6hq7Ia8uRgyy4jUKBk?=
 =?us-ascii?Q?eImHWtGysn5pCNpSkFx6J3l+CfSwxcToMN3Pr5RPOEFYeh8WLjcjEjtZxY6X?=
 =?us-ascii?Q?HY3o7YZuhZKvbzdAmoBZ4NvstANpky9rScBDSdYB2QCUa3x/3ZrhPThgIt2H?=
 =?us-ascii?Q?LT1oBoBhd/0ai8I56b3UVKf2kfA+9bPVIDY/1PAWhHVS6fvXCOzg6P0IVtlP?=
 =?us-ascii?Q?GHcOHnBvIQX7aYYttbcfqT0P81NLZoQdztPbLzqcrWGPZGBJXXElog6/Dmud?=
 =?us-ascii?Q?35h2DVb26e5mz14HwE+p58BRXehovDpIlyP//yx253IbqFgf9EmZYEvQ9zSC?=
 =?us-ascii?Q?iPSA7yucURRgqBWJgy2GVYhm8PmNdjEOXToTZsSIzrn8o3p8+HH37baQ15tL?=
 =?us-ascii?Q?1J1VFK7w58DggAc8U0npMFJXdNkML75kwE5MrJVykd3iREuUkPDnhzenSosY?=
 =?us-ascii?Q?KGttgyIYpHTcTw32DJ5i3uWZBRTtgLDOM/pK9hgrT0RUdUxy6QseEQbawe+R?=
 =?us-ascii?Q?EuG7+S/T5TiIt8Lcg+jEYs03+gxA0EupY6La9TEjLcWUozzUbVNRGZUClREM?=
 =?us-ascii?Q?30Jsal6c8wQcWW/4pwp4HFb1j2XBXOdndZK0LGWcNKu8FORPKqIP3+n0Ft51?=
 =?us-ascii?Q?0cWxsrqxxdnj/yzBGq2TOIIyQ5Joyq/52tXnK2WwcY1t9hoWZ9bK9nMgPVpv?=
 =?us-ascii?Q?2cxlF2hjyim7IWKIJiQZX1Nhj9KgabLuioVWZxBxnK8bTI4gYHSOcGkmitqp?=
 =?us-ascii?Q?+Yl4/X+cmkUn6PMiD7y7UoVVGMK+nvQ388gISI99QnepE/DLjgPv6BuvI6qH?=
 =?us-ascii?Q?5CyFRiowGgDJcDqFAC2o7hGqNpweSaWsXRjKqGW/wdH9BobhBik4FBVLzbHI?=
 =?us-ascii?Q?lZAq0wAQacMTx0missh/6mDCq+CClk/EtJnNs34YbWYo1qo4VZQIO7TtrTXe?=
 =?us-ascii?Q?HNuCBirkiBvU2PdnGYvRcpApvH0+oducuupRxotKDoM0XZC5OJjzTBNpjpBT?=
 =?us-ascii?Q?23VhpApAbpKYbUqlgdCJ+eyxZmvwAiKEWPpXBJCe7Ab7iOdLADMS0a304kh2?=
 =?us-ascii?Q?/GwGCNrM+qmRfbNQilIIKVJD3/8sBBjDciCx6kZ4GaU2Pcjnr/UD+Hj76qr/?=
 =?us-ascii?Q?zu3tywnMGYc8o6jOfrrO8gYNJYkBO8aSNx5fdWm+30JAldmxV985kdzR3loM?=
 =?us-ascii?Q?ygbzXZNI3sO6/Ff1Ms/+znW6pTTBlyHRhpKAF7HTGrAoJeZRvu5FdswfF80k?=
 =?us-ascii?Q?TPOw8oalKwX5oKv6H7ph+24F3gnDiWRzS8T+?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:36:12.7030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35db59a4-6b7c-40a1-716f-08dd9f7ef1d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6782

Add support for CBB 2.0 based fabrics in GB10 SoC using ACPI.
Fabrics reporting errors are: C2C, GPU, Display_Cluster.
GB10 is using hardware based lookup to get target node address.
So, the target_map tables for each fabric are not needed now.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 58 ++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 69c704938679..99a4a636a04c 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -117,6 +117,15 @@ enum tegra264_cbb_fabric_ids {
 	T264_RSVD7_FABRIC_ID,
 };
 
+enum gb10_cbb_fabric_ids {
+	GB10_DCE_FABRIC_ID             = 19,
+	GB10_DISP_CLUSTER_FABRIC_ID    = 25,
+	GB10_C2C_FABRIC_ID             = 26,
+	GB10_GPU_FABRIC_ID             = 27,
+	GB10_DISP_CLUSTER_1_FABRIC_ID  = 28,
+	GB10_MAX_FABRIC_ID,
+};
+
 struct tegra234_target_lookup {
 	const char *name;
 	unsigned int offset;
@@ -1418,6 +1427,52 @@ static const struct tegra234_cbb_fabric tegra264_vision_cbb_fabric = {
 	.firewall_wr_ctl = 0x5c8,
 };
 
+static const struct tegra234_fabric_lookup gb10_cbb_fab_list[] = {
+	[GB10_C2C_FABRIC_ID] = { "c2c-fabric", true },
+	[GB10_DISP_CLUSTER_FABRIC_ID] = { "display-cluster-fabric", true },
+	[GB10_GPU_FABRIC_ID] = { "gpu-fabric", true },
+};
+
+static const struct tegra234_cbb_fabric gb10s_c2c_fabric = {
+	.fab_id = GB10_C2C_FABRIC_ID,
+	.fab_list = gb10_cbb_fab_list,
+	.errors = tegra241_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x1ff007f,
+	.notifier_offset = 0x50000,
+	.off_mask_erd = 0x14004,
+	.firewall_base = 0x40000,
+	.firewall_ctl = 0x9b0,
+	.firewall_wr_ctl = 0x9a8,
+};
+
+static const struct tegra234_cbb_fabric gb10s_disp_fabric = {
+	.fab_id = GB10_DISP_CLUSTER_FABRIC_ID,
+	.fab_list = gb10_cbb_fab_list,
+	.errors = tegra241_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0x1,
+	.err_status_clr = 0x1ff007f,
+	.notifier_offset = 0x50000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0x810,
+	.firewall_wr_ctl = 0x808,
+};
+
+static const struct tegra234_cbb_fabric gb10g_gpu_fabric = {
+	.fab_id = GB10_GPU_FABRIC_ID,
+	.fab_list = gb10_cbb_fab_list,
+	.errors = tegra241_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0x1f,
+	.err_status_clr = 0x1ff007f,
+	.notifier_offset = 0x50000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0x930,
+	.firewall_wr_ctl = 0x928,
+};
+
 static const struct of_device_id tegra234_cbb_dt_ids[] = {
 	{ .compatible = "nvidia,tegra234-cbb-fabric", .data = &tegra234_cbb_fabric },
 	{ .compatible = "nvidia,tegra234-aon-fabric", .data = &tegra234_aon_fabric },
@@ -1442,6 +1497,9 @@ struct tegra234_cbb_acpi_uid {
 static const struct tegra234_cbb_acpi_uid tegra234_cbb_acpi_uids[] = {
 	{ "NVDA1070", "1", &tegra241_cbb_fabric },
 	{ "NVDA1070", "2", &tegra241_bpmp_fabric },
+	{ "NVDA1070", "3", &gb10s_c2c_fabric },
+	{ "NVDA1070", "4", &gb10s_disp_fabric },
+	{ "NVDA1070", "5", &gb10g_gpu_fabric },
 	{ },
 };
 
-- 
2.25.1

