Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223B026299;
	Wed,  1 Apr 2026 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775079565; cv=fail; b=NbEHFUi1ohA//C85zuflBEswI8WdS2Hv4C4g5j3kZPGtx17lL3aMOJCjA3N9DOXF67t1nQoq1zQ6WyArqa+jCNNSoXGv5bf8GuLegHdwIT2y16un7y48J6joLaeJvq4clzQ7tKIbPs+kTUF0Y3wAA5VQ+7J1NAeiDCLEI3srZuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775079565; c=relaxed/simple;
	bh=g846JjvWG4WhfJ3hN2NgLOI0yIAMgfMRAKuroKIb7dA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ij2HpoCo7uOb0kNToDKk/BEG6N0X/vBG7KP1+adScz2BBAfX+CdSYXV/VwM3R7N5ThdIcDCGu33+hHjAcKQKaQdj0VUtGK+s9nHlU5UgbycFQMpEEWDtvKNs/3M5aUBRqEJCzAgmDcuFAETU806rmVCNn9HGN6KjTmdfzKo2rDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=essWss//; arc=fail smtp.client-ip=52.101.85.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="essWss//"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yq272BETEKYLowCjwaHQWzCYoBtM4Jd3YI5GqhPN9Haun92Mr2jBWqC5uMICgvomIqyhmNkjs/9+drgV+HfNLLKhHolpahMPPOmLua7syer+333PiRSZtRVY55hNnibcZ/sHFT27s7fcSH+qRJXsObSP4YqnT1aNDStLcQfYzjaT03AXLK+09iCjqNB/4+hS1BBYSZsZL6nOdYGVGv3dOUBhyxcHTr6BMHSN/0fr51o9Fa68mP7vXt/lE6RHANPvbduz43A9lnhTDbla59u+RK7tJs8NbmcH5TU+waDBMugCVMa5e7gc9qu+v/0tm1qNkHCdiVsTk6IgRqZhcRPL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=az7i3yFJClaQFHZd5y+MNbffAWModNfUk7UGn5JhgCo=;
 b=lfYlno4uspp/sJDlVszplqW5Ot867y01/APaZjDACJtYowgTiQWucaPeURXdnwpzn/ztW0cG8h9YrNxtx1OiEErUqza8QLDW3hme38PGq2o0Z4n4FuKKGupBWrHQj4LyxlPjxhyymflvUGgqRNgnFe3u6sReBRVNibKnXYFz8XrNrjEKGvYnkjoN0GJfr7OrMgGeZcMzp+bIQRatsT47YhitBXTHl1LWf8YQe8ml/A/Q5wv2oPmo+D/rVdRSK+kxYiMm4bhNT4mWyxuaPojD+vt6M8sd68SyMuR4pwVkZu6co0xmzhvLfRfPkj75akkgrAbAEn+n+al3pTz6P9p4hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az7i3yFJClaQFHZd5y+MNbffAWModNfUk7UGn5JhgCo=;
 b=essWss//aMoIaWthOWyrXvpmP/ILvVkWC430OUl/+0Mue54fhG+HEI8PMSEm6UnLdcwvhQL2onN2nCmNQl0eSswrgsS8U132y7YqITj4/NG9sL7Re8Bl+Mpkb9gVDOqrsxb2CanAJHYYln9GdR0pbvPYw/E//INoZkiMsVgm6DAo9UtjPxjcLn9Y63HQcIDC5o2LFhVjm8tU4OsfbNY1aguuEt3hgV5ljc/DB+WlcNYwOzOAusJQi0KgsOISWMZsIw2h7z9YKYPvYx2Qh8IODniI9E4lJMAObWbZoeotUOxs4cyV9sicaXdAQSR01T0QudHHxfNfjvVSPNn0nuVOnQ==
Received: from SJ2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:a03:505::6)
 by DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.10; Wed, 1 Apr 2026 21:39:18 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::8) by SJ2PR07CA0009.outlook.office365.com
 (2603:10b6:a03:505::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Wed,
 1 Apr 2026 21:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 21:39:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 14:39:01 -0700
Received: from build-suneelg-jammy-20260204.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 1 Apr 2026 14:38:59 -0700
From: Suneel Garapati <suneelg@nvidia.com>
To: <dipenp@nvidia.com>, <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <amhetre@nvidia.com>,
	<sheetal@nvidia.com>, <kkartik@nvidia.com>, <robh@kernel.org>,
	<pshete@nvidia.com>, <timestamp@list.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Suneel Garapati <suneelg@nvidia.com>
Subject: [PATCH 2/3] hte: tegra194: Add Tegra264 GTE support
Date: Wed, 1 Apr 2026 21:38:30 +0000
Message-ID: <20260401213831.187569-3-suneelg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401213831.187569-1-suneelg@nvidia.com>
References: <20260401213831.187569-1-suneelg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|DS0PR12MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a34266-cbe1-4d6e-3820-08de903720a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cne3wKfr7x1Aoar+wH6LCJoAR8YwZrXkgNk3ekq/o3ib5/K3GlWGBBHnYKs3tD8lJZtgMbPTFI2TK+j0cGcYqqf6dJyPdwXIewOCV00fuF5LSeUYK2loOoSOF4XsB1PkEZCZXNfN0NkFQ/iWBTASdY+WJr2YDuP/lCompp8CnF7LBcAVWRZ6skB2EklVeZU7KVRZTBBtm7r/EYeI+e5h2SyA0obv5PRs2Gg1u84E5vQ+BQ5XaCc24UnP2j121VJPExL6ibWY+ApY2sC5SQXYx7YmXOqcaZzowNpEVCK62/Up6egtWZ01wjf97ZTz7EjJ62h9VFw3RimQYcbVIZvgCYFZPvMl9MtewTStP4ycS1qszTzxwD0pBiXIb6HITqfNJ9HN6LWVSlwpwOsk1epitHHoWz8Rl3h95Wpmb5HQEgWgOmur5tsKFW9ndWYhm1yxX00v89XE+mugFMdEUwjOyO+P8IQuUacsOhox863L7VT2mcOPO+dZ5PrRKmWzDYruLcLRZZU2jsL+5y9+NAtX77xWS+qRMJ1i+psGuxM9cH/uWnaG2GpunA5WRsa5cZT9QO5YEgmVtODDt36cFLdF2LA+HSjYvGJcoBm+/ROfpIzNSpKoRajSewdCyIiELUXCiUs32ROSpRU7tr1Nqx/TAxqpwo0qca9eF9b7qNq0S58L3zMAqASmhSHPzmBAivCNIqBbU2WpBM1CMoM9ey9rgKrfm3p4rBh107iAHzlAgx0rfGjpKjY8Qbl5NpcxDlRb8re9JeTuFN33xDfYta2txt6bW8gSkFRN8/8op6wLFMVBDOMG75KcazYc17w1MaA8
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uCy64vEFUCS0VCNBXQCKCTpi8SzGmrPc4RAzDgjPr9upCPtMmOJW2I2No5ZBJEGW/8LGh8sMtsJG9uT/XDo/PTUpFkV59SoXAgcYGlP++6xxTHKXcnIWe8wph2FpOhmsjCb2h+QB/qP7iZTDKUnEAMWaZwzay9RRz8+LnB1Wo/+1JItT6MpltwwhiWrQuA8EovP9iKcxCsFuIHtrqYlChZ4noc4BJvS3qOwDfrIXcGSJqGfqj5NgNnRpBwTI/d9BgAvlHmMjXmrXbmHQL9iitun5uQU3Oy/ckq1wHz0kdxD71mKskMbttphzdqj74TGoH/Rf/6KrMrW8oCbRAMPIxUomfuy39ugm8ySzVoUfGuzEMt+DVgp420PutygLOOfc6H7ZIeWiXBPPbyRRJPuTJBpTv0txn+sUUgp/z61rPYVdsBCIAR5ldhqEohcSXodk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 21:39:17.7164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a34266-cbe1-4d6e-3820-08de903720a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6559

Add AON-GTE mapping and LIC GTE instance support for the Tegra264.
Move TSC clock parameters from macros to members of SoC data
as values differ for Tegra264 chip.

Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
---
 drivers/hte/hte-tegra194.c | 133 +++++++++++++++++++++++++++++++++++--
 1 file changed, 128 insertions(+), 5 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 690eb9be30fb..4a7702b32b24 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -20,10 +20,11 @@
 
 #define HTE_SUSPEND	0
 
-/* HTE source clock TSC is 31.25MHz */
+/* HTE source clock TSC is 1GHz for T264 and 31.25MHz for others */
 #define HTE_TS_CLK_RATE_HZ	31250000ULL
+#define HTE_TS_CLK_RATE_1G	1000000000ULL
 #define HTE_CLK_RATE_NS		32
-#define HTE_TS_NS_SHIFT	__builtin_ctz(HTE_CLK_RATE_NS)
+#define HTE_CLK_RATE_NS_1G	1
 
 #define NV_AON_SLICE_INVALID	-1
 #define NV_LINES_IN_SLICE	32
@@ -120,6 +121,8 @@ struct tegra_hte_data {
 	u32 slices;
 	u32 map_sz;
 	u32 sec_map_sz;
+	u64 tsc_clkrate_hz;
+	u32 tsc_clkrate_ns;
 	const struct tegra_hte_line_mapped *map;
 	const struct tegra_hte_line_mapped *sec_map;
 };
@@ -317,6 +320,94 @@ static const struct tegra_hte_line_mapped tegra234_aon_gpio_sec_map[] = {
 	[40] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
 };
 
+static const struct tegra_hte_line_mapped tegra264_aon_gpio_map[] = {
+	/* gpio, slice, bit_index */
+	/* AA port */
+	[0]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_29},
+	[1]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_28},
+	[2]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
+	[3]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
+	[4]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
+	[5]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
+	[6]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
+	[7]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_22},
+	/* BB port */
+	[8]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_21},
+	[9]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_20},
+	/* CC port */
+	[10] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_19},
+	[11] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_18},
+	[12] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_17},
+	[13] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_16},
+	[14] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_15},
+	[15] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_14},
+	[16] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_13},
+	[17] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_12},
+	/* DD port */
+	[18] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_11},
+	[19] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_10},
+	[20] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_9},
+	[21] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_8},
+	[22] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_7},
+	[23] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_6},
+	[24] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_5},
+	[25] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_4},
+	/* EE port */
+	[26] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_3},
+	[27] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_2},
+	[28] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_1},
+	[29] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_0},
+};
+
+static const struct tegra_hte_line_mapped tegra264_aon_gpio_sec_map[] = {
+	/* gpio, slice, bit_index */
+	/* AA port */
+	[0]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_29},
+	[1]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_28},
+	[2]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
+	[3]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
+	[4]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
+	[5]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
+	[6]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
+	[7]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_22},
+	/* BB port */
+	[8]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_21},
+	[9]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_20},
+	[10] = {NV_AON_SLICE_INVALID, 0},
+	[11] = {NV_AON_SLICE_INVALID, 0},
+	[12] = {NV_AON_SLICE_INVALID, 0},
+	[13] = {NV_AON_SLICE_INVALID, 0},
+	[14] = {NV_AON_SLICE_INVALID, 0},
+	[15] = {NV_AON_SLICE_INVALID, 0},
+	/* CC port */
+	[16] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_19},
+	[17] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_18},
+	[18] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_17},
+	[19] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_16},
+	[20] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_15},
+	[21] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_14},
+	[22] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_13},
+	[23] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_12},
+	/* DD port */
+	[24] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_11},
+	[25] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_10},
+	[26] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_9},
+	[27] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_8},
+	[28] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_7},
+	[29] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_6},
+	[30] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_5},
+	[31] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_4},
+	/* EE port */
+	[32] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_3},
+	[33] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_2},
+	[34] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_1},
+	[35] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_0},
+	[36] = {NV_AON_SLICE_INVALID, 0},
+	[37] = {NV_AON_SLICE_INVALID, 0},
+	[38] = {NV_AON_SLICE_INVALID, 0},
+	[39] = {NV_AON_SLICE_INVALID, 0},
+};
+
 static const struct tegra_hte_data t194_aon_hte = {
 	.map_sz = ARRAY_SIZE(tegra194_aon_gpio_map),
 	.map = tegra194_aon_gpio_map,
@@ -324,6 +415,8 @@ static const struct tegra_hte_data t194_aon_hte = {
 	.sec_map = tegra194_aon_gpio_sec_map,
 	.type = HTE_TEGRA_TYPE_GPIO,
 	.slices = 3,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
 };
 
 static const struct tegra_hte_data t234_aon_hte = {
@@ -333,6 +426,19 @@ static const struct tegra_hte_data t234_aon_hte = {
 	.sec_map = tegra234_aon_gpio_sec_map,
 	.type = HTE_TEGRA_TYPE_GPIO,
 	.slices = 3,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
+};
+
+static const struct tegra_hte_data t264_aon_hte = {
+	.map_sz = ARRAY_SIZE(tegra264_aon_gpio_map),
+	.map = tegra264_aon_gpio_map,
+	.sec_map_sz = ARRAY_SIZE(tegra264_aon_gpio_sec_map),
+	.sec_map = tegra264_aon_gpio_sec_map,
+	.type = HTE_TEGRA_TYPE_GPIO,
+	.slices = 4,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_1G,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS_1G,
 };
 
 static const struct tegra_hte_data t194_lic_hte = {
@@ -340,6 +446,8 @@ static const struct tegra_hte_data t194_lic_hte = {
 	.map = NULL,
 	.type = HTE_TEGRA_TYPE_LIC,
 	.slices = 11,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
 };
 
 static const struct tegra_hte_data t234_lic_hte = {
@@ -347,6 +455,17 @@ static const struct tegra_hte_data t234_lic_hte = {
 	.map = NULL,
 	.type = HTE_TEGRA_TYPE_LIC,
 	.slices = 17,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
+};
+
+static const struct tegra_hte_data t264_lic_hte = {
+	.map_sz = 0,
+	.map = NULL,
+	.type = HTE_TEGRA_TYPE_LIC,
+	.slices = 10,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_1G,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS_1G,
 };
 
 static inline u32 tegra_hte_readl(struct tegra_hte_soc *hte, u32 reg)
@@ -574,12 +693,12 @@ static int tegra_hte_release(struct hte_chip *chip, struct hte_ts_desc *desc,
 static int tegra_hte_clk_src_info(struct hte_chip *chip,
 				  struct hte_clk_info *ci)
 {
-	(void)chip;
+	struct tegra_hte_soc *hte_dev = chip->data;
 
 	if (!ci)
 		return -EINVAL;
 
-	ci->hz = HTE_TS_CLK_RATE_HZ;
+	ci->hz = hte_dev->prov_data->tsc_clkrate_hz;
 	ci->type = CLOCK_MONOTONIC;
 
 	return 0;
@@ -602,8 +721,10 @@ static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
 {
 	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
 	u64 tsc;
+	u8 tsc_ns_shift;
 	struct hte_ts_data el;
 
+	tsc_ns_shift = __builtin_ctz(gs->prov_data->tsc_clkrate_ns);
 	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
 		HTE_TESTATUS_OCCUPANCY_SHIFT) &
 		HTE_TESTATUS_OCCUPANCY_MASK) {
@@ -621,7 +742,7 @@ static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
 		while (acv) {
 			bit_index = __builtin_ctz(acv);
 			line_id = bit_index + (slice << 5);
-			el.tsc = tsc << HTE_TS_NS_SHIFT;
+			el.tsc = tsc << tsc_ns_shift;
 			el.raw_level = tegra_hte_get_level(gs, line_id);
 			hte_push_ts_ns(gs->chip, line_id, &el);
 			acv &= ~BIT(bit_index);
@@ -656,6 +777,8 @@ static const struct of_device_id tegra_hte_of_match[] = {
 	{ .compatible = "nvidia,tegra194-gte-aon", .data = &t194_aon_hte},
 	{ .compatible = "nvidia,tegra234-gte-lic", .data = &t234_lic_hte},
 	{ .compatible = "nvidia,tegra234-gte-aon", .data = &t234_aon_hte},
+	{ .compatible = "nvidia,tegra264-gte-lic", .data = &t264_lic_hte},
+	{ .compatible = "nvidia,tegra264-gte-aon", .data = &t264_aon_hte},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_hte_of_match);
-- 
2.34.1

