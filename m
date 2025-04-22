Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EEC20B7EA;
	Tue, 22 Apr 2025 09:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314723; cv=fail; b=GKT3+kxHymOsc7Sw0eudKSuOfYPpKvdyYL6m+rK7yhodP5kPW+xIfEW3RrXr8Rv1ZV1JCEFC+rxqY81D3BW8ve4ogezY0vH1tGmfpod6GNe32AOYk9GMdfsvgLY13UAZDRfNvKq4EqzxesuBwm+Rfliwhh+0LyUT4YyhKCYfmgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314723; c=relaxed/simple;
	bh=BoPOEX+eyM8nqqH1nqhYnuVWeVUkcZKVLEeODj4j834=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fr+z+/QUxUKd4vFzepRIJhCrNKQUDIE4zuuQ5pFqLQDW39ka9It6XO+hdAsFczduepNUj01ofMa0EzuXJP6CnF/nI079mE58q6X6fozcDG0A/DIlZ4v9K+nGWnRV8GQ3IDchcIZAkJMf9DCfK3yytGQd81+A5qZrn0XOUpoOjfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QcJqT85d; arc=fail smtp.client-ip=40.107.237.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QcJqT85d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuZF5jKzlgZKtO+WlccdHy5TF9wQOTMX4BN/ytct/9x60Tjb5YROac9VHevaEmD43WCq3NDF/CX24J0ggKrGhqpYA1Pd6rKm2oLse4BX/pc+Dr2nIcXjtfLsODhb7sLTokAmvrvomPqG2mzX2aUAgR6x8Hx2F5X85ImrWNVXWwItg70QIfBVUdc0ntzJeW8uPG0Ua6FMghjF4coolFHkqXGQqHR6lmHdhn297flf1pnQgtvAAePZeuiZMpavzHadE6VJh+esL1PsapAlWUynsQuuco2uM+CwG8CxzqRf2NN+Ipv0Qs8HuRAx3I8KjNSJMulhdGbaFCJAV+Bz2vD3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/7F0cWDhB54l1CzAdeVWEOUrs+FerncsvyRMsBf4Gc=;
 b=GF7lOx4H5ipGnQHG8hu6A+3Wwydy3/wqtBuLqNnMWmA7jac3JRUJy15pkAJ1TePo6o4k75fc4eF4u55TvJAHEtb5E42gNeTNvZ/+1C6t+sn4qZETRGM1gZz88qBi7HbDHMDzQVh6Q2JERxFEKkMZFmgFG1pxRrGlwOaNxpdifEzidztIft+fFg8twa/ndvujJnbVcjQNiXMaFNR2A+O9SbSaEo8UxivwFqAb3NnMsAqgbghDcsaxToBaWgc3ETJVGrHr+82ytkFhb1japuMZlGSR19ehPo+6tMCPlSuhsegEmfEeIT5qowhWVDCFOsyoeAxFNuihq/dIb0URiZzzDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/7F0cWDhB54l1CzAdeVWEOUrs+FerncsvyRMsBf4Gc=;
 b=QcJqT85dHJExKZlggzmGOvnHWYXEbbcW560xUtbTfViWOeImv+o4g2ElxzSoB7WrVMDt5GDeEC1zOZOFd/uo6FosvcV+otpO4Ed9neEtlgSjo4nAtRvYgyTWXwkCK24af43Lx/y5cqJMGsBrm4KGHIZyS8+EBVE8D4vL+1dFU9SudVNDXmcoG55rltWpy7JGeutkyPxb5vUZPKofrTZs0fpiqmoU799kgqsIYclN53lKb3TjiGXiO6sQzvYqNK4Rh8FUbs0kZ2yR7NQgmt1Q2X9mebKMtDQ6fGl212enTcvmliVlQo4b3oyxhnxO/0eQp0bVwEgz3/oGprUj+7Q+bw==
Received: from BL1PR13CA0358.namprd13.prod.outlook.com (2603:10b6:208:2c6::33)
 by MN2PR12MB4288.namprd12.prod.outlook.com (2603:10b6:208:1d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 09:38:37 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::86) by BL1PR13CA0358.outlook.office365.com
 (2603:10b6:208:2c6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Tue,
 22 Apr 2025 09:38:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 09:38:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 02:38:22 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 02:38:22 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 02:38:22 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [RESEND PATCH 08/10] ASoC: tegra: ADX: Add Tegra264 support
Date: Tue, 22 Apr 2025 09:38:13 +0000
Message-ID: <20250422093815.506810-9-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|MN2PR12MB4288:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc4f64d-2ebc-4fa7-498a-08dd8181754e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2tvFCXP/kLMIohLji0XuAPVMvJP0402txl0Lzbl+q3OuX2arVTBkdvqmL69X?=
 =?us-ascii?Q?Ua5fkC0U7+GBKBem0MPNbo4mDVi+Ye6FE8bc0EBk/QI+F8N5ylU+Oj7NQ5oG?=
 =?us-ascii?Q?jESdEJzNjc8fXgz7U1Bk21RB2eqIBW0RfkC8XAftZ6tT7tJYdci3rM9eNe4W?=
 =?us-ascii?Q?NeNX87eFkZWYxS90mPGa0HtpsBWLZVAJ62xhJxJY2RLNYH6IRLpPanNfVrwj?=
 =?us-ascii?Q?qsLuYvWTNtvu5lojUDlS6Hy6Drw5woKd/60HN608y+GnIy3dHa9KwDyky4Z/?=
 =?us-ascii?Q?9H4O0kTMBrbz5Dd3Qwz3V1eLZftq62vrAZHEFE9ABqN8FnyPlCsZwjLTqf2q?=
 =?us-ascii?Q?3dMgrVANggO5gH1yTDiVmsQBVNJwW1p99Kp9dK06gkYB57P3LeDUntT+wZFU?=
 =?us-ascii?Q?QJpMko3OEK0gg6B0Gzp9pOWMr4+v7e21ylCvGk4l456Se0IKP/dWwsG9CHIv?=
 =?us-ascii?Q?S8wF7sVTP9aG7KvWMaZyvQKKjUKyaurL81+VgbGzmxk/Bkv6AenrnFQT51rY?=
 =?us-ascii?Q?PPQDYPfXbCBhyMl7Bo28grlodIKN7VhBmKWW5wDnPXwZeBNeOhjI9DSJNU2f?=
 =?us-ascii?Q?yF4CAt+Uigin4ZBokHSG9QccOIDB2x+LS7B70FrF5wXkQi9oVdKDqacuQI9k?=
 =?us-ascii?Q?YCJDf7OG3sBiBs9TIS7hj+x7hUk6VflLW8Pc52lq6Y6rhUldXVwvSrGtDLcI?=
 =?us-ascii?Q?aT5lQryTCyN2rE9HPgwVzGEghphqrjqydyGF5ykAErRdaDoZyfiZQzp7JgrU?=
 =?us-ascii?Q?NS5yuvWe03YK9ioBiig11zwokla0XGPM9zMoZlXNqn8h/EPzfSiGC8oDQz0P?=
 =?us-ascii?Q?1cLRF2p1Bx4KZAHtPkSJk1d19EMh5VP/VTg1rd6rQhBfySex51a9Y/IDywXT?=
 =?us-ascii?Q?apa/QO6Nf6OLhSQ4mOdUAFTFwEnIaBPhy7Rg3G7LDuvihobcy90oFj9E/sPv?=
 =?us-ascii?Q?OuAiTPiRKwGLn3BVMJETy6nuX36B8OQcA08e1fEO7S0gjipsmYAeM0xjZ5S9?=
 =?us-ascii?Q?84WITGxFkzE6Sp+bmowa0Olu4UHK6XWYV6eMTF8ctUYzkb19c9OSb8ICvO9T?=
 =?us-ascii?Q?zxACCAqB+VimO9B2ywRKVTUByHjejgKkhh7uQPgqh//c0UuLImBLRbrQhKCB?=
 =?us-ascii?Q?2Q2EX5O0J8dFe27g8bdrw7cr5ADh7/uaVPHa5C6CDxn0W3E7Imq6NdeVlXfg?=
 =?us-ascii?Q?iLoW/SeJOPX/7AqKHToF45CtlJcpOgGI9qzC7KB95163hlmCC5ViAIZx3+uK?=
 =?us-ascii?Q?cKce2mrGJFbcLP+7NuMP+I4GutoOFCuhPHlmlzZAw6VQYoUkGkXiVCrbW10Y?=
 =?us-ascii?Q?Yms1Usin9nIrcB51hH4BY7MoDj9Qm0XYj7eiFuYUe2gxXdnnlamfR/fTeQRy?=
 =?us-ascii?Q?nHzSD2RdfSIlWcwzOGoGceIn7Xwg8LYUR2/DuzQIKaJPPXWQS77CK7DzdqDL?=
 =?us-ascii?Q?9AyOGyTyw8NQDgSN6KPw8tZUVPw0uJ9xKf+mlQ8zhpx76sxqwC2dmNyXdflL?=
 =?us-ascii?Q?D13TXXL09RTljqk4f3syRRrUj7aJxE9pueFF?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:38:37.3336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc4f64d-2ebc-4fa7-498a-08dd8181754e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4288

From: Sheetal <sheetal@nvidia.com>

Add Tegra264 ADX support with following changes:
- Add soc_data for Tegra264-specific variations
- Tegra264 ADX supports 32 input channels, hence update the playback DAI
  channels_max parameter and CIF configuration API.
- Register offsets and default values are updated to align with Tegra264.
- Add 128 byte map controls for Tegra264 to accommodate each byte per
  channel (32channels x 32bits).

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_adx.c | 229 +++++++++++++++++++++++++++++++--
 sound/soc/tegra/tegra210_adx.h |  36 +++++-
 2 files changed, 248 insertions(+), 17 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index b6c798baedea..ad7cd8655047 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -32,21 +33,37 @@ static const struct reg_default tegra210_adx_reg_defaults[] = {
 	{ TEGRA210_ADX_CFG_RAM_CTRL, 0x00004000},
 };
 
+static const struct reg_default tegra264_adx_reg_defaults[] = {
+	{ TEGRA210_ADX_RX_INT_MASK, 0x00000001},
+	{ TEGRA210_ADX_RX_CIF_CTRL, 0x00003800},
+	{ TEGRA210_ADX_TX_INT_MASK, 0x0000000f },
+	{ TEGRA210_ADX_TX1_CIF_CTRL, 0x00003800},
+	{ TEGRA210_ADX_TX2_CIF_CTRL, 0x00003800},
+	{ TEGRA210_ADX_TX3_CIF_CTRL, 0x00003800},
+	{ TEGRA210_ADX_TX4_CIF_CTRL, 0x00003800},
+	{ TEGRA210_ADX_CG, 0x1},
+	{ TEGRA264_ADX_CFG_RAM_CTRL, 0x00004000},
+};
+
 static void tegra210_adx_write_map_ram(struct tegra210_adx *adx)
 {
 	int i;
 
-	regmap_write(adx->regmap, TEGRA210_ADX_CFG_RAM_CTRL,
+	regmap_write(adx->regmap, TEGRA210_ADX_CFG_RAM_CTRL +
+			adx->soc_data->cya_offset,
 		     TEGRA210_ADX_CFG_RAM_CTRL_SEQ_ACCESS_EN |
 		     TEGRA210_ADX_CFG_RAM_CTRL_ADDR_INIT_EN |
 		     TEGRA210_ADX_CFG_RAM_CTRL_RW_WRITE);
 
-	for (i = 0; i < TEGRA210_ADX_RAM_DEPTH; i++)
-		regmap_write(adx->regmap, TEGRA210_ADX_CFG_RAM_DATA,
+	for (i = 0; i < adx->soc_data->ram_depth; i++)
+		regmap_write(adx->regmap, TEGRA210_ADX_CFG_RAM_DATA +
+				adx->soc_data->cya_offset,
 			     adx->map[i]);
 
-	regmap_write(adx->regmap, TEGRA210_ADX_IN_BYTE_EN0, adx->byte_mask[0]);
-	regmap_write(adx->regmap, TEGRA210_ADX_IN_BYTE_EN1, adx->byte_mask[1]);
+	for (i = 0; i < adx->soc_data->byte_mask_size; i++)
+		regmap_write(adx->regmap,
+			     TEGRA210_ADX_IN_BYTE_EN0 + (i * TEGRA210_ADX_AUDIOCIF_CH_STRIDE),
+			     adx->byte_mask[i]);
 }
 
 static int tegra210_adx_startup(struct snd_pcm_substream *substream,
@@ -117,7 +134,7 @@ static int tegra210_adx_set_audio_cif(struct snd_soc_dai *dai,
 
 	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
 
-	if (channels < 1 || channels > 16)
+	if (channels < 1 || channels > adx->soc_data->max_ch)
 		return -EINVAL;
 
 	switch (format) {
@@ -140,7 +157,10 @@ static int tegra210_adx_set_audio_cif(struct snd_soc_dai *dai,
 	cif_conf.audio_bits = audio_bits;
 	cif_conf.client_bits = audio_bits;
 
-	tegra_set_cif(adx->regmap, reg, &cif_conf);
+	if (adx->soc_data->max_ch == 32)
+		tegra264_set_cif(adx->regmap, reg, &cif_conf);
+	else
+		tegra_set_cif(adx->regmap, reg, &cif_conf);
 
 	return 0;
 }
@@ -169,7 +189,7 @@ static int tegra210_adx_get_byte_map(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_adx *adx = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_mixer_control *mc;
-	unsigned char *bytes_map = (unsigned char *)&adx->map;
+	unsigned char *bytes_map = (unsigned char *)adx->map;
 	int enabled;
 
 	mc = (struct soc_mixer_control *)kcontrol->private_value;
@@ -198,7 +218,7 @@ static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_adx *adx = snd_soc_component_get_drvdata(cmpnt);
-	unsigned char *bytes_map = (unsigned char *)&adx->map;
+	unsigned char *bytes_map = (unsigned char *)adx->map;
 	int value = ucontrol->value.integer.value[0];
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -402,7 +422,90 @@ static struct snd_kcontrol_new tegra210_adx_controls[] = {
 	TEGRA210_ADX_BYTE_MAP_CTRL(63),
 };
 
+static struct snd_kcontrol_new tegra264_adx_controls[] = {
+	TEGRA210_ADX_BYTE_MAP_CTRL(64),
+	TEGRA210_ADX_BYTE_MAP_CTRL(65),
+	TEGRA210_ADX_BYTE_MAP_CTRL(66),
+	TEGRA210_ADX_BYTE_MAP_CTRL(67),
+	TEGRA210_ADX_BYTE_MAP_CTRL(68),
+	TEGRA210_ADX_BYTE_MAP_CTRL(69),
+	TEGRA210_ADX_BYTE_MAP_CTRL(70),
+	TEGRA210_ADX_BYTE_MAP_CTRL(71),
+	TEGRA210_ADX_BYTE_MAP_CTRL(72),
+	TEGRA210_ADX_BYTE_MAP_CTRL(73),
+	TEGRA210_ADX_BYTE_MAP_CTRL(74),
+	TEGRA210_ADX_BYTE_MAP_CTRL(75),
+	TEGRA210_ADX_BYTE_MAP_CTRL(76),
+	TEGRA210_ADX_BYTE_MAP_CTRL(77),
+	TEGRA210_ADX_BYTE_MAP_CTRL(78),
+	TEGRA210_ADX_BYTE_MAP_CTRL(79),
+	TEGRA210_ADX_BYTE_MAP_CTRL(80),
+	TEGRA210_ADX_BYTE_MAP_CTRL(81),
+	TEGRA210_ADX_BYTE_MAP_CTRL(82),
+	TEGRA210_ADX_BYTE_MAP_CTRL(83),
+	TEGRA210_ADX_BYTE_MAP_CTRL(84),
+	TEGRA210_ADX_BYTE_MAP_CTRL(85),
+	TEGRA210_ADX_BYTE_MAP_CTRL(86),
+	TEGRA210_ADX_BYTE_MAP_CTRL(87),
+	TEGRA210_ADX_BYTE_MAP_CTRL(88),
+	TEGRA210_ADX_BYTE_MAP_CTRL(89),
+	TEGRA210_ADX_BYTE_MAP_CTRL(90),
+	TEGRA210_ADX_BYTE_MAP_CTRL(91),
+	TEGRA210_ADX_BYTE_MAP_CTRL(92),
+	TEGRA210_ADX_BYTE_MAP_CTRL(93),
+	TEGRA210_ADX_BYTE_MAP_CTRL(94),
+	TEGRA210_ADX_BYTE_MAP_CTRL(95),
+	TEGRA210_ADX_BYTE_MAP_CTRL(96),
+	TEGRA210_ADX_BYTE_MAP_CTRL(97),
+	TEGRA210_ADX_BYTE_MAP_CTRL(98),
+	TEGRA210_ADX_BYTE_MAP_CTRL(99),
+	TEGRA210_ADX_BYTE_MAP_CTRL(100),
+	TEGRA210_ADX_BYTE_MAP_CTRL(101),
+	TEGRA210_ADX_BYTE_MAP_CTRL(102),
+	TEGRA210_ADX_BYTE_MAP_CTRL(103),
+	TEGRA210_ADX_BYTE_MAP_CTRL(104),
+	TEGRA210_ADX_BYTE_MAP_CTRL(105),
+	TEGRA210_ADX_BYTE_MAP_CTRL(106),
+	TEGRA210_ADX_BYTE_MAP_CTRL(107),
+	TEGRA210_ADX_BYTE_MAP_CTRL(108),
+	TEGRA210_ADX_BYTE_MAP_CTRL(109),
+	TEGRA210_ADX_BYTE_MAP_CTRL(110),
+	TEGRA210_ADX_BYTE_MAP_CTRL(111),
+	TEGRA210_ADX_BYTE_MAP_CTRL(112),
+	TEGRA210_ADX_BYTE_MAP_CTRL(113),
+	TEGRA210_ADX_BYTE_MAP_CTRL(114),
+	TEGRA210_ADX_BYTE_MAP_CTRL(115),
+	TEGRA210_ADX_BYTE_MAP_CTRL(116),
+	TEGRA210_ADX_BYTE_MAP_CTRL(117),
+	TEGRA210_ADX_BYTE_MAP_CTRL(118),
+	TEGRA210_ADX_BYTE_MAP_CTRL(119),
+	TEGRA210_ADX_BYTE_MAP_CTRL(120),
+	TEGRA210_ADX_BYTE_MAP_CTRL(121),
+	TEGRA210_ADX_BYTE_MAP_CTRL(122),
+	TEGRA210_ADX_BYTE_MAP_CTRL(123),
+	TEGRA210_ADX_BYTE_MAP_CTRL(124),
+	TEGRA210_ADX_BYTE_MAP_CTRL(125),
+	TEGRA210_ADX_BYTE_MAP_CTRL(126),
+	TEGRA210_ADX_BYTE_MAP_CTRL(127),
+};
+
+static int tegra210_adx_component_probe(struct snd_soc_component *component)
+{
+	struct tegra210_adx *adx = snd_soc_component_get_drvdata(component);
+	int err = 0;
+
+	if (adx->soc_data->num_controls) {
+		err = snd_soc_add_component_controls(component, adx->soc_data->controls,
+						     adx->soc_data->num_controls);
+		if (err)
+			dev_err(component->dev, "can't add ADX controls, err: %d\n", err);
+	}
+
+	return err;
+}
+
 static const struct snd_soc_component_driver tegra210_adx_cmpnt = {
+	.probe			= tegra210_adx_component_probe,
 	.dapm_widgets		= tegra210_adx_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(tegra210_adx_widgets),
 	.dapm_routes		= tegra210_adx_routes,
@@ -460,6 +563,58 @@ static bool tegra210_adx_volatile_reg(struct device *dev,
 	return false;
 }
 
+static bool tegra264_adx_wr_reg(struct device *dev,
+				unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_ADX_TX_INT_MASK ... TEGRA210_ADX_TX4_CIF_CTRL:
+	case TEGRA210_ADX_RX_INT_MASK ... TEGRA210_ADX_RX_CIF_CTRL:
+	case TEGRA210_ADX_ENABLE ... TEGRA210_ADX_CG:
+	case TEGRA210_ADX_CTRL ... TEGRA264_ADX_CYA:
+	case TEGRA264_ADX_CFG_RAM_CTRL ... TEGRA264_ADX_CFG_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra264_adx_rd_reg(struct device *dev,
+				unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_ADX_RX_STATUS ... TEGRA210_ADX_RX_CIF_CTRL:
+	case TEGRA210_ADX_TX_STATUS ... TEGRA210_ADX_TX4_CIF_CTRL:
+	case TEGRA210_ADX_ENABLE ... TEGRA210_ADX_INT_STATUS:
+	case TEGRA210_ADX_CTRL ... TEGRA264_ADX_CFG_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra264_adx_volatile_reg(struct device *dev,
+				      unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_ADX_RX_STATUS:
+	case TEGRA210_ADX_RX_INT_STATUS:
+	case TEGRA210_ADX_RX_INT_SET:
+	case TEGRA210_ADX_TX_STATUS:
+	case TEGRA210_ADX_TX_INT_STATUS:
+	case TEGRA210_ADX_TX_INT_SET:
+	case TEGRA210_ADX_SOFT_RESET:
+	case TEGRA210_ADX_STATUS:
+	case TEGRA210_ADX_INT_STATUS:
+	case TEGRA264_ADX_CFG_RAM_CTRL:
+	case TEGRA264_ADX_CFG_RAM_DATA:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
 static const struct regmap_config tegra210_adx_regmap_config = {
 	.reg_bits		= 32,
 	.reg_stride		= 4,
@@ -473,8 +628,40 @@ static const struct regmap_config tegra210_adx_regmap_config = {
 	.cache_type		= REGCACHE_FLAT,
 };
 
+static const struct regmap_config tegra264_adx_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA264_ADX_CFG_RAM_DATA,
+	.writeable_reg		= tegra264_adx_wr_reg,
+	.readable_reg		= tegra264_adx_rd_reg,
+	.volatile_reg		= tegra264_adx_volatile_reg,
+	.reg_defaults		= tegra264_adx_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra264_adx_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct tegra210_adx_soc_data soc_data_tegra210 = {
+	.regmap_conf		= &tegra210_adx_regmap_config,
+	.max_ch			= TEGRA210_ADX_MAX_CHANNEL,
+	.ram_depth		= TEGRA210_ADX_RAM_DEPTH,
+	.byte_mask_size		= TEGRA210_ADX_BYTE_MASK_COUNT,
+	.cya_offset		= TEGRA210_ADX_CYA_OFFSET,
+};
+
+static const struct tegra210_adx_soc_data soc_data_tegra264 = {
+	.regmap_conf		= &tegra264_adx_regmap_config,
+	.max_ch			= TEGRA264_ADX_MAX_CHANNEL,
+	.ram_depth		= TEGRA264_ADX_RAM_DEPTH,
+	.byte_mask_size		= TEGRA264_ADX_BYTE_MASK_COUNT,
+	.cya_offset		= TEGRA264_ADX_CYA_OFFSET,
+	.controls		= tegra264_adx_controls,
+	.num_controls		= ARRAY_SIZE(tegra264_adx_controls),
+};
+
 static const struct of_device_id tegra210_adx_of_match[] = {
-	{ .compatible = "nvidia,tegra210-adx" },
+	{ .compatible = "nvidia,tegra210-adx", .data = &soc_data_tegra210 },
+	{ .compatible = "nvidia,tegra264-adx", .data = &soc_data_tegra264 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra210_adx_of_match);
@@ -483,6 +670,8 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra210_adx *adx;
+	const struct of_device_id *match;
+	struct tegra210_adx_soc_data *soc_data;
 	void __iomem *regs;
 	int err;
 
@@ -490,6 +679,10 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 	if (!adx)
 		return -ENOMEM;
 
+	match = of_match_device(tegra210_adx_of_match, dev);
+	soc_data = (struct tegra210_adx_soc_data *)match->data;
+	adx->soc_data = soc_data;
+
 	dev_set_drvdata(dev, adx);
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
@@ -497,7 +690,7 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 		return PTR_ERR(regs);
 
 	adx->regmap = devm_regmap_init_mmio(dev, regs,
-					    &tegra210_adx_regmap_config);
+					    soc_data->regmap_conf);
 	if (IS_ERR(adx->regmap)) {
 		dev_err(dev, "regmap init failed\n");
 		return PTR_ERR(adx->regmap);
@@ -505,6 +698,20 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(adx->regmap, true);
 
+	adx->map = devm_kzalloc(dev, soc_data->ram_depth * sizeof(*adx->map),
+				GFP_KERNEL);
+	if (!adx->map)
+		return -ENOMEM;
+
+	adx->byte_mask = devm_kzalloc(dev,
+				      soc_data->byte_mask_size * sizeof(*adx->byte_mask),
+				      GFP_KERNEL);
+	if (!adx->byte_mask)
+		return -ENOMEM;
+
+	tegra210_adx_dais[TEGRA_ADX_IN_DAI_ID].playback.channels_max =
+			adx->soc_data->max_ch;
+
 	err = devm_snd_soc_register_component(dev, &tegra210_adx_cmpnt,
 					      tegra210_adx_dais,
 					      ARRAY_SIZE(tegra210_adx_dais));
diff --git a/sound/soc/tegra/tegra210_adx.h b/sound/soc/tegra/tegra210_adx.h
index d7dcb6497978..176a4e40de0a 100644
--- a/sound/soc/tegra/tegra210_adx.h
+++ b/sound/soc/tegra/tegra210_adx.h
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tegra210_adx.h - Definitions for Tegra210 ADX driver
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2021-2025 NVIDIA CORPORATION. All rights reserved.
  *
- * Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
+ * tegra210_adx.h - Definitions for Tegra210 ADX driver
  *
  */
 
@@ -36,6 +35,10 @@
 #define TEGRA210_ADX_CFG_RAM_CTRL	0xb8
 #define TEGRA210_ADX_CFG_RAM_DATA	0xbc
 
+#define TEGRA264_ADX_CYA		0xb8
+#define TEGRA264_ADX_CFG_RAM_CTRL	0xc0
+#define TEGRA264_ADX_CFG_RAM_DATA	0xc4
+
 /* Fields in TEGRA210_ADX_ENABLE */
 #define TEGRA210_ADX_ENABLE_SHIFT			0
 
@@ -62,11 +65,32 @@
 #define TEGRA210_ADX_MAP_STREAM_NUMBER_SHIFT	6
 #define TEGRA210_ADX_MAP_WORD_NUMBER_SHIFT	2
 #define TEGRA210_ADX_MAP_BYTE_NUMBER_SHIFT	0
+#define TEGRA210_ADX_BYTE_MASK_COUNT		2
+#define TEGRA210_ADX_MAX_CHANNEL		16
+#define TEGRA210_ADX_CYA_OFFSET			0
+
+#define TEGRA264_ADX_RAM_DEPTH			32
+#define TEGRA264_ADX_BYTE_MASK_COUNT		4
+#define TEGRA264_ADX_MAX_CHANNEL		32
+#define TEGRA264_ADX_CYA_OFFSET			8
+
+#define TEGRA_ADX_IN_DAI_ID			4
+
+struct tegra210_adx_soc_data {
+	const struct regmap_config *regmap_conf;
+	const struct snd_kcontrol_new *controls;
+	unsigned int num_controls;
+	unsigned int max_ch;
+	unsigned int ram_depth;
+	unsigned int byte_mask_size;
+	unsigned int cya_offset;
+};
 
 struct tegra210_adx {
 	struct regmap *regmap;
-	unsigned int map[TEGRA210_ADX_RAM_DEPTH];
-	unsigned int byte_mask[2];
+	unsigned int *map;
+	unsigned int *byte_mask;
+	const struct tegra210_adx_soc_data *soc_data;
 };
 
 #endif
-- 
2.17.1

