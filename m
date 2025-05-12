Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D58A2550DC;
	Mon, 12 May 2025 05:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027111; cv=fail; b=XljzJKz0ymQHkut08I+zRv2QdNN/oPSeTKVfEv8ty2jy7DizfNIvBbAR6eM+cvsV+TPp6LBWMibk9iOH+KdO0Ny5F3mRoyGAuZ8KNxfwX5MyPQOElGr8ZnDMdtcMqjAH6hSJ0bSp/gfXSHTR53PRVmamMR/Wyz+QO1xwMPE3rLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027111; c=relaxed/simple;
	bh=V7/QGcbZ32AJSyDP2OqflqgfYVPLPPZLRYi36oPtWMg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AJGvjxM9WA9WGcge8+rlIjknDZNn3oz8DZG/Z1ZLwBSU+nnB4BoIdPbu9YWtbvXEjtTiBYfKr7PGA/n1TgW23zxz4j6jDfGgzRSbf0uf2Kpba+CUsZjuiLKHuANKl5Akbbw9H2AoP6ReD3GV7GrglJY5Bs8gtoSg6o7lxDhFLbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=chTXJuDZ; arc=fail smtp.client-ip=40.107.220.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="chTXJuDZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjLOpaC9wrtTXl0LrHHfCGZ/zKcxc9qAJ3c2PP/lF41Pd03Y0xBHaQppxSazd1GGP6ksTpORqL3ElicUe9hHpO1F7SegaT8qis1afmkwn2O4/wEK3Vjnk3DF+27CRyT3/eJs1Tqj8WqtTrsw0RvoTp0JtKWik1oyiMbP5PO0uCIPZpnosWX1siKX00CZxsoYQbVSu94PL2WsP37nYwm8HW4tq48HWG8GXBNcthkaiMMRu/GWmyPib5IZ2egknTmu5ShthFDW4maghWvzSmjqq5Ea/ntSyZvpWOUR/savZwScxUiQe75NDQG76KhDYbaowluKa3x1FJxmB9ZGwOu/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU/2V8s9GwzEINsuV22tsgrAIyhxxQFOnHbvaioYA5A=;
 b=SDt35s9zTcKNTOCatTIMi9PdDX8GrEXxOqjW4dGnijAZDE2vPnMqWnrrdVkx1U003uIzSyAkF54Z2c1Wv/9pyJZFBVJBgy1w+xJt2EmxHj/S209bcQM+0ElTvCvWl6HiLR2RoF1/aoUNqOY5VfYrV4Q3Xv7lYZcZZQX7NMBdWd9340WP+vxx+0TK41leXLgNMPUv3bC+GAOFZCa1mUsSdl9VjzwK9FhAn1Ucgz21ctPAtVD2SYXPH/SRYKYPOoptKAwj1UJB6h+A+rjSkIfQAif1ih5V0QiU19MpgL69BfWPoUoMn/nLV1sz/czLgwSNyGvCgWWCDP1yMIhgKetHLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UU/2V8s9GwzEINsuV22tsgrAIyhxxQFOnHbvaioYA5A=;
 b=chTXJuDZexH1ZisV6668xboA4IIC93Bo558QZRzoHRZ9ytTTjCv8vIKOSdxldz4VWVtcOEpAjcD3ejDH3ILa+7TAenF7EJjakUW4JN48pE/vt+egWxyFTMivPhifT1kNpaAxT5L5v33sdak4nF56U5Gl406IWvEl3XrXRWmbULMU7iKEC6oBBcw0VZhAwf25Z8HiSpS7fhXDj+XIEsdP6RcXkqXWZ80z1PMFJ87Uf7lZYG+9d+T2Toxps4YIrVgXjQs3Xtvu4shwbbXblc6YfsrrMNtqJRXsZlHvFQV/I55Nvk4eVOWZ8zYm6eprxgBm+VEO7baeQ8KzLKsuz83vVQ==
Received: from SJ0PR13CA0164.namprd13.prod.outlook.com (2603:10b6:a03:2c7::19)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Mon, 12 May
 2025 05:18:24 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::b) by SJ0PR13CA0164.outlook.office365.com
 (2603:10b6:a03:2c7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Mon,
 12 May 2025 05:18:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 05:18:24 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 22:18:14 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 22:18:13 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 22:18:13 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 05/11] ASoC: tegra: ASRC: Update ARAM address
Date: Mon, 12 May 2025 05:17:41 +0000
Message-ID: <20250512051747.1026770-6-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250512051747.1026770-1-sheetal@nvidia.com>
References: <20250512051747.1026770-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|SJ1PR12MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 33063b0d-cce0-4c72-7482-08dd91146b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VSLpzuV22KIsogPwsXyCnrTiQhNnHITbuFhFkSZRYALJX6nTw+8jtYZ7Vh0c?=
 =?us-ascii?Q?lxuImxl8TbeT5yiWSlaf50DI90ZaWVrMvQe88iRcQpHDgCCWwxs5wzfgsskg?=
 =?us-ascii?Q?Kk7O49xLPGiqLTegqTswqFsuJ1T/f6vRQv15Ry2NVo3l3izGqNvvBTmlna6C?=
 =?us-ascii?Q?wSMz5jy600apGgWGSFvhAjsG4pB1wx5mtPy5yUlFhgwevbgQ3f0pqIe5Pj9a?=
 =?us-ascii?Q?rBlZnhHBzz0AUo9Z4BhmQ6sCd11O+A77DpNF8sqKHhs1YSmQZ7mRU0N848uw?=
 =?us-ascii?Q?I7YVS/XDbFLFIEd1pdeN0SfGKo9s2bzxKk1K/Y9HMxjHj3YPCA+fpHrr+rSO?=
 =?us-ascii?Q?ggftsd9WjH45sjCgUaMyIC6+iLjO+S0XouRJmFSeYOG1WJWTGL5LiZxaCfHC?=
 =?us-ascii?Q?40MTmpa4wE1lt6x+Wimnjv3QuufY61PgRSCzGUBgztl9yz4jHmze2vlIGWv5?=
 =?us-ascii?Q?9N5qLndTLziNedyxfuG+UMUk8uwaeFilqxObdzakhL/BPe8kmvOH1GocxVt8?=
 =?us-ascii?Q?H1/pzCpzdyS40NW/j/wTgJZRt/LCo6PIyen3G3pzd18wMk2bt0TsmXj1fHMP?=
 =?us-ascii?Q?UKHj5RDmWw0hPbnOa7oiFsDQP0Hh6JNFNWPRUYQcFDUP0G9+PQXpBcOXoOiN?=
 =?us-ascii?Q?mXEeExhn9/IZ8qVDPWyLh264xMiXUJ0s57zZ3I7ds0d5+xF9jyVMrLei/FqR?=
 =?us-ascii?Q?ihivlSlZMzgAjS6UYBhMCLp2Bl6RjHytaq1jSKKVl0tdfhqrF63OHty8y78N?=
 =?us-ascii?Q?bpcscguncT6N7ljeihNilLiZGXOAeFIDKmFGKdCBjggq/50hP50cVJLoJv17?=
 =?us-ascii?Q?X/HVzXFCv6ZqGNu1T+BYzyq1wPf299SYmUTSFYBgsyf/NpBKPbbGRD+tbXj/?=
 =?us-ascii?Q?pHReN4yqV4pv8VWb0g8sKRZK+NXmjE0nlggaDyEsyPsg5jyy3aLk7D1P/gjH?=
 =?us-ascii?Q?V3wOVU+yFQsjF0P+OWiGa214e+pg+vhS09F1oCDFxTABema131fZ9QDxHjJr?=
 =?us-ascii?Q?t5+kAV2fx+Y7d8BMMSExxxA/HX4+Ylv7hTdPYqI36lcMKSSHuH5wN/1OMZsb?=
 =?us-ascii?Q?JjbSc3NB1XHhGfhuXDPv/wy8m/FdhQW+k0kJtmjhaPcEc6JIwnqzz5rcJe2R?=
 =?us-ascii?Q?MoWzrjNONsPqCjUxw7Zyx+s5ZQIeBV/5wn4H92kRMc7dnSAeUne124Hb7ENO?=
 =?us-ascii?Q?H48upRVVfdYWglw0EIF7QYaBYfGhiq4RKd3rv0zxUUhfSLoc+3ofTyDgm4hL?=
 =?us-ascii?Q?/rsIO0J+rAwm/L163L8dHqosE5KQAhX61wf90BtA6Eoww7b9O1Dbdfhq2/ME?=
 =?us-ascii?Q?ndIK2ue7zv6TeFCJl9HCfM0rTt7tnJacC1+61l3C2dbH+mpfFDmGgOH1XcPq?=
 =?us-ascii?Q?NtcSr9apcwS9NOM3zVnM8LlIvsNu9K5YZBNCEu7B390e/i5hJX3fk2py7rhB?=
 =?us-ascii?Q?5AJsif98ETpsUcAu6lq8vCoxWDjo4IqIKYfah407atTaCTniGxEHLIujjiK+?=
 =?us-ascii?Q?OifO4f0RbC/ko7zp7DfbQ1hZF3NllVX3EN2A?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 05:18:24.6257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33063b0d-cce0-4c72-7482-08dd91146b8f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098

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

