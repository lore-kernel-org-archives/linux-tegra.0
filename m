Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6062620A5F3;
	Fri, 30 May 2025 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612092; cv=fail; b=YRo638QSA5kP5cvNlUvHUCkR+fZIuFErs9nDlOu8ovb+IFgr1NM7kznMdHNxb+qZi4LVauXwgSde9pj2k5ApTVYGukmTc/YNRxU/auZ3i9sOo90GOvltRUkLn6z9JampVatuHmUYMjtoN/5ssLtOK5+JpfBuy6hfj8GqmYcZi/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612092; c=relaxed/simple;
	bh=IwkPJa9fAI1NHLLe5K8DkL28DBgQi4JSpdr+owSf5Mk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8WWv04EEd+gJKzfbn0QKNFHHexrzwX42yFCmBuSGthNrrPgB8T1wYJ3d7WryDtxsq5jnbJmTprHR5nPaWm5VzZ2H/DaW4jxLsI38qqNsQBDjf40TYrusQRTWSFnVl5oVGGfdaJg2396XVSRI6HJDWgQj4O8B4Lo3N8qPY9xvcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nFN2qkxt; arc=fail smtp.client-ip=40.107.212.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nFN2qkxt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SD3RtetyAKLtH9P2pjHxHYQJgfPuy8pKmNVzQaiIG1q1A9xLgHqBPfbRASKf/yReSfByuFzpKRxKUn0KtJi/j+2vRwZtO7P5hsiKRhZLNrj7zk+DJOV/tsM+qaBd8PNY3Ja9hPC7fY61wpx39WWyBbken5WJfIeXbT9MI36ttubtn1CsSS4xZhjkhJDWm02pvqTVcfkcqkGfwhX1uUM1vlZiKJTPZY6PUXeV29aIK2LZP1NLXcm0LBj6wNM+pP5rFOkoYFW/iaRQBFsT7p+sZYIokaI/6ySf1eAAUjjxgP/RPwC6AD0fNAsqOHH+JD680veH3YKrHwTlWkm61anTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hT34DqN9ln814cAQC8J6jVE+UO5xCIroW5NM5SeU58M=;
 b=O0qiJCuSngRp4bwRhB3P+iYKmcdJ+l1ARjP6cOnRC4od4l+zinkuhlagwO3cRJJSAzfHT5xPZnLW+cl0Tc5x50WayeOtVbqg2muAUyk3xtmfSz8sEJ4eRqZJaDzMKh7v+hMMeve9cvVMz8Jp8/epO9rGervxRqd/lwsK7U95HkWGhvW3zZEU8s5wQjaPljctYFRufcfhTzUg+OafsOcNEyXD3pSCXWp6j22WUYGYr9olEFMyM8n7cr46dxUNNXuQnoc+u8WzYPPg/GKnOFf2AaonZhdFMLM1n9jXHkNy+1eGUmWhg3g6J14kgdGp/CnpAsbiN8tPpRWOeJtyQ+5NZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hT34DqN9ln814cAQC8J6jVE+UO5xCIroW5NM5SeU58M=;
 b=nFN2qkxt4UzUmERGUe80VlwaJmJdlHJItHNqPGYAIGq+hRnXMCKO6btXyv3zPt61IRtKCdeJdhFGJE6Hzpb1F+Sv9xvgHYyn0reQS79Q6UHUOP+uc9FieKvMSLiXw2tNntg8X8s+27xIcF3oFvhKkjAnmzV34t+s/O75FbJLQ51yoIjoGz/tGa60BLAVhGZzpMKC8/2yMEG5r8hSXIsVYkOA2nVXPnZjQ2c0ahK1xth7LbPBs/CXaZw5lBAIYP+8xl/h2Yt8n8/msjoWn5/LdrNbwy1frl33mRCz0YL75K/UN85vCLhGKdKhqGpMNRRNRpdsxOTDscTzY0RgQZmddQ==
Received: from DS2PEPF00004560.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::50e) by SA1PR12MB9245.namprd12.prod.outlook.com
 (2603:10b6:806:3a7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 30 May
 2025 13:34:45 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:2c:400:0:1007:0:6) by DS2PEPF00004560.outlook.office365.com
 (2603:10b6:f:fc00::50e) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.9 via Frontend Transport; Fri,
 30 May 2025 13:34:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 13:34:44 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 06:34:28 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 30 May
 2025 06:34:27 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 06:34:24 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <--to=tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [Patch 3/8] soc: tegra: cbb: make error interrupt enable and status per SoC
Date: Fri, 30 May 2025 19:03:31 +0530
Message-ID: <20250530133336.1419971-4-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|SA1PR12MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 54585be9-eade-4252-7ace-08dd9f7ebd72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uD7dxAvFQhX76hKnt7elf1YIzcjfUuS2jjfnPQAlhK54e2pQ/l/wN3cIkoXX?=
 =?us-ascii?Q?rCh2o+ozbSmutiKTznyupkfOjOUu9ghM0255a3cJUUUlTeF25unHuLZdOZMN?=
 =?us-ascii?Q?aWDkotdXwVVvjOO/siZ8QSVSmgYBwaGEDrHml0H6YQULTtjkebayPEV/G1b4?=
 =?us-ascii?Q?iH6byRvGjlhSA/MM8lcB4uDVJiqUrydGGbvT/Eu/sqUF5QGI5YesgouYVbiX?=
 =?us-ascii?Q?I3YmoHQ6JcmDaNO+QYGgHQTP/UXK9PlqohggJ/HgzJZrDAUmUKz5RrTG350a?=
 =?us-ascii?Q?W234gfikVuLfhMDO8viVbrgUNC2GYsTMfLX+TvHXpUVixKJnGKTEY883RmSk?=
 =?us-ascii?Q?kXv7pC42UOm8aL536aoafdaEvu5c6yp+7Pe1f7jhBmXosXSPsK5S3hpx1tvX?=
 =?us-ascii?Q?w3iBy0s4JmgSJ9OyPV/zdCMwZUzUorm12sz4Qk/nqSE5FYXOZoeicIb0PPw+?=
 =?us-ascii?Q?zVE8xl0hOW4Sb8AP8LSS7PqNzqWdRIeGUQeaaFNqI74Tz+ZmJtNwqHwFTBXk?=
 =?us-ascii?Q?OqyvZemdKHDf4UaEJr9U3lYFqP9tE8q4T/OQKg/ZIycUCSrG1ahvEtBaBTNn?=
 =?us-ascii?Q?qqUh3hpHghb0qy0nh/nMqrz243sLK7tSlunbOBIqeNdMC8a6GndbwIqod8w5?=
 =?us-ascii?Q?uPQCbSmoUTWiAjeSBk5dlRhVUcnd9Quzp8Mpy3qxlRKRK1FluB1uZwzNl/bL?=
 =?us-ascii?Q?CDXFXTM1IjZomvIpX3amyx+g7IQo+7G459nhYk9fN30wZwv/HXIBQ84FH5rF?=
 =?us-ascii?Q?zRiSczXcNUcgjd0V+3XWgrjP9j/UIiTbHwYvcZxi4X4hbMF5WUTVD99mfd7m?=
 =?us-ascii?Q?2uen1wQYZ1zAV2m/BTjXCvsy24Bayv+6Uf8UnUAzbQm63zVEBQ3EN8a8NDA3?=
 =?us-ascii?Q?2URUn917odumQ38b4e8XlJZTbwf2kAGTZH+TOyIW59z0T6tJ/2e6CQfwXmNu?=
 =?us-ascii?Q?46VoETdP3m499u15VvDOy1ALA2HclJCU49fiisCYshsXXwy6nZ/H2JHtJ9V0?=
 =?us-ascii?Q?DVfMoh8Vj/KtfGn8Lcsqh1xkrXFjasqVreJ7Df6trTsS2AQfcwWihCW1BAUe?=
 =?us-ascii?Q?+Yli1y10NwhjgpiHGcU+aRCYWbAmXUInIBjsc7ux3UCRD+mS8gmxtjlxDQi7?=
 =?us-ascii?Q?S8ZdaQo6pq3MTs0YLkYcceItToPEA93pgVOGQn3YX8NfmEqeJ+WUMRMeh/2w?=
 =?us-ascii?Q?O23eJX3NKA91MhBEwS1hcDZzbPpkUJdop+LF/KdoGb5YQ+8pf7RU/IwmfS+S?=
 =?us-ascii?Q?XE8+Z12dKoiYRxY2Tf3ZW249mgFDl9BsAXW/km7wvplsfTclxkOLrnqBuvxC?=
 =?us-ascii?Q?5Sa+EzzJHP8yZljYNtI/6/ODtPVXdHtAnLM8Q+Ig6P3+gAZEES/5xLfOhqih?=
 =?us-ascii?Q?Ldo1pw+2GqaPKd8c+4xg9PrUnUYspsrmgXhR4/MS2AABWB86V9zCXQtqiGat?=
 =?us-ascii?Q?mlc9q1jsZCFEb3H1hJyJUwo8cvFMzh7d4RUVjCzCdOqZyMtyQuxu/w1xlj0c?=
 =?us-ascii?Q?rS37ef4TWgqRCOYfGTUwxSlubaO0gjlvBlWM?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:34:44.8457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54585be9-eade-4252-7ace-08dd9f7ebd72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245

Make the error interrupt enable and error status fields as per SoC.
Both these fields can change for different SoC's. Moving them to per
SoC data helps to set or clear the required bits only for a SoC.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 5d04ed3b2d50..6116221f0ca6 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -102,6 +102,8 @@ struct tegra234_cbb_fabric {
 	const int max_errors;
 	const struct tegra234_target_lookup *target_map;
 	const int max_targets;
+	const u32 err_intr_enbl;
+	const u32 err_status_clr;
 };
 
 struct tegra234_cbb {
@@ -177,7 +179,7 @@ static void tegra234_cbb_fault_enable(struct tegra_cbb *cbb)
 	void __iomem *addr;
 
 	addr = priv->regs + priv->fabric->notifier_offset;
-	writel(0x1ff, addr + FABRIC_EN_CFG_INTERRUPT_ENABLE_0_0);
+	writel(priv->fabric->err_intr_enbl, addr + FABRIC_EN_CFG_INTERRUPT_ENABLE_0_0);
 	dsb(sy);
 }
 
@@ -187,7 +189,7 @@ static void tegra234_cbb_error_clear(struct tegra_cbb *cbb)
 
 	writel(0, priv->mon + FABRIC_MN_INITIATOR_ERR_FORCE_0);
 
-	writel(0x3f, priv->mon + FABRIC_MN_INITIATOR_ERR_STATUS_0);
+	writel(priv->fabric->err_status_clr, priv->mon + FABRIC_MN_INITIATOR_ERR_STATUS_0);
 	dsb(sy);
 }
 
@@ -709,6 +711,8 @@ static const struct tegra234_cbb_fabric tegra234_aon_fabric = {
 	.max_targets = ARRAY_SIZE(tegra234_aon_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0x7,
+	.err_status_clr = 0x3f,
 	.notifier_offset = 0x17000,
 	.firewall_base = 0x30000,
 	.firewall_ctl = 0x8d0,
@@ -730,6 +734,8 @@ static const struct tegra234_cbb_fabric tegra234_bpmp_fabric = {
 	.max_targets = ARRAY_SIZE(tegra234_bpmp_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x3f,
 	.notifier_offset = 0x19000,
 	.firewall_base = 0x30000,
 	.firewall_ctl = 0x8f0,
@@ -807,6 +813,8 @@ static const struct tegra234_cbb_fabric tegra234_cbb_fabric = {
 	.max_targets = ARRAY_SIZE(tegra234_cbb_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0x7f,
+	.err_status_clr = 0x3f,
 	.notifier_offset = 0x60000,
 	.off_mask_erd = 0x3a004,
 	.firewall_base = 0x10000,
@@ -830,6 +838,8 @@ static const struct tegra234_cbb_fabric tegra234_dce_fabric = {
 	.max_targets = ARRAY_SIZE(tegra234_common_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x3f,
 	.notifier_offset = 0x19000,
 	.firewall_base = 0x30000,
 	.firewall_ctl = 0x290,
@@ -843,6 +853,8 @@ static const struct tegra234_cbb_fabric tegra234_rce_fabric = {
 	.max_targets = ARRAY_SIZE(tegra234_common_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x3f,
 	.notifier_offset = 0x19000,
 	.firewall_base = 0x30000,
 	.firewall_ctl = 0x290,
@@ -856,6 +868,8 @@ static const struct tegra234_cbb_fabric tegra234_sce_fabric = {
 	.max_targets = ARRAY_SIZE(tegra234_common_target_map),
 	.errors = tegra234_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x3f,
 	.notifier_offset = 0x19000,
 	.firewall_base = 0x30000,
 	.firewall_ctl = 0x290,
@@ -1040,6 +1054,8 @@ static const struct tegra234_cbb_fabric tegra241_cbb_fabric = {
 	.max_targets = ARRAY_SIZE(tegra241_cbb_target_map),
 	.errors = tegra241_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0x7,
+	.err_status_clr = 0x1ff007f,
 	.notifier_offset = 0x60000,
 	.off_mask_erd = 0x40004,
 	.firewall_base = 0x20000,
@@ -1065,6 +1081,8 @@ static const struct tegra234_cbb_fabric tegra241_bpmp_fabric = {
 	.max_targets = ARRAY_SIZE(tegra241_bpmp_target_map),
 	.errors = tegra241_cbb_errors,
 	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x1ff007f,
 	.notifier_offset = 0x19000,
 	.firewall_base = 0x30000,
 	.firewall_ctl = 0x8f0,
-- 
2.25.1

