Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092727701E;
	Tue, 29 Apr 2025 06:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906421; cv=fail; b=FiW5g9kiuSDNHTFSkyOKTJPrHUfbtcggQSEGdeUX+on6LWzGiUisx8/m2FGs+xysZYJiSfnFIQFQ5Z8BR9Zjy3gBkb/pGY+Mtdn/a/MTSiqzuusfP8YSepO0lFRtlHeEMORtbUfC45gW2JiZUxOGzATTKsrd3X4fYe0JEMXARn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906421; c=relaxed/simple;
	bh=9qlDTJhZhudxF8f6jJASYahlTt20s1h59a3nI9S2ymk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsRCUu7zIkYbC/sqFaZJLsvV2dODMwSslG1ysOuJNOuDnR+zRGEsIXgi8d5591sNZBsqwlLIGrMzGRNc5eaaB7+FqT+ly18Eif70Usc5fw0JaoX6RPtkDaBRbPbBqcu7tNMAIYhlDqyGEXH6F/nTDLNF/5M8Rk1DA1OktIrON48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RIzBbQJa; arc=fail smtp.client-ip=40.107.237.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RIzBbQJa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iX4cM0sPp6gdYxO5ECZPA/aGFz4waG3Qf7wiw6C/xtCwwNKLSm1M+buEOH7BegPf2BxateKVdIaNeAf7RsouDG4QeEqw61WzGTbKpYIZs0AV7SqOnV1VNyQbZdHhfWgtYyHhsIdM7UXzv4cdYhgbfrayqXxmZm8lR0t2MmJ0eNYFznpZuym/9dcvC1EGWAcYVfk5bBix3QY9uKnsDGMWtYra0Pt5spiinKJt8ixg7UDWalRsvlkCC8cQiay/WmJD5vnqoiZII5vaxE5X5PRiQw37pC0fKg+mdMw1LA4v1argmNgBh7n885OrlZSdLHF3p51asgRi84M7J3AvylhSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT7oH61d3XgyUsVhxXdQMWBrBOAekfkBJZ7bVhpqCwg=;
 b=nh2l6cbesPchPWR59feXxZF+0pcnoIEtr3HzbYqQDcoglngdg1ood4eNu693wOUaC8F4lPNaCHHxix+I9TW1qp6PTmp8mIboXLXqLsdNYhpyMvVTrrMQo3kCMvknlyEft+shNrFaO4ScvA0YwbJdTcKtW/3A+24Qir0H9y+NulfFWehA0DrY3xQ7sNUIUWkLlDXw70wZjfMABqWn/Ypq02eHU5fjAyK+pSPrFJbYSIKkT0nLuNgBK+syv4/zYvENjxSQGU5rN3WXkg9iLWdqKPtXGlS88h0uL5E6GWT3ksi20+87mXqo9us9+1iOvhFcs8j2hG9DUv2zh4dMd2c3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT7oH61d3XgyUsVhxXdQMWBrBOAekfkBJZ7bVhpqCwg=;
 b=RIzBbQJahnc0kni4vqRazENjqNlGGs9yNgrnnvu51Ka7UzN1C5+r1xVt8LvVHY2QNHEFuPyEhSRk1rCJB3Z4DrYEUttbdx1juyGTz/Woihvgt1LVtSPyJ8sxSOdli7EeuCQ/ptXGZTaGNxR5q4OG5vMVVL7zAARVUvHLNdOU3GmN+qs0kN2LZc/CBTLJWE0DdmGRpQMfUJ9c/DexdDzyKl1w3AqVNcz2jCMH6ZpfAGYqP3MUyj8LZKxME66M7bleLTT4smHDlfIL3M6NF5FNhNqB1dQg3qDeP2S0XWxDj/Yf6kcEt+8C7pod3Z/Bu8uGdWgK5K3OdaqR11VM7IT5Sw==
Received: from BL0PR01CA0036.prod.exchangelabs.com (2603:10b6:208:71::49) by
 DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.29; Tue, 29 Apr 2025 06:00:09 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:208:71:cafe::16) by BL0PR01CA0036.outlook.office365.com
 (2603:10b6:208:71::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 05:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 06:00:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 22:59:49 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 22:59:48 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 28 Apr 2025 22:59:48 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2 08/11] ASoC: tegra: AMX: Add Tegra264 support
Date: Tue, 29 Apr 2025 05:59:38 +0000
Message-ID: <20250429055941.901511-9-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fcc99c-0cab-49c1-eff7-08dd86e31961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7XO5poxIlVXUm6Z/VK4tlJy2IhZVzV0xfkGCTD2ZWaFOEW7Wip84ED6qC2w5?=
 =?us-ascii?Q?rAaEiKF+nvJPrUMBKc3H9rVxj7EGK4/8JC7bKgyhfRaTC1WqZlkK3/HJjxj9?=
 =?us-ascii?Q?3X0vES8BTHqZCb4Yj6Z3PPctlmTlYDB4T/R6asXbYzuys+lsJcmz5i0fk3Bp?=
 =?us-ascii?Q?5DMR/99Klm35qP4XbJyyexlGXJAyzDZBlk2TQNOaeOklLQgZPcyN0df7oqWy?=
 =?us-ascii?Q?nEQfM78DliFZ+CzJFthtn94hgilh6DDrx6VGS2GsIub60w/6cMz5Dz84GNdS?=
 =?us-ascii?Q?SmUoDf1Oe89HFijLVWbZTcHSdPnte9M8GdlcamzAevJwVUxURtkiq+bZ9E13?=
 =?us-ascii?Q?9tzZ3SSfuE42varMOF3B9oqWtBKtJW1nMrzQf+DMBaIkQZA2d3quBxS0x9WR?=
 =?us-ascii?Q?ykhVoJwqmFsQxrhUaQr82q4anLGRqdYc53DdwLzmD22YJncb4sQUSAlc8TOS?=
 =?us-ascii?Q?jObwJHisNNkGprlOhpHLwKYB/GZ76AQv4meR+h1vmdkRi8y8n9K4z7v3eWSo?=
 =?us-ascii?Q?3ucRfbLwfhaAxf6lU+LUc3DZuUrPRxA5getT2ixe8w0/lNPTUogejA26lqR7?=
 =?us-ascii?Q?iBeaXI/Y6cfBXtRpvfKLC8yP+IuS0Oe+DUnGAsL21a/93Wg4NBD1pMZAHL8H?=
 =?us-ascii?Q?IWOVp0I2lfmjvxsMfRlKq7rWWmT9XDtbcoqi5UgVX5pYtNm/V8H9sFaJedTu?=
 =?us-ascii?Q?wqVljiw3yILQf8NB1rE6G7M3i8l3A/NWLcEYHQKQvPGj/ppz6+K9IgK2LC4E?=
 =?us-ascii?Q?e6I90eYKfF1B5fIvXkVTJkvNoD9gLD+UkNBCEjuJS28DTirPoggrut11/GMK?=
 =?us-ascii?Q?hSZqx94N79nwG3rs9tQxFrDfe0oV1Uag7aZila9NwTNplhHf7fBEuoqIWh2k?=
 =?us-ascii?Q?GTlpIfCpmt94nZ5AAKu/8KgR0pCsyQvll73nA5vOFPhPJ2iZVV9fz7NP0UXA?=
 =?us-ascii?Q?ZUmyRQQ4d5In7G39FRGWqsmy0mzDJbk/pQqd51U9cv/Uqpv9xAjRqTjzwSR2?=
 =?us-ascii?Q?tAJhAZ6P1JuussKmZC1qdoVTlf7qBy1Quzft9xWjxYhXplufK+sOQpJORf2d?=
 =?us-ascii?Q?hbZEPgJQelvxHVtWNtAOFffJMPThYox1ifOh5M+l7k71WJfiSlwN3RthgU0/?=
 =?us-ascii?Q?pN8YfgREsXgFXt7Oly2i3WGlRliafdcSlQQFh93wXMk2d64ucEW1E5ZZDren?=
 =?us-ascii?Q?cbEem4HVLmYzkEtHZYLkgJR7/9rFM8MhhxD3hz8CwkoRHAG5OfjbdjX1eBnO?=
 =?us-ascii?Q?YfBHU+1xUnwCYfLdOVgFn6FuX1p7B2/ujENu6yn7WbcZFSgTHHLiLlsrRLRd?=
 =?us-ascii?Q?SAEihTCe2x/tIixKzAeQXbVED9hpLFfQF+rwFPLSMAhPdaqg0JPb9IQeVX0L?=
 =?us-ascii?Q?jZ/l0rVKhtPDSshXLei3gIDck5a4wcGCg4894ngKMusHXKKBuPSwMWcaId3U?=
 =?us-ascii?Q?7NJ3AdomOBjB5k0i7fVdahOM6Y/maIHHEDVrK1mnimKPf6zUIaG8sP5BhZo6?=
 =?us-ascii?Q?WZLc8M2nIGDpl8NHjq0GyN++4cTNpgGdGgF5?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:00:09.5641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fcc99c-0cab-49c1-eff7-08dd86e31961
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748

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

