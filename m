Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791161;
	b=3bKNHjI3EWir5h3RJq76HCCviyjvJvuB+Ny4cW/vGo3K0/HsxxxObA6k09BXsvfJOsJ3
	 LxorlTr04BrcW+mz+7azIPPIqka+zawe+jsOXb5v3OX0FxzVGtmzBHxlMlBkY00fgZfTV
	 U5G+vBKQTAeFdR0zCCRy7qEqKQBH0L2+6O7iErYUx/HHVsCSqjMu5KbC7L+gWdB/ZHrL6
	 qfbnagesdFqTCiFKaPgswwR3dOB0BpcDwyhJf8ZUJ7bZ5GqrRP1hnq6pKJ5lRWAQgQeGS
	 +PBPtU9lxpkCi6MDIPYh330ZMLtm6JcDBeK5Yd1zIaqBizF6sfHgS+wxtGyG+w1M8Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791161;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VOPIN8tamrwTvSz0Ap9djTca1XQm+hhjWuTOfTFUAcQ=;
	b=Z0fdtiy5rbr1db5vH1N5zp7YPPdom5pWnRwDlE/EDLOegzvwEr2d3MquVIuJ6a6R7gmS
	 aSR/Dffy+Qr/YBcDgio84E9kjYni7O6H4Ar8VBwtrrSBVFm/39C5GGPRdlbI5ll4FHIo/
	 EPhyoKkAQWdrMBZ6jsaVDb7gf+f6GGb1UyQKdOIUo5ezkv5EN+5+vYIhCQYodHKp7sony
	 j60rF80dFaF98nTwcFYyFyk003lbI2Ivx9BlT7+P28S8Kg1aZRfrJxguYQ0gM+l1TI2J3
	 VVsxGZpCOaGp/bwoAX3VjaBT1469Sahr1N3QSnyn20rxCVO6oSQWnhP+glEiEVPFDTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KfhkrTYG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.67
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9A5606A337;
	Wed,  4 Nov 2026 11:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC9A5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KfhkrTYG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObxcYleGrqFQj+CdPQRX5jmMcgQAzhCeLNZ/SBmvfOsbHA8z7C7BrllXaQ62XCdGjuB3PvHBRE0q1Zwd6VKnR+SNOgagk329tQ/+oUC44TSaHDwBtSnJmCF/GDbyF6kjquo0hwBQaMouBjXoe79t1L9Oy8rYO/TMNZjK7EiZEK5z5wqxFd+XsS28WBA8TBHxcIruTR+KthoO1VFn0k/8+XhG6TpB/hxNd3t/t1XK7ElHhYfC0YEWw1nVcPPytwMsvRZhg6l+oSvnrrFlxPLsA7JqV2+BX0+ei0GkN0G34xUiP0md0d+bdam1Nmb2TtoUiDP/Mis4bBDDmjUiE077/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOPIN8tamrwTvSz0Ap9djTca1XQm+hhjWuTOfTFUAcQ=;
 b=NkZlst+D+H1TOV8luhMQUhlhCJU8vHW/wK6ovBIB5RNRgw6usSlo//2+XarWyhqg/BvBdAV5eianDdcS4FauLmjSVYzv1GJFCmlz0cUBhRYjLYxVw2UmH3ZiGFuHuoNBxaVmZWi0pjyqTL5NNBpyOEfSAIwU5tRBkoum22GxpFBon7l7eigdw+FrbbKYwk1hI4nTLfvPVBRaXlemjEG3zG0VA+gB0sSqdk6nB0fOBgl3KnzIjrRvko/9oQO4ctMdwx3l3i0tefmJdyWighj5ydHCtT7yL7sJ+V5K0oYm0GmjVpYOHz6ASm6n8kcBZxw3S8+c5OUP7/gS/auCMq7X/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOPIN8tamrwTvSz0Ap9djTca1XQm+hhjWuTOfTFUAcQ=;
 b=KfhkrTYGIT0fWh8mW8a4fAm60bOYFJDc1mccxbi8wCuTHu4Rx6gQ2mkMkz0eZL7yEzuhZkFFHW5d5Ky4F1UibhjcXSF7c7HX6L4ttcZBfoVBogerN3J/M3j8ydKsgDfbhnVH1F8dhC4Wbl7xDLTtORJ7koHOjCudeyUraHlr1Zlc4yDbG5jwgD45QCVMI7G+G7TVuW7IESmcrS9as7wauapJoW+gT0yRa0rfa4aiv2Nxnh0vhsBaWb0VzrJn3sBHkV3sJYOsAkatQRPaQdVacsmFoAXCNnsYAHmEHUTKnr+UxYseK6RlW83pb3Ci+EfuBNfdxhuD9lgOJxAExtP/1w==
Received: from BN9PR03CA0318.namprd03.prod.outlook.com (2603:10b6:408:112::23)
 by SA1PR12MB6869.namprd12.prod.outlook.com (2603:10b6:806:25d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 11:19:14 +0000
Received: from BN5PEPF0004698A.namprd02.prod.outlook.com
 (2603:10b6:408:112:cafe::3d) by BN9PR03CA0318.outlook.office365.com
 (2603:10b6:408:112::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:19:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN5PEPF0004698A.mail.protection.outlook.com (10.167.245.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:19:14 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:19:00 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:19:00 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 03:18:59 -0800
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Anupama
 Kunkulagunta" <akunkulagunt@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 2/2] ASoC: tegra: ADMAIF: Add Tegra268 support
Date: Wed, 4 Nov 2026 11:18:36 +0000
Message-ID: <20261104111836.1100527-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104111836.1100527-1-sheetal@nvidia.com>
References: <20261104111836.1100527-1-sheetal@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698A:EE_|SA1PR12MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: b890e3a9-988c-4f9a-ed0f-08df3a657545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|10067099003|261022105027099003|261021121427099003|261022075727099003|261009223027099003|11063799006|261028144727099003|261026140227099003|56012099006|18002099003|22082099003|261102123227099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	j0IPKaE/nvLf0L0qpd3/ZLSPganxSC4oLLGGZkNunKxiXA+ocS72jO0x7OYPXAY0AmDNVx+O5iGVQAqW/pXKCyWnikO90LlCR/WZBJUb6T158eknBz4NFBXV7Yk/OstXVkXCKJhkdErvgoCxEAoi5BcmzzAWpsLMzjoovVFENF8RNNyW0aZlJNT2jW9a9rV0W0tO2PyJSvQ21ytU0tlXKX/nAs4v2X3iPYbMo9jCc7O73Cd3Kno8JHB6U7TMITutv0+4tTTM5fY2wSs0BxeyI2MZWajl6FIuihdLEDp9fTdeD6PtFyma0z3K1gBjc9Pw29KgtlP8ElG2TGA0Tc/Xh/N5aFH56D7cG6/ULUW+4yNR9X7/rLKe3CEC2H2fqtayAZv6onNRVnXFrC/4FGnlYXzZtH404ywHD8cp8+ORkPvirE07gNiP5sFJZZz617DFJirXDlOk2Vpz/M2QK97XwiYFomXByxlP+2cijEXSZxwkQsGdc69Zr5ft7zmeNIRWZn38Q2MRoXYsDKKv+PtjBGM/fZuRGqYIW3zUh5gGZ8wyqMyKManzn5p+6GjzTgSmP4ghMRXvWP+2tpaQEtuooX+uxYprm+rPvSHLyU4IAKPbJzfDA3ESnon0bbfQcQClwBMeFvIhvgactAs7nza93T3tUaHkDweJC+UZ9GbpC1U+5QZDFxWlslOMxirL3hoE
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(10067099003)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(11063799006)(261028144727099003)(261026140227099003)(56012099006)(18002099003)(22082099003)(261102123227099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UjdwVCvrzmMddvoZ1dtmXCUPte/1NMbSCoZoFTFUpG1P16eZkeZHv5SlVfzFmA4o0R0llq+X253GmM9IxTw2vDSpH/X9rP7VyocIaTNxTZqq/LUltEqVRJIdzfW9GgBZEBonsmOaQNHeo1UZFaVvt8Mf2eSaeBScUEHkcBGg8d5EyYcj89GFVWhdX7kB8pfnvvWqsyNQy64CVMf4Bs3fiNOis36+wwCRDKDBJQPaHs4slVUBojW8RGUSrieNK47GavXtjxEb+uKhDAPzg5l27g+zg3C7nO/QpuwiJeH4qbz6CsddOP2XV0I6mafVrNPifFdkzGZHP8Df9XDFz0zkeB+5ysyRw4rMtdENLZ2UQPeCu5CR6jrpPOjxzpTD83YK4ahPYU7addFTjvfi/gKfe+HwjHu0JX7wu9PpKs9f1zBnMziHUedCmIVdapYXq9od
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:19:14.1811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b890e3a9-988c-4f9a-ed0f-08df3a657545
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6869

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

Tegra268 reuses the Tegra264 ADMAIF register layout but provides only
five RX and five TX interfaces. Add the compatible and SoC data for
this configuration.

Add register defaults and five-entry DAI and control tables. Retain
the Tegra264 32-channel per-stream limit and use Tegra268 FIFO defaults.

Set the register bound one stride past the final global TX enable
status register so the access callbacks mark it readable and volatile.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_admaif.c | 66 +++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h | 20 ++++++++++
 2 files changed, 86 insertions(+)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 87e898cc35e4..72a245ced209 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -184,6 +184,20 @@ static const struct reg_default tegra264_admaif_reg_defaults[] = {
 	{(TEGRA_ADMAIF_GLOBAL_CG_0 + TEGRA264_ADMAIF_GLOBAL_BASE), 0x00000003}
 };
 
+static const struct reg_default tegra268_admaif_reg_defaults[] = {
+	ADMAIF_RX_REG_DEFAULTS(1, TEGRA268),
+	ADMAIF_RX_REG_DEFAULTS(2, TEGRA268),
+	ADMAIF_RX_REG_DEFAULTS(3, TEGRA268),
+	ADMAIF_RX_REG_DEFAULTS(4, TEGRA268),
+	ADMAIF_RX_REG_DEFAULTS(5, TEGRA268),
+	ADMAIF_TX_REG_DEFAULTS(1, TEGRA268),
+	ADMAIF_TX_REG_DEFAULTS(2, TEGRA268),
+	ADMAIF_TX_REG_DEFAULTS(3, TEGRA268),
+	ADMAIF_TX_REG_DEFAULTS(4, TEGRA268),
+	ADMAIF_TX_REG_DEFAULTS(5, TEGRA268),
+	{(TEGRA_ADMAIF_GLOBAL_CG_0 + TEGRA268_ADMAIF_GLOBAL_BASE), 0x00000003}
+};
+
 static bool tegra_admaif_wr_reg(struct device *dev, unsigned int reg)
 {
 	struct tegra_admaif *admaif = dev_get_drvdata(dev);
@@ -342,6 +356,20 @@ static const struct regmap_config tegra264_admaif_regmap_config = {
 	.cache_type		= REGCACHE_FLAT,
 };
 
+static const struct regmap_config tegra268_admaif_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA268_ADMAIF_LAST_REG,
+	.writeable_reg		= tegra_admaif_wr_reg,
+	.readable_reg		= tegra_admaif_rd_reg,
+	.volatile_reg		= tegra_admaif_volatile_reg,
+	.reg_defaults		= tegra268_admaif_reg_defaults,
+	.num_reg_defaults	= TEGRA268_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.reg_default_cb		= regmap_default_zero_cb,
+	.cache_type		= REGCACHE_FLAT,
+};
+
 static int tegra_admaif_runtime_suspend(struct device *dev)
 {
 	struct tegra_admaif *admaif = dev_get_drvdata(dev);
@@ -796,6 +824,14 @@ static struct snd_soc_dai_driver tegra264_admaif_cmpnt_dais[] = {
 	DAI("ADMAIF32", TEGRA264_ADMAIF_MAX_CHANNEL),
 };
 
+static struct snd_soc_dai_driver tegra268_admaif_cmpnt_dais[] = {
+	DAI("ADMAIF1", TEGRA268_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF2", TEGRA268_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF3", TEGRA268_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF4", TEGRA268_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF5", TEGRA268_ADMAIF_MAX_CHANNEL),
+};
+
 static const char * const tegra_admaif_stereo_conv_text[] = {
 	"CH0", "CH1", "AVG",
 };
@@ -908,6 +944,14 @@ static struct snd_kcontrol_new tegra264_admaif_controls[] = {
 	TEGRA_ADMAIF_CIF_CTRL(32),
 };
 
+static struct snd_kcontrol_new tegra268_admaif_controls[] = {
+	TEGRA_ADMAIF_CIF_CTRL(1),
+	TEGRA_ADMAIF_CIF_CTRL(2),
+	TEGRA_ADMAIF_CIF_CTRL(3),
+	TEGRA_ADMAIF_CIF_CTRL(4),
+	TEGRA_ADMAIF_CIF_CTRL(5),
+};
+
 static const struct snd_soc_component_driver tegra210_admaif_cmpnt = {
 	.controls		= tegra210_admaif_controls,
 	.num_controls		= ARRAY_SIZE(tegra210_admaif_controls),
@@ -938,6 +982,16 @@ static const struct snd_soc_component_driver tegra264_admaif_cmpnt = {
 	.pointer		= tegra_pcm_pointer,
 };
 
+static const struct snd_soc_component_driver tegra268_admaif_cmpnt = {
+	.controls		= tegra268_admaif_controls,
+	.num_controls		= ARRAY_SIZE(tegra268_admaif_controls),
+	.pcm_new		= tegra_pcm_new,
+	.open			= tegra_pcm_open,
+	.close			= tegra_pcm_close,
+	.hw_params		= tegra_pcm_hw_params,
+	.pointer		= tegra_pcm_pointer,
+};
+
 static const struct tegra_admaif_soc_data soc_data_tegra210 = {
 	.num_ch		= TEGRA210_ADMAIF_CHANNEL_COUNT,
 	.max_stream_ch	= TEGRA210_ADMAIF_MAX_CHANNEL,
@@ -971,10 +1025,22 @@ static const struct tegra_admaif_soc_data soc_data_tegra264 = {
 	.rx_base	= TEGRA264_ADMAIF_RX_BASE,
 };
 
+static const struct tegra_admaif_soc_data soc_data_tegra268 = {
+	.num_ch		= TEGRA268_ADMAIF_CHANNEL_COUNT,
+	.max_stream_ch	= TEGRA268_ADMAIF_MAX_CHANNEL,
+	.cmpnt		= &tegra268_admaif_cmpnt,
+	.dais		= tegra268_admaif_cmpnt_dais,
+	.regmap_conf	= &tegra268_admaif_regmap_config,
+	.global_base	= TEGRA268_ADMAIF_GLOBAL_BASE,
+	.tx_base	= TEGRA268_ADMAIF_TX_BASE,
+	.rx_base	= TEGRA268_ADMAIF_RX_BASE,
+};
+
 static const struct of_device_id tegra_admaif_of_match[] = {
 	{ .compatible = "nvidia,tegra210-admaif", .data = &soc_data_tegra210 },
 	{ .compatible = "nvidia,tegra186-admaif", .data = &soc_data_tegra186 },
 	{ .compatible = "nvidia,tegra264-admaif", .data = &soc_data_tegra264 },
+	{ .compatible = "nvidia,tegra268-admaif", .data = &soc_data_tegra268 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_admaif_of_match);
diff --git a/sound/soc/tegra/tegra210_admaif.h b/sound/soc/tegra/tegra210_admaif.h
index fd9877aa95d3..4a7fff91f8bb 100644
--- a/sound/soc/tegra/tegra210_admaif.h
+++ b/sound/soc/tegra/tegra210_admaif.h
@@ -31,6 +31,14 @@
 #define TEGRA264_ADMAIF_TX_BASE				0x1000
 #define TEGRA264_ADMAIF_GLOBAL_BASE			0x2000
 #define TEGRA264_ADMAIF_MAX_CHANNEL			32
+/* Tegra268 specific */
+#define TEGRA268_ADMAIF_CHANNEL_COUNT			5
+#define TEGRA268_ADMAIF_RX_BASE				TEGRA264_ADMAIF_RX_BASE
+#define TEGRA268_ADMAIF_TX_BASE				TEGRA264_ADMAIF_TX_BASE
+#define TEGRA268_ADMAIF_GLOBAL_BASE			TEGRA264_ADMAIF_GLOBAL_BASE
+#define TEGRA268_ADMAIF_LAST_REG			(TEGRA268_ADMAIF_GLOBAL_BASE + \
+							 TEGRA_ADMAIF_GLOBAL_TX_ENABLE_STATUS + 4)
+#define TEGRA268_ADMAIF_MAX_CHANNEL			TEGRA264_ADMAIF_MAX_CHANNEL
 /* Global registers */
 #define TEGRA_ADMAIF_GLOBAL_ENABLE			0x0
 #define TEGRA_ADMAIF_GLOBAL_CG_0			0x8
@@ -204,6 +212,18 @@
 #define TEGRA264_ADMAIF_TX30_FIFO_CTRL_REG_DEFAULT	0x01800257
 #define TEGRA264_ADMAIF_TX31_FIFO_CTRL_REG_DEFAULT	0x0180025a
 #define TEGRA264_ADMAIF_TX32_FIFO_CTRL_REG_DEFAULT	0x0180025d
+/* Default values - Tegra268 */
+#define TEGRA268_ADMAIF_CIF_REG_DEFAULT			0x00003f00
+#define TEGRA268_ADMAIF_RX1_FIFO_CTRL_REG_DEFAULT	0x00000500
+#define TEGRA268_ADMAIF_RX2_FIFO_CTRL_REG_DEFAULT	0x00000507
+#define TEGRA268_ADMAIF_RX3_FIFO_CTRL_REG_DEFAULT	0x0000050e
+#define TEGRA268_ADMAIF_RX4_FIFO_CTRL_REG_DEFAULT	0x00000514
+#define TEGRA268_ADMAIF_RX5_FIFO_CTRL_REG_DEFAULT	0x0000051a
+#define TEGRA268_ADMAIF_TX1_FIFO_CTRL_REG_DEFAULT	0x03000500
+#define TEGRA268_ADMAIF_TX2_FIFO_CTRL_REG_DEFAULT	0x03000507
+#define TEGRA268_ADMAIF_TX3_FIFO_CTRL_REG_DEFAULT	0x0300050e
+#define TEGRA268_ADMAIF_TX4_FIFO_CTRL_REG_DEFAULT	0x03000514
+#define TEGRA268_ADMAIF_TX5_FIFO_CTRL_REG_DEFAULT	0x0300051a
 
 enum {
 	DATA_8BIT,
-- 
2.43.0

