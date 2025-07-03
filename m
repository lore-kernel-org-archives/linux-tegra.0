Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B62E174A;
	Thu,  3 Jul 2025 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539154; cv=fail; b=rUHkhgSUdg23+Z6peBNxoHA9FC4DZZhw9lJV3ijTE1jWomHmI9p5sgFNAqdMqvRoTOWjvb9NBgoNcQNyWFB0dRlnAzFgeODzFdzpZv6IQvC5N+qrhm8w63aLB6s4mcAEb33PZnA0S5/Ri/R6ApeiRDbg/GTbw0uzU9PnHpBdmck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539154; c=relaxed/simple;
	bh=Gt7poHbAR6dlcELZgkW39jU80OD6VGfL/i+zTXakfwg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h1NOyWhq8RTvfnQUapGVnat0wKFJmzNcf8aYBQKejpE/PMfxwDC6Tc9DZIu7UmHYyY70euGAKsjgrEiIthOhCPRZtz8xAuJyBfSEcXrbyh59hL9Bl1LUumP2L2xmXx+xMU2mKCSLMgkJBeCUDUYWFLYEhPxm+TlFXNfvlxMdxGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ttZ6N61B; arc=fail smtp.client-ip=40.107.100.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ttZ6N61B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzZFgF2+W1CVZ0j8bucQDgeT7XEbOb55zVi34jHyCO7Ws5oiYr5OgnwQ0yLDbGrZ6mHYWDisPoRxBR4DcbC0TPifxEgjAV4hbN9myF978TfTl8ktFBNsySpv20czb3kV9AOrm76TVyEo5YpxV+iQvoCg76ascYxDRhRED9DUxTbrSZxfQlEjhsTIB3okawpe5TE7ziST81d/q3d1nxgdEzjVE8qv3Lhaeot6j4kGVYTg0HkW+TVeOfqYSnsULJTmAP6S/EufP2UMFx83r/nZx2PBkMRYTlLrNMbuv8L59Df51RMd9oJlpnk7kjogewJZ/pV1IO35tNN/dxHqqqpKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vvz38SLuB2zflJkQzFJjY/e9+yEZHeS05S3/ai4Y6QY=;
 b=jcI5+UfNnfyfBe0CEYt/zHsIX+zkljEjzmQQ6OsiobABz/J3INpiT894z0PZfwvVf8KV8oXhD3Qd8Lmk+mNYCd1ZIY5miQ9tiP7pJZ7fWUdfTtm1LUuNy1Ba0pijtJhI3tbscQPkV0o/ZKeB1mm5X1hxh+4U3cXO0sNi/FZjof5/Un8GWyhVljkFrGVY2+0+8mksa30O7NclL9rEpkpcLxdBEAmqC6pSwhTFZ4nD035GRyCbZ2hICmCCxOq95iBOq6U4FRWHw0LBpGN0iFccEykPk0TNAEZQyHH1zOulBnJX7TNirqDHcJl+01WdHq6sgRFzvVTWqBOvAoMMSLu2Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvz38SLuB2zflJkQzFJjY/e9+yEZHeS05S3/ai4Y6QY=;
 b=ttZ6N61B2/UY3KEI+BedD3a2Jv+SXJs7Tj0neX5fviLebqnpfy5rPE/NnHw1095BUGGBR493lOGZIvA0nS/f0RBbRCgIGZIRzWV9g9iMDNdrTg88j0cb7nSAYTn0W4/JRWe5Zt0I1CBIXKCu8y5Lx+9/FBjWaEbGcwRAOGB1jkmppFF9rkTZSwmZ7IK3uEvVH91Qumdwl0kPCgBhNhtgTYqvLBG1YBL5v59aQMnYQ2m+uZl10/ZHxSskFIoNjyaCPqjRH00KDDbgHNmrrqk7UhWs8gt7q5stI4kgQR1IRjAobsHlcY2qX9NfewKPUanfea3sm1Rj/uEyoVOuHLfIuQ==
Received: from SN6PR01CA0010.prod.exchangelabs.com (2603:10b6:805:b6::23) by
 SJ2PR12MB9085.namprd12.prod.outlook.com (2603:10b6:a03:564::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 10:39:08 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:805:b6:cafe::42) by SN6PR01CA0010.outlook.office365.com
 (2603:10b6:805:b6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 10:38:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 10:39:08 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 03:38:58 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 03:38:57 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 03:38:54 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 4/8] soc: tegra: cbb: improve handling for per SoC fabric data
Date: Thu, 3 Jul 2025 16:08:25 +0530
Message-ID: <20250703103829.1721024-5-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703103829.1721024-1-sumitg@nvidia.com>
References: <20250703103829.1721024-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SJ2PR12MB9085:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f58988-0919-4fae-2916-08ddba1dd72d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DnzDpH24NjBkhNOuG7bFRXGcacrOJ0yPYdR3WTRzpH/BGmgp424RDf8edFkm?=
 =?us-ascii?Q?04t3t4f6NqZ7GsfIOWFDT/uvXftFKZ0wFt1vVY6s6PiiJmlGuPTt5GgHZE7R?=
 =?us-ascii?Q?zfu9+bVfAR/FXRTdtbUjJIxvFGHVPuubGv7Nha2lWU2FYEwbQPiVYEiOd88o?=
 =?us-ascii?Q?BF4cy9x1oUrigaBhBM6G2ajfsZ8/klVmW5wnuW7THXESjcxghrHsYPJxFbHM?=
 =?us-ascii?Q?pgpv7IF2Cg6YZlbbM/5/2xtvR+rmt3TW8UNvoVt1sU5cOmbWWtb/jtcmP7vu?=
 =?us-ascii?Q?AM2jX52pgGEq4Lt5E5fGVsnfqNN4/+C6SimYstIwXKvpW5wcUyVm59/147sV?=
 =?us-ascii?Q?IlDWQloepdPkhgxvtdUL4W/PIogyUVywX9tRL2zEuZ5tirwaAxPqb0ZOAdMz?=
 =?us-ascii?Q?B+HPsstYlOBEhqSNEhdFpKrFGKFd2y4hJ62UC03ZdvkSKkN1ORoJL1CHbW3B?=
 =?us-ascii?Q?vj8ocDVXodqz/NmvUbfyIMJ0+ZqEQZU0eov59taqxI11xr+hqDyVnkAixj3i?=
 =?us-ascii?Q?YuAMSZbq9FLHc2ywn06galn/F318WMbdHmiEs0wJVp0rLMfoVc7jNHDPtdrN?=
 =?us-ascii?Q?jQPKctpUEz68hLUd7eSghMH5DaHYNmnU/C13WSsVg4xya5hvRoHPxkFzo+8R?=
 =?us-ascii?Q?P+WaSsFVbNS26hMMVD/Quucf3WtTlLKoDipZsi+S5aOuXRAJdjijs0RGOGuK?=
 =?us-ascii?Q?DFIP9XtToyl/x863XPUk0peH8xIZDBtKQvIDDK7UH+wexu8TUf4VtD+xJvQz?=
 =?us-ascii?Q?LrTRnbiIvJ9PsKkQvOy90C3PFs2fKY4qeAcLQQ8Q0fbbvuaWDNyDKw080nq9?=
 =?us-ascii?Q?B/CMJrKuTSrYErtusr1JArantk0bLEnd4IXFVzsjp6GSduEjPji/3o3S8Lph?=
 =?us-ascii?Q?MQWSr8w3erEIoDFG7vqxy6NgJgRa9oKfpZHXZVOo4HbSz7TIiOstXj6/WVpf?=
 =?us-ascii?Q?eEOG4vR9hbHE2aAW2F/CjAmF3RFV7HhCbT3D1BrVevHd9cNoxj+3MEj4KaRt?=
 =?us-ascii?Q?Hd1Wtp8J4kK8M54HC5fSE/yOgocqTFW1ZCfWgWyCwU9jcj6+h4ngsdACqAk7?=
 =?us-ascii?Q?SQ2pRSEKtkArMne64ve619rXvloioaoZGwnjCLYQKHkK8XkeSAELrcggiN7Q?=
 =?us-ascii?Q?0P1PSEYggfs9Li0RBzAyncJsJcY/ja5GlFVkaWyx14WXaWDOusVFhBLMb++H?=
 =?us-ascii?Q?xEeMDBjVJDYgg7J/3QpMLjUklxIp5GKBqm0BVEr3PmBs94Hajhlp7Fuisyg2?=
 =?us-ascii?Q?Lhml1/P4R4nisYNKoucp8lo35fCoXc0LEYo/ICl1kUZBCI7wHAs0TngYwEso?=
 =?us-ascii?Q?4O3u3154t99mUDEy1KVQMX1LVYBavkHDEhNMg2Ni8U9GSZOGZEFIv0LsvSs1?=
 =?us-ascii?Q?C6Z6/LcvvNUY0Bvo4hkOr0YvdGE2Vr97haAix+6YrRz2OsGMjMS+uiXbRAKw?=
 =?us-ascii?Q?cuyzjXtRk0GHaL3JD7pxEFB0qLNtyWqlr8pEv66caBYhE1Ms4scuKlt4PaPI?=
 =?us-ascii?Q?cj+LChsneFzz4v/CmFQhbdHjz3WxaXa0TR/e?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:39:08.2095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f58988-0919-4fae-2916-08ddba1dd72d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9085

Improve handling for the per soc fabrics and targets.
The below changes make them more flexible and ready for future SoC's.
- Added SoC prefix to Fabric_ID enums.
- Rename *lookup_target_timeout() to *sw_lookup_target_timeout() to
  make it separate from HW based lookup function to be added later.
- Moved target_map within fabric_lookup table to make it easy to
  check whether SW vs HW lookup is supported and handle accordingly.
- Slight improvements to some error prints.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 239 +++++++++++++++------------
 1 file changed, 131 insertions(+), 108 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 6116221f0ca61..10f57f17fee8d 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -74,15 +74,15 @@
 #define WEN				0x20000
 
 enum tegra234_cbb_fabric_ids {
-	CBB_FAB_ID,
-	SCE_FAB_ID,
-	RCE_FAB_ID,
-	DCE_FAB_ID,
-	AON_FAB_ID,
-	PSC_FAB_ID,
-	BPMP_FAB_ID,
-	FSI_FAB_ID,
-	MAX_FAB_ID,
+	T234_CBB_FABRIC_ID,
+	T234_SCE_FABRIC_ID,
+	T234_RCE_FABRIC_ID,
+	T234_DCE_FABRIC_ID,
+	T234_AON_FABRIC_ID,
+	T234_PSC_FABRIC_ID,
+	T234_BPMP_FABRIC_ID,
+	T234_FSI_FABRIC_ID,
+	T234_MAX_FABRIC_ID,
 };
 
 struct tegra234_target_lookup {
@@ -90,8 +90,15 @@ struct tegra234_target_lookup {
 	unsigned int offset;
 };
 
-struct tegra234_cbb_fabric {
+struct tegra234_fabric_lookup {
 	const char *name;
+	bool is_lookup;
+	const struct tegra234_target_lookup *target_map;
+	const int max_targets;
+};
+
+struct tegra234_cbb_fabric {
+	int fab_id;
 	phys_addr_t off_mask_erd;
 	phys_addr_t firewall_base;
 	unsigned int firewall_ctl;
@@ -100,8 +107,7 @@ struct tegra234_cbb_fabric {
 	unsigned int notifier_offset;
 	const struct tegra_cbb_error *errors;
 	const int max_errors;
-	const struct tegra234_target_lookup *target_map;
-	const int max_targets;
+	const struct tegra234_fabric_lookup *fab_list;
 	const u32 err_intr_enbl;
 	const u32 err_status_clr;
 };
@@ -266,12 +272,17 @@ static void tegra234_cbb_lookup_apbslv(struct seq_file *file, const char *target
 	}
 }
 
-static void tegra234_lookup_target_timeout(struct seq_file *file, struct tegra234_cbb *cbb,
-					   u8 target_id, u8 fab_id)
+static void tegra234_sw_lookup_target_timeout(struct seq_file *file, struct tegra234_cbb *cbb,
+					      u8 target_id, u8 fab_id)
 {
-	const struct tegra234_target_lookup *map = cbb->fabric->target_map;
+	const struct tegra234_target_lookup *map = cbb->fabric->fab_list[fab_id].target_map;
 	void __iomem *addr;
 
+	if (target_id >= cbb->fabric->fab_list[fab_id].max_targets) {
+		tegra_cbb_print_err(file, "\t  Invalid target_id:%d\n", target_id);
+		return;
+	}
+
 	/*
 	 * 1) Get target node name and address mapping using target_id.
 	 * 2) Check if the timed out target node is APB or AXI.
@@ -354,7 +365,6 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 {
 	u8 cache_type, prot_type, burst_length, mstr_id, grpsec, vqc, falconsec, beat_size;
 	u8 access_type, access_id, requester_socket_id, local_socket_id, target_id, fab_id;
-	char fabric_name[20];
 	bool is_numa = false;
 	u8 burst_type;
 
@@ -399,21 +409,18 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 	else
 		tegra_cbb_print_err(file, "\t  Wrong type index:%u\n", cbb->type);
 
-	tegra_cbb_print_err(file, "\t  Initiator_Id\t\t: %s\n", cbb->fabric->initiator_id[mstr_id]);
+	tegra_cbb_print_err(file, "\t  Initiator_Id\t\t: %#x\n", mstr_id);
+	if (cbb->fabric->initiator_id)
+		tegra_cbb_print_err(file, "\t  Initiator\t\t: %s\n",
+				    cbb->fabric->initiator_id[mstr_id]);
+
 	tegra_cbb_print_err(file, "\t  Address\t\t: %#llx\n", cbb->access);
 
 	tegra_cbb_print_cache(file, cache_type);
 	tegra_cbb_print_prot(file, prot_type);
 
 	tegra_cbb_print_err(file, "\t  Access_Type\t\t: %s", (access_type) ? "Write\n" : "Read\n");
-	tegra_cbb_print_err(file, "\t  Access_ID\t\t: %#x", access_id);
-
-	if (fab_id == PSC_FAB_ID)
-		strcpy(fabric_name, "psc-fabric");
-	else if (fab_id == FSI_FAB_ID)
-		strcpy(fabric_name, "fsi-fabric");
-	else
-		strcpy(fabric_name, cbb->fabric->name);
+	tegra_cbb_print_err(file, "\t  Access_ID\t\t: %#x\n", access_id);
 
 	if (is_numa) {
 		tegra_cbb_print_err(file, "\t  Requester_Socket_Id\t: %#x\n",
@@ -424,7 +431,9 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 				    num_possible_nodes());
 	}
 
-	tegra_cbb_print_err(file, "\t  Fabric\t\t: %s\n", fabric_name);
+	tegra_cbb_print_err(file, "\t  Fabric\t\t: %s (id:%#x)\n",
+			    cbb->fabric->fab_list[fab_id].name, fab_id);
+
 	tegra_cbb_print_err(file, "\t  Target_Id\t\t: %#x\n", target_id);
 	tegra_cbb_print_err(file, "\t  Burst_length\t\t: %#x\n", burst_length);
 	tegra_cbb_print_err(file, "\t  Burst_type\t\t: %#x\n", burst_type);
@@ -433,21 +442,13 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 	tegra_cbb_print_err(file, "\t  GRPSEC\t\t: %#x\n", grpsec);
 	tegra_cbb_print_err(file, "\t  FALCONSEC\t\t: %#x\n", falconsec);
 
-	if ((fab_id == PSC_FAB_ID) || (fab_id == FSI_FAB_ID))
+	if (!cbb->fabric->fab_list[fab_id].is_lookup)
 		return;
 
-	if (target_id >= cbb->fabric->max_targets) {
-		tegra_cbb_print_err(file, "\t  Invalid target_id:%d\n", target_id);
-		return;
-	}
-
-	if (!strcmp(cbb->fabric->errors[cbb->type].code, "TIMEOUT_ERR")) {
-		tegra234_lookup_target_timeout(file, cbb, target_id, fab_id);
-		return;
-	}
+	if (!strcmp(cbb->fabric->errors[cbb->type].code, "TIMEOUT_ERR"))
+		tegra234_sw_lookup_target_timeout(file, cbb, target_id, fab_id);
 
-	tegra_cbb_print_err(file, "\t  Target\t\t\t: %s\n",
-			    cbb->fabric->target_map[target_id].name);
+	return;
 }
 
 static int print_errmonX_info(struct seq_file *file, struct tegra234_cbb *cbb)
@@ -508,7 +509,7 @@ static int print_err_notifier(struct seq_file *file, struct tegra234_cbb *cbb, u
 
 	pr_crit("**************************************\n");
 	pr_crit("CPU:%d, Error:%s, Errmon:%d\n", smp_processor_id(),
-		cbb->fabric->name, status);
+		cbb->fabric->fab_list[cbb->fabric->fab_id].name, status);
 
 	while (status) {
 		if (status & BIT(0)) {
@@ -531,13 +532,13 @@ static int print_err_notifier(struct seq_file *file, struct tegra234_cbb *cbb, u
 			tegra234_cbb_error_clear(&cbb->base);
 			if (err)
 				return err;
+			tegra_cbb_print_err(file, "\t**************************************\n");
 		}
 
 		status >>= 1;
 		index++;
 	}
 
-	tegra_cbb_print_err(file, "\t**************************************\n");
 	return 0;
 }
 
@@ -586,7 +587,8 @@ static irqreturn_t tegra234_cbb_isr(int irq, void *data)
 
 		if (status && (irq == priv->sec_irq)) {
 			tegra_cbb_print_err(NULL, "CPU:%d, Error: %s@0x%llx, irq=%d\n",
-					    smp_processor_id(), priv->fabric->name,
+					    smp_processor_id(),
+					    priv->fabric->fab_list[priv->fabric->fab_id].name,
 					    priv->res->start, irq);
 
 			err = print_err_notifier(NULL, priv, status);
@@ -704,21 +706,6 @@ static const struct tegra234_target_lookup tegra234_aon_target_map[] = {
 	{ "CPU",     0x16000 },
 };
 
-static const struct tegra234_cbb_fabric tegra234_aon_fabric = {
-	.name = "aon-fabric",
-	.initiator_id = tegra234_initiator_id,
-	.target_map = tegra234_aon_target_map,
-	.max_targets = ARRAY_SIZE(tegra234_aon_target_map),
-	.errors = tegra234_cbb_errors,
-	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
-	.err_intr_enbl = 0x7,
-	.err_status_clr = 0x3f,
-	.notifier_offset = 0x17000,
-	.firewall_base = 0x30000,
-	.firewall_ctl = 0x8d0,
-	.firewall_wr_ctl = 0x8c8,
-};
-
 static const struct tegra234_target_lookup tegra234_bpmp_target_map[] = {
 	{ "AXI2APB", 0x00000 },
 	{ "AST0",    0x15000 },
@@ -727,19 +714,13 @@ static const struct tegra234_target_lookup tegra234_bpmp_target_map[] = {
 	{ "CPU",     0x18000 },
 };
 
-static const struct tegra234_cbb_fabric tegra234_bpmp_fabric = {
-	.name = "bpmp-fabric",
-	.initiator_id = tegra234_initiator_id,
-	.target_map = tegra234_bpmp_target_map,
-	.max_targets = ARRAY_SIZE(tegra234_bpmp_target_map),
-	.errors = tegra234_cbb_errors,
-	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
-	.err_intr_enbl = 0xf,
-	.err_status_clr = 0x3f,
-	.notifier_offset = 0x19000,
-	.firewall_base = 0x30000,
-	.firewall_ctl = 0x8f0,
-	.firewall_wr_ctl = 0x8e8,
+static const struct tegra234_target_lookup tegra234_common_target_map[] = {
+	{ "AXI2APB", 0x00000 },
+	{ "AST0",    0x15000 },
+	{ "AST1",    0x16000 },
+	{ "CBB",     0x17000 },
+	{ "RSVD",    0x00000 },
+	{ "CPU",     0x18000 },
 };
 
 static const struct tegra234_target_lookup tegra234_cbb_target_map[] = {
@@ -806,11 +787,61 @@ static const struct tegra234_target_lookup tegra234_cbb_target_map[] = {
 	{ "AXI2APB_3",  0x91000 },
 };
 
+static const struct tegra234_fabric_lookup tegra234_cbb_fab_list[] = {
+	[T234_CBB_FABRIC_ID] = { "cbb-fabric", true,
+				 tegra234_cbb_target_map,
+				 ARRAY_SIZE(tegra234_cbb_target_map) },
+	[T234_SCE_FABRIC_ID] = { "sce-fabric", true,
+				 tegra234_common_target_map,
+				 ARRAY_SIZE(tegra234_common_target_map) },
+	[T234_RCE_FABRIC_ID] = { "rce-fabric", true,
+				 tegra234_common_target_map,
+				 ARRAY_SIZE(tegra234_common_target_map) },
+	[T234_DCE_FABRIC_ID] = { "dce-fabric", true,
+				 tegra234_common_target_map,
+				 ARRAY_SIZE(tegra234_common_target_map) },
+	[T234_AON_FABRIC_ID] = { "aon-fabric", true,
+				 tegra234_aon_target_map,
+				 ARRAY_SIZE(tegra234_bpmp_target_map) },
+	[T234_PSC_FABRIC_ID] = { "psc-fabric" },
+	[T234_BPMP_FABRIC_ID] = { "bpmp-fabric", true,
+				 tegra234_bpmp_target_map,
+				 ARRAY_SIZE(tegra234_bpmp_target_map) },
+	[T234_FSI_FABRIC_ID] = { "fsi-fabric" },
+};
+
+static const struct tegra234_cbb_fabric tegra234_aon_fabric = {
+	.fab_id = T234_AON_FABRIC_ID,
+	.fab_list = tegra234_cbb_fab_list,
+	.initiator_id = tegra234_initiator_id,
+	.errors = tegra234_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0x7,
+	.err_status_clr = 0x3f,
+	.notifier_offset = 0x17000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0x8d0,
+	.firewall_wr_ctl = 0x8c8,
+};
+
+static const struct tegra234_cbb_fabric tegra234_bpmp_fabric = {
+	.fab_id = T234_BPMP_FABRIC_ID,
+	.fab_list = tegra234_cbb_fab_list,
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
 static const struct tegra234_cbb_fabric tegra234_cbb_fabric = {
-	.name = "cbb-fabric",
+	.fab_id = T234_CBB_FABRIC_ID,
+	.fab_list = tegra234_cbb_fab_list,
 	.initiator_id = tegra234_initiator_id,
-	.target_map = tegra234_cbb_target_map,
-	.max_targets = ARRAY_SIZE(tegra234_cbb_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
 	.err_intr_enbl = 0x7f,
@@ -822,20 +853,10 @@ static const struct tegra234_cbb_fabric tegra234_cbb_fabric = {
 	.firewall_wr_ctl = 0x23e8,
 };
 
-static const struct tegra234_target_lookup tegra234_common_target_map[] = {
-	{ "AXI2APB", 0x00000 },
-	{ "AST0",    0x15000 },
-	{ "AST1",    0x16000 },
-	{ "CBB",     0x17000 },
-	{ "RSVD",    0x00000 },
-	{ "CPU",     0x18000 },
-};
-
 static const struct tegra234_cbb_fabric tegra234_dce_fabric = {
-	.name = "dce-fabric",
+	.fab_id = T234_DCE_FABRIC_ID,
+	.fab_list = tegra234_cbb_fab_list,
 	.initiator_id = tegra234_initiator_id,
-	.target_map = tegra234_common_target_map,
-	.max_targets = ARRAY_SIZE(tegra234_common_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
 	.err_intr_enbl = 0xf,
@@ -847,10 +868,9 @@ static const struct tegra234_cbb_fabric tegra234_dce_fabric = {
 };
 
 static const struct tegra234_cbb_fabric tegra234_rce_fabric = {
-	.name = "rce-fabric",
+	.fab_id = T234_RCE_FABRIC_ID,
+	.fab_list = tegra234_cbb_fab_list,
 	.initiator_id = tegra234_initiator_id,
-	.target_map = tegra234_common_target_map,
-	.max_targets = ARRAY_SIZE(tegra234_common_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
 	.err_intr_enbl = 0xf,
@@ -862,10 +882,9 @@ static const struct tegra234_cbb_fabric tegra234_rce_fabric = {
 };
 
 static const struct tegra234_cbb_fabric tegra234_sce_fabric = {
-	.name = "sce-fabric",
+	.fab_id = T234_SCE_FABRIC_ID,
+	.fab_list = tegra234_cbb_fab_list,
 	.initiator_id = tegra234_initiator_id,
-	.target_map = tegra234_common_target_map,
-	.max_targets = ARRAY_SIZE(tegra234_common_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
 	.err_intr_enbl = 0xf,
@@ -985,6 +1004,17 @@ static const struct tegra_cbb_error tegra241_cbb_errors[] = {
 	},
 };
 
+static const struct tegra234_target_lookup tegra241_bpmp_target_map[] = {
+	{ "RSVD",    0x00000 },
+	{ "RSVD",    0x00000 },
+	{ "RSVD",    0x00000 },
+	{ "CBB",     0x15000 },
+	{ "CPU",     0x16000 },
+	{ "AXI2APB", 0x00000 },
+	{ "DBB0",    0x17000 },
+	{ "DBB1",    0x18000 },
+};
+
 static const struct tegra234_target_lookup tegra241_cbb_target_map[] = {
 	{ "RSVD",       0x00000 },
 	{ "PCIE_C8",    0x51000 },
@@ -1047,11 +1077,16 @@ static const struct tegra234_target_lookup tegra241_cbb_target_map[] = {
 	{ "AXI2APB_32", 0x8F000 },
 };
 
+static const struct tegra234_fabric_lookup tegra241_cbb_fab_list[] = {
+	[T234_CBB_FABRIC_ID]  = { "cbb-fabric", true,
+				  tegra241_cbb_target_map, ARRAY_SIZE(tegra241_cbb_target_map) },
+	[T234_BPMP_FABRIC_ID] = { "bpmp-fabric", true,
+				  tegra241_bpmp_target_map, ARRAY_SIZE(tegra241_cbb_target_map) },
+};
 static const struct tegra234_cbb_fabric tegra241_cbb_fabric = {
-	.name = "cbb-fabric",
+	.fab_id = T234_CBB_FABRIC_ID,
+	.fab_list = tegra241_cbb_fab_list,
 	.initiator_id = tegra241_initiator_id,
-	.target_map = tegra241_cbb_target_map,
-	.max_targets = ARRAY_SIZE(tegra241_cbb_target_map),
 	.errors = tegra241_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
 	.err_intr_enbl = 0x7,
@@ -1063,22 +1098,10 @@ static const struct tegra234_cbb_fabric tegra241_cbb_fabric = {
 	.firewall_wr_ctl = 0x2368,
 };
 
-static const struct tegra234_target_lookup tegra241_bpmp_target_map[] = {
-	{ "RSVD",    0x00000 },
-	{ "RSVD",    0x00000 },
-	{ "RSVD",    0x00000 },
-	{ "CBB",     0x15000 },
-	{ "CPU",     0x16000 },
-	{ "AXI2APB", 0x00000 },
-	{ "DBB0",    0x17000 },
-	{ "DBB1",    0x18000 },
-};
-
 static const struct tegra234_cbb_fabric tegra241_bpmp_fabric = {
-	.name = "bpmp-fabric",
+	.fab_id = T234_BPMP_FABRIC_ID,
+	.fab_list = tegra241_cbb_fab_list,
 	.initiator_id = tegra241_initiator_id,
-	.target_map = tegra241_bpmp_target_map,
-	.max_targets = ARRAY_SIZE(tegra241_bpmp_target_map),
 	.errors = tegra241_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
 	.err_intr_enbl = 0xf,
@@ -1197,7 +1220,7 @@ static int __maybe_unused tegra234_cbb_resume_noirq(struct device *dev)
 
 	tegra234_cbb_error_enable(&cbb->base);
 
-	dev_dbg(dev, "%s resumed\n", cbb->fabric->name);
+	dev_dbg(dev, "%s resumed\n", cbb->fabric->fab_list[cbb->fabric->fab_id].name);
 
 	return 0;
 }
-- 
2.34.1

