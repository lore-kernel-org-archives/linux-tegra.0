Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31624275872;
	Tue, 29 Apr 2025 06:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906418; cv=fail; b=XWsVRTD8zHPokDvof+Y+wCkd3Ve7JLSnogfSzFwdU0xixbYaYyLrVoXo2MmZ5zVqZOaJl8M90iHB2SU4wO4EMFep/TuMX2rtXbj0u1HgwLg+QPMeDiW/BeT74jfGKnVfM/yfC/o+IsPmCT4OSaNClVafu4V/mJiIWkadQKsucmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906418; c=relaxed/simple;
	bh=BoPOEX+eyM8nqqH1nqhYnuVWeVUkcZKVLEeODj4j834=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l5QoMvV3zymU1Gr1zheKeoKe6tJBxi+h4b3CBFROUf0EPd/+YimCG8Z19iHvWl6+ij9GNuxnlAtsdBwcEwySKDaSgWCR8tcsIJatIE0VHnssTcb5xgUU8h3g3oQ0pQAKqv9eI+ngnuqn+MURBwV233cjIF+WiXAWJ1tTqInyldc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CwpqArlo; arc=fail smtp.client-ip=40.107.94.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CwpqArlo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Df2srrymKpTEloo6fh4mR+m0YH4Oqpj5gGUjTne+n5qW8StClj9yEjeYeXK0GbxHCnBfUbHeAPGB1thUSU6N0yF09p4RYXr4F0onLFcXf44l9Zt/qnE7UcY4gDdAYTLGnAVKyiGiTu2gcG3fEILVhKixL2tyeIy+hlu7271pryf95Ru3/SS7V9CwFowlGxF8dlYhW/T/eiLUcmRxZb0qDWhfjn6piGQUWO7GdRcoxk2/SZh8A7atkjqQKAf/SHP7gE4BbUwZ1hQv8x5NEMQHHSIHpbF60cyjX0uHiyOjP7FldTR9llpBolYBxmJ9dv4Wp4OJevttMhiyZsk13QQ5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/7F0cWDhB54l1CzAdeVWEOUrs+FerncsvyRMsBf4Gc=;
 b=RYaiyrxbsXonNdvRAORv8sxrwLOzYXUyHyR6pQqxqjpygVqVMX0UVDy5AXJmrptdDQr17osIRAzDcqFOFeKZae30LxPMOWbMAztaupNq2BVNR7vuFiEANbozarKbxpfp68yqg56oSecofuJalK3mGgfyVBF2LXChO+fwGZO/w02cBURW48GEcQ/pH5OOffbj0G7eF0pDLUu3R5cgzdshZ5ganhxygiI3JddDfuXQpJE0IaR/r9JtjHFwLfIEujKngDk4usyfPJKYopfa7EV2xekhuNo1oHnpDTuah8vzGeQT07dLTS72aOtOPraeafzKnJePgdshvv4XWE2FcTLMQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/7F0cWDhB54l1CzAdeVWEOUrs+FerncsvyRMsBf4Gc=;
 b=CwpqArloCCE20vul4+Pp4Bf0aMODrDYUV6Vkqqv4TevJj6GrhL73GR62Ce869RFXTVhNGLo3MXBVUoRQ5gCxrZzmVcENEib8xJuwCUuuaUbo0XMCPYtG72b8WWYcZ+9wXQWWOSET08RsSeVC9+JQY9CCVPGUsuRiAA3D1FNzvp5FU7avy4IpMtbuACozuywp2UvbtaKPBn0u5zzb9B6mXLT7qZNzoYrJlhlqwj4lrQcjDzfLlmYb8UnAbibh/t0Ajoplqy+BbrRcSokNypDz+1YS22QeovGEdbOOvdRNW8FNuzLKPySCDfrdJnG3bVZMqaPiYGbK/p/pobfRshFscA==
Received: from BN9PR03CA0393.namprd03.prod.outlook.com (2603:10b6:408:111::8)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 06:00:10 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:111:cafe::ad) by BN9PR03CA0393.outlook.office365.com
 (2603:10b6:408:111::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 06:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 06:00:09 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 22:59:49 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 22:59:49 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 28 Apr 2025 22:59:49 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2 09/11] ASoC: tegra: ADX: Add Tegra264 support
Date: Tue, 29 Apr 2025 05:59:39 +0000
Message-ID: <20250429055941.901511-10-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d94ab58-c3e5-43ff-ec3d-08dd86e3195d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fGkGiOrs5GOq7bDXi3sFnSwvKXY6jTD0txBcRguujOR0OSOCAWNRit5D7aHK?=
 =?us-ascii?Q?++ShaVekhbnFxZZ2dsPjNEIUPG2/ge3hzLEwpMbl3LnDrzWo0sCCo1L+/3SA?=
 =?us-ascii?Q?XSNSY/GOL0ACd4R9ynVIBAM0sZbe3KjW4m87kTYg+A0GXxy+cInEipJACA5q?=
 =?us-ascii?Q?xTnqOhTpzvfDwa9eoBqgWrMyqH9/gqRmsUgetHHl2ColLr5PPga/HrGVER+l?=
 =?us-ascii?Q?cDnb0x9KrHUSthtzuT3gEuYR30ZWhqG6aLzitypl4Es9W2LI+e7w9bVCwTal?=
 =?us-ascii?Q?PwqdW9p4DBvlZygLtkVezq5csJ4BWfd+Vi/wk0XaltOAGGn1dUrgpmagHDj6?=
 =?us-ascii?Q?sD3keBjLRsWb7/GXkUqPMt527WyPxK4HydyKE7dSTjJLgI/x9hcn5sQoFG/G?=
 =?us-ascii?Q?ic/pr2wxkwfduBm7FUdzl60fcDMuSq/th615pzpLa0nsFyA82Fs7hFkA8Fh0?=
 =?us-ascii?Q?Y4VNEfXzMoxsl5YYnys8zfFq3xtUQJZ1MfmoGpvGQ5w+9sV9LBXFCDf0QdCy?=
 =?us-ascii?Q?lu9yUiZ73VKA4mRgJi8R83i1PYiTilPPNzbq7Ae8wTuPndENzzJv5/qOV8Ot?=
 =?us-ascii?Q?wTJH6zsxk2XhR2UOB47SEcKGpS0zH6vfBg/jnJ16m1+PUd9iRBzUIHJvJ1vH?=
 =?us-ascii?Q?o96FwOjh7zaxUgmI2Esgi9p0cFZ8ZFYbU/5zfmkNigCJE93WYHH0Vu+eakmz?=
 =?us-ascii?Q?G4sJUhBwwB0CRpv57u7hEeUPb15mRwRTMUpy1zkjXkcNcRd62DTq350JevBL?=
 =?us-ascii?Q?oWEPBb7ksuyFH6TQXoQr2zrGTOCl5Nd6INT9QvG4WFmL8I0YEdiQ8xP0pBI5?=
 =?us-ascii?Q?F0bPjCvjVNQoBDsIOmg2DTG48LdpXVrcY/fH/mD7BYa3pJtP3//nNClKAdYK?=
 =?us-ascii?Q?ozRTbNy/SthY5eL0eA2e9tdE/myY8Ph5ZBjkYqqGZDoXrxNv+hhrts68mPBr?=
 =?us-ascii?Q?KmSN64EiS9qhTKgXFjrpe2MpITwUYm2IQm5G+pyToenbdALj5BUDGeiuVLUK?=
 =?us-ascii?Q?LWW/nfuhnuxq4vfqZg1NXWhDho/7J8CYMXjZegwhY3bK4igy4bRuMNYcAAW3?=
 =?us-ascii?Q?EBYMte59sOgetLkPZ7seiuzzZ3kLcO0T2xTIl3x0ACznmhPClVhGOECvok4B?=
 =?us-ascii?Q?0FVrIWUnLKscz2itVDo8aBaXCr+Ny5RcaST8Kxsh2nrsD5r1cWgghnhYYxPR?=
 =?us-ascii?Q?3slF7MOBhQdfLzxXOaDZF4k8wMiZYQ8fRmMgDrC4jsSJ5y4rcyTLc5IxDrd/?=
 =?us-ascii?Q?oCXsWM1rI7DkFzHAWWxqG51mcSPUmIAeT+Kzfvrrp9Wx2PqTmK0Ke7KkteO4?=
 =?us-ascii?Q?q8K2WykD6lODtzki16AvvXpG+4EqnUuRxNOCE071IB2DR/TyhDWlIhh1S94h?=
 =?us-ascii?Q?4u2gE5NAHK+e0QWlQezi3XmrfN5gNybutzPfxSuQBYfxcKFbkgpBKRQJq4ht?=
 =?us-ascii?Q?/PbZmxUcZLEqYB0mX968k0lISlmoecUl7QS11Xvj2DMvghmGmsPT75L5BNvm?=
 =?us-ascii?Q?22I0iJzPbX8SdgYpcjpa+IJRMj1jcgJ4F0D6?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:00:09.5775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d94ab58-c3e5-43ff-ec3d-08dd86e3195d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

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

