Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A12E1744;
	Thu,  3 Jul 2025 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539152; cv=fail; b=QNAsCf7k0c6LUhSqW+7KX7lj+OfFEiJI4jfZbppC45Y47buVftfm5W5Hx6HIZFW/BN69Ds5XOacqqnBpldB+dOSGHeji1vlEIqS7U3iEi/DEnSAkoy8OqUAXU1T166GmHRs1DWTzEWA6huedIGWmWcz86DfE78yeEpK9jgg+fz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539152; c=relaxed/simple;
	bh=isPVhJl4x/7FQOqXKy+6AbSeBV0vjLk3b/fxMgHn1Pk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lfff+5KS0xsFkBSqOu7J3OROK5om5W1kNDmRY2dv0T71g6bBChtgDq+AWK9ANmqzBQRkv7+0dJZtav25r4v4mjWVq692tOACwM9lUlRSo/Ri31Rq2bAvXBRD7vHY0Svx3zzDMxa+Lf+UHMAckXRjJbnpsM/+0IklM8Yx4RSNNf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MBnqk9NK; arc=fail smtp.client-ip=40.107.93.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MBnqk9NK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0+hfzIvk04S6U9FK6agHoTqFdFxAKQCSkwLHUxKz1hHd+CkwIVklfQNDCwBGvUs/+TZv572L7YgHgOoaxNT2Q1dxPXTX5Q9UDzhmYun6ZGdBwHH+jw3nJOJ70+GtS1+Vr9yGsLziJTw45KE13JnAjlY7Ng/hsmssEkWRwl7+YbLyZWwZjVZy6uF3srRfJWxjX7GxckwLYLAsjfHNY5AFceXu3QZX7slGqaSk3tcAh4elF+7HNVGCtqeFFgh0GqXwkIDq60+xz10zkHr10pwXwIcHly+N4jkUsZ7oGbzRxLHp/XRYyFWlYHv8EOoRxsthnP4OmeplfOpdOHwQcDeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdVWeBjW7ObsP5pxumootoPWr5aU+iF1lLH0W/FA1/k=;
 b=pCdbrA0l1nhDj5t5gNVyzv2THqxccTSn5UPC0LgxbnpZc57IChSi/E/S7KVXxSYn5eO7EAkmfaERVr/GTv1uwINMs0YoJ/84nMgBJ8TPc+hVhpbA/JOT5VRP2Xwm++aDs+/vd8Pcm9TrPnZaPDjgBEIEEc1yHHopCfNHrtnFO4RvCYSLZ2VLHtMbcPxOAUqLnoIilAF3yDKKlj6qE6mewKjyw9t3QxD8x/qzxjHoJv1S5ICTFyoY8sL92NZQzte2hshYdIjmMUp9hyUv5Wyp9hbEdEq135blhDEtOobBHpLNVVp6PfrTEQedbld0/mWDJ/TCZJoAqmoFl/CxswsDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdVWeBjW7ObsP5pxumootoPWr5aU+iF1lLH0W/FA1/k=;
 b=MBnqk9NKIfn/HDNuhDDB7TNyDJ+f4EGfeV7HRMB38TuUX/r6d8oLtjQt2AJC0N4RnBzYdW1IKHD72JbefW1gEtGZ0KNS0+EMl8jontd6x9ZnReVsX0QIn4ZDWRDTSru7onfMTV5KMsYIrRK8K351I7mGvjFdqhTWOgEe3JzaE9vaI8dcyfXmkEpHQg8RTxYpF5fvb9LH0Qp392qzxeP3+r20XPDPo9CNfPJIgvBAX1Bs26EtLNeBRnz7PcIF8cEeG/TlNbyJDO58bhSk5kWbWZCaFYf+5ocIx5rTy/yDyR8dEDHOOb/xzGUN1u05TSHw8cQf5xO183wY9UJ+TaSBKg==
Received: from SA1P222CA0130.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::21)
 by DM4PR12MB6615.namprd12.prod.outlook.com (2603:10b6:8:8d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Thu, 3 Jul 2025 10:39:06 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::8c) by SA1P222CA0130.outlook.office365.com
 (2603:10b6:806:3c2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 10:39:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 10:39:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 03:38:54 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 03:38:54 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 03:38:51 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 3/8] soc: tegra: cbb: make error interrupt enable and status per SoC
Date: Thu, 3 Jul 2025 16:08:24 +0530
Message-ID: <20250703103829.1721024-4-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|DM4PR12MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 4150f4cc-5c63-4407-b6c1-08ddba1dd643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K2s0S/7dXKo0vYpnCRR68knV6TpJJSZdRdl09TYgUtGFXofabXtOLho0z2uC?=
 =?us-ascii?Q?u0AEeIAXlade9YhKWXMXh6GM9fnVJ0t0nsoWEmL0JFcf8/MrjWJ0PsbLkov2?=
 =?us-ascii?Q?f6BCqYAs70lKq77h2mFanztx1IDXLcmxppR/qK+QZ1/CuLjf5vuNGKzURKGa?=
 =?us-ascii?Q?GbMm/XMuPTW09Uj9hO7cmHE3zAT6d0O1AEg0zyowSBEl5uekZOos9ZUu4kmr?=
 =?us-ascii?Q?Ps12Hry3Cs5/Z1avnvy1Yvu5qxERkdLM7YdZcX2JSbvMn8FkXaRVBtbuvMES?=
 =?us-ascii?Q?W83ksOA28+uPqr2c9qcyD8g0i/CWqTzEmnX9FbYxFq3LD9bITHBDTjdHcnFF?=
 =?us-ascii?Q?8AJPE1GtODcRtbYI67tAZp5uQ4HZ9KBju5gnubZQ10xYGvXUwIcxH9dk6kh2?=
 =?us-ascii?Q?LCUnazBw3uolKTOTI7Z9RbKIS45h5EdMi4m4xE3ivaOZspbKXnGD8UghGIjl?=
 =?us-ascii?Q?qyuu5yhV5Jy9DY8/Y3hetb8KdaY+SaqeqMuMxOSrXha6n4OvL1nikX97P1Oj?=
 =?us-ascii?Q?y5Zd520+LCRfLNRpUhcRURKeioJQlRX1+YhOafFF146CLCVUJYQmKDDQYfTV?=
 =?us-ascii?Q?3hUZ1/P2enbyk0uAL15EX0r3gGYEZC3Yz9lBN3DnzoerC1ZN02heOzvPJJJm?=
 =?us-ascii?Q?AOClKj86Q+t7J7I7nG1tmrtghwkKZaAJfhpUl3PE85i+da9r0Q0Pi6XXNc7W?=
 =?us-ascii?Q?WYF5723zvrf+m007PrZpq5n1Xu4xv69G4pAEHhyYSNoNJXRlBRDgleNMb33U?=
 =?us-ascii?Q?IQ23AbiYIzr7KG6caAXB7xYJ9Gl2U7hgrFSoN4FofCdnRKnDE2EULGyT9BBn?=
 =?us-ascii?Q?/wpT+czb5qdY6s2udQBXJzIciFOy4ZKeAvXBs+PU4ttjQ8G399/GX4AoYQN8?=
 =?us-ascii?Q?9C/LMj7KMUpz9pBGhJZOLVhb47w+BXg0mgNgqG1nePdo+oaIpECySA4RQTTL?=
 =?us-ascii?Q?a2dnqS13TGIBiPlHhRlFRTWPIwEig5SJbZsAND3zetQzaS+C6+xsR5zZlgHk?=
 =?us-ascii?Q?q9Dnjcfl05dLTT28SDvzWBvnmKiP/YffNEk+dM91HtBQH+uoxp0q5r1JlIfT?=
 =?us-ascii?Q?9Qgzle4clQTwb8YxUYG+141r25Uv5JBF6z5rW+BMtxLhKiGoIquMoyUM5sMV?=
 =?us-ascii?Q?Pv6hZolNt7+7viARFxhpu3Ht0mb06pEuDD8Gm7OFSOHcw4yI8nh7YhmfNzkx?=
 =?us-ascii?Q?i0DFRJLFlcycrEvxLd1zI7U70YdfdL1FhdHeX/zp14xyQQkHenEFQu0TmSNB?=
 =?us-ascii?Q?9Nuv2r76H32691w3i85+jWTZmU+G6PUkq62O824KwGSVK5dC1Gc64c0dAKoe?=
 =?us-ascii?Q?L/a9CaB6c0CZCp4fAKOT8Q66MZrgrc4veZR1L5cstotWZhn61fDreCP0ZSGp?=
 =?us-ascii?Q?0Q7KbhOh3PqbbAfVqhvxyRTdFYIiaDYqEAWwewrLg24xvGJg2ZO8kFjRAIqS?=
 =?us-ascii?Q?C2xydw1rgDZqtVxXNJHv2jiIMf70ukAAdbZNSKabDf53xKGTzYcPpVhQpQhN?=
 =?us-ascii?Q?r1iHEpsLtbxCwZ7cvLc9emha8Lwfd3lfBgML?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:39:06.6978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4150f4cc-5c63-4407-b6c1-08ddba1dd643
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6615

Make the error interrupt enable and error status fields as per SoC.
Both these fields can change for different SoC's. Moving them to per
SoC data helps to set or clear the required bits only for a SoC.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 5d04ed3b2d50d..6116221f0ca61 100644
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
2.34.1

