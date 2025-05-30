Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7F9176ADB;
	Fri, 30 May 2025 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612095; cv=fail; b=kS2BZdB1hOa4CBFakxE148AEYp8qygBx3ABITrplXyHam8w0nhpn3STx/UFTvgBcaEQWAECu64eXUFpINFPXJFe4zR4ymMTElhuP4cSKgqmp9CwW1wrliSilEkFIQmq/1a7v90pV/rLa4eDkVPCJ7HT5YhD/MQJcIfVqsbm8pcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612095; c=relaxed/simple;
	bh=2j+SMuxC2HNRIGtfgCFDYFCauzY+pHhIUPLmsqeECp8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U1bQSvb8bxinKnBFvWJKoiIfmqPL1NbYqn1jFY5LjiPgvPyl7B2xIszUVY8XCWeF0s+xzjnbOBmZx3712unmHEZzUTjIVoHmaCLBxMZRky51WkCtoeJf7gg6uVu2v3FCu6tfdiaGfZqk2yxj9WY5iwUbi8li1dDngNX0sxCe/ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jgs1ZwOA; arc=fail smtp.client-ip=40.107.94.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jgs1ZwOA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOWsPtW7IxbVUS3F9TNLig5NHj57fUTCA6Ybj1T5XfzjR4HbbEvvdmFm1Mcs/x1YWj7p1w5vYwJ9viVDssXrk0s/2jym8Ke4Hv64iL2vzjSVfQ8buRrvqttv1F3aNeiL7vvctPiHG88HoLdnkxv+LgRR2/WrkV2Me8t4COLkWEGA5rwSi1qy+46b7vWEXEfdL5V+9nrAvUpxmzM9ZNfBYndePW7c+/5eftmLQ1vxJjqRYNmlQEuMFfKFrjbro7PkXtXfTh55fnfpcbK68D4l0vGlKdEldmrq3FZoSYstNlbMYYtXHmx4VY4OyN4bWpvnDKqIpPaClBeHN2tF4PKJAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqV9/I+OtHzn4Lnh7q2ybxNyTN9GQ4xlUKD/KmxUC60=;
 b=UOZQOaLBaVE7eg/rDinBazODeKeXn2Nq2UeNjwwlWocZPGCFCteKo7O2FC3B7YbsKUNtrs5eejRR0OLYUAWFPPgFt8x0nX/I+DQQkRb+mN9uXMxyqqG8Au+LzEQq3gJ3SjGo2M25IPDNDjJN5O7g4dBw78K0scIPSSLYeAzmCfpqV3hcfyQx6fMY3ma+JYNmSKp76GkoZezpogNy0sKQuLp96CbrPGOXbn1bcuOk7iow9XO8+tlyBdCBWN2x+rwz7iRN5QQMLmZpNTxnN7aBhf729cPMW1R/i4wNtH70WtYNpJBZce7w3/rd3QfIk1N7Ap8L9o4QGNZUsIWXTczutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqV9/I+OtHzn4Lnh7q2ybxNyTN9GQ4xlUKD/KmxUC60=;
 b=jgs1ZwOAW9NRdDe/pJ5/Xjt0VnKGhB1BbiCBKgHLPDK3o76c/sc3FMmwj7ChpEd3bPjkXWMv/TqbxTqV1UkPPCAJphASq2pfqOhHY9rLz94zuF+DIXIme/fD6Zy1GkC9qst9xasfDvt1X/PsEzVSZYbc7rRF6LyL9SX7NRIQjCYDV4d8qgpsmx+tJ26r8X1KCiObF+ni1j5kFb7nZErmUXOgR32ZZCqea26OwAr8xsLIFnXmgyWX/aCeZfzi/vvNarfKdqSTACw3e4tVH3JkqX23tB805YzkZ3cgT7TjJclo2wg/V8ne6XCIxJ4hQa/XazCIvPNN1LeiBKJGArAqCA==
Received: from MW4PR04CA0085.namprd04.prod.outlook.com (2603:10b6:303:6b::30)
 by SA1PR12MB7150.namprd12.prod.outlook.com (2603:10b6:806:2b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 30 May
 2025 13:34:46 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:6b:cafe::be) by MW4PR04CA0085.outlook.office365.com
 (2603:10b6:303:6b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Fri,
 30 May 2025 13:34:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.0 via Frontend Transport; Fri, 30 May 2025 13:34:46 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 06:34:33 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 30 May
 2025 06:34:33 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 06:34:29 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <--to=tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [Patch 4/8] soc: tegra: cbb: improve handling for per SoC fabric data
Date: Fri, 30 May 2025 19:03:32 +0530
Message-ID: <20250530133336.1419971-5-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|SA1PR12MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b3f1b4-f6a9-4035-ea47-08dd9f7ebe47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fqz+eufH3jVm8HaqVFxtIC2Z9lYbQPdpVTULzrEwr8czjEgQJglgGPTy0wNp?=
 =?us-ascii?Q?8VCk2zqwMjK+YYtRgmGCgK12WDw7ljLRtQysAfAk4ENzAoFOvQpWz3Cg53QE?=
 =?us-ascii?Q?Y0mm4hvVcrxDKRbkDF0HwyToI17x3kl4i64CiIeCnG3uEiIszimrs9SlGRqq?=
 =?us-ascii?Q?KwCpelMVF1DU7BWRWBEuDVaoFOw+EEn3XVmmqN2FZFDPU3QevpxXLTagOLsS?=
 =?us-ascii?Q?6YYwPg0BRw1bILKOOBlXC38nWb42CMcSkiO8pAcJCq8iL1uo5QH/8CzVapdW?=
 =?us-ascii?Q?3DfRDxJLsbSq3B2MSQhRqYBS7haS41RheBeuHdF4xt9EStpiQZaWgGEJbZ3G?=
 =?us-ascii?Q?QOC+UPr5yUJZ6bkM4TLv/IpDZ852RmMNQm6l8dXvj8Z5blU9MeZdtvNeetZL?=
 =?us-ascii?Q?GNJgd3akSlNHmoZRd7TwAS4VKPImU1I3LE6oKgrZBef/hgWgbhRLyefj08Xd?=
 =?us-ascii?Q?otFOCgQ/ySiyg1e6+LyMSHbar+F8sTOrQ3L96Tletph2MGMsbVYDK+4lt6LT?=
 =?us-ascii?Q?SCqRxt9kMSwzGwLn3llHtF8pgXqL6+x813T31nERjuD4ohz2s3WpvaENlLFq?=
 =?us-ascii?Q?e+s0miD8ndA+AmWHeYeTVkFUhNQiPQLWt2o9xs7JhK0J0SaDAsMXfIHCpXCU?=
 =?us-ascii?Q?TAeEqA30Lav/SmWvQkpck+57535ELfyQigSwC3tlJTXXClXBvyOBwGyZED7x?=
 =?us-ascii?Q?yEbOHi1yBYUI/pnor4pO0adWtWXtARVh2kp8fP1AF6lp4LwPqdR6PfOFnmHz?=
 =?us-ascii?Q?iopCClQeSRsaD7QPC8TAMHYrWcvkj9G1yKGllxeAhHnPAoE+/uhoT+Nal///?=
 =?us-ascii?Q?t9DaJsOfMFkOPsOihCpPqe/A3BG7XFpPf1T0ZttJVgYAKZ5QfzArOk/F24qh?=
 =?us-ascii?Q?gOXSdbiCvr+v9KebkVp39LTYk9w8X2tfMB5+lxiuRgp2sl0zRHpOzWKH6Hr2?=
 =?us-ascii?Q?SJPpHxWZL42kbUGx7B+nylHhqGXmDLU3S7DdcwZLN1ox+nCu+RkXeKjlBzxm?=
 =?us-ascii?Q?eS1H3897IbrZVSw0Q+4JNmUja5x/zI5EvroHLNpFqnLHXOWSVT+mZPAhlYkk?=
 =?us-ascii?Q?TMVJ/FQ0y+nLQymLKUHHG8X3F5uyfwan4aHzFYJSgeAZH5DcchDEZFt3p+xf?=
 =?us-ascii?Q?q+mU7lpwrrLv5nsNWTVBpoGnVRtEqInkGtWaKcUgYo4vtPSNN3X+hjfaSPNu?=
 =?us-ascii?Q?8xnTgM3vEGBiGDlCzYZMD72K6atmcC6vx11lhdIqNUo5sL8BjCTnVykulU3N?=
 =?us-ascii?Q?O62Odlni/sJ/V3UTqbeaO4ZqFuav3bCGVUwyWeEHioYURoNSWXfa4LejMq/b?=
 =?us-ascii?Q?kNcv5skS+lfQcIuVQw3A9S7wqASWCgRrImC1blTBvUXkqL3yUfInUiYDET30?=
 =?us-ascii?Q?XjupRiPuYpU/keIUuiJD6un/LWquW12F1CElTJEpCrzL6fEi5FpDNqH7EVn0?=
 =?us-ascii?Q?qzCzuCO9lXaWPGq+qO7BFLkI1xliMhe2meUFORakv6JsVzgzwPTbAI3YdKbO?=
 =?us-ascii?Q?FC0Nm+Oa+B/xk+ScBFpUjzn3u6fpPg+309sB?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:34:46.2133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b3f1b4-f6a9-4035-ea47-08dd9f7ebe47
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7150

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
index 6116221f0ca6..10f57f17fee8 100644
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
2.25.1

