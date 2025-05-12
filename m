Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2061.outbound.protection.outlook.com [40.107.212.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D36B2561C5;
	Mon, 12 May 2025 05:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027118; cv=fail; b=aoMk3uNHFh+0bBehw7S0Mxd3zqbdTsVWawFcQC87IfJSImYp5TgMv1PQH8ZVE4KJ6kwilQvA1ruep1toim9jrxW4+EyKHLyzwoButT6FsytWA3EvmJsE3ZsCoU9mNfal6+L4h1lMuG5TD3+MsmaJwSj22NLYQRfvfiZ0Eygp3kA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027118; c=relaxed/simple;
	bh=9qlDTJhZhudxF8f6jJASYahlTt20s1h59a3nI9S2ymk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pqdpQzkwQMxBi3de44L411/yatncGVARo1CDhSITv9wbHC0R6K2IrYUIdVmvOhv9c1lJDD4A2ap4sORc/bIKQzZd4l3V4JTJbBCnQ7zxCYhyDQ5DOF5dxCNCMNnQy5okRJkBPjnq/XfO0pKZwn2k81L0XRNJ9y+a/1gOuNQ025w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=px4rZrAm; arc=fail smtp.client-ip=40.107.212.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="px4rZrAm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFH0n9idz0YcwQr8fSpmRC6TKiW3oznzXeRVm7vzT0jz2n8xISsxTYRx8iYdHBH5bHl4bxBTsWke5EQOvTFhe1/wYzoio75KkTtyOwA35cQ740EW63BlSf7PCki6dLHv2XRhN0p2O0UtoW36OiU5nGPtXJj52emz2DR0BkAjS2NAOjGcGRqSabZhsLEsAtvgt0xZaIzBv5+BaDxSJWd/g0kofzHcdKhYZ8CCKqd2pp2VwImBNRH/XJVSaBuOEJssRAZ+nB+tQD6vtOrdjJs5N24fH1juGAraDFO8rugsRw311MbScPqVAEypPmm54R3TcRdlJTcnuL9cZ2tqGwV1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT7oH61d3XgyUsVhxXdQMWBrBOAekfkBJZ7bVhpqCwg=;
 b=pBaENyyAF5ruKRZedWci795lKDqFsvYoF6SIMPL4GRTVgERD/YPwmp4LwdNZ8cwUdEECwP0eVEPYFk3HuVy2HkpcgRP/57ytMNVWj9E4VJOvYpehIjR4eLNWLuZxUPJ09pL0loxuhc385Bval/suayXid0EZxMtH5vTioMb321m3/NM31kOpwdJOt0wpJG7v6cjxZ3XhymY7vl+vPvZF46fleWfOvl+pB3oZCiD5mfsN8tFcx+RNBJ6Tk3XEBaq6bq9TGgOosc9m8UkK2e99QnRYicDehKwUwKyXJMvTiMVNzJz2P61Vj1I/B+OoNtlStZiHmkD1Yrv49H9ZkJpzPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT7oH61d3XgyUsVhxXdQMWBrBOAekfkBJZ7bVhpqCwg=;
 b=px4rZrAmBRxKE8ri+isQcVywI+BYOwteCR9/fPr14VWkbQjOL89Qhn6B0LEzFrx2tdduHlyb3YeVWwLOBAv76blc1dQHoGy6uLsMqzhgbPYyLhOZN5S5r4hD0mfFpWb5PMjahZH8/FGwoNJa7QJhyvTBrejx5QaR+N4gc6x7YF9OYSHRVFEafR5z1aT7LePTbctMrY33eH05Q/jQZnOT0v6QtItptD2xd87b4rCo9thZkGcmWk0ERrkWGLZjsBt+/pkSp89cKlRweB4YGTyA75bRJxLFmPbS8fokOn7Sm7aJxR7zwxLzDcc3cBsRuzyBb7f1i7EHNh/mrpy0Uw24gg==
Received: from DS7PR03CA0105.namprd03.prod.outlook.com (2603:10b6:5:3b7::20)
 by CH3PR12MB8878.namprd12.prod.outlook.com (2603:10b6:610:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 05:18:29 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::5) by DS7PR03CA0105.outlook.office365.com
 (2603:10b6:5:3b7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Mon,
 12 May 2025 05:18:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 05:18:29 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 22:18:15 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 22:18:14 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 22:18:14 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 08/11] ASoC: tegra: AMX: Add Tegra264 support
Date: Mon, 12 May 2025 05:17:44 +0000
Message-ID: <20250512051747.1026770-9-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|CH3PR12MB8878:EE_
X-MS-Office365-Filtering-Correlation-Id: abba4f88-20ca-4ca6-eddd-08dd91146e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Eky1FBRwktSjLM4HMS2ETKL//yt2Rt0a/MLLPqtz6ilZoxYXCrNVp+42suC?=
 =?us-ascii?Q?GlQVjkJHck+Y8yjKWWKJN4O4XipKqoQsxugqi+m6tL+2GA710okELhy1NcOF?=
 =?us-ascii?Q?YER3EoBv8iOsWcIZe9TdLUtneDhlR/KJMWdWe3aPQ1gPfyy4YhySMkr5/S96?=
 =?us-ascii?Q?Yrxb8um3SyCZjn/PtIVnhoU9fAD/uJm9+VJ49l+yguhXHf88UtMf3SFM0ZHc?=
 =?us-ascii?Q?x88pzGt2u1t03CQI6snCBU1DI23v2Txu5qbJ/crRxPbYPVp+mHR7dRv1B28t?=
 =?us-ascii?Q?Qwom7vmSbq9hxHm8fS5i+GIOpYO1UKp4cC6EKrcjn/9q8RrJ+dvyc0B8Sbp7?=
 =?us-ascii?Q?hPd8ejNTFQLdiNRG3yQYmiNBc7vNsqYXQRV+0RzvBeQtS1h23tWGnDl7hVmf?=
 =?us-ascii?Q?IB28aX5WgQCwUO6tcFE1nhEQAxF2gUKgrB2ZfNuDK3nzqnDeQleYWDLAShMu?=
 =?us-ascii?Q?okK6agJYJ3O7Lv5VT1nlpTgBCO/eD7c9TzzfxbelwkoTpkZcQfpCltAbAwo7?=
 =?us-ascii?Q?61m8DiRHqa7GSjCquJtgHUN0YaqDievBWa/hozpmQMhdmRaoXam5PXNENesC?=
 =?us-ascii?Q?Jj8Jcx/NrHauBJe/Cv2QiObvea57k5wuNySXtIcHL3B06wlxHizCZtDboSHo?=
 =?us-ascii?Q?UO6udzXQM8cQvrblMhcLmDOWbfvnNjJOZZ1q7TR6Cm682oUnqYPR5c+R7gf3?=
 =?us-ascii?Q?NgI4MvPHB+Gldd/LvJ1BuPn9BqyMDiPyqabLG/MmewrE4j3w030NALl0WWaW?=
 =?us-ascii?Q?3luEtsMS7FDn0dzM0QYsT/NVJbJ9635QGlj/B92/gzLIoKHI15acawUwLA0U?=
 =?us-ascii?Q?oKLgaJ9fz5VdHaTemssyqX5xLb+iJ6uAUyHF3ao+juVUHB9GvnSk1tDHwtWv?=
 =?us-ascii?Q?4uR81yUi6ZhUMuD8uonpBvMemCUtJnV0bph5x3GXk/q4xxGJsnrLntAX34Bq?=
 =?us-ascii?Q?vJz/G5PmjXsNNMqtpU+votpZuj5BOs9R534o9pQioLcZsIIY44AP4FetWihk?=
 =?us-ascii?Q?5MbiHDU7blzrwbDZwBMHfWhDobCU9GKWKPGjNAJwhZ954XchuwxRuegCFjCw?=
 =?us-ascii?Q?+7m4fH+U/of/6rnkbWmcu0YO3t8jVam5m0CBw0lSMyBOeee7dihcaRAkk/Mh?=
 =?us-ascii?Q?FiPf8W8eRj65brQCGIbJ6PyOqIJq8w/WaQTbohLjw+AoQuJn2oDRjfMAoGjT?=
 =?us-ascii?Q?hhNJkhOIVVYF33YfcaMZVHBNMMnZbNfgnbZRaQcgST5C/DJee+jCUgeKwoZf?=
 =?us-ascii?Q?oI0Yo9bIj+vUf7QxZkggQ7pOx9S0OgbAHfhEYnCcbpVpZZ8qYXdBYN/epZLJ?=
 =?us-ascii?Q?E84+QwvybGwk2m292bK8kLYfPEZZoDIUi9IJzvvgjiOoDi7bHlyqUeQH8i93?=
 =?us-ascii?Q?oLGgrD5W9PKYa9YykaIxE3ljnAvjOVgHravXn+91GQaXbIf0/DTZBX+asJd2?=
 =?us-ascii?Q?6pIcL8IIPauuffJyjGTfiybZIeHfaNi/vZ+l5+nx0XlFjYxy8itZszIzoRR8?=
 =?us-ascii?Q?VgdOjfTkovJlZduNPO3OynnYAspBSJUbJU90?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 05:18:29.4041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abba4f88-20ca-4ca6-eddd-08dd91146e75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8878

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

