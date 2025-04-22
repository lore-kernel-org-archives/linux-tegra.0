Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62A22459CB;
	Tue, 22 Apr 2025 07:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306943; cv=fail; b=GexSI05aZqx/fQ52um8noCJUhF1SCuJ36DHy6DD2tDbXihBRIJAtz4jEBvDDuqC+8L6UrLqr14ZC7UAuEPZlD6cL4OGIRUU8o+KBobzLPE7WJKHsi269nCPWLJSSSAkYvNwlHTSDshaDEkWhXw6e7CCqgLw6r3zfR+jUKy7/sJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306943; c=relaxed/simple;
	bh=V7/QGcbZ32AJSyDP2OqflqgfYVPLPPZLRYi36oPtWMg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZUOwljsjOFRSYn2oM4irHxhLthOO1Jfo86mFbeFXM2SxHkvS1ne0u2fAVVLt1EzEwCj4HbZEL+xSz5nUzevkaD3bzRQ7Dt7XqzP8FXJ+S2H/1zI65pk9JwUpSj1wcZyiBJ+AmGllwEDMxxJKpx7RDYezL/1g9GKDArnhsRz8AGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RZI32dp+; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RZI32dp+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGC/XvhjS9ACt1IJ1LfFHwUtzBU/a8xlx46ymLHqFjfxxsIqKpjLtegjF/Eb4vxIYzjcR3MwDlmwtlBTMO+m9V+w/rW6Ea4k2NrlwKlWYeZURBjV7FsqBqKRlr7LCmbhEO0/SJr8I03WN6airpCKycpIMdFZYD+tGKrxSJgnmNgrudQeQXcDEVLugCNO1K4UGd1WAkn9QAg1qkuuOYE4KqGWMs9yE/7SxJ1/7k7nYhWgkVqtvtEOCX7GkXK3Zxv8jUchyI/6i7dJoRX9A7ES2/fP/o/kHsyTO9Jp2BlQ0hQywjjn3eS86Bv/+PH9eK4iiBu6a/hvAMaBcNaIKxbKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU/2V8s9GwzEINsuV22tsgrAIyhxxQFOnHbvaioYA5A=;
 b=bmVcRQ9lAjvKREUXgNuzxtgeVmtM1n0Pl6NhVQUqcQ5IXfkN1vYJNVrJ2xt//7VZmYp6pkUZ422k2VZFKh88ZcWURqqyIxaEX1jYsoIE1Eiom7n2NXXgC2AYzgCYCtNCotIOCS4atgmH7J3UtVFk6IvOrpi3chugB0sJ0vazd3Idvvjmk4GwWfxBpmSjfEHQOTEKv93eVJstsmV5owcqY0ppuicEYWSoxqdNyga7XlzGS4hPQm7BhwmOoxN7oXjhNIN7squw1EDTwds+2A25aJSkSVAJTKbnS7p7o483WqiXARAI1DAiET5j/V5ZXlpvvBnMwFtyd6uBOdWyqRg7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UU/2V8s9GwzEINsuV22tsgrAIyhxxQFOnHbvaioYA5A=;
 b=RZI32dp+J8a35wi1g3lwvveNWfnQb59xKHy1JM7YDQe/AILwVTobZHIukYiRYKBM1H8mE7tmn58s7obqYVWOnFJdJLzEnsT1AX052cfUoSWTiOtftRFgFy1JRVjafi6SnAoS5Ksif16f0U4UyqabgiYolyUoDG1YxJtLya8YU0+KbpyFhMoLNdnjRI4YSL0zhjXV1BaHz5200HE5jr/4M8u99BQd0y9ymvdMYjZ1JxtAk7ysMVP0omvFxpc8sx/A6t52E1cESiE5/LXcobr3C+dTWy/uva9YgF4imUN4teuNutki+aCcD7nbhPxxmayKtY2XOpCSg9qi9PQhXL2MuA==
Received: from SJ0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:a03:2c0::29)
 by MW4PR12MB7432.namprd12.prod.outlook.com (2603:10b6:303:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 07:28:54 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::98) by SJ0PR13CA0024.outlook.office365.com
 (2603:10b6:a03:2c0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 22 Apr 2025 07:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 07:28:53 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 00:28:38 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 00:28:38 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 00:28:38 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 04/10] ASoC: tegra: ASRC: Update ARAM address
Date: Tue, 22 Apr 2025 07:27:59 +0000
Message-ID: <20250422072805.501152-5-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250422072805.501152-1-sheetal@nvidia.com>
References: <20250422072805.501152-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|MW4PR12MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 027d6553-deda-4f7e-f204-08dd816f5603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uk6qPzCpRVoSDn560mL/qMXP2ynzxigN9OGfdSknZa0BJjs5D5xFV1S/49bz?=
 =?us-ascii?Q?eAnJaNGfvpdR11oBHKMSePkD+XgdywuxKgvijOIO8WgH0YmrR3KEMswDv7wR?=
 =?us-ascii?Q?GPDUkgwy9hy+pRdCd9DSpdTkngtaY74tv4GSE214MaQKi/efWD2rKVmTfMFG?=
 =?us-ascii?Q?Bi5HhXmv359rLmZ1OXdu3yrZG+hNWDeH6P99ssI3n4WhZOIg6KVIbnS7z3Xw?=
 =?us-ascii?Q?sE/0PRKd9YCBhX0Bwxp4kMKQunuImOeBuFklejjex2NXlG0r74OHE2mlTUmN?=
 =?us-ascii?Q?D9rW6SrXe58I+4+eerKg6d3HAjleJtkcGaUlayuBWleLhvw1ygGhd19P66nU?=
 =?us-ascii?Q?Zxp0wqyMu/lfRcGL16Ga7tl1EmTxTXhMscH0fgbWGGhLYYjZ/gxUNoxxpctN?=
 =?us-ascii?Q?m+5hdTKl+wT30Fl+6p+tqOSUYkFry0qwh7VM2VdRYRG/x0T/gfcn+chRbe2U?=
 =?us-ascii?Q?gho0+WM1GMaD7k1Iy5ccN9BqvKn2lHAAOBh9xqfb1JMB6GVj6GCKJs8IaZt5?=
 =?us-ascii?Q?pNSWiDFBWkNInnCWE2qUgEtuEjTTXO6r/f0bdf7u+EWMkVX8U87KUsl7ENkB?=
 =?us-ascii?Q?uAUhSoBmVq93a/lQP1t0Dc16zsGtF3wkg0FhvKaf+BFu32YOKEfz/YDXxdgK?=
 =?us-ascii?Q?R96xUMySIr70xbQ203p2k6HhMJOOhjA9mYYA5dXc8GY0zx5zPyg7vlMlh/Mu?=
 =?us-ascii?Q?+QJxBKiIOIJgm8MgtAAFVwi4GM77xkDqs3t0SIr5QLh0bB3vzEyw0bzZypML?=
 =?us-ascii?Q?eZfv9/MbA6bfxvDUZC96cJyr7MJoGvH5SNqe1Dc9hAhIOB464cGk5O8aRys3?=
 =?us-ascii?Q?JH7DtWq47TbyJ2+kbIg0cr7vCeSJienXax2t138/be/3ps9Gn8iTizwODQvO?=
 =?us-ascii?Q?0aV/2xFPLxGByPVAh1Wk/ON4t36PA7HzMikoTPsZcSehOY9vTOvCBxtWvgLa?=
 =?us-ascii?Q?nFDGCd4EvTsCIxud88YQuMUeCyvNladENc2eC0goZKA32P5dvdnkfs9Wu1iu?=
 =?us-ascii?Q?MTAYUJLONaqT1Bl0ZYwAAoH83fQtgRouah+fywOLqJSvB+6TbLljLg9jN1A8?=
 =?us-ascii?Q?DUBZJQsNLTg9m/Y/PtarZkZe1YCavO0yE74cI1gEFlBDQUI9Z7EMEppM3GkF?=
 =?us-ascii?Q?eLuSFDXkVU1Yyex1F+adSyjevZucCVQAEbDB7/qSoZkxybSKbyqx14iHz3kn?=
 =?us-ascii?Q?s5EIfSmZdcewprh6wsQcfFOiAveylok/FxAxh1GHsVb1stRXB9E+JdPfhXIG?=
 =?us-ascii?Q?5C0F7tEiNKtZNA79ETNXS6O1TAN9Cs5RyNdFzZFh3lpgnYdOF+uUEFd1dYca?=
 =?us-ascii?Q?FE4fjgOq8NiQ01Wb7k8dne5NETD4qrLX7cAoRgRtmG22ii/E6AHDx4ln6C3+?=
 =?us-ascii?Q?QUKGdUX22rcPK2+f75E7VOEU+UDc/MmBaCIHO/NZ/4PDW20OvBhTc4sMZ+QB?=
 =?us-ascii?Q?xXehLLJFJEiPvMc8UaOJUPYjNwiitDvjWBlYJJLSTO8MD+LQFoDp9BUgESG0?=
 =?us-ascii?Q?J2JvU5pLgY1HXyBOc/RXeIKsohS9xX9imGG/?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:28:53.9836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 027d6553-deda-4f7e-f204-08dd816f5603
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7432

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

