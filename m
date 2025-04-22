Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D881820CCD9;
	Tue, 22 Apr 2025 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314726; cv=fail; b=B4PECL4vjoGubPcElaHdkOF+BOVEsl4BV6RoLe+JN5HmPu5uDOjsh542rkFLTzSKHLaZowjXAao0H6piBR3Xh7MQjr6MJCPnrK0XBNEoztnY87gzX/yicvOF41tCfJG2KWBUl8mFyYC9E+s802Br7M/rcLnMT7bAskgB0nnBu0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314726; c=relaxed/simple;
	bh=9qlDTJhZhudxF8f6jJASYahlTt20s1h59a3nI9S2ymk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PptqBT0uIh4Cg89cgUy/CpDqKCuH78xOLLzqye46mD7sgIYWbdcI/VdDd8BoUy3X/lX1TUeVayb5NtnKwN8xvXrHF1V2+JV9VFDFViwfPw8fGDtppvBSyEz3y8gxdmlIargRF9d9l/fwNSUknaJ/qG6xLTzN84VGpycIXSicr9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I0V5EHXO; arc=fail smtp.client-ip=40.107.243.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I0V5EHXO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2kzlhL3TMY4lRXmBAufbpWSRI+PNDpL46BJoQa4PeLysHi+W5suCJNW4fooTo14yIBYV+zPmRn8awWHBRMEdQAhJxBgp5YHGabI29pellLagL6wdVvYoX79HNgZLdOV68GR6gSVRLMej+cJGvAGJ5Xb1ETYMqFkWIG1yLSFPMgQysK9lZD7uiKqka+b8mkB7nKyyW8gSZeLKeD2cL9VzF/gAvzDkE+BLTRPoSmkZjoO+xUZIYH2zakYAmk/g2QI3VDWTbnUh9FEP2P+SBTaFcwApzYaGAPpDb7+9ozoWCaNxw6cSyqCX4Sr9IzO953KcZ6SVpiqGtzaZxGii7MzSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT7oH61d3XgyUsVhxXdQMWBrBOAekfkBJZ7bVhpqCwg=;
 b=Pi4DSxu2dQDU4SZLFWPOPYtiNrMNmRUgXZkf4EOhp1QfKj4ktrDi7TeZz4Z8r2vVNtLFohlUoTkHjrPERbT8TjIHjajL5Jz3w/GUUU7YMzdPJ4DPPRjwsdST51PmGBDkXgyV5DJ86N/u+Uclw8j3/cLjn7AuTPB0tJ/SzZNyYN/pw67FPAZb+dFrGS4ykRXXSyUVR2vcvd09YNHySCIjogiOjHk86qZDUw0A3I4WiluLO3SmXQszFbTlSWekYwzUbQqg1zPQ0F2ye5yqqPaRjzjtURFHYGR7YwFUkMPuF3AgiKuGb2WlHHt1LkCD5ccKug7mNzePcGaVRZ2FrTtfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT7oH61d3XgyUsVhxXdQMWBrBOAekfkBJZ7bVhpqCwg=;
 b=I0V5EHXOxEoor2NQVebgfYPZFmJ38pTGMNDE8hA/0TTg7KlHhmw6ArkyGnYpS1UM8+CXljEEu3cK20hn4lZzdU6GU9Y9L5hVtdVTkvQnTHK2w0yYD+ixF6MyOHwE78S42mIb4SwymnKFsUnME2fNK9VcBr0KShnWb0ONt4J2H01a4tBJMISyDH6Pc6VZI+COcPo6FdOOipi7FtA+mPuJcm+jXL05DASP/Ulf14n4O4tUIjnWdXVYAsR7JQYjGD0SW924jQdehPKiOrtn79U8lgfe217u1Z6fpIFsFmQYESPq43wGAY8r8kdv8/Mr+rsiqC+vQ1S64aCwIieXDf2c+g==
Received: from BL6PEPF00013E10.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:15) by MN2PR12MB4173.namprd12.prod.outlook.com
 (2603:10b6:208:1d8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 09:38:38 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2a01:111:f403:c803::9) by BL6PEPF00013E10.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Tue,
 22 Apr 2025 09:38:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 09:38:37 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 02:38:22 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 02:38:21 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 02:38:21 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [RESEND PATCH 07/10] ASoC: tegra: AMX: Add Tegra264 support
Date: Tue, 22 Apr 2025 09:38:12 +0000
Message-ID: <20250422093815.506810-8-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d0c70b-4b1d-4d34-78a0-08dd8181758e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gKgHfVmaoYV0ZtIchwG7LMfAF9TQvHYeBxkG3GzEcmsxF6SBddg4sXS40cu9?=
 =?us-ascii?Q?rd4XuFy3ZSsAAVlSkOzcIym3DjFaY+/Sike0TvSnpxPL5Ioo0ZbsuJ9yLoNP?=
 =?us-ascii?Q?vjsBhVc7wSuxDd5vnlfBoTMhaQjNfZCuWYoydY7RpH0j4ETwwQmTbh227f5h?=
 =?us-ascii?Q?lVHnBpspUS0/XdDLB7ASlbFN3NMFP4BZM2emWvHbmHU7qEKHh7gQt1zAH9db?=
 =?us-ascii?Q?hRPF2zvfbrRdHNfybVBe+RogDgy3gqrkDNYb/IBTiHIh3u+glkoswL1hMgEO?=
 =?us-ascii?Q?HPym0XB45Y48kAi7ognKRa290gBRzN+GlY81ETqXEqkyGddH2xBvqRpvLzkx?=
 =?us-ascii?Q?IsGN2a1KNvJj2ikd5olmrV1q0KkS39BkwT0q8wW1fg/I4EgydICHPXDSoDkp?=
 =?us-ascii?Q?5KqKYCzxERPwIDwuL19GtT9OfSUSh8giCXy/+lXh83/LtfuNVfe8a3klUpgx?=
 =?us-ascii?Q?7iPN2CnGtjhWccqqBTOHyzpu9WFmPfCtjOVbsxblkq6z189hJ8OnRo4lFk64?=
 =?us-ascii?Q?xsEVsH34gAYZCHHEWHwLO/yzZRLUBunSFnwqFbiJnTbvtm4+JHwaOcyWosno?=
 =?us-ascii?Q?yLei+rSWdQazDtuUTWzvObk8jLeQzdq2Q614X3ixIJzGro3cqNhpNETghf7W?=
 =?us-ascii?Q?kXAs7Vp0tebSkx7AOK4JOr9I4vXV/X30b4Jpck4/i918BbciheGojnoyBDx6?=
 =?us-ascii?Q?xE+cFmPqIpQDxaSw04lvMq0UglIAilZqgtxqnqrY6NLpBSUu+AucxgikVOch?=
 =?us-ascii?Q?gmJzPJFOv33O6k9LUxa4wQeBSHgRqv8vd0N+xnqNv3QawzNxln3pyKgLRWgO?=
 =?us-ascii?Q?F9POrLpGqHborAg3PjClsU0SlcKJogtF9WnxJyrGwIZcUOWEG5nCpvyw0Psp?=
 =?us-ascii?Q?OuklA2XYIXhYq5S1KPta850h4yGvjA0/tYCmig9PgClWGFsX5R8iozd5767m?=
 =?us-ascii?Q?NBduME0f1dlzMrYGL8mTZ4vdPUgEICT3lI5ukbUg91VB/v+V5hkq6HzheJne?=
 =?us-ascii?Q?rAMygkOusI8lTVl2rwBUjnPOcCkCd7c3ljJtV2WzxnD3/SkXnYycWHAG1XiW?=
 =?us-ascii?Q?hAex6jo1YAJIgs2fvqaZqXxS3rQeW+fDepfCjgBL2J+IiSXEKWrm+MR33q0X?=
 =?us-ascii?Q?3jFtV0BuaUD4nF4YPoOfefQ+hLfhzzk8uF7/N7HIfvWTpwAQv/13FO486+l7?=
 =?us-ascii?Q?NnhsfjogomtNA3F+PztqXDaYl8uEp1D1YnGL8IoA1pjtwogS6i8uDFTYRej5?=
 =?us-ascii?Q?7uRUVdTIl6mu1E28mc4xZ7AOaEVlI/Yl7LyGE5edGqYqJ4R2e3gJdC+uQ3pI?=
 =?us-ascii?Q?8ujOvkhWAJzYmP9mg1Sxe0557nP4Doi/NJnvw5JD/yGWyhrlG6ExIcxm3iOu?=
 =?us-ascii?Q?1VfYc2IMNwyNILJ6g7COco1bmKHNuJccF9elxbVN39p2V79pGLMMPUtXWk2p?=
 =?us-ascii?Q?0fBSGySPk2r4GMjaK1XYMMKi48BJ6Ir4ixA5xq496V9JI6IdwFWYgcm9zHAG?=
 =?us-ascii?Q?7OCosQrmpwPMcVpSrE4Jt4TnyQc3idcjUwoZ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:38:37.7310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d0c70b-4b1d-4d34-78a0-08dd8181758e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173

From: Sheetal <sheetal@nvidia.com>

Add Tegra264 AMX support with following changes:
- Add soc_data for Tegra264-specific variations
- Tegra264 AMX supports 32 output channels, hence update the capture DAI
  channels_max parameter and CIF configuration API.
- Register offsets and default values are updated to align with Tegra264.
- Add 128 byte map controls for Tegra264 to accommodate each byte per
  channel (32channels x 32bits).

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_amx.c | 229 ++++++++++++++++++++++++++++++---
 sound/soc/tegra/tegra210_amx.h |  34 ++++-
 2 files changed, 241 insertions(+), 22 deletions(-)

diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index 1981b94009cf..7f558c40e097 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-// SPDX-FileCopyrightText: Copyright (c) 2021-2024 NVIDIA CORPORATION & AFFILIATES.
+// SPDX-FileCopyrightText: Copyright (c) 2021-2025 NVIDIA CORPORATION & AFFILIATES.
 // All rights reserved.
 //
 // tegra210_amx.c - Tegra210 AMX driver
@@ -46,21 +46,35 @@ static const struct reg_default tegra210_amx_reg_defaults[] = {
 	{ TEGRA210_AMX_CFG_RAM_CTRL, 0x00004000},
 };
 
+static const struct reg_default tegra264_amx_reg_defaults[] = {
+	{ TEGRA210_AMX_RX_INT_MASK, 0x0000000f},
+	{ TEGRA210_AMX_RX1_CIF_CTRL, 0x00003800},
+	{ TEGRA210_AMX_RX2_CIF_CTRL, 0x00003800},
+	{ TEGRA210_AMX_RX3_CIF_CTRL, 0x00003800},
+	{ TEGRA210_AMX_RX4_CIF_CTRL, 0x00003800},
+	{ TEGRA210_AMX_TX_INT_MASK, 0x00000001},
+	{ TEGRA210_AMX_TX_CIF_CTRL, 0x00003800},
+	{ TEGRA210_AMX_CG, 0x1},
+	{ TEGRA264_AMX_CFG_RAM_CTRL, 0x00004000},
+};
+
 static void tegra210_amx_write_map_ram(struct tegra210_amx *amx)
 {
 	int i;
 
-	regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_CTRL,
+	regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_CTRL + amx->soc_data->reg_offset,
 		     TEGRA210_AMX_CFG_RAM_CTRL_SEQ_ACCESS_EN |
 		     TEGRA210_AMX_CFG_RAM_CTRL_ADDR_INIT_EN |
 		     TEGRA210_AMX_CFG_RAM_CTRL_RW_WRITE);
 
-	for (i = 0; i < TEGRA210_AMX_RAM_DEPTH; i++)
-		regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_DATA,
+	for (i = 0; i < amx->soc_data->ram_depth; i++)
+		regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_DATA + amx->soc_data->reg_offset,
 			     amx->map[i]);
 
-	regmap_write(amx->regmap, TEGRA210_AMX_OUT_BYTE_EN0, amx->byte_mask[0]);
-	regmap_write(amx->regmap, TEGRA210_AMX_OUT_BYTE_EN1, amx->byte_mask[1]);
+	for (i = 0; i < amx->soc_data->byte_mask_size; i++)
+		regmap_write(amx->regmap,
+			     TEGRA210_AMX_OUT_BYTE_EN0 + (i * TEGRA210_AMX_AUDIOCIF_CH_STRIDE),
+			     amx->byte_mask[i]);
 }
 
 static int tegra210_amx_startup(struct snd_pcm_substream *substream,
@@ -157,7 +171,10 @@ static int tegra210_amx_set_audio_cif(struct snd_soc_dai *dai,
 	cif_conf.audio_bits = audio_bits;
 	cif_conf.client_bits = audio_bits;
 
-	tegra_set_cif(amx->regmap, reg, &cif_conf);
+	if (amx->soc_data->max_ch == TEGRA264_AMX_MAX_CHANNEL)
+		tegra264_set_cif(amx->regmap, reg, &cif_conf);
+	else
+		tegra_set_cif(amx->regmap, reg, &cif_conf);
 
 	return 0;
 }
@@ -170,9 +187,10 @@ static int tegra210_amx_in_hw_params(struct snd_pcm_substream *substream,
 
 	if (amx->soc_data->auto_disable) {
 		regmap_write(amx->regmap,
-			     AMX_CH_REG(dai->id, TEGRA194_AMX_RX1_FRAME_PERIOD),
+			     AMX_CH_REG(dai->id, TEGRA194_AMX_RX1_FRAME_PERIOD +
+				amx->soc_data->reg_offset),
 			     TEGRA194_MAX_FRAME_IDLE_COUNT);
-		regmap_write(amx->regmap, TEGRA210_AMX_CYA, 1);
+		regmap_write(amx->regmap, TEGRA210_AMX_CYA + amx->soc_data->reg_offset, 1);
 	}
 
 	return tegra210_amx_set_audio_cif(dai, params,
@@ -194,14 +212,11 @@ static int tegra210_amx_get_byte_map(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
-	unsigned char *bytes_map = (unsigned char *)&amx->map;
+	unsigned char *bytes_map = (unsigned char *)amx->map;
 	int reg = mc->reg;
 	int enabled;
 
-	if (reg > 31)
-		enabled = amx->byte_mask[1] & (1 << (reg - 32));
-	else
-		enabled = amx->byte_mask[0] & (1 << reg);
+	enabled = amx->byte_mask[reg / 32] & (1 << (reg % 32));
 
 	/*
 	 * TODO: Simplify this logic to just return from bytes_map[]
@@ -228,7 +243,7 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
-	unsigned char *bytes_map = (unsigned char *)&amx->map;
+	unsigned char *bytes_map = (unsigned char *)amx->map;
 	int reg = mc->reg;
 	int value = ucontrol->value.integer.value[0];
 	unsigned int mask_val = amx->byte_mask[reg / 32];
@@ -418,7 +433,90 @@ static struct snd_kcontrol_new tegra210_amx_controls[] = {
 	TEGRA210_AMX_BYTE_MAP_CTRL(63),
 };
 
+static struct snd_kcontrol_new tegra264_amx_controls[] = {
+	TEGRA210_AMX_BYTE_MAP_CTRL(64),
+	TEGRA210_AMX_BYTE_MAP_CTRL(65),
+	TEGRA210_AMX_BYTE_MAP_CTRL(66),
+	TEGRA210_AMX_BYTE_MAP_CTRL(67),
+	TEGRA210_AMX_BYTE_MAP_CTRL(68),
+	TEGRA210_AMX_BYTE_MAP_CTRL(69),
+	TEGRA210_AMX_BYTE_MAP_CTRL(70),
+	TEGRA210_AMX_BYTE_MAP_CTRL(71),
+	TEGRA210_AMX_BYTE_MAP_CTRL(72),
+	TEGRA210_AMX_BYTE_MAP_CTRL(73),
+	TEGRA210_AMX_BYTE_MAP_CTRL(74),
+	TEGRA210_AMX_BYTE_MAP_CTRL(75),
+	TEGRA210_AMX_BYTE_MAP_CTRL(76),
+	TEGRA210_AMX_BYTE_MAP_CTRL(77),
+	TEGRA210_AMX_BYTE_MAP_CTRL(78),
+	TEGRA210_AMX_BYTE_MAP_CTRL(79),
+	TEGRA210_AMX_BYTE_MAP_CTRL(80),
+	TEGRA210_AMX_BYTE_MAP_CTRL(81),
+	TEGRA210_AMX_BYTE_MAP_CTRL(82),
+	TEGRA210_AMX_BYTE_MAP_CTRL(83),
+	TEGRA210_AMX_BYTE_MAP_CTRL(84),
+	TEGRA210_AMX_BYTE_MAP_CTRL(85),
+	TEGRA210_AMX_BYTE_MAP_CTRL(86),
+	TEGRA210_AMX_BYTE_MAP_CTRL(87),
+	TEGRA210_AMX_BYTE_MAP_CTRL(88),
+	TEGRA210_AMX_BYTE_MAP_CTRL(89),
+	TEGRA210_AMX_BYTE_MAP_CTRL(90),
+	TEGRA210_AMX_BYTE_MAP_CTRL(91),
+	TEGRA210_AMX_BYTE_MAP_CTRL(92),
+	TEGRA210_AMX_BYTE_MAP_CTRL(93),
+	TEGRA210_AMX_BYTE_MAP_CTRL(94),
+	TEGRA210_AMX_BYTE_MAP_CTRL(95),
+	TEGRA210_AMX_BYTE_MAP_CTRL(96),
+	TEGRA210_AMX_BYTE_MAP_CTRL(97),
+	TEGRA210_AMX_BYTE_MAP_CTRL(98),
+	TEGRA210_AMX_BYTE_MAP_CTRL(99),
+	TEGRA210_AMX_BYTE_MAP_CTRL(100),
+	TEGRA210_AMX_BYTE_MAP_CTRL(101),
+	TEGRA210_AMX_BYTE_MAP_CTRL(102),
+	TEGRA210_AMX_BYTE_MAP_CTRL(103),
+	TEGRA210_AMX_BYTE_MAP_CTRL(104),
+	TEGRA210_AMX_BYTE_MAP_CTRL(105),
+	TEGRA210_AMX_BYTE_MAP_CTRL(106),
+	TEGRA210_AMX_BYTE_MAP_CTRL(107),
+	TEGRA210_AMX_BYTE_MAP_CTRL(108),
+	TEGRA210_AMX_BYTE_MAP_CTRL(109),
+	TEGRA210_AMX_BYTE_MAP_CTRL(110),
+	TEGRA210_AMX_BYTE_MAP_CTRL(111),
+	TEGRA210_AMX_BYTE_MAP_CTRL(112),
+	TEGRA210_AMX_BYTE_MAP_CTRL(113),
+	TEGRA210_AMX_BYTE_MAP_CTRL(114),
+	TEGRA210_AMX_BYTE_MAP_CTRL(115),
+	TEGRA210_AMX_BYTE_MAP_CTRL(116),
+	TEGRA210_AMX_BYTE_MAP_CTRL(117),
+	TEGRA210_AMX_BYTE_MAP_CTRL(118),
+	TEGRA210_AMX_BYTE_MAP_CTRL(119),
+	TEGRA210_AMX_BYTE_MAP_CTRL(120),
+	TEGRA210_AMX_BYTE_MAP_CTRL(121),
+	TEGRA210_AMX_BYTE_MAP_CTRL(122),
+	TEGRA210_AMX_BYTE_MAP_CTRL(123),
+	TEGRA210_AMX_BYTE_MAP_CTRL(124),
+	TEGRA210_AMX_BYTE_MAP_CTRL(125),
+	TEGRA210_AMX_BYTE_MAP_CTRL(126),
+	TEGRA210_AMX_BYTE_MAP_CTRL(127),
+};
+
+static int tegra210_amx_component_probe(struct snd_soc_component *component)
+{
+	struct tegra210_amx *amx = snd_soc_component_get_drvdata(component);
+	int err = 0;
+
+	if (amx->soc_data->num_controls) {
+		err = snd_soc_add_component_controls(component, amx->soc_data->controls,
+						     amx->soc_data->num_controls);
+		if (err)
+			dev_err(component->dev, "can't add AMX controls, err: %d\n", err);
+	}
+
+	return err;
+}
+
 static const struct snd_soc_component_driver tegra210_amx_cmpnt = {
+	.probe			= tegra210_amx_component_probe,
 	.dapm_widgets		= tegra210_amx_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(tegra210_amx_widgets),
 	.dapm_routes		= tegra210_amx_routes,
@@ -450,6 +548,22 @@ static bool tegra194_amx_wr_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool tegra264_amx_wr_reg(struct device *dev,
+				unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_AMX_RX_INT_MASK ... TEGRA210_AMX_RX4_CIF_CTRL:
+	case TEGRA210_AMX_TX_INT_MASK ... TEGRA210_AMX_TX_CIF_CTRL:
+	case TEGRA210_AMX_ENABLE ... TEGRA210_AMX_CG:
+	case TEGRA210_AMX_CTRL ... TEGRA264_AMX_STREAMS_AUTO_DISABLE:
+	case TEGRA264_AMX_CFG_RAM_CTRL ... TEGRA264_AMX_CFG_RAM_DATA:
+	case TEGRA264_AMX_RX1_FRAME_PERIOD ... TEGRA264_AMX_RX4_FRAME_PERIOD:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static bool tegra210_amx_rd_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -470,6 +584,21 @@ static bool tegra194_amx_rd_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool tegra264_amx_rd_reg(struct device *dev,
+				unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_AMX_RX_STATUS ... TEGRA210_AMX_RX4_CIF_CTRL:
+	case TEGRA210_AMX_TX_STATUS ... TEGRA210_AMX_TX_CIF_CTRL:
+	case TEGRA210_AMX_ENABLE ... TEGRA210_AMX_INT_STATUS:
+	case TEGRA210_AMX_CTRL ... TEGRA264_AMX_CFG_RAM_DATA:
+	case TEGRA264_AMX_RX1_FRAME_PERIOD ... TEGRA264_AMX_RX4_FRAME_PERIOD:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static bool tegra210_amx_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -492,6 +621,29 @@ static bool tegra210_amx_volatile_reg(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool tegra264_amx_volatile_reg(struct device *dev,
+				      unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_AMX_RX_STATUS:
+	case TEGRA210_AMX_RX_INT_STATUS:
+	case TEGRA210_AMX_RX_INT_SET:
+	case TEGRA210_AMX_TX_STATUS:
+	case TEGRA210_AMX_TX_INT_STATUS:
+	case TEGRA210_AMX_TX_INT_SET:
+	case TEGRA210_AMX_SOFT_RESET:
+	case TEGRA210_AMX_STATUS:
+	case TEGRA210_AMX_INT_STATUS:
+	case TEGRA264_AMX_CFG_RAM_CTRL:
+	case TEGRA264_AMX_CFG_RAM_DATA:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
 static const struct regmap_config tegra210_amx_regmap_config = {
 	.reg_bits		= 32,
 	.reg_stride		= 4,
@@ -518,18 +670,51 @@ static const struct regmap_config tegra194_amx_regmap_config = {
 	.cache_type		= REGCACHE_FLAT,
 };
 
+static const struct regmap_config tegra264_amx_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA264_AMX_RX4_LAST_FRAME_PERIOD,
+	.writeable_reg		= tegra264_amx_wr_reg,
+	.readable_reg		= tegra264_amx_rd_reg,
+	.volatile_reg		= tegra264_amx_volatile_reg,
+	.reg_defaults		= tegra264_amx_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra264_amx_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
 static const struct tegra210_amx_soc_data soc_data_tegra210 = {
 	.regmap_conf	= &tegra210_amx_regmap_config,
+	.max_ch		= TEGRA210_AMX_MAX_CHANNEL,
+	.ram_depth	= TEGRA210_AMX_RAM_DEPTH,
+	.byte_mask_size = TEGRA210_AMX_BYTE_MASK_COUNT,
+	.reg_offset	= TEGRA210_AMX_AUTO_DISABLE_OFFSET,
 };
 
 static const struct tegra210_amx_soc_data soc_data_tegra194 = {
 	.regmap_conf	= &tegra194_amx_regmap_config,
 	.auto_disable	= true,
+	.max_ch		= TEGRA210_AMX_MAX_CHANNEL,
+	.ram_depth	= TEGRA210_AMX_RAM_DEPTH,
+	.byte_mask_size	= TEGRA210_AMX_BYTE_MASK_COUNT,
+	.reg_offset	= TEGRA210_AMX_AUTO_DISABLE_OFFSET,
+};
+
+static const struct tegra210_amx_soc_data soc_data_tegra264 = {
+	.regmap_conf	= &tegra264_amx_regmap_config,
+	.auto_disable	= true,
+	.max_ch		= TEGRA264_AMX_MAX_CHANNEL,
+	.ram_depth	= TEGRA264_AMX_RAM_DEPTH,
+	.byte_mask_size = TEGRA264_AMX_BYTE_MASK_COUNT,
+	.reg_offset	= TEGRA264_AMX_AUTO_DISABLE_OFFSET,
+	.controls	= tegra264_amx_controls,
+	.num_controls	= ARRAY_SIZE(tegra264_amx_controls),
 };
 
 static const struct of_device_id tegra210_amx_of_match[] = {
 	{ .compatible = "nvidia,tegra210-amx", .data = &soc_data_tegra210 },
 	{ .compatible = "nvidia,tegra194-amx", .data = &soc_data_tegra194 },
+	{ .compatible = "nvidia,tegra264-amx", .data = &soc_data_tegra264 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra210_amx_of_match);
@@ -562,6 +747,20 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(amx->regmap, true);
 
+	amx->map = devm_kzalloc(dev, amx->soc_data->ram_depth * sizeof(*amx->map),
+				GFP_KERNEL);
+	if (!amx->map)
+		return -ENOMEM;
+
+	amx->byte_mask = devm_kzalloc(dev,
+				      amx->soc_data->byte_mask_size * sizeof(*amx->byte_mask),
+				      GFP_KERNEL);
+	if (!amx->byte_mask)
+		return -ENOMEM;
+
+	tegra210_amx_dais[TEGRA_AMX_OUT_DAI_ID].capture.channels_max =
+			amx->soc_data->max_ch;
+
 	err = devm_snd_soc_register_component(dev, &tegra210_amx_cmpnt,
 					      tegra210_amx_dais,
 					      ARRAY_SIZE(tegra210_amx_dais));
diff --git a/sound/soc/tegra/tegra210_amx.h b/sound/soc/tegra/tegra210_amx.h
index e277741e4258..50a237b197ba 100644
--- a/sound/soc/tegra/tegra210_amx.h
+++ b/sound/soc/tegra/tegra210_amx.h
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tegra210_amx.h - Definitions for Tegra210 AMX driver
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2021-2025 NVIDIA CORPORATION. All rights reserved.
  *
- * Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
+ * tegra210_amx.h - Definitions for Tegra210 AMX driver
  *
  */
 
@@ -32,7 +31,6 @@
 #define TEGRA210_AMX_INT_STATUS			0x90
 #define TEGRA210_AMX_CTRL			0xa4
 #define TEGRA210_AMX_OUT_BYTE_EN0		0xa8
-#define TEGRA210_AMX_OUT_BYTE_EN1		0xac
 #define TEGRA210_AMX_CYA			0xb0
 #define TEGRA210_AMX_CFG_RAM_CTRL		0xb8
 #define TEGRA210_AMX_CFG_RAM_DATA		0xbc
@@ -41,6 +39,13 @@
 #define TEGRA194_AMX_RX4_FRAME_PERIOD		0xcc
 #define TEGRA194_AMX_RX4_LAST_FRAME_PERIOD	0xdc
 
+#define TEGRA264_AMX_STREAMS_AUTO_DISABLE	0xb8
+#define TEGRA264_AMX_CFG_RAM_CTRL	0xc0
+#define TEGRA264_AMX_CFG_RAM_DATA	0xc4
+#define TEGRA264_AMX_RX1_FRAME_PERIOD	0xc8
+#define TEGRA264_AMX_RX4_FRAME_PERIOD	0xd4
+#define TEGRA264_AMX_RX4_LAST_FRAME_PERIOD	0xe4
+
 /* Fields in TEGRA210_AMX_ENABLE */
 #define TEGRA210_AMX_ENABLE_SHIFT			0
 
@@ -72,6 +77,15 @@
 #define TEGRA210_AMX_MAP_STREAM_NUM_SHIFT	6
 #define TEGRA210_AMX_MAP_WORD_NUM_SHIFT		2
 #define TEGRA210_AMX_MAP_BYTE_NUM_SHIFT		0
+#define TEGRA210_AMX_BYTE_MASK_COUNT		2
+#define TEGRA210_AMX_MAX_CHANNEL		16
+#define TEGRA210_AMX_AUTO_DISABLE_OFFSET	0
+
+#define TEGRA264_AMX_RAM_DEPTH			32
+#define TEGRA264_AMX_BYTE_MASK_COUNT		4
+#define TEGRA264_AMX_MAX_CHANNEL		32
+#define TEGRA264_AMX_AUTO_DISABLE_OFFSET	8
+#define TEGRA_AMX_OUT_DAI_ID			4
 
 enum {
 	TEGRA210_AMX_WAIT_ON_ALL,
@@ -81,13 +95,19 @@ enum {
 struct tegra210_amx_soc_data {
 	const struct regmap_config *regmap_conf;
 	bool auto_disable;
+	const struct snd_kcontrol_new *controls;
+	unsigned int num_controls;
+	unsigned int max_ch;
+	unsigned int ram_depth;
+	unsigned int byte_mask_size;
+	unsigned int reg_offset;
 };
 
 struct tegra210_amx {
 	const struct tegra210_amx_soc_data *soc_data;
-	unsigned int map[TEGRA210_AMX_RAM_DEPTH];
+	unsigned int *map;
+	unsigned int *byte_mask;
 	struct regmap *regmap;
-	unsigned int byte_mask[2];
 };
 
 #endif
-- 
2.17.1

