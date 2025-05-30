Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F5B22D4E5;
	Fri, 30 May 2025 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612102; cv=fail; b=DB9pdCSFBbn3NZ8Na82WtY9//bvpH0mItnp2wRj9Nrzeq58C2/fzHk6dAz+FBQiRc0A0ww4o1/ZoYqEKCTkHuXkMvmpTLsIN4cDCTsdZIQ8MN13+dspjIg3z6vvPeDncWxdz4ss9LKugn5VzoZcpQwAchPnrrrV2kk2fgIULxEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612102; c=relaxed/simple;
	bh=ADdpy39RVPEfUqvZul35h+fQFjzwkuYLsGjYjbufnY0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bIJplX2NogS5HA+QmNOkIsFyvDMKbSTGIx2j/4fltOf38N1KniJoD4HaaygzfW6Gycb+JGuxSDW+QfaY5tZePnOUx9HjHoTZz3jED1gpLntUGZcEwCDDDIK+F8HotLnqlXSv693act+6E3DsU3lSUoEMsD6PmDrkSeK6uAgu1SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SU+5qCro; arc=fail smtp.client-ip=40.107.223.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SU+5qCro"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWps1v/OsuzbtBawiAkbfxSMcsbSY5htIKApJc5xMzEkQHLBONWMiRuyp2mFsh7vtgbnSeqhiK3a1rrF8CBeLnhSnj183vF4gxWwWCIWpjqFSlUyuCa9JdvoA6UfUoHIf9Xxi7WdyafWdlxRJ6CcesvbZtj3VNrxkHQblcuabdJdta+0TU/KhZvNvxoUFnCk8HIhb9XC9c4Jr5aDQyTn/htUvlkIkUHYNQcoW+POod3W7ujHY7diNutruYJtU1DnnHx8v2gGtvOlR4XZfwB9AU/zwzuH5B4bwZin0guw8Huav5SoUOlYExrkzIgdnLQUqo41WQ513+Xjt2klxyQvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x98IFyX1sKhvLGQ3lEctjtLjUGR7SVZn6uugNWx8Kbc=;
 b=nbFaycTvU+gq/jONW/5t3Cnh40fROx33T8x9rRgJDxk5RkcQraBy1eZT/5xSbx8iYJAtBReCTH0n0LnG2EDjA7Am+nLwuLc7OYM8N1Fvf10ZA0D4o7M2aC9B+U8q0o84lLK/aFb4dSdKR0OllPlChNCz+D0zmEOI/7UqjZ9fKZun+zSBxUHinR/hd3EMWeM14d7CJfCXhIjolPHaEm5Ph1+8u9tRanXUgLFwtucqNOBPmWaIbIlMgaG3QhJIrwtUPrbhy4fgkiLmXDCNlew5bXMNhcGJo/OoL720OrrqUu+nEjYqcguxA2+D7jAG+2fto/NcevFZwKYsaWbDs0MpBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x98IFyX1sKhvLGQ3lEctjtLjUGR7SVZn6uugNWx8Kbc=;
 b=SU+5qCroV+3RqsgaFg3fgXP3s0dWHuHTYgyNdZWeb71JVdWwsMTqOHwZ+pWc9AuKhw+wcYX1L0rCXXmwOxQ163m3pWM3ZgVNRul6Xa8G6VeZ4b8b+3G+Qfhb0RN/Suf4f1FVzhsviKovaX7f3RWrtkdyCjbMnc3Vfc1fmNAmtllg2u5tq/SHthmMptFvbuPzj2U62ZvNNkm3TZ5HfcXCTXAvnnzyf1jpVVeVjlxalxzq1++vsEdZZfG8TfvoA8Jn2ExVCpnV6MTKcdPT6nlUJxytiUzdtaW+Z954HpDL4tUsEqd/+pCa4jI4wEqxjlCSJJkgwR73TWiVwmRwYGI7uA==
Received: from SJ0PR13CA0120.namprd13.prod.outlook.com (2603:10b6:a03:2c5::35)
 by PH8PR12MB6747.namprd12.prod.outlook.com (2603:10b6:510:1c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 30 May
 2025 13:34:52 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::f0) by SJ0PR13CA0120.outlook.office365.com
 (2603:10b6:a03:2c5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 30 May 2025 13:34:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.0 via Frontend Transport; Fri, 30 May 2025 13:34:51 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 06:34:38 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 30 May
 2025 06:34:38 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 06:34:34 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <--to=tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [Patch 5/8] soc: tegra: cbb: support hw lookup to get timed out target address
Date: Fri, 30 May 2025 19:03:33 +0530
Message-ID: <20250530133336.1419971-6-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|PH8PR12MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a271f7a-0773-44a1-ab5f-08dd9f7ec1b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ySmx9C1RTKq39S2ZQn9lqnS3JxmcXWQlgK55G6JyhppwgFjRCrIYnl3cmDkG?=
 =?us-ascii?Q?WLvwJhwofzu3L4/w53MLYz5hYZc1pQ8fZqQWIBm7SRLrQDh0Dlw8Sm6L/6YQ?=
 =?us-ascii?Q?opLtUmyaqF162om+Txjwt7sKqSdF9DxZGcYnMOb1vgag247FRZGBsmiUrYG3?=
 =?us-ascii?Q?qJWfvs13xStgezrJQqTZMEDGzGhG/bOI/lIkuPc7lxHDuI3uP5JGpyhnAgdS?=
 =?us-ascii?Q?9TzO4Ugqrxab4KzBG8EnJIydGBmfFj7r9HkulLhiqGTKvbX317SKQ8ZgKQUl?=
 =?us-ascii?Q?+BoNsApgk4naaHX0gOldkp6F6d2DQENEGOvtAFvgcyNJWdMtiW5dbwq4WYZ9?=
 =?us-ascii?Q?S41ujilz/ol+JlqBjgTOVWJ3x6QBCgjoLUsmGlbC95wQGdwJfkPSVOknFNin?=
 =?us-ascii?Q?HM5hrk2Vj+c/rPqV69tr8iWAi0MWROsadhxPJGvUF4VK0pfJQ/lpSj1bIJga?=
 =?us-ascii?Q?p6I/tHws+H7LQhC4vr4Hh8XrY68Q1DIUJmxZjjI6H6IXMcstPzLKk+p8nb4t?=
 =?us-ascii?Q?0pMbuoXfu4K/SNH8p5jawzITfOQXeKDkYrbFdyYpFHhV1vtW4I58JgISRJNB?=
 =?us-ascii?Q?AKC52caObrpFWcEaMtbI3iLNLfo2PGvKviDj66B98Fvwp2YrxacwOXYKXCxo?=
 =?us-ascii?Q?wtVvD8Umu6Mv0uXePzr4jL1oARDDHfEBWO6i+ZuSbX6kowvaulAf2EP22ncd?=
 =?us-ascii?Q?XLyNoKktJaiglNmcJsrNMzNRgSRhiIH8kPNB9InE9wUJp8dxRfYC72ldxvby?=
 =?us-ascii?Q?clIcZhKHzJd7SU127R+ZxIx19iJ1phKulXJ5TKi/DM9nJPx9eQOCc2F1CBU2?=
 =?us-ascii?Q?4AFfxbrqoskpOwcPvBd9x5TZ1TBQePEXWjhCeDmpyHt9UmUpJfjq16Ur9W6n?=
 =?us-ascii?Q?OnJ14Kms4HLpAbW5+bIUJ6Z8ncxn26WIKzrf8ZVq7gngnW2gzWtxv3mmdvVF?=
 =?us-ascii?Q?AQ/avmKNPiaJ3h4S47KybjF15FO0Xrulf/xCWfZ9mX5aMQhi1mbU91cDuSrr?=
 =?us-ascii?Q?8bwxbEKIHANi/cxW8t1363u8mp00RsVPfQPtvG/z2DC2TFMn6PjJFNc6SG9N?=
 =?us-ascii?Q?0J7bcZCH3y3PhAcReVSjd3Dzb5RRxa1DciIQ3d0TVxfwmpNlV+GaTsfZXDf4?=
 =?us-ascii?Q?TDk3Tjdtl5L7KbzDjSKUNVxuqLO8SS8F8GBwX/5h2pwu2WBGOwa3v3WJhwpC?=
 =?us-ascii?Q?30ECeXub2x2brX1GOJs2Ggw3abe172csxtrH65D1ySQypZka4YzdWm/XGZPB?=
 =?us-ascii?Q?gB8VnYSjwMe1S+S+irTyqVFbhQYP/X6ghwabdi6N3gAFc2K/LLtGrspiqU0e?=
 =?us-ascii?Q?w1V3I6bTQc6ghPVatknn6t0OPSeL4MxuEeMT7y0xoc7dp758Mn5jmQshpSf8?=
 =?us-ascii?Q?d7fIzosooZsj/A52YFtKpApewksRxcVKa+icUP9rNcP+D6RurW5nOzhzAg7r?=
 =?us-ascii?Q?2TPa8lMj0sLs20sOuaTxyHE6zsl8I1szl8g467fLd/6ssvsgP/p+gQPDfInl?=
 =?us-ascii?Q?frouul+sZAt8wt36OZjwEVQAF9F9liV65qR8?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:34:51.9900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a271f7a-0773-44a1-ab5f-08dd9f7ec1b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6747

Add support for hardware based lookup to get address of timed out
target node. This features is added in upcoming SoCs and avoids
need of creating per fabric target_map tables in driver.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 41 ++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 10f57f17fee8..aab0cd85dea5 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -30,13 +30,17 @@
 #define FABRIC_EN_CFG_ADDR_LOW_0		0x80
 #define FABRIC_EN_CFG_ADDR_HI_0			0x84
 
+#define FABRIC_EN_CFG_TARGET_NODE_ADDR_INDEX_0_0 0x100
+#define FABRIC_EN_CFG_TARGET_NODE_ADDR_LOW_0    0x140
+#define FABRIC_EN_CFG_TARGET_NODE_ADDR_HI_0     0x144
+
 #define FABRIC_MN_INITIATOR_ERR_EN_0		0x200
 #define FABRIC_MN_INITIATOR_ERR_FORCE_0		0x204
-#define FABRIC_MN_INITIATOR_ERR_STATUS_0		0x208
-#define FABRIC_MN_INITIATOR_ERR_OVERFLOW_STATUS_0	0x20c
+#define FABRIC_MN_INITIATOR_ERR_STATUS_0	0x208
+#define FABRIC_MN_INITIATOR_ERR_OVERFLOW_STATUS_0 0x20c
 
 #define FABRIC_MN_INITIATOR_LOG_ERR_STATUS_0	0x300
-#define FABRIC_MN_INITIATOR_LOG_ADDR_LOW_0		0x304
+#define FABRIC_MN_INITIATOR_LOG_ADDR_LOW_0	0x304
 #define FABRIC_MN_INITIATOR_LOG_ADDR_HIGH_0	0x308
 #define FABRIC_MN_INITIATOR_LOG_ATTRIBUTES0_0	0x30c
 #define FABRIC_MN_INITIATOR_LOG_ATTRIBUTES1_0	0x310
@@ -320,6 +324,23 @@ static void tegra234_sw_lookup_target_timeout(struct seq_file *file, struct tegr
 	}
 }
 
+static void tegra234_hw_lookup_target_timeout(struct seq_file *file, struct tegra234_cbb *cbb,
+					      u8 target_id, u8 fab_id)
+{
+	unsigned int notifier = cbb->fabric->notifier_offset;
+	u32 hi, lo;
+	u64 addr;
+
+	writel(target_id, cbb->regs + notifier + FABRIC_EN_CFG_TARGET_NODE_ADDR_INDEX_0_0);
+
+	hi = readl(cbb->regs + notifier + FABRIC_EN_CFG_TARGET_NODE_ADDR_HI_0);
+	lo = readl(cbb->regs + notifier + FABRIC_EN_CFG_TARGET_NODE_ADDR_LOW_0);
+
+	addr = (u64)hi << 32 | lo;
+
+	tegra_cbb_print_err(file, "\t  Target Node Addr : %#llx\n", addr);
+}
+
 static void tegra234_cbb_print_error(struct seq_file *file, struct tegra234_cbb *cbb, u32 status,
 				     u32 overflow)
 {
@@ -445,8 +466,18 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 	if (!cbb->fabric->fab_list[fab_id].is_lookup)
 		return;
 
-	if (!strcmp(cbb->fabric->errors[cbb->type].code, "TIMEOUT_ERR"))
-		tegra234_sw_lookup_target_timeout(file, cbb, target_id, fab_id);
+	/*
+	 * If is_lookup field is set in fabric_lookup table of soc data, it
+	 * means that address lookup of target is supported for Timeout errors.
+	 * If is_lookup is set and the target_map is not populated making
+	 * max_targets as zero, then it means HW lookup is to be performed.
+	 */
+	if (!strcmp(cbb->fabric->errors[cbb->type].code, "TIMEOUT_ERR")) {
+		if (cbb->fabric->fab_list[fab_id].max_targets)
+			tegra234_sw_lookup_target_timeout(file, cbb, target_id, fab_id);
+		else
+			tegra234_hw_lookup_target_timeout(file, cbb, target_id, fab_id);
+	}
 
 	return;
 }
-- 
2.25.1

