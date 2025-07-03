Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACA62E266C;
	Thu,  3 Jul 2025 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539155; cv=fail; b=O8MSRCCrwYmwb+asiP5j2vh6rpbp3qm/m3G+9SBwKBta4IUzjfQzjaCfx9eH1UvrZsqd3ZO7LKnlzi6vnr6I71WflWxNOi5bF8HgAij3iTQqeapbi4717cO6vP52zGGpj6d/RGyfwXIzPHL86YmvZ5hMDOOoRLtLCcXDPHLiiKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539155; c=relaxed/simple;
	bh=/KoiG9oC+6ukrdJWb5wCW7P0Yld2yfCJy1U/CmPg3Po=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V87IWDZw3Pz/G0YgywsxA/Z7YCUAsVBM2mjFgmeHZAzG9RKOufm0Dj7ct4fMcZsm1zncWmYiO3u+7ct7AdUU1v1VugqTNqmIhdzl/F7d+g+d9pSs65xNgnpmGors9k58PaZrDO1swpL+o7uVwIxn8pdTRkGx+RmVKQsuersyAoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CSl7fZzx; arc=fail smtp.client-ip=40.107.92.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CSl7fZzx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMSBQBXWe+7RtaVKkEsgZUQZzTpJGn+NX14yWLBgOibOE9FGhNZBSH+ZOyu4C8vTO1te6zYNIkWKY+eu47ljN8LLYIp3BIvJ31C2DEGILmPUWUYw1iSHsjm63sooi313usuIDMuNQZ36yATZh6B4Z7tsSCGmMHOkaaR7Xy9eEhQh/zTbA6pM+/YQfJWzkoDBMPkGgRb1f4LD8hnHmmMtmd0V/ewpwyET7VTUVoRhduF551f2iSm0tNGFD2Lys1BSR7r2SnCarXoLOMEcAQbhA0+KXMsayFFzDJr7UUIml37zcbEseZc/FiEz9TF3GeJuPqNrHEULS1mNdmGowuz51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6dP2dVoePfydBdEWYS4xlVlzrxilNkumpA/eLn7Dc0=;
 b=y41h8435gZ99hu4Ax8UvH2Gk1JXlFfhGDEKBlTdz1+jQMQYkBpGcjlSWQIj6pyn0hdjw2oL4U87e7TQiiA9u8BsVXG/IwOAJ1j4zS5ElgP4NOBOGG/VXunBE11J/gR9J6mS5yFoPZaS7lOqdR9+Lp1xNiTlkuKSqldL9d01hWHoMq+SAFRraXI/z6/OxOHFSA4js55snIRsWyQySIySv0vM768Ww4JwukkPaCg+ZpBUkAQns742nVlwHzhjeHwv5/GOy325hOBvf68CDs7VWguTZsVUeTGiQPk7v1uhrtHByJZ8EWtbKRuGdSl9S6UaE6GTnF7e9kwj7WmtJyUI6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6dP2dVoePfydBdEWYS4xlVlzrxilNkumpA/eLn7Dc0=;
 b=CSl7fZzxihb5mp2WGRKyFKCXAnN86vRtWkG9DiMxWQY4lICBqWRzJKhY9NVbNdBWuBmbyPimiSwa0b1Tb9ITdpDOPy4v2rkm1K+IAlVayC7f87/STsuXS/HqCm/XPFXIyv4pQM0c9f31kA1L0zdT5l6XUDhqEtfvK70pt1OlkkH7Ig78WFgxJpN4AKRZyPp4O4kqhd0ai5+AIEIEZJV1ywJYxZ4jgFPMiUzH5EfCaGptKG1XMReXeZh2f6zrN95TKJL2jZSlmSN9vmRv7OalPeI4V7EnP2GrMnx9lSqaFUu0b43wcfaq5Eqr689123696ZAqj59mroxbfbmWNl5prw==
Received: from CH2PR10CA0021.namprd10.prod.outlook.com (2603:10b6:610:4c::31)
 by IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:39:01 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::b8) by CH2PR10CA0021.outlook.office365.com
 (2603:10b6:610:4c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 10:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 10:39:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 03:38:51 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 03:38:50 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 03:38:47 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 2/8] soc: tegra: cbb: change master-slave to initiator-target
Date: Thu, 3 Jul 2025 16:08:23 +0530
Message-ID: <20250703103829.1721024-3-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|IA1PR12MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b1ca13-1219-4ea3-dcca-08ddba1dd2e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yZ6HEjjie/g0gUHiqij4PdIyppVJSvP+X3b54npgUgQbOvIDWZTYPGtQOt9i?=
 =?us-ascii?Q?g4/GfDPv7cJ8llNCfWA/f/l/v/kdR/QMWK1FOXijudI58tSzKim+dicqJNHx?=
 =?us-ascii?Q?7hGfVGdFow6farH+lDUGpxP5fYgmpub5ELGaMaMJ7LHIHB+yVnwO0Ao6kQ0k?=
 =?us-ascii?Q?zdb5Dh/sHSjjak9/AyNeV6euhXDQIY0ou53+KuWv77SuMDw8B4IVBcF0u+mA?=
 =?us-ascii?Q?7p4jMBinY/7mmuWSq1h79IP2apxqJAGTrVdgHEi8Gr0MvD/uEMTgM8fGw3UM?=
 =?us-ascii?Q?h6JEUMgxdFE6avCeZGbCN5NS4RTmwpjq3NGcRgKoDlrDgsavwjqhQgiggiHW?=
 =?us-ascii?Q?OLY9jOuS4B9H4BxCsctIDR15hgcpx78/v6K/D8cWpD1vxRYULckfvRRlhEoy?=
 =?us-ascii?Q?tb2+5SuRDyvaEMvsHbux51lpeI0r5TZ9U9Nh7IFqAEha8vI3jNj7YzeoBACI?=
 =?us-ascii?Q?/Rde72JigPzj9edqW8p+CK1eEuNTIHShup9YnQ2GroetJouFwMmHGYE/2N6j?=
 =?us-ascii?Q?25IRycreNRteQyabhD6Ox5CZJ00WhjdR0o2b4wDOeKF6HrNdGEtcB6v+tK8F?=
 =?us-ascii?Q?P5nla6Rwy5QHZl+wOmhCdVYg3ITdz541tqxiFbt90fTRF7lcmWk6Qiqtg+89?=
 =?us-ascii?Q?LZtPRSYl/4UjF7TVYOvjJNw6O8voz3c0ZYajSbDGbKQXAY+kbs2IkkjDByeE?=
 =?us-ascii?Q?xtjMFEUVxgLKCYnDFWYpvxVEv8EPuoDfTG/lWK+rSiPMvALexmYJbhfvg/Yf?=
 =?us-ascii?Q?fQCyz/abL0KUH81jdnOu7aFVPeWGcdnfLYF9nvlzzoAItHOszqMh/RwLY8Yp?=
 =?us-ascii?Q?UeQ7Y1yJPXsHQmsTY34hcTz306AoAzVvou0/fdVIEusNWR1qs5PH2ypk6Iu/?=
 =?us-ascii?Q?n5OmjqBPkiE9ijKJocsvX6aQoZC3qqBzb/x+OTXjqCZ4ZQsFgxYF8DkS/IK0?=
 =?us-ascii?Q?FRyCmFJiNcFxOKDWHYI5SGEpll5uPAyhNDdSNSz+EpgwHLk+TYHbmoSXcG/U?=
 =?us-ascii?Q?ohF+92/ODX/ZMsHvfuv4SjFucW1yw8pbQN2HJMwRqcEysVQn07jvdFIu/ZW/?=
 =?us-ascii?Q?b7PEnXF2QnxqR276nwBKrNzezXd738IpBad23TuzV/rpi1pV1agwNrV549oX?=
 =?us-ascii?Q?+B6VgEjGsynGyhcfdzFHctiGtQSC00U20VaNgQiELknnCf/v9uEuGbzsjAdz?=
 =?us-ascii?Q?X8KdVe+IiOOOOZPE3rY9FF/LRsmnO+HhH2atfKRoV83wBSYDiy60s9Qv1Sqv?=
 =?us-ascii?Q?wfnCwIgM/37ibZOMo1sBeFpO0x/rOHMs5LsC12TktPZoNo3uiOh8+cAUpDRA?=
 =?us-ascii?Q?wc5YSUjvxflwrtPvy3MT+xZRpOk8+KuoAUlykRM/4v6EAQmBD9wkI2d85Opq?=
 =?us-ascii?Q?kPxERbAy4yeiASRM7Y9ZGCVQ8bkzpxXFnxgH/v6do4Rj6xGx4rxT33rabew/?=
 =?us-ascii?Q?v3oDsBVZOX2qXmYWu/DKIGmHJlxg6G/ka6mPXrr5E5xfSg3WR7Z5V4zCBDoB?=
 =?us-ascii?Q?JFwdI3YkWQXlvJsdzyowKP9T1PIIjVgd1+Jr?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:39:01.0201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b1ca13-1219-4ea3-dcca-08ddba1dd2e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061

Change usage of 'Master/Slave' to 'Initiator/Target' as per
the new convention.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra194-cbb.c |  34 ++---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 205 ++++++++++++++-------------
 2 files changed, 120 insertions(+), 119 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 846b17ffc2f97..c1bdea8c853fe 100644
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
index 1da31ead2b5eb..5d04ed3b2d50d 100644
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
2.34.1

