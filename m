Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F91E1DE3;
	Fri, 30 May 2025 13:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612091; cv=fail; b=l2nRuOW226omU52wjCD4T0Xnxf0fLH0dz9ndtxxlVIvYkqadzns78XcPYsaMNU51e4cZhWfxx59NNOQddLAaZbq0A3zUSqd8h7vtZz5lVNgyRVYRKeAzoLxwfOHoAMr5LV2GZLrrI++UUzywDJFX1giEFDznQf7SZHxAVW98jIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612091; c=relaxed/simple;
	bh=KhmxtnvkBsC0lwn4iO77AGmTsqe3dxeT3CUVxua4bIE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RdSGCv339IZomi/q5IFwgI3g8I30PEd8P1wQOVxrmicBAANfzgLSCPTMgxDRy5qhZtfKJz7l9XcAYBYn6GD4Zcb4MkKAq8AWO6E3XE4eosvn4jwwjquQq0ZS3sEcqQCYrto2b1SVsPEOx61xJh5PZAsuTQIXW2bPrgNB8k3RFZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WgJNYiXk; arc=fail smtp.client-ip=40.107.94.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WgJNYiXk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTThqk9BHFQlY9A/eOvmy6mc9c+l6v/+DEMBOBPTYv/qi5cvYwasjIrtK5OWy829CrrQHk0SBqx6ihWe0f4rkjPjw5V9Opy9+rGVz4zqMk9nHFQXg1taesrHERJQCOBVdSoadJdIuKFO2fptIgOImU4s7j1TZi60EjxsZqPDVXHD9YuD2cfGdoBYCcHkQmFR5sWsb8/Tei1D1gGrckdtKZRYmaK5zLAu3lGYTtx2fIX3JqRGktFwOe94zcQEu+AS63MGUDqXqQ+AFY2adtkv8MmptQFIUmi2GIeULwESiZIzo6tYdn3HLA7kh0+3GehRCaGKDgv8GB7zaMgaiG+VwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gGwkgwOUCt/2U5V+HsATQ2436gyW4dCWzBj+4fiv0U=;
 b=Lim697e6y86nXEalyJQAFtUDSzuGvHpvRbmvNc8m4/NLJDO0KHKevAMeYd1JBfPLZewAhT9eXQiKkCXBmixCMCpDyopxjUV8oKB/9aSHUbtgdd5ywL5764sS5VrGsi+hBgSyHVJu3uDFlaI/8YEgxc30G1f26REVLRYYNOu102xlVQxnqLDpXphek3nFfKbKEMNJCM1KdSDh+dcBpRZXoRQVVd4KnUHtgOQTmorMTcX7Y0L7DdL8j8Mh5nQsM2zYYWGXURyozpP2gXx9O0JA0Da/ap8O1KyaBReuEu/xmK4ih0S2IU5v6xmMvhugrgKbdaVfWcbfb1oGzPwqesLsvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gGwkgwOUCt/2U5V+HsATQ2436gyW4dCWzBj+4fiv0U=;
 b=WgJNYiXkehfCdjNp2kjHxAQSKtO/jNGtRRrKHcjrx/U8lkNPGnoMdh3mzF/9WKh9taPHt7JKilAHuEEt/PQbxEYMGx4cB+0cVj1uhJqN7aVU9206Mz+/G6IGi9QTeM7UiCY9Xhl2NNTZcHKQGTE5UInMuVL8/XqeqG23k6TfqWZw1sdlEpa8lAlk9h1YsQTOhb2i7EsDAJRw9gkgjQdsxQSJOx/QJRlvo9HO1o7EXR7y0yqEIy4uUuzkhZKNl8LoMJackvgvgyXPq81dG9UVRSIlr5TmSJ1/dTsoLqYQrESzaqMhGXwK1b5UOD+0Jg81Ieo/lBckMAGzN+85qpSFsA==
Received: from PH8P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::22)
 by SA3PR12MB7806.namprd12.prod.outlook.com (2603:10b6:806:31d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 13:34:39 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:510:345:cafe::d4) by PH8P220CA0007.outlook.office365.com
 (2603:10b6:510:345::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.20 via Frontend Transport; Fri,
 30 May 2025 13:34:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.0 via Frontend Transport; Fri, 30 May 2025 13:34:39 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 06:34:22 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 30 May
 2025 06:34:22 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 06:34:18 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <--to=tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [Patch 2/8] soc: tegra: cbb: change master-slave to initiator-target
Date: Fri, 30 May 2025 19:03:30 +0530
Message-ID: <20250530133336.1419971-3-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|SA3PR12MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 23550b34-a473-4c69-f539-08dd9f7eba29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WcERS0o7mJdqUwMs7lAGJ+FVB5Yd+JwX3lMp2rQWYvpyBxjlt0cnsf9cssIv?=
 =?us-ascii?Q?nW7kPOpSfThqOe6JvyE5Y5kS3CLiLSqA5qugCbH0gixMmL6Oz0BQnuw1DevY?=
 =?us-ascii?Q?M79YTqDi0n6jOhRJ987sIH6yvG8/4uxyjJmtb4PYD6wsjKAbmrn4EGlvFN2u?=
 =?us-ascii?Q?53H4ehtZ2u+qP2fEcKijrbFLNGpwmQJnBsl13i3nNVfAvxluzgRZzsjv0TSN?=
 =?us-ascii?Q?fBrkkZZK+C0uuooc7UP8Gp3DoiosvNIbe0s4Itad586tL22y/9fqQ/iIOwv2?=
 =?us-ascii?Q?hhDspCAc8hITt7tLXlKq3HFZSANDFcwlneGCLbEAo+cK+yKjdH7zzf0vqawv?=
 =?us-ascii?Q?FqXqL++VXZ8GDkxI8wqhERjQVFoyqTP9cuBU2aCQRWaiHd32FSU+TktqhVFa?=
 =?us-ascii?Q?cLMM0pZsoDpXJqNt2zXpIC/oa0YyDh1u0TRV4MhXASfrGBYNkSnGwK1cdY8q?=
 =?us-ascii?Q?mTJ34N00Yn37Jlb8othX2WxL+nXylPBC+Qlv7DCKzEZQWN/m8W+Mj0YTLxZm?=
 =?us-ascii?Q?CtVJBBO3OZHaY+CYmquA0e7I93Pa1IGdvx7K+UFOuARzea08xWGI8EMCP/cU?=
 =?us-ascii?Q?RRgGxePN2kTrUQ/gm1JBok2wK3QzsP0x4M0tfKTRzjZ42SuRS9vbs20xtpee?=
 =?us-ascii?Q?wFYFk/YBsM+PMrEIP7aGGi90KdzLSUepuASL6A10Xo3r0qPuCP3aGMldOcLS?=
 =?us-ascii?Q?U+eNkVSJLrqrAW9L/YRP1FdgsQTSiWa/4np+qG5knu2C/mHAUX3VcFuDd6PT?=
 =?us-ascii?Q?zNmvf8UA8PNj1XPXmZzAlmx226ON8dhiEwBVZJqFdOtgfN74YjjNFUSvwurU?=
 =?us-ascii?Q?wHDE9WkbGJ42DXtNEBLMe26tVeE6TorF2rlOj4mbOxWFs5wWSo/cgpQ2ZIYq?=
 =?us-ascii?Q?x9V5+V7l3Xq5f1ZgLHcYYvo1iTrw/K7LioJz6HZJVZG1wN/7INw21LjYKEkj?=
 =?us-ascii?Q?ASWEFaXNGCq8ZljRc6iYjULcDJhb7V8aKeKLjg5Yczd8PC4NaKdJhnyodMHG?=
 =?us-ascii?Q?BzGT5LI+gz+TDo6DigD8yJado1mm2HyQVxq0RfwZ4YOxTsYXAwZwAhDHg8/l?=
 =?us-ascii?Q?CnrpLYnWfXmyb9/SRfMEmpZahAIpY3MgrVFpNs0U/YzJPgXetcCsd96yU5aE?=
 =?us-ascii?Q?QBfc8DxJmWf1gBVLdeNk71xpjhX27Wx+HUUpedHxl8+3jm8srqJJagzBYkXD?=
 =?us-ascii?Q?miBRxspnXt6D/uWfo20SCUIOqc2Z4w2CtncnaKDDjkJWi10lnnl1jssJT/ia?=
 =?us-ascii?Q?VGEhE+2fTKxFkbAD9Tviu+EalNrvGUhx4lJRjMyaUgE574maHtFTqG06CWSK?=
 =?us-ascii?Q?/MEthVo4Ai7D8451cMmW9b+FQXKZYcdkwdUqxwuRwgA03Q9wGckxnV2weCXJ?=
 =?us-ascii?Q?B31ZDN5WbiCM/MEncIw2HUQXr9bEBS06oLkyhxqNY1fzBBt+wiUuPq+/r5Z1?=
 =?us-ascii?Q?e8XIrso7cKRcwyiEBcy4ahQyCf6gxdYwa5Z9wcOCkzIJl0YENwtL8XNf1U/9?=
 =?us-ascii?Q?HulDg2JhN2HrDFMhQQ8DuFjOErbf0fy4niwH?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:34:39.3039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23550b34-a473-4c69-f539-08dd9f7eba29
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7806

Change usage of 'Master/Slave' to 'Initiator/Target' as per
the new convention.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra194-cbb.c |  34 ++---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 205 ++++++++++++++-------------
 2 files changed, 120 insertions(+), 119 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 846b17ffc2f9..c1bdea8c853f 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2021-2022, NVIDIA CORPORATION. All rights reserved
+ * Copyright (c) 2021-2025, NVIDIA CORPORATION. All rights reserved
  *
  * The driver handles Error's from Control Backbone(CBB) generated due to
  * illegal accesses. When an error is reported from a NOC within CBB,
@@ -138,7 +138,7 @@ struct tegra194_cbb_userbits {
 struct tegra194_cbb_noc_data {
 	const char *name;
 	bool erd_mask_inband_err;
-	const char * const *master_id;
+	const char * const *initiator_id;
 	unsigned int max_aperture;
 	const struct tegra194_cbb_aperture *noc_aperture;
 	const char * const *routeid_initflow;
@@ -216,7 +216,7 @@ static const char * const tegra194_axi2apb_error[] = {
 	"CH2RFIFOF - Ch2 Request FIFO Full interrupt"
 };
 
-static const char * const tegra194_master_id[] = {
+static const char * const tegra194_initiator_id[] = {
 	[0x0] = "CCPLEX",
 	[0x1] = "CCPLEX_DPMU",
 	[0x2] = "BPMP",
@@ -238,7 +238,7 @@ static const struct tegra_cbb_error tegra194_cbb_errors[] = {
 	{
 		.code = "SLV",
 		.source = "Target",
-		.desc = "Target error detected by CBB slave"
+		.desc = "Target error detected by CBB target"
 	}, {
 		.code = "DEC",
 		.source = "Initiator NIU",
@@ -1774,8 +1774,8 @@ static void print_errlog5(struct seq_file *file, struct tegra194_cbb *cbb)
 		tegra_cbb_print_err(file, "\t  AXI ID\t\t: %#x\n", userbits.axi_id);
 	}
 
-	tegra_cbb_print_err(file, "\t  Master ID\t\t: %s\n",
-			    cbb->noc->master_id[userbits.mstr_id]);
+	tegra_cbb_print_err(file, "\t  Initiator ID\t\t: %s\n",
+			    cbb->noc->initiator_id[userbits.mstr_id]);
 	tegra_cbb_print_err(file, "\t  Security Group(GRPSEC): %#x\n", userbits.grpsec);
 	tegra_cbb_print_cache(file, userbits.axcache);
 	tegra_cbb_print_prot(file, userbits.axprot);
@@ -1837,14 +1837,14 @@ print_errlog1_2(struct seq_file *file, struct tegra194_cbb *cbb,
 
 /*
  * Print transcation type, error code and description from ErrLog0 for all
- * errors. For NOC slave errors, all relevant error info is printed using
+ * errors. For NOC target errors, all relevant error info is printed using
  * ErrLog0 only. But additional information is printed for errors from
- * APB slaves because for them:
- *  - All errors are logged as SLV(slave) errors due to APB having only single
+ * APB targets because for them:
+ *  - All errors are logged as SLV(target) errors due to APB having only single
  *    bit pslverr to report all errors.
  *  - Exact cause is printed by reading DMAAPB_X_RAW_INTERRUPT_STATUS register.
  *  - The driver prints information showing AXI2APB bridge and exact error
- *    only if there is error in any AXI2APB slave.
+ *    only if there is error in any AXI2APB target.
  *  - There is still no way to disambiguate a DEC error from SLV error type.
  */
 static bool print_errlog0(struct seq_file *file, struct tegra194_cbb *cbb)
@@ -1884,8 +1884,8 @@ static bool print_errlog0(struct seq_file *file, struct tegra194_cbb *cbb)
 		/* For all SLV errors, read DMAAPB_X_RAW_INTERRUPT_STATUS
 		 * register to get error status for all AXI2APB bridges.
 		 * Print bridge details if a bit is set in a bridge's
-		 * status register due to error in a APB slave connected
-		 * to that bridge. For other NOC slaves, none of the status
+		 * status register due to error in a APB target connected
+		 * to that bridge. For other NOC targets, none of the status
 		 * register will be set.
 		 */
 
@@ -2118,7 +2118,7 @@ static const struct tegra_cbb_ops tegra194_cbb_ops = {
 static struct tegra194_cbb_noc_data tegra194_cbb_central_noc_data = {
 	.name = "cbb-noc",
 	.erd_mask_inband_err = true,
-	.master_id = tegra194_master_id,
+	.initiator_id = tegra194_initiator_id,
 	.noc_aperture = tegra194_cbbcentralnoc_apert_lookup,
 	.max_aperture = ARRAY_SIZE(tegra194_cbbcentralnoc_apert_lookup),
 	.routeid_initflow = tegra194_cbbcentralnoc_routeid_initflow,
@@ -2130,7 +2130,7 @@ static struct tegra194_cbb_noc_data tegra194_cbb_central_noc_data = {
 static struct tegra194_cbb_noc_data tegra194_aon_noc_data = {
 	.name = "aon-noc",
 	.erd_mask_inband_err = false,
-	.master_id = tegra194_master_id,
+	.initiator_id = tegra194_initiator_id,
 	.noc_aperture = tegra194_aonnoc_aperture_lookup,
 	.max_aperture = ARRAY_SIZE(tegra194_aonnoc_aperture_lookup),
 	.routeid_initflow = tegra194_aonnoc_routeid_initflow,
@@ -2142,7 +2142,7 @@ static struct tegra194_cbb_noc_data tegra194_aon_noc_data = {
 static struct tegra194_cbb_noc_data tegra194_bpmp_noc_data = {
 	.name = "bpmp-noc",
 	.erd_mask_inband_err = false,
-	.master_id = tegra194_master_id,
+	.initiator_id = tegra194_initiator_id,
 	.noc_aperture = tegra194_bpmpnoc_apert_lookup,
 	.max_aperture = ARRAY_SIZE(tegra194_bpmpnoc_apert_lookup),
 	.routeid_initflow = tegra194_bpmpnoc_routeid_initflow,
@@ -2154,7 +2154,7 @@ static struct tegra194_cbb_noc_data tegra194_bpmp_noc_data = {
 static struct tegra194_cbb_noc_data tegra194_rce_noc_data = {
 	.name = "rce-noc",
 	.erd_mask_inband_err = false,
-	.master_id = tegra194_master_id,
+	.initiator_id = tegra194_initiator_id,
 	.noc_aperture = tegra194_scenoc_apert_lookup,
 	.max_aperture = ARRAY_SIZE(tegra194_scenoc_apert_lookup),
 	.routeid_initflow = tegra194_scenoc_routeid_initflow,
@@ -2166,7 +2166,7 @@ static struct tegra194_cbb_noc_data tegra194_rce_noc_data = {
 static struct tegra194_cbb_noc_data tegra194_sce_noc_data = {
 	.name = "sce-noc",
 	.erd_mask_inband_err = false,
-	.master_id = tegra194_master_id,
+	.initiator_id = tegra194_initiator_id,
 	.noc_aperture = tegra194_scenoc_apert_lookup,
 	.max_aperture = ARRAY_SIZE(tegra194_scenoc_apert_lookup),
 	.routeid_initflow = tegra194_scenoc_routeid_initflow,
diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 1da31ead2b5e..5d04ed3b2d50 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -1,13 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2021-2022, NVIDIA CORPORATION. All rights reserved
+ * Copyright (c) 2021-2025, NVIDIA CORPORATION. All rights reserved
  *
  * The driver handles Error's from Control Backbone(CBB) version 2.0.
  * generated due to illegal accesses. The driver prints debug information
  * about failed transaction on receiving interrupt from Error Notifier.
  * Error types supported by CBB2.0 are:
  *   UNSUPPORTED_ERR, PWRDOWN_ERR, TIMEOUT_ERR, FIREWALL_ERR, DECODE_ERR,
- *   SLAVE_ERR
+ *   TARGET_ERR
  */
 
 #include <linux/acpi.h>
@@ -30,18 +30,18 @@
 #define FABRIC_EN_CFG_ADDR_LOW_0		0x80
 #define FABRIC_EN_CFG_ADDR_HI_0			0x84
 
-#define FABRIC_MN_MASTER_ERR_EN_0		0x200
-#define FABRIC_MN_MASTER_ERR_FORCE_0		0x204
-#define FABRIC_MN_MASTER_ERR_STATUS_0		0x208
-#define FABRIC_MN_MASTER_ERR_OVERFLOW_STATUS_0	0x20c
+#define FABRIC_MN_INITIATOR_ERR_EN_0		0x200
+#define FABRIC_MN_INITIATOR_ERR_FORCE_0		0x204
+#define FABRIC_MN_INITIATOR_ERR_STATUS_0		0x208
+#define FABRIC_MN_INITIATOR_ERR_OVERFLOW_STATUS_0	0x20c
 
-#define FABRIC_MN_MASTER_LOG_ERR_STATUS_0	0x300
-#define FABRIC_MN_MASTER_LOG_ADDR_LOW_0		0x304
-#define FABRIC_MN_MASTER_LOG_ADDR_HIGH_0	0x308
-#define FABRIC_MN_MASTER_LOG_ATTRIBUTES0_0	0x30c
-#define FABRIC_MN_MASTER_LOG_ATTRIBUTES1_0	0x310
-#define FABRIC_MN_MASTER_LOG_ATTRIBUTES2_0	0x314
-#define FABRIC_MN_MASTER_LOG_USER_BITS0_0	0x318
+#define FABRIC_MN_INITIATOR_LOG_ERR_STATUS_0	0x300
+#define FABRIC_MN_INITIATOR_LOG_ADDR_LOW_0		0x304
+#define FABRIC_MN_INITIATOR_LOG_ADDR_HIGH_0	0x308
+#define FABRIC_MN_INITIATOR_LOG_ATTRIBUTES0_0	0x30c
+#define FABRIC_MN_INITIATOR_LOG_ATTRIBUTES1_0	0x310
+#define FABRIC_MN_INITIATOR_LOG_ATTRIBUTES2_0	0x314
+#define FABRIC_MN_INITIATOR_LOG_USER_BITS0_0	0x318
 
 #define AXI_SLV_TIMEOUT_STATUS_0_0		0x8
 #define APB_BLOCK_TMO_STATUS_0			0xc00
@@ -53,7 +53,7 @@
 #define FAB_EM_EL_FALCONSEC		GENMASK(1, 0)
 
 #define FAB_EM_EL_FABID			GENMASK(20, 16)
-#define FAB_EM_EL_SLAVEID		GENMASK(7, 0)
+#define FAB_EM_EL_TARGETID		GENMASK(7, 0)
 
 #define FAB_EM_EL_ACCESSID		GENMASK(7, 0)
 
@@ -85,7 +85,7 @@ enum tegra234_cbb_fabric_ids {
 	MAX_FAB_ID,
 };
 
-struct tegra234_slave_lookup {
+struct tegra234_target_lookup {
 	const char *name;
 	unsigned int offset;
 };
@@ -96,12 +96,12 @@ struct tegra234_cbb_fabric {
 	phys_addr_t firewall_base;
 	unsigned int firewall_ctl;
 	unsigned int firewall_wr_ctl;
-	const char * const *master_id;
+	const char * const *initiator_id;
 	unsigned int notifier_offset;
 	const struct tegra_cbb_error *errors;
 	const int max_errors;
-	const struct tegra234_slave_lookup *slave_map;
-	const int max_slaves;
+	const struct tegra234_target_lookup *target_map;
+	const int max_targets;
 };
 
 struct tegra234_cbb {
@@ -185,9 +185,9 @@ static void tegra234_cbb_error_clear(struct tegra_cbb *cbb)
 {
 	struct tegra234_cbb *priv = to_tegra234_cbb(cbb);
 
-	writel(0, priv->mon + FABRIC_MN_MASTER_ERR_FORCE_0);
+	writel(0, priv->mon + FABRIC_MN_INITIATOR_ERR_FORCE_0);
 
-	writel(0x3f, priv->mon + FABRIC_MN_MASTER_ERR_STATUS_0);
+	writel(0x3f, priv->mon + FABRIC_MN_INITIATOR_ERR_STATUS_0);
 	dsb(sy);
 }
 
@@ -218,13 +218,13 @@ static u32 tegra234_cbb_get_tmo_slv(void __iomem *addr)
 	return timeout;
 }
 
-static void tegra234_cbb_tmo_slv(struct seq_file *file, const char *slave, void __iomem *addr,
+static void tegra234_cbb_tmo_slv(struct seq_file *file, const char *target, void __iomem *addr,
 				 u32 status)
 {
-	tegra_cbb_print_err(file, "\t  %s : %#x\n", slave, status);
+	tegra_cbb_print_err(file, "\t  %s : %#x\n", target, status);
 }
 
-static void tegra234_cbb_lookup_apbslv(struct seq_file *file, const char *slave,
+static void tegra234_cbb_lookup_apbslv(struct seq_file *file, const char *target,
 				       void __iomem *base)
 {
 	unsigned int block = 0;
@@ -234,7 +234,7 @@ static void tegra234_cbb_lookup_apbslv(struct seq_file *file, const char *slave,
 
 	status = tegra234_cbb_get_tmo_slv(base);
 	if (status)
-		tegra_cbb_print_err(file, "\t  %s_BLOCK_TMO_STATUS : %#x\n", slave, status);
+		tegra_cbb_print_err(file, "\t  %s_BLOCK_TMO_STATUS : %#x\n", target, status);
 
 	while (status) {
 		if (status & BIT(0)) {
@@ -249,7 +249,7 @@ static void tegra234_cbb_lookup_apbslv(struct seq_file *file, const char *slave,
 					if (clients != 0xffffffff)
 						clients &= BIT(client);
 
-					sprintf(name, "%s_BLOCK%d_TMO", slave, block);
+					sprintf(name, "%s_BLOCK%d_TMO", target, block);
 
 					tegra234_cbb_tmo_slv(file, name, addr, clients);
 				}
@@ -264,16 +264,16 @@ static void tegra234_cbb_lookup_apbslv(struct seq_file *file, const char *slave,
 	}
 }
 
-static void tegra234_lookup_slave_timeout(struct seq_file *file, struct tegra234_cbb *cbb,
-					  u8 slave_id, u8 fab_id)
+static void tegra234_lookup_target_timeout(struct seq_file *file, struct tegra234_cbb *cbb,
+					   u8 target_id, u8 fab_id)
 {
-	const struct tegra234_slave_lookup *map = cbb->fabric->slave_map;
+	const struct tegra234_target_lookup *map = cbb->fabric->target_map;
 	void __iomem *addr;
 
 	/*
-	 * 1) Get slave node name and address mapping using slave_id.
-	 * 2) Check if the timed out slave node is APB or AXI.
-	 * 3) If AXI, then print timeout register and reset axi slave
+	 * 1) Get target node name and address mapping using target_id.
+	 * 2) Check if the timed out target node is APB or AXI.
+	 * 3) If AXI, then print timeout register and reset axi target
 	 *    using <FABRIC>_SN_<>_SLV_TIMEOUT_STATUS_0_0 register.
 	 * 4) If APB, then perform an additional lookup to find the client
 	 *    which timed out.
@@ -287,12 +287,12 @@ static void tegra234_lookup_slave_timeout(struct seq_file *file, struct tegra234
 	 *	e) Goto step-a till all bits are set.
 	 */
 
-	addr = cbb->regs + map[slave_id].offset;
+	addr = cbb->regs + map[target_id].offset;
 
-	if (strstr(map[slave_id].name, "AXI2APB")) {
+	if (strstr(map[target_id].name, "AXI2APB")) {
 		addr += APB_BLOCK_TMO_STATUS_0;
 
-		tegra234_cbb_lookup_apbslv(file, map[slave_id].name, addr);
+		tegra234_cbb_lookup_apbslv(file, map[target_id].name, addr);
 	} else {
 		char name[64];
 		u32 status;
@@ -301,7 +301,7 @@ static void tegra234_lookup_slave_timeout(struct seq_file *file, struct tegra234
 
 		status = tegra234_cbb_get_tmo_slv(addr);
 		if (status) {
-			sprintf(name, "%s_SLV_TIMEOUT_STATUS", map[slave_id].name);
+			sprintf(name, "%s_SLV_TIMEOUT_STATUS", map[target_id].name);
 			tegra234_cbb_tmo_slv(file, name, addr, status);
 		}
 	}
@@ -351,7 +351,7 @@ static void tegra234_cbb_print_error(struct seq_file *file, struct tegra234_cbb
 static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 {
 	u8 cache_type, prot_type, burst_length, mstr_id, grpsec, vqc, falconsec, beat_size;
-	u8 access_type, access_id, requester_socket_id, local_socket_id, slave_id, fab_id;
+	u8 access_type, access_id, requester_socket_id, local_socket_id, target_id, fab_id;
 	char fabric_name[20];
 	bool is_numa = false;
 	u8 burst_type;
@@ -366,7 +366,7 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 
 	/*
 	 * For SOC with multiple NUMA nodes, print cross socket access
-	 * errors only if initiator/master_id is CCPLEX, CPMU or GPU.
+	 * errors only if initiator_id is CCPLEX, CPMU or GPU.
 	 */
 	if (is_numa) {
 		local_socket_id = numa_node_id();
@@ -379,7 +379,7 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 	}
 
 	fab_id = FIELD_GET(FAB_EM_EL_FABID, cbb->mn_attr2);
-	slave_id = FIELD_GET(FAB_EM_EL_SLAVEID, cbb->mn_attr2);
+	target_id = FIELD_GET(FAB_EM_EL_TARGETID, cbb->mn_attr2);
 
 	access_id = FIELD_GET(FAB_EM_EL_ACCESSID, cbb->mn_attr1);
 
@@ -397,7 +397,7 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 	else
 		tegra_cbb_print_err(file, "\t  Wrong type index:%u\n", cbb->type);
 
-	tegra_cbb_print_err(file, "\t  MASTER_ID\t\t: %s\n", cbb->fabric->master_id[mstr_id]);
+	tegra_cbb_print_err(file, "\t  Initiator_Id\t\t: %s\n", cbb->fabric->initiator_id[mstr_id]);
 	tegra_cbb_print_err(file, "\t  Address\t\t: %#llx\n", cbb->access);
 
 	tegra_cbb_print_cache(file, cache_type);
@@ -423,7 +423,7 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 	}
 
 	tegra_cbb_print_err(file, "\t  Fabric\t\t: %s\n", fabric_name);
-	tegra_cbb_print_err(file, "\t  Slave_Id\t\t: %#x\n", slave_id);
+	tegra_cbb_print_err(file, "\t  Target_Id\t\t: %#x\n", target_id);
 	tegra_cbb_print_err(file, "\t  Burst_length\t\t: %#x\n", burst_length);
 	tegra_cbb_print_err(file, "\t  Burst_type\t\t: %#x\n", burst_type);
 	tegra_cbb_print_err(file, "\t  Beat_size\t\t: %#x\n", beat_size);
@@ -434,24 +434,25 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 	if ((fab_id == PSC_FAB_ID) || (fab_id == FSI_FAB_ID))
 		return;
 
-	if (slave_id >= cbb->fabric->max_slaves) {
-		tegra_cbb_print_err(file, "\t  Invalid slave_id:%d\n", slave_id);
+	if (target_id >= cbb->fabric->max_targets) {
+		tegra_cbb_print_err(file, "\t  Invalid target_id:%d\n", target_id);
 		return;
 	}
 
 	if (!strcmp(cbb->fabric->errors[cbb->type].code, "TIMEOUT_ERR")) {
-		tegra234_lookup_slave_timeout(file, cbb, slave_id, fab_id);
+		tegra234_lookup_target_timeout(file, cbb, target_id, fab_id);
 		return;
 	}
 
-	tegra_cbb_print_err(file, "\t  Slave\t\t\t: %s\n", cbb->fabric->slave_map[slave_id].name);
+	tegra_cbb_print_err(file, "\t  Target\t\t\t: %s\n",
+			    cbb->fabric->target_map[target_id].name);
 }
 
 static int print_errmonX_info(struct seq_file *file, struct tegra234_cbb *cbb)
 {
 	u32 overflow, status, error;
 
-	status = readl(cbb->mon + FABRIC_MN_MASTER_ERR_STATUS_0);
+	status = readl(cbb->mon + FABRIC_MN_INITIATOR_ERR_STATUS_0);
 	if (!status) {
 		pr_err("Error Notifier received a spurious notification\n");
 		return -ENODATA;
@@ -462,11 +463,11 @@ static int print_errmonX_info(struct seq_file *file, struct tegra234_cbb *cbb)
 		return -EINVAL;
 	}
 
-	overflow = readl(cbb->mon + FABRIC_MN_MASTER_ERR_OVERFLOW_STATUS_0);
+	overflow = readl(cbb->mon + FABRIC_MN_INITIATOR_ERR_OVERFLOW_STATUS_0);
 
 	tegra234_cbb_print_error(file, cbb, status, overflow);
 
-	error = readl(cbb->mon + FABRIC_MN_MASTER_LOG_ERR_STATUS_0);
+	error = readl(cbb->mon + FABRIC_MN_INITIATOR_LOG_ERR_STATUS_0);
 	if (!error) {
 		pr_info("Error Monitor doesn't have Error Logger\n");
 		return -EINVAL;
@@ -478,15 +479,15 @@ static int print_errmonX_info(struct seq_file *file, struct tegra234_cbb *cbb)
 		if (error & BIT(0)) {
 			u32 hi, lo;
 
-			hi = readl(cbb->mon + FABRIC_MN_MASTER_LOG_ADDR_HIGH_0);
-			lo = readl(cbb->mon + FABRIC_MN_MASTER_LOG_ADDR_LOW_0);
+			hi = readl(cbb->mon + FABRIC_MN_INITIATOR_LOG_ADDR_HIGH_0);
+			lo = readl(cbb->mon + FABRIC_MN_INITIATOR_LOG_ADDR_LOW_0);
 
 			cbb->access = (u64)hi << 32 | lo;
 
-			cbb->mn_attr0 = readl(cbb->mon + FABRIC_MN_MASTER_LOG_ATTRIBUTES0_0);
-			cbb->mn_attr1 = readl(cbb->mon + FABRIC_MN_MASTER_LOG_ATTRIBUTES1_0);
-			cbb->mn_attr2 = readl(cbb->mon + FABRIC_MN_MASTER_LOG_ATTRIBUTES2_0);
-			cbb->mn_user_bits = readl(cbb->mon + FABRIC_MN_MASTER_LOG_USER_BITS0_0);
+			cbb->mn_attr0 = readl(cbb->mon + FABRIC_MN_INITIATOR_LOG_ATTRIBUTES0_0);
+			cbb->mn_attr1 = readl(cbb->mon + FABRIC_MN_INITIATOR_LOG_ATTRIBUTES1_0);
+			cbb->mn_attr2 = readl(cbb->mon + FABRIC_MN_INITIATOR_LOG_ATTRIBUTES2_0);
+			cbb->mn_user_bits = readl(cbb->mon + FABRIC_MN_INITIATOR_LOG_USER_BITS0_0);
 
 			print_errlog_err(file, cbb);
 		}
@@ -591,7 +592,7 @@ static irqreturn_t tegra234_cbb_isr(int irq, void *data)
 				goto unlock;
 
 			/*
-			 * If illegal request is from CCPLEX(id:0x1) master then call WARN()
+			 * If illegal request is from CCPLEX(id:0x1) initiator then call WARN()
 			 */
 			if (priv->fabric->off_mask_erd) {
 				mstr_id =  FIELD_GET(USRBITS_MSTR_ID, priv->mn_user_bits);
@@ -643,7 +644,7 @@ static const struct tegra_cbb_ops tegra234_cbb_ops = {
 #endif
 };
 
-static const char * const tegra234_master_id[] = {
+static const char * const tegra234_initiator_id[] = {
 	[0x00] = "TZ",
 	[0x01] = "CCPLEX",
 	[0x02] = "CCPMU",
@@ -674,8 +675,8 @@ static const char * const tegra234_master_id[] = {
 
 static const struct tegra_cbb_error tegra234_cbb_errors[] = {
 	{
-		.code = "SLAVE_ERR",
-		.desc = "Slave being accessed responded with an error"
+		.code = "TARGET_ERR",
+		.desc = "Target being accessed responded with an error"
 	}, {
 		.code = "DECODE_ERR",
 		.desc = "Attempt to access an address hole"
@@ -684,17 +685,17 @@ static const struct tegra_cbb_error tegra234_cbb_errors[] = {
 		.desc = "Attempt to access a region which is firewall protected"
 	}, {
 		.code = "TIMEOUT_ERR",
-		.desc = "No response returned by slave"
+		.desc = "No response returned by target"
 	}, {
 		.code = "PWRDOWN_ERR",
 		.desc = "Attempt to access a portion of fabric that is powered down"
 	}, {
 		.code = "UNSUPPORTED_ERR",
-		.desc = "Attempt to access a slave through an unsupported access"
+		.desc = "Attempt to access a target through an unsupported access"
 	}
 };
 
-static const struct tegra234_slave_lookup tegra234_aon_slave_map[] = {
+static const struct tegra234_target_lookup tegra234_aon_target_map[] = {
 	{ "AXI2APB", 0x00000 },
 	{ "AST",     0x14000 },
 	{ "CBB",     0x15000 },
@@ -703,9 +704,9 @@ static const struct tegra234_slave_lookup tegra234_aon_slave_map[] = {
 
 static const struct tegra234_cbb_fabric tegra234_aon_fabric = {
 	.name = "aon-fabric",
-	.master_id = tegra234_master_id,
-	.slave_map = tegra234_aon_slave_map,
-	.max_slaves = ARRAY_SIZE(tegra234_aon_slave_map),
+	.initiator_id = tegra234_initiator_id,
+	.target_map = tegra234_aon_target_map,
+	.max_targets = ARRAY_SIZE(tegra234_aon_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
 	.notifier_offset = 0x17000,
@@ -714,7 +715,7 @@ static const struct tegra234_cbb_fabric tegra234_aon_fabric = {
 	.firewall_wr_ctl = 0x8c8,
 };
 
-static const struct tegra234_slave_lookup tegra234_bpmp_slave_map[] = {
+static const struct tegra234_target_lookup tegra234_bpmp_target_map[] = {
 	{ "AXI2APB", 0x00000 },
 	{ "AST0",    0x15000 },
 	{ "AST1",    0x16000 },
@@ -724,9 +725,9 @@ static const struct tegra234_slave_lookup tegra234_bpmp_slave_map[] = {
 
 static const struct tegra234_cbb_fabric tegra234_bpmp_fabric = {
 	.name = "bpmp-fabric",
-	.master_id = tegra234_master_id,
-	.slave_map = tegra234_bpmp_slave_map,
-	.max_slaves = ARRAY_SIZE(tegra234_bpmp_slave_map),
+	.initiator_id = tegra234_initiator_id,
+	.target_map = tegra234_bpmp_target_map,
+	.max_targets = ARRAY_SIZE(tegra234_bpmp_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
 	.notifier_offset = 0x19000,
@@ -735,7 +736,7 @@ static const struct tegra234_cbb_fabric tegra234_bpmp_fabric = {
 	.firewall_wr_ctl = 0x8e8,
 };
 
-static const struct tegra234_slave_lookup tegra234_cbb_slave_map[] = {
+static const struct tegra234_target_lookup tegra234_cbb_target_map[] = {
 	{ "AON",        0x40000 },
 	{ "BPMP",       0x41000 },
 	{ "CBB",        0x42000 },
@@ -801,9 +802,9 @@ static const struct tegra234_slave_lookup tegra234_cbb_slave_map[] = {
 
 static const struct tegra234_cbb_fabric tegra234_cbb_fabric = {
 	.name = "cbb-fabric",
-	.master_id = tegra234_master_id,
-	.slave_map = tegra234_cbb_slave_map,
-	.max_slaves = ARRAY_SIZE(tegra234_cbb_slave_map),
+	.initiator_id = tegra234_initiator_id,
+	.target_map = tegra234_cbb_target_map,
+	.max_targets = ARRAY_SIZE(tegra234_cbb_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
 	.notifier_offset = 0x60000,
@@ -813,7 +814,7 @@ static const struct tegra234_cbb_fabric tegra234_cbb_fabric = {
 	.firewall_wr_ctl = 0x23e8,
 };
 
-static const struct tegra234_slave_lookup tegra234_common_slave_map[] = {
+static const struct tegra234_target_lookup tegra234_common_target_map[] = {
 	{ "AXI2APB", 0x00000 },
 	{ "AST0",    0x15000 },
 	{ "AST1",    0x16000 },
@@ -824,9 +825,9 @@ static const struct tegra234_slave_lookup tegra234_common_slave_map[] = {
 
 static const struct tegra234_cbb_fabric tegra234_dce_fabric = {
 	.name = "dce-fabric",
-	.master_id = tegra234_master_id,
-	.slave_map = tegra234_common_slave_map,
-	.max_slaves = ARRAY_SIZE(tegra234_common_slave_map),
+	.initiator_id = tegra234_initiator_id,
+	.target_map = tegra234_common_target_map,
+	.max_targets = ARRAY_SIZE(tegra234_common_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
 	.notifier_offset = 0x19000,
@@ -837,9 +838,9 @@ static const struct tegra234_cbb_fabric tegra234_dce_fabric = {
 
 static const struct tegra234_cbb_fabric tegra234_rce_fabric = {
 	.name = "rce-fabric",
-	.master_id = tegra234_master_id,
-	.slave_map = tegra234_common_slave_map,
-	.max_slaves = ARRAY_SIZE(tegra234_common_slave_map),
+	.initiator_id = tegra234_initiator_id,
+	.target_map = tegra234_common_target_map,
+	.max_targets = ARRAY_SIZE(tegra234_common_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
 	.notifier_offset = 0x19000,
@@ -850,9 +851,9 @@ static const struct tegra234_cbb_fabric tegra234_rce_fabric = {
 
 static const struct tegra234_cbb_fabric tegra234_sce_fabric = {
 	.name = "sce-fabric",
-	.master_id = tegra234_master_id,
-	.slave_map = tegra234_common_slave_map,
-	.max_slaves = ARRAY_SIZE(tegra234_common_slave_map),
+	.initiator_id = tegra234_initiator_id,
+	.target_map = tegra234_common_target_map,
+	.max_targets = ARRAY_SIZE(tegra234_common_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
 	.notifier_offset = 0x19000,
@@ -861,7 +862,7 @@ static const struct tegra234_cbb_fabric tegra234_sce_fabric = {
 	.firewall_wr_ctl = 0x288,
 };
 
-static const char * const tegra241_master_id[] = {
+static const char * const tegra241_initiator_id[] = {
 	[0x0] = "TZ",
 	[0x1] = "CCPLEX",
 	[0x2] = "CCPMU",
@@ -879,22 +880,22 @@ static const char * const tegra241_master_id[] = {
 };
 
 /*
- * Possible causes for Slave and Timeout errors.
- * SLAVE_ERR:
- * Slave being accessed responded with an error. Slave could return
+ * Possible causes for Target and Timeout errors.
+ * TARGET_ERR:
+ * Target being accessed responded with an error. Target could return
  * an error for various cases :
  *   Unsupported access, clamp setting when power gated, register
- *   level firewall(SCR), address hole within the slave, etc
+ *   level firewall(SCR), address hole within the target, etc
  *
  * TIMEOUT_ERR:
- * No response returned by slave. Can be due to slave being clock
- * gated, under reset, powered down or slave inability to respond
- * for an internal slave issue
+ * No response returned by target. Can be due to target being clock
+ * gated, under reset, powered down or target inability to respond
+ * for an internal target issue
  */
 static const struct tegra_cbb_error tegra241_cbb_errors[] = {
 	{
-		.code = "SLAVE_ERR",
-		.desc = "Slave being accessed responded with an error."
+		.code = "TARGET_ERR",
+		.desc = "Target being accessed responded with an error."
 	}, {
 		.code = "DECODE_ERR",
 		.desc = "Attempt to access an address hole or Reserved region of memory."
@@ -903,16 +904,16 @@ static const struct tegra_cbb_error tegra241_cbb_errors[] = {
 		.desc = "Attempt to access a region which is firewalled."
 	}, {
 		.code = "TIMEOUT_ERR",
-		.desc = "No response returned by slave."
+		.desc = "No response returned by target."
 	}, {
 		.code = "PWRDOWN_ERR",
 		.desc = "Attempt to access a portion of the fabric that is powered down."
 	}, {
 		.code = "UNSUPPORTED_ERR",
-		.desc = "Attempt to access a slave through an unsupported access."
+		.desc = "Attempt to access a target through an unsupported access."
 	}, {
 		.code = "POISON_ERR",
-		.desc = "Slave responds with poison error to indicate error in data."
+		.desc = "Target responds with poison error to indicate error in data."
 	}, {
 		.code = "RSVD"
 	}, {
@@ -970,7 +971,7 @@ static const struct tegra_cbb_error tegra241_cbb_errors[] = {
 	},
 };
 
-static const struct tegra234_slave_lookup tegra241_cbb_slave_map[] = {
+static const struct tegra234_target_lookup tegra241_cbb_target_map[] = {
 	{ "RSVD",       0x00000 },
 	{ "PCIE_C8",    0x51000 },
 	{ "PCIE_C9",    0x52000 },
@@ -1034,9 +1035,9 @@ static const struct tegra234_slave_lookup tegra241_cbb_slave_map[] = {
 
 static const struct tegra234_cbb_fabric tegra241_cbb_fabric = {
 	.name = "cbb-fabric",
-	.master_id = tegra241_master_id,
-	.slave_map = tegra241_cbb_slave_map,
-	.max_slaves = ARRAY_SIZE(tegra241_cbb_slave_map),
+	.initiator_id = tegra241_initiator_id,
+	.target_map = tegra241_cbb_target_map,
+	.max_targets = ARRAY_SIZE(tegra241_cbb_target_map),
 	.errors = tegra241_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
 	.notifier_offset = 0x60000,
@@ -1046,7 +1047,7 @@ static const struct tegra234_cbb_fabric tegra241_cbb_fabric = {
 	.firewall_wr_ctl = 0x2368,
 };
 
-static const struct tegra234_slave_lookup tegra241_bpmp_slave_map[] = {
+static const struct tegra234_target_lookup tegra241_bpmp_target_map[] = {
 	{ "RSVD",    0x00000 },
 	{ "RSVD",    0x00000 },
 	{ "RSVD",    0x00000 },
@@ -1059,9 +1060,9 @@ static const struct tegra234_slave_lookup tegra241_bpmp_slave_map[] = {
 
 static const struct tegra234_cbb_fabric tegra241_bpmp_fabric = {
 	.name = "bpmp-fabric",
-	.master_id = tegra241_master_id,
-	.slave_map = tegra241_bpmp_slave_map,
-	.max_slaves = ARRAY_SIZE(tegra241_bpmp_slave_map),
+	.initiator_id = tegra241_initiator_id,
+	.target_map = tegra241_bpmp_target_map,
+	.max_targets = ARRAY_SIZE(tegra241_bpmp_target_map),
 	.errors = tegra241_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
 	.notifier_offset = 0x19000,
-- 
2.25.1

