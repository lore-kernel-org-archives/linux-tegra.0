Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F76136E3B;
	Thu, 23 Jan 2025 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737636430; cv=fail; b=iMWEtOOsQ2MUMpmj55QVgDbmdc542mSnRbwYz08adt+LcAKUaKgcbrWqhKNjxFHRwAm3aTv9CRjU4DyVMA9mmlJBoxc5MK6hpDdJNTgHy6LnxrMKoJQsKogYmt1k4+lfEjkJzJ6G1DE1QU70RLTAbolfZYS8jX/o83h7F7go1sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737636430; c=relaxed/simple;
	bh=LRwRe4z8thYtlguOXTWRRbFTCqTGs0LPaOGKnOJ+flk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AW4thJ7Ot7LRi9vEAoZCiOTZ2cTKdHjUSHnzSv4RrqRsBXRIWzvVR/iRRI5yY+FuDWvkBgWR+i92v12R8RK5KL4IICG5DJdRslNg/h6grLYKShDELSYYC53x1Hgj0PomiapEUbmBXsTsPXeXes7L2/LXNFB2ecxAQXy03hj1mDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k3YusUxF; arc=fail smtp.client-ip=40.107.237.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k3YusUxF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3Tk9yKqTbN1AEKVF2ipvr2aurE2ncqPiNzoOKIv5xNkD2T0uWbavtCBbuw23hdNq8VhY+yu0rhKUd0xyYTdW9lwwp9lR+IS3zRVvwbIkJx9yQ0j8IlMzOPZ0YKUNJuU1fv3UDnb540ii0ZrC1ZZS5XeFd4GAK/zBKzYr5uxU+McZh67VmQCJwWymPSgp8QyJwXQJedoAtFjLRfDGR8J+d781jjEOOMo3wtzq8sDrQi6seQsUiB8/E4BQuNF899xCbxbGCbzQ8LF2khUqWTSCteZkAZ0MHldJNFJDRjt5aXlzTaBLjaLpoOS5nwQsl6S9cxr4QTiy0LOa9HbE2EZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7cTZgMUIWeMJiWAk2MhZABGr5YdsQg3nnu61NdVm3o=;
 b=UHov8dhd85J5fwjsdaw+Y34U379CYxWUF447oXIHsP/rnq+bQFmwL70oshIvrPXsfhwtTKjqvQjjAbAl1ki9ZYjM9D3hM6FS0Ll9ujCSkNg+3P43seSlPCa1dOEFVNg7xbxhQ6PQhjfpZGRYd7vzmVZecpYf+xQ7TyzM6MHK9cyYD5yZ0//IH7j8ZfRnAEC9DU8mmJIZ+IqXt7AoHUQPIH9U+5a+dvxp3dsbG92Wc10/gEnob6HWwnYKgt1Qu3J7myGni8Crc/QNEl2PS3gLyikJsp1sxuByAACKx75J+c+hfevXBWz1WWsNzaZp2kFJtU774ln+Gky1ItqBwamqng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7cTZgMUIWeMJiWAk2MhZABGr5YdsQg3nnu61NdVm3o=;
 b=k3YusUxFJ8bcF0OzjvVkXdrEz0YDz3fNMxX7iU9kVm05rr1KRa93BxerSm/DmWR4fbkY1iKzIv2X2Qn8e39zT2RFUoW3FC2iADsM4VT4QRVYEEilHu+viN8dwlzpcrj/WO6C/QzaWJTiVTUpOHMnVrwxEcukgMXVABPqqcBcWB2airaOxFU3lgejm2Q0rLAnzFEj9Z5oWQHdmq5RSaTXfsV8Pz8YR433SAFFOKE9kNgLhQ64xOkV5KVgZS5Nn5keVE4zeKTtM2gX1wApdwBLMPST3AvWljYHvTvKJW7wc+Mz0csOIiCMkaoEuQk/KQ8OtoyZsuymvhx+YP5mKmgNJg==
Received: from CYZPR11CA0007.namprd11.prod.outlook.com (2603:10b6:930:8d::29)
 by SA1PR12MB8698.namprd12.prod.outlook.com (2603:10b6:806:38b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 12:47:01 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:8d:cafe::6f) by CYZPR11CA0007.outlook.office365.com
 (2603:10b6:930:8d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.18 via Frontend Transport; Thu,
 23 Jan 2025 12:47:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 12:47:00 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 04:46:50 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 04:46:50 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 23 Jan 2025 04:46:44 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] mailbox: tegra-hsp: Define dimensioning masks in soc data
Date: Thu, 23 Jan 2025 18:16:32 +0530
Message-ID: <20250123124632.9061-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|SA1PR12MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b467464-e1d1-4d86-1ddd-08dd3bac07e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KpGDY1tC5WjeF2bBrBvUMBY9TaRsbrZ/7Jm9zT4/DfjCv5jWwN6NlWWebp5m?=
 =?us-ascii?Q?B3/Nd/V1KlLrQ4PH2c/hSF9OJu9GLr67A1i7+0pzDS0ZFz+VZSWvTbSBhVjH?=
 =?us-ascii?Q?hfAKdMoRFMHhPQlw6MDQE9gwNQetf7yMpyK5I9J8BSvnplwIYAgJB7Q672ZZ?=
 =?us-ascii?Q?KY91pDegPgpOuf44lShMjhdOZFZwO4MTUVL4bSvr1l0BDhDsRNnC5ZhpwFwk?=
 =?us-ascii?Q?zZfg1e9w2QTb60g1nQ+O0ESBr1BZOAUe0Ik9A7mgS0XSnEMx48Al+5lVuNL5?=
 =?us-ascii?Q?XHBs/Lf1wYmw41PFxSd9RjgEwzGzMeNo2RcAu6o8s3jRs8FIT08zhhvfpclo?=
 =?us-ascii?Q?HEWhnyNZTZoS61rnbaG+K0RCjnlMsJZtj75dO6uNxukhVTGRT7cUHqy58/pQ?=
 =?us-ascii?Q?CwaMAhjRA8qSya69hN6MCGBum8xf3IJz7/nKAuXBKqWUINTv2WlESpCFiyVo?=
 =?us-ascii?Q?WifhdRltwegQJbUQfHtFQc4iiD0G3xvlo+lhNLZRHOVp7E2jcSfVDoCp9c+R?=
 =?us-ascii?Q?fwS9C1A8H21hP0voWe5NqTS4Cjl57/jXHPQjdA/pzDpFGNLWYs8CZHin3zh6?=
 =?us-ascii?Q?ONyku03RZeA+E4meFmp2I+HU5AFxJ4N99vHbtR+Q3t9a0ydNVCspUSSvRpla?=
 =?us-ascii?Q?tV4rGe2y7u4jKLb+MeVUGAuQ1M3neC8BRBOFONiQV5Idc2QcKY2a64dZDDN5?=
 =?us-ascii?Q?/AJftWCTJ3z+rZb1H12Fc2N+s/n+7E4kEqtjfVcVy99y8HUgvNQz4kP5cNNh?=
 =?us-ascii?Q?kJ6FAU/kccclZDfWv1t3tZFOfvIWWJbRAXxiwkJ4hkfm0lNo/BRv8jC985EC?=
 =?us-ascii?Q?d9XTtECY4uxP9Z/DYImAk8X5nTktBAb1rwtnetlELhCIViQEJB9zZmevDVUL?=
 =?us-ascii?Q?++uIz4SZdwJ9JkHRtL5snqYZvM6dfupvsAj0OnJXeBOHpWDW8958ZM7Mjxlb?=
 =?us-ascii?Q?8u0yMxNGDcd0kGKJh+zEi8BCjIlW35ipnLDfjasgPs7XQf75jPXap/ga3zCG?=
 =?us-ascii?Q?j7E0QQDfpE9R10erXRjnLdA2S86AkbcYgqstBlm0tJgTqsAU3Y47DQQwGySN?=
 =?us-ascii?Q?n2RJZeNeIxCjkhIDQvoU8tBuKFisjkqhccJmTwmXtA/+joI4Dg/l89VZqM9o?=
 =?us-ascii?Q?uehkOo/ifGb5LhIciOKThvolU49w7nIv6dpRqpnNIXwVEBuQRDPRxrJCsf0V?=
 =?us-ascii?Q?TdQ62iN4Ft0Xq1Iu976wB9o07/P0oAgEF347IPN37/1DBnB/4SA+IM8wjJ5Y?=
 =?us-ascii?Q?t+vqdlZeT6Z8Z0yI/S6DbNHI8YQAJ3kY1FY4U36PwRIQl6RcTyi/4m8dAOOq?=
 =?us-ascii?Q?qCbg/qMGP9lCKsCmKWJoMWd1FLi+IiTCCYPjDGVAjp9/ke3tqby/aXG0Rb/R?=
 =?us-ascii?Q?3CGZjpy6WUYWAlHki9gzKkmsyilVBY2fTw3XpMDeaYcx68PNODgNnG+67/9S?=
 =?us-ascii?Q?Q2XPCkOY9uC1UassJdOF46Pf2DPxdjhOMCjvDk5gxrZ4xQdjlV0S9Lya/7Cr?=
 =?us-ascii?Q?RfdqGW//zTFIbvs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 12:47:00.8163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b467464-e1d1-4d86-1ddd-08dd3bac07e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8698

Tegra264 has updated HSP_INT_DIMENSIONING register as follows:
	* nSI is now BIT17:BIT21.
	* nDB is now BIT12:BIT16.

Currently, we are using a static macro HSP_nINT_MASK to get the values
from HSP_INT_DIMENSIONING register. This results in wrong values for nSI
for HSP instances that supports 16 shared interrupts.

Define dimensioning masks in soc data and use them to parse nSI, nDB,
nAS, nSS & nSM values.

Fixes: 602dbbacc3ef ("mailbox: tegra: add support for Tegra264")
Cc: stable@vger.kernel.org

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/mailbox/tegra-hsp.c | 72 ++++++++++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 8d5e2d7dc03b..038d4a4080e7 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2023, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2016-2025, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/delay.h>
@@ -28,12 +28,6 @@
 #define HSP_INT_FULL_MASK	0xff
 
 #define HSP_INT_DIMENSIONING	0x380
-#define HSP_nSM_SHIFT		0
-#define HSP_nSS_SHIFT		4
-#define HSP_nAS_SHIFT		8
-#define HSP_nDB_SHIFT		12
-#define HSP_nSI_SHIFT		16
-#define HSP_nINT_MASK		0xf
 
 #define HSP_DB_TRIGGER	0x0
 #define HSP_DB_ENABLE	0x4
@@ -97,6 +91,20 @@ struct tegra_hsp_soc {
 	bool has_per_mb_ie;
 	bool has_128_bit_mb;
 	unsigned int reg_stride;
+
+	/* Shifts for dimensioning register. */
+	unsigned int si_shift;
+	unsigned int db_shift;
+	unsigned int as_shift;
+	unsigned int ss_shift;
+	unsigned int sm_shift;
+
+	/* Masks for dimensioning register. */
+	unsigned int si_mask;
+	unsigned int db_mask;
+	unsigned int as_mask;
+	unsigned int ss_mask;
+	unsigned int sm_mask;
 };
 
 struct tegra_hsp {
@@ -745,11 +753,11 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 		return PTR_ERR(hsp->regs);
 
 	value = tegra_hsp_readl(hsp, HSP_INT_DIMENSIONING);
-	hsp->num_sm = (value >> HSP_nSM_SHIFT) & HSP_nINT_MASK;
-	hsp->num_ss = (value >> HSP_nSS_SHIFT) & HSP_nINT_MASK;
-	hsp->num_as = (value >> HSP_nAS_SHIFT) & HSP_nINT_MASK;
-	hsp->num_db = (value >> HSP_nDB_SHIFT) & HSP_nINT_MASK;
-	hsp->num_si = (value >> HSP_nSI_SHIFT) & HSP_nINT_MASK;
+	hsp->num_sm = (value >> hsp->soc->sm_shift) & hsp->soc->sm_mask;
+	hsp->num_ss = (value >> hsp->soc->ss_shift) & hsp->soc->ss_mask;
+	hsp->num_as = (value >> hsp->soc->as_shift) & hsp->soc->as_mask;
+	hsp->num_db = (value >> hsp->soc->db_shift) & hsp->soc->db_mask;
+	hsp->num_si = (value >> hsp->soc->si_shift) & hsp->soc->si_mask;
 
 	err = platform_get_irq_byname_optional(pdev, "doorbell");
 	if (err >= 0)
@@ -913,6 +921,16 @@ static const struct tegra_hsp_soc tegra186_hsp_soc = {
 	.has_per_mb_ie = false,
 	.has_128_bit_mb = false,
 	.reg_stride = 0x100,
+	.si_shift = 16,
+	.db_shift = 12,
+	.as_shift = 8,
+	.ss_shift = 4,
+	.sm_shift = 0,
+	.si_mask = 0xf,
+	.db_mask = 0xf,
+	.as_mask = 0xf,
+	.ss_mask = 0xf,
+	.sm_mask = 0xf,
 };
 
 static const struct tegra_hsp_soc tegra194_hsp_soc = {
@@ -920,6 +938,16 @@ static const struct tegra_hsp_soc tegra194_hsp_soc = {
 	.has_per_mb_ie = true,
 	.has_128_bit_mb = false,
 	.reg_stride = 0x100,
+	.si_shift = 16,
+	.db_shift = 12,
+	.as_shift = 8,
+	.ss_shift = 4,
+	.sm_shift = 0,
+	.si_mask = 0xf,
+	.db_mask = 0xf,
+	.as_mask = 0xf,
+	.ss_mask = 0xf,
+	.sm_mask = 0xf,
 };
 
 static const struct tegra_hsp_soc tegra234_hsp_soc = {
@@ -927,6 +955,16 @@ static const struct tegra_hsp_soc tegra234_hsp_soc = {
 	.has_per_mb_ie = false,
 	.has_128_bit_mb = true,
 	.reg_stride = 0x100,
+	.si_shift = 16,
+	.db_shift = 12,
+	.as_shift = 8,
+	.ss_shift = 4,
+	.sm_shift = 0,
+	.si_mask = 0xf,
+	.db_mask = 0xf,
+	.as_mask = 0xf,
+	.ss_mask = 0xf,
+	.sm_mask = 0xf,
 };
 
 static const struct tegra_hsp_soc tegra264_hsp_soc = {
@@ -934,6 +972,16 @@ static const struct tegra_hsp_soc tegra264_hsp_soc = {
 	.has_per_mb_ie = false,
 	.has_128_bit_mb = true,
 	.reg_stride = 0x1000,
+	.si_shift = 17,
+	.db_shift = 12,
+	.as_shift = 8,
+	.ss_shift = 4,
+	.sm_shift = 0,
+	.si_mask = 0x1f,
+	.db_mask = 0x1f,
+	.as_mask = 0xf,
+	.ss_mask = 0xf,
+	.sm_mask = 0xf,
 };
 
 static const struct of_device_id tegra_hsp_match[] = {
-- 
2.43.0

