Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410D420297C;
	Tue, 22 Apr 2025 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314717; cv=fail; b=KCSqcNbtujW7Jvc9XImPZ7iRoo4NKCua8r05DM20M2CU5AuR1KEaGv9NBCP82xg0PhXWzDhaIqtYQMo7mTvUN5jkoBQCah9iE0tzxEqEsjmIi3/QZCg2CuWjrYMljasKCT+5QrReGgkSiL07FdFIXcxKlNTeqhcTOFIxEQfmPa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314717; c=relaxed/simple;
	bh=V7/QGcbZ32AJSyDP2OqflqgfYVPLPPZLRYi36oPtWMg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t63SA/k7vEIb9W6CFD0jWhBd/Cq/qdGtMZLQM0lE0ROKFL1N/cCzteS/hgaoQMHjTprg9o5ACBpd9la2Qm3K007OSeesqnMBxLqfQHD3PeLznBJCyxn1+g6TJbXkLfBXuWrKFf7pI0OG2/fDa/vBnp2wPKcmPskXrVgfZSaueqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dcBh/FFD; arc=fail smtp.client-ip=40.107.92.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dcBh/FFD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbu6qeR3VfWEucUIcRdDERV6qNDaU07L5allnEF1+bxW9bC8TSmUEmakuMZ1nE61dUdurMG2fRNEE2CnuRhm1m0Xu73d57A+sFrlrLS5gcmGf350mbccOyk/doSiX4VsCb2MW61ICZ7m0bNxbCubVP265+0V/LAMP6/KjPEt+x5i8uVNX/sbYijWS/TW+wHfvL3TG8ZDdCkj2I4b0KdtIllWQGRNnL0YyIAFYqxpWJT4GFQ9sT6ZXjDCNZEft/gfYi6wJjoSyhBsYbVoLQL6C5j6DibTxkKt/eLZCVU57pNaWNqbcuuSxrEODv5/FjZAZgl3+Dt05JokVgtxJE8LlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU/2V8s9GwzEINsuV22tsgrAIyhxxQFOnHbvaioYA5A=;
 b=JKeUUsFBtATHtigAquOr6OastQ7bZFe+yZWsJ63CcwBztnQGV+QOkFzFV9YLVrz+ymE7F5e3BPEcczRTkO5MKPGO7X5ZdrzB4qqTxDTTN96FzHnVAZ1e7APJM0AkLGIALaExFxrqDj0Rp2qZJ5Z+wsFze38sG2iLBm4EmSpecnPxXinQUSipg2r2fImSfBCGY6moi0P5X5uzD2V4GBzCDyDhHJODDi6wIlRKl2E35lyd+2n172rwBe6FncoBi6dveNtGcjR36JZdgJ1jh7OGNIB8BZnnv41c7hs0uZuqdAjmX0CfZqgVDYzE0EHNQ9COb0AoHc0N04asjyqy2Y/y7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UU/2V8s9GwzEINsuV22tsgrAIyhxxQFOnHbvaioYA5A=;
 b=dcBh/FFDhP8mWFdygX0Pxp4XJUkKRi+mEQAh8RLfNjv0FPtAM9fLjlOsVV1FiTpRtBWs0C9C9DHJXgGxes9X6glz7g7DdJuNl4vibUgwy8ALjvOp470MwE42AHMj4uovO4DJc1+Vg1Hsg0hZLGSRyetSxxcL426gIYdfhaR6B2kO3TGLZMgyY/8c2Ew81ZZKb+0gsaqqux6npgklcqOHW0/ZqA808AYCWUwqc6DLlvCuP4b7l3qyMOLysCi+96Gzi/XKPwJkrT2Vb9daen9Y0nVUNW1SdhZPnq5pqyEnhblQHaOfeWlH9AZczh8/RVpLh46aBrIaodwy2HTMuCxQHQ==
Received: from BL1PR13CA0350.namprd13.prod.outlook.com (2603:10b6:208:2c6::25)
 by DS0PR12MB8017.namprd12.prod.outlook.com (2603:10b6:8:146::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 09:38:31 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::d4) by BL1PR13CA0350.outlook.office365.com
 (2603:10b6:208:2c6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Tue,
 22 Apr 2025 09:38:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 09:38:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 02:38:20 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 02:38:19 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 02:38:19 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [RESEND PATCH 04/10] ASoC: tegra: ASRC: Update ARAM address
Date: Tue, 22 Apr 2025 09:38:09 +0000
Message-ID: <20250422093815.506810-5-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250422093815.506810-1-sheetal@nvidia.com>
References: <20250422093815.506810-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DS0PR12MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: f321ce5f-5d3e-477b-963f-08dd81817153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I2ssnu5GMZmYSK0R/OQOy9Mh5MmxkT+IFaT6qsTBfrbOky5lp8KXGLp8J6zO?=
 =?us-ascii?Q?sDg9JUbWpi7C4xYpvRG7j3TApUa4PHoEUiqUMDVzcxI8YsWUIxVnelu+ygnu?=
 =?us-ascii?Q?KqTn7Ergdfo8e5Q46Rkr5kz1kzJ8Es1tJfvwmbNJhWhiZfZoSHCTGpJEVDhC?=
 =?us-ascii?Q?J2eEziT7f5hqtFEDTyoeNdW58Q5lj/cSlwN6No+1HEMpH1QflKs/mUm2D1WB?=
 =?us-ascii?Q?E8CSf/pqOkdoaGq+gh/IKdL/Flx7Nu27zN6wPE9nt4iRF6nF9hQFY80N4L28?=
 =?us-ascii?Q?KBVmc+vShI5HzPJLECXMl6nRSucrhxDZuEDQamqsDOS8qT4v0vKq1x11CU8V?=
 =?us-ascii?Q?xIHErCFavaSgA/n6gZ/6/xndUIKPkSp5pPhZ0h6zVhstpd4uI+z+p/ccxLQ8?=
 =?us-ascii?Q?HmhUVb4L7uANiZsiHUpn5kEv28yiGIMwvtsL2+4qGAnXBl37yBSWsXDjs+Vv?=
 =?us-ascii?Q?4Ho7cFRK/e2oefBuTjfzRCeXPD4ct9OJylPuGCOYuiV5aH7pKmgnVhpSs5zX?=
 =?us-ascii?Q?l2bK+laPuxC2bE4Mq4QOsEnzFwAycxsTXNrbj+QFY6uhu/hqsDnKpTd1SPT8?=
 =?us-ascii?Q?Jqm8QdYGq3Sx/VVd7/7kQZgJT7lxKMvrPe/S5WT7ybrETx6k4SW3wRx23aec?=
 =?us-ascii?Q?1KiA/8mNLfqYrKgl6y5gxDrwtS/K6K914pZsgWh1fyfYzgf8A9BCbyiLdQgm?=
 =?us-ascii?Q?smQnTGkIv0k/6fqEnb39fFMVkjkiGE8zckpfPPeoc5zzmATc/uGKCxBn6+a2?=
 =?us-ascii?Q?PGfVOW2cTly7j47FqelieTSZmll21YLJGizFkAxcwck4XimDDzNuPeHneVG0?=
 =?us-ascii?Q?8fPva6kSeEXrvACpxwA24ba36EFFXoTnk742djedBbNC7hOP/L9pWNE5aY3o?=
 =?us-ascii?Q?SuSNZdZYG7ePHLlR/vf+y9Lfghs3xVAYtixMh8voWR7lOVlbTv9qhj6dBDwn?=
 =?us-ascii?Q?by0wyWdPJObGoBprlHc5517FSHy4hIXLNG2yPTGvR+9/eMKI+6rOULh/PcZS?=
 =?us-ascii?Q?/KcMkl8UL6VQmLLP1hVyWcyvYSHacAhpzIOxP60wKTkcCyWU41DwiCeXd6gl?=
 =?us-ascii?Q?IL1nrOoh0O0Ssu09pNuoZC1CgaWO0uBmwGs3ZCQaMfTOXEqpQgUW42AyTrkm?=
 =?us-ascii?Q?TcCKi0UGGGo7SBgnp/r5EVLTNKyXwdC0DDEdkW/ihxOJcH5Tq+UdBC8awpVO?=
 =?us-ascii?Q?ca2VQ4Z+J4bHCzu3oBIsbo1t6Qpy2arI2/L+Nrv5rIDc0V46UBa0QMnb9sbM?=
 =?us-ascii?Q?i0AeXhe4pUt6DFo/svOFqrUXIxZDt6DINPmg8oav8ba//cTWfKeiDTFNTpJB?=
 =?us-ascii?Q?psxdgUb31KsER0qqrQMWypvN5x7rfvaFn4ym/z3utiKs1eP1ERRSFEazPaad?=
 =?us-ascii?Q?It2QsxfJvp2ALaD6fQoPOFc8/j6LUryX04KLEa3xzx5/hjqkO7ps80atjjmK?=
 =?us-ascii?Q?PzBCF64aTTtPqHABYcrvOj5gukrwmnj0SXMiWwMbE9fSFUioGbSLgfA+p2IJ?=
 =?us-ascii?Q?X1EyYMKlN7P6s5/XFCeIOwfFJR/criB0In8M?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:38:30.6566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f321ce5f-5d3e-477b-963f-08dd81817153
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8017

From: Sheetal <sheetal@nvidia.com>

The ARAM address for Tegra264 has been updated. To maintain backward
compatibility given its chip-specific nature, it's now included in the
soc_data.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_asrc.c | 18 ++++++++++++++----
 sound/soc/tegra/tegra186_asrc.h | 12 ++++++++----
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 5c67e1f01d9b..851509ae07f5 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2022-2025 NVIDIA CORPORATION. All rights reserved.
 //
 // tegra186_asrc.c - Tegra186 ASRC driver
-//
-// Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -99,7 +98,7 @@ static int tegra186_asrc_runtime_resume(struct device *dev)
 	 * sync is done after this to restore other settings.
 	 */
 	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_SCRATCH_ADDR,
-		     TEGRA186_ASRC_ARAM_START_ADDR);
+		     asrc->soc_data->aram_start_addr);
 	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_ENB,
 		     TEGRA186_ASRC_GLOBAL_EN);
 
@@ -954,8 +953,17 @@ static const struct regmap_config tegra186_asrc_regmap_config = {
 	.cache_type		= REGCACHE_FLAT,
 };
 
+static const struct tegra_asrc_soc_data soc_data_tegra186 = {
+	.aram_start_addr	= TEGRA186_ASRC_ARAM_START_ADDR,
+};
+
+static const struct tegra_asrc_soc_data soc_data_tegra264 = {
+	.aram_start_addr	= TEGRA264_ASRC_ARAM_START_ADDR,
+};
+
 static const struct of_device_id tegra186_asrc_of_match[] = {
-	{ .compatible = "nvidia,tegra186-asrc" },
+	{ .compatible = "nvidia,tegra186-asrc", .data = &soc_data_tegra186 },
+	{ .compatible = "nvidia,tegra264-asrc", .data = &soc_data_tegra264 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra186_asrc_of_match);
@@ -985,6 +993,8 @@ static int tegra186_asrc_platform_probe(struct platform_device *pdev)
 		return PTR_ERR(asrc->regmap);
 	}
 
+	asrc->soc_data = of_device_get_match_data(&pdev->dev);
+
 	regcache_cache_only(asrc->regmap, true);
 
 	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_CFG,
diff --git a/sound/soc/tegra/tegra186_asrc.h b/sound/soc/tegra/tegra186_asrc.h
index 094fcc723c02..0c98e26d5e72 100644
--- a/sound/soc/tegra/tegra186_asrc.h
+++ b/sound/soc/tegra/tegra186_asrc.h
@@ -1,9 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2022-2024 NVIDIA CORPORATION. All rights reserved.
  * tegra186_asrc.h - Definitions for Tegra186 ASRC driver
  *
- * Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
- *
  */
 
 #ifndef __TEGRA186_ASRC_H__
@@ -94,6 +92,7 @@
 #define TEGRA186_ASRC_RATIO_SOURCE_SW				0x1
 
 #define TEGRA186_ASRC_ARAM_START_ADDR				0x3f800000
+#define TEGRA264_ASRC_ARAM_START_ADDR				0x8a080000
 
 struct tegra186_asrc_lane {
 	unsigned int int_part;
@@ -104,7 +103,12 @@ struct tegra186_asrc_lane {
 	unsigned int output_thresh;
 };
 
+struct tegra_asrc_soc_data {
+	unsigned int aram_start_addr;
+};
+
 struct tegra186_asrc {
+	const struct tegra_asrc_soc_data *soc_data;
 	struct tegra186_asrc_lane lane[TEGRA186_ASRC_STREAM_MAX];
 	struct regmap *regmap;
 };
-- 
2.17.1

