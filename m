Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8479124888E;
	Tue, 22 Apr 2025 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306946; cv=fail; b=oXk4g7xauSD8pWiLftmyHLIbbAg+0KEBsyeiQZ9AMxcfys8u3E+WA1k2O8yeIQ1EAKaWa8Zz4b6dow8rNHcVdkEswBVKx2U1Z+m9L1G/CiHcUwW+k864OlpYroQO4q+hkfIUfNLhJKDZfSH9DdSVf2l5+MQZ3XaHOWvlmEFujPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306946; c=relaxed/simple;
	bh=9qlDTJhZhudxF8f6jJASYahlTt20s1h59a3nI9S2ymk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXNYLUO15teZjtsl2ViHX3RGdqMgErYhb0S+eqEySHoTHak0RoNGpRgRALq8ZudUzn7vl6TnpOdKDvlrTquI9zmqkGenH9yyBF7WJw115WheiZ5H3kfU4pzVfrUfhIXfmb1S+/8s6emYoGx/mXRiL0P0rlkbzhhdfhUdqcVZeiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ygbo2y3V; arc=fail smtp.client-ip=40.107.212.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ygbo2y3V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBiyAA7UtEoC3OwuNEIHhS+wiHvU4eQmevb8E3kwMKHyxJy2PVOj9Frd+FWqoa216nHstNkLyAY3y+mwB5QgtIVPIvcGThL0xXK5vdVLh/uARjTMOFR/yg3VJIpUMe6bRFUYucth2uPJ0ET22+CxPZr0FZHD06lKRL+NRkjJ+91Fhi/3MUGNCmvQy9xKugWR7JZXViwrWjI+h+srBxcxHcgUIid6TlCrhCZjMt6dsZWa9IIhUOMQsbGZEt6vud24Z3uEWfwTfTM8wizbj7uPM137YgbjyPWsZ7doRGPjhEsUhXbHrUqlSYn8vpLwO8jkwftPoMOGmaEEPkwuMpEXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT7oH61d3XgyUsVhxXdQMWBrBOAekfkBJZ7bVhpqCwg=;
 b=YmsNwy/hXnPYi3eBVAxFMvho9Gpdb5riK5hAt3piRGmbkopQ7oTHwi21ldp2+RU/RJhL13FdeYTlRMsw895MZl0JW6FyvtL24Gb2k5wVHz9G3MLX5rKX1R84kqTEv0ZVlpANhDsFjlV1ZdSlGJDWgWMXxLa1+wzR94PwtzaUIoVYPaH9XgwC4UHmtSJ+kj7dsus0jnidAzxUHeBEpxQ6QoYazRBGt/lVaSV+P4IPrkvwZj6b6rKaAT/3LzW3c6umgvPABeJbrzKSPcULwSj+eqVSDwTaxmxMRGe8yntrcBdwWpaOWKpUREz6cLrYuLvSLB1W2oF9Yx0fxPgQmr34Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT7oH61d3XgyUsVhxXdQMWBrBOAekfkBJZ7bVhpqCwg=;
 b=Ygbo2y3VLnKsZdt9L9BMzAStiP3Y7x8Aq0gSp9emJRzq632PbFf8BKnXHF80hS5v18v7OpNjc9uHcm590EyxSELlg2qUiKXeZc6yzJ82M4KO/ttnDE44v1wuuD1+uPB4Dobd7tT2JEs5pQe+7usG3ExNKxNvhOyDja+CrQLqHK3+GsDvj4GBDTGY1maSmtoTFYfO+S1MaVW8N53X441uVfwzvSCcGHFAi3aeswcYKel+jJUZWIUO5GRr5SJCeoAYNJHKkxlQr69X6L8Fp7KfNSfjoE+MzO2hycaCSf5+9WEdcOoRx11eE6UL2tPK9ULHBjQhWIoKMJjGdXVnoHwPrw==
Received: from SJ0PR05CA0143.namprd05.prod.outlook.com (2603:10b6:a03:33d::28)
 by PH7PR12MB6609.namprd12.prod.outlook.com (2603:10b6:510:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 07:28:56 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::4f) by SJ0PR05CA0143.outlook.office365.com
 (2603:10b6:a03:33d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Tue,
 22 Apr 2025 07:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 07:28:55 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 00:28:40 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 00:28:39 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 00:28:39 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 07/10] ASoC: tegra: AMX: Add Tegra264 support
Date: Tue, 22 Apr 2025 07:28:02 +0000
Message-ID: <20250422072805.501152-8-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|PH7PR12MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: d6840104-3f4b-44fd-4109-08dd816f570f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zo9v+gVCmWkfsC34PsIJz6D/cccnkIu9alMxCGUuF4rt2n1EtKrMPmeZ26Zd?=
 =?us-ascii?Q?IxovlladinzBd2nJybEZvi37LW+CG9YcKSmRLuz0VcwPkVt8GNMvBgezfgu/?=
 =?us-ascii?Q?odr3khzw0u7ejiPvUUj/u0RPpAAdsVFCg/zXSiYFDNQMdOZxXBsytwGndIjM?=
 =?us-ascii?Q?/JbZEFUrjHswHGQxb8Z4MqVD19rvjI+1v2graPGGnlAy+96zvw4JA8P0iMof?=
 =?us-ascii?Q?Lp9MAs3pleCceF608Eil48VYm47F5IBg+a5X3o5nGTHv4JIYFD3nEFaX3Q2q?=
 =?us-ascii?Q?XSzcCqeXAUb9LfFqcLOQh5colhVOyt8G7hdag/Q6O/sCGK4k8P12AmXS9s7+?=
 =?us-ascii?Q?3v6G0ybSbnUk4sEUMgX1OCjuMIP9ez+tQqcC2W0Jlsghn01jW/OlwvwNJVtF?=
 =?us-ascii?Q?hnqr1DV5R/qzCAE4T8/nzYvh6Hgpv0dnehgbTVwbjdU62tDI1yZdXcixY0UL?=
 =?us-ascii?Q?2NdNX9NABjoWhK7WmcQQdV2EkawGy8PUALQsVXnIZuH11fIcLj/K2RIFLGK2?=
 =?us-ascii?Q?LnxzPihzc+LtZiu9/RHHoiRIkc1Ueqzy8l+QMaIDLw9VQVfsdivpnTvn8oDP?=
 =?us-ascii?Q?lk8pa3ldzictGe+lRgwASBSROfmh1Qxfr2pQTcTEnywZbOFmbcPUY6ML3tOD?=
 =?us-ascii?Q?U4FP8Zv+TgUf+cUI2xT6DXCfCqLlMmkcvJUILu/jgrRqYXDPEjtxHvnAE1ir?=
 =?us-ascii?Q?74SeoQGm1DRXZ6Beqkr69XtQuQIgG/qNJQ2oWBsnw9Z4Ocibb+98radaLFDe?=
 =?us-ascii?Q?PHk3kjaOW/LsyKeNns5lkn14dW3RlGWx6CIBBEWyU4Yuvg/Gjc7mFiGLfELO?=
 =?us-ascii?Q?NHx3N7uG7lyAch3EJyPLeHpXy/qwcOG8ojIf77ADK/r/Av28inSTzg5hE16J?=
 =?us-ascii?Q?a8SBz043WLTuvvmH5+AmstjMCvZ80Pg2VzTWM7YEPv0ri55vGGywq4qD4876?=
 =?us-ascii?Q?AKGX2jGsK9sOsbEUK8H7hxBFR4WYY2QrKWDLzC8O8V2tA/1Huv4TEZvsaTFV?=
 =?us-ascii?Q?5PO0PuGMTYYCjZFqa6Ezj8ng2F6dhnJY8oqofq8HjD/Ciyx1UnE+RjWKi7wa?=
 =?us-ascii?Q?mY8vvjlqMMGYtyNZVhc8nDiKI5sUzyolxC6BxYz+HN65Uc9tt5GCjpI1D5qO?=
 =?us-ascii?Q?rfQ739DOFVXkhPRqiNM/HV5JSl8TixrEtmzwhxzINgXtD94edpa+8q5NVI3n?=
 =?us-ascii?Q?8ZxcxJKuOtVKkYxpbXWHlMxHB6wuK1oFc2wOB8iY+1cabBC2eko40Qhl6+ew?=
 =?us-ascii?Q?wSZej/2pbGHiCfXYuF2kjXSzeuenfPnaRG7c3A7O1Q+aI+DHxvnMi0g8C65O?=
 =?us-ascii?Q?fqEBWyuY3DoW5joJ/8N8L2UvvKEVZksS4Zex6BG0Ot4haeF6nap7cO35sxE6?=
 =?us-ascii?Q?8KutqjF5j7iYsG4mzktA5+DD4C08AtyhouTJnoH5ZzHcYzuwFo+6V1H/efS0?=
 =?us-ascii?Q?QSe3xxvxsQPxA1wfR5fk9vsMGfI/zKMkPouhzBDEzpWnKgHd2b9FDppDe8nW?=
 =?us-ascii?Q?LeMTDmI5IuvpGLJ5I1DCTZSIBH03RTLoOqHs?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:28:55.7355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6840104-3f4b-44fd-4109-08dd816f570f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6609

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

