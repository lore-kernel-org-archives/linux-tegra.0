Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2060.outbound.protection.outlook.com [40.107.96.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159DB2741CB;
	Tue, 29 Apr 2025 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906411; cv=fail; b=Wu2j3PVqUdAGvhgKLDR0axlhsHk630dINGJCewzvH5rcPERs1fPWVO3bp4x2o33LI5EIZm+5tHmaVI8N0q+U4fWrUYR+mbXHk/tIZuL1yrtgNxuKUSwwjHICjM4nnO9qGF54PddM2w7KG87s3XHM+CpCCNLLqu5Aamkqly50GNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906411; c=relaxed/simple;
	bh=V7/QGcbZ32AJSyDP2OqflqgfYVPLPPZLRYi36oPtWMg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C8pIlBECUyFj0bKuWoo/Fq4ghsDY6qqkGn/a5cjsJuodhZfOhJc2zr+eVJmydO1rw2UzVMBQgx492FYTjwsC5xMwzJwpVxjkAIod0v1ShC5lHaZx1fEyMbT+j8QD8qg1dmbX3A4QeQoUwjTRe5z0g11rDXUbh70vwc8PxonE0G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X03J2R2/; arc=fail smtp.client-ip=40.107.96.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X03J2R2/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKRNynyaBmOqTVXVjHCT3XSgoK5lb34SQtglbdkY0bRpDNAUbPpiRkNPjc/QpKp0kZp4uG/KnojNDCtOc3GcG4hHIXqtFIEjKS3l2aFk/+4VeeiLuVzxp3Twp6dt/XtYT/MQzuQSDTXysO0INBEucGBvC1XlqHfh+vAW25oY0a2FFeRNg4I5K9oAbaurbJ1gAdHPdoKLxMIs95298+5DnTF/mi4RGo3gELZwODIuw4pZyaf8bzVY0XbTAUmzFeFxK3mvtzBvvwgvp1IDQdSsqLTdwj4YSNm0WEd14Pt2Vww5ixhSzyWqaoxqSvbmNfnyisvCxhuUkCCKC3pM2y7+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU/2V8s9GwzEINsuV22tsgrAIyhxxQFOnHbvaioYA5A=;
 b=g5fugr1gyTLPA1VQwbrZLI/jnkJyuMXDtyUtkXNrBeqRSI185NbHgsTWmgR4Dp4OYXtDtyO4YxUnh1sb6EReABU8Y8VPxrEQXT1T9BrjtUSW3/CJX8uXw93zmoj8vAqiUd0BHsaCJW6j5R1mgnf7ot5uTBC/A+Uk7vcWyqOBycHmulwzPpa2c3DFn93o/CDKssNu1JbVoqtwXx/0knN4JUN6mP0ZVHlvK7czZAZjfSK7wH1BySkbTnvWnsuTwse61gDgQLDqA+tRJhhHPK0ykx545VhXoIzipnlhbWLck9nKBPmgiafaAvefNXpUllwT/Qu3VMIqz3K8DCwvc1wpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UU/2V8s9GwzEINsuV22tsgrAIyhxxQFOnHbvaioYA5A=;
 b=X03J2R2/NvX3ng+GjV9/QaMgzsS/rAEvteiH9vxWUPuR0nhN4qsi8YsR6OcyRywYLLOSJ1tJbrcG7NRwVr9OIeCEkwGyPf7Atm72mR712lFxLSs4KEJnlnKP6O6DLuWCD/tk0YDzhhMVsS6FgQMFO/iECKMRKa09Vxr8qkHdaLfYbHbLWJPWtDyc5zOnOaIlBSUZzutyTU1UgeC3PxcA3qFPG47L/4QJsC/fG5uxi8IwzQFbsHd/Aqn2xnJvYB3Zvp44XttA7RPNP+WqcJOCXtbhQv0c/s/TNcFaSIxDD63KwKoSTRS6wqrDbjiWvewisKiwB9T8U3yO3J6dSra1cg==
Received: from BL0PR01CA0018.prod.exchangelabs.com (2603:10b6:208:71::31) by
 DS0PR12MB9059.namprd12.prod.outlook.com (2603:10b6:8:c5::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Tue, 29 Apr 2025 06:00:06 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:208:71:cafe::3f) by BL0PR01CA0018.outlook.office365.com
 (2603:10b6:208:71::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 05:59:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 06:00:05 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 22:59:47 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 22:59:46 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 28 Apr 2025 22:59:46 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2 05/11] ASoC: tegra: ASRC: Update ARAM address
Date: Tue, 29 Apr 2025 05:59:35 +0000
Message-ID: <20250429055941.901511-6-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429055941.901511-1-sheetal@nvidia.com>
References: <20250429055941.901511-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|DS0PR12MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ab72fe-dbe6-4e31-43a0-08dd86e3172a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PhwR41a8MH5szijg5id8HwXDK89Gny6ns4k+XFJycBEe6uRtV+JYe1y9xmnd?=
 =?us-ascii?Q?a56j/cmrjcwfR/m5oDvlZmgo59QbbuQAadSHegeZNiMB1rkw+qDV8d8DfqDk?=
 =?us-ascii?Q?gfD3xO/kkJTkmsFDrDEqhessAXR/eBMcIiX2nWnYUmsoQcfDw5Q26qZJcf6p?=
 =?us-ascii?Q?6BafkSk9oSd+i6i6sVpGOwIronToqZuR/fjK19dRmznu8fIS+U8l38eA+OXE?=
 =?us-ascii?Q?KHgn4rZKG/R3nzAVHmB4f5I17v0WpTC1YPIynftTJAdfBKksIOPHaliulGqF?=
 =?us-ascii?Q?cmb+kJ/UEDr1wFWAEsKytoO2A35C73LafPV0znMZqegf5Zn9ho+vG6FvxDFK?=
 =?us-ascii?Q?9MOH/sRmv/kJnDMdULfrxfC1YAliGKrhMLikRifr5zQsTjN+pXa0AhXCyzeD?=
 =?us-ascii?Q?Mx9CyDyNvUYQgxinl0wEovsLvsDqBvXK5wrom7OTa0rHfpOB0PniG+9AYfff?=
 =?us-ascii?Q?7ZkKyn35qggghNnfK2IfOcUvLE7qiNSS0z8b/FoiRcNbHVA1QI72LhAhKmZ5?=
 =?us-ascii?Q?WgmtYbVZGS6NbjLsjvYVNpWsShfTicArc+DB4WNYSdZZuPSiDDtGPDL805/7?=
 =?us-ascii?Q?A4x+5Dt6tZLwrH02IQhhB8nIE8VWDI7jwzjtSwJyQZf0KfQ5capbmSHqYQ3J?=
 =?us-ascii?Q?ORLLSFctSE9DqLsen07yLpRVnlJfqJVjqK1Qwhnw/aq3GeMn949QTYMEQ+7p?=
 =?us-ascii?Q?Pc29gKizmgkgeoW0QvI4io7ewJm5rfSHNbPKrl+e1XyvOyK7COPYwlizw5fc?=
 =?us-ascii?Q?qU8VS4vAx3RnO03VL+S7xgvOR0e94+sDZfFZVgFrCutPBineFNYA75mQIqwp?=
 =?us-ascii?Q?qBTazzashc4ceEEZaG5oIcF6vjQ2ROSq5794awNmn0Z8iDaL0KhLA8UJAdTe?=
 =?us-ascii?Q?S9+9/qH62o717T2yYKWRQTv87tMbxtFm/6yQbHG3RzeWmDa/Vend2VqafZeN?=
 =?us-ascii?Q?1g848A0hkGMjr6s6THeYALb2PhKqsmof5KVNX5N+lXB1qgT0loDg09O+BRyZ?=
 =?us-ascii?Q?5gLpIo8qvSqHvRJQWSSRavyjwn32Ahm8y0NVo8T9wI0d19bCGMFx6R2ZZzql?=
 =?us-ascii?Q?lQR6+6F/+dv9ZaI7+0QY1awFyoqbfyCJkiyC7q76CkQ26VAPIsrtjnFsa2hW?=
 =?us-ascii?Q?AmDl1iRVoU+Q9rGDRR2764zQkYPWrPuYlgmplMXYLUmAxrtt1snG5WUGf/WW?=
 =?us-ascii?Q?LQy4CrrsQoXdXOIiIKZEUIb45BtaMAp3yDEko2Qk24EzSoh2RmrziZWGo1r9?=
 =?us-ascii?Q?SS4dSV/7zMKEzrOSWzgIsJ5ON4cgP76Bqeg5G0ybRdQ8FYnuLUJQwVOMG2o8?=
 =?us-ascii?Q?DYGFwSJTAiN7xF9X61gqqOpvRSN3pTTDxmaW8OBZcYJcYHKMDBeDvHKCI2Og?=
 =?us-ascii?Q?4c9cAbFLvm33VuGKCAFHfjjqo+U7V5Kb1gatOwWZKqCeBXWhpS7y3DBGYx2H?=
 =?us-ascii?Q?9v79fWKylPVPzxI5oAAhbnhgPs4cKm4Nj++zHv/NOPJ+bfM3Khcm8Xf0ooxp?=
 =?us-ascii?Q?GsONi+gOjpygx7uIvn3kZdla+VKegZGL53un?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:00:05.8670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ab72fe-dbe6-4e31-43a0-08dd86e3172a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9059

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

