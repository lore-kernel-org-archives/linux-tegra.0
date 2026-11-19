Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795091194;
	b=WnHO8A3Opymz9NVc20CaihHuR3f60KkmRjRW0XEWW//QE5rQtTG9FQwxaSU47UsFxzP/
	 neypdFVd8EvsTbMtiJTCmyo0R3iPzMNYQnXhtoZ9xZhgc9Li6A0yxxS3d29EqvPNtlvKQ
	 FZKhaRJ+Qj9heJfWfXtP3Uw5UQBJi6wf76BPq4loIKK87d+Z4ou8b3Azqr6j0FU6hmNxB
	 Ao7C4aWUWoJhfK/7dppMreqXedQADzzK1PsebPxzeohBycbYiCwknWu2VGtufepEJTNFZ
	 vg1cISVHZoPwYyTZpKk62QnpxPfL1nHshwC3NdjErNjVNUkbAEGHikWp6NgfrFKxikQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091194;
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
	bh=VRPGkDGFtnk0wXJRfT7kS8pwWbyTvKbbnv1594oFmZg=;
	b=oD4bXkmxLPQo6VmSIzHsr5d/MI/Vj3dhpiWR/Lg9lGj87PUTmlZ9kcvXF4MVmnT640hE
	 Xd7aq4LI/R/Z+uXtMDqnVUqLWsSKgvD/fLIvN3+ewPXpkckDaLnSWFSvVi+52Wa7OeiI9
	 vIIbqSE5IW09QIYLK7lEsEQWPDI6KsOibx3hkZjMIdDkVhPcIvpiWlp/ygy8nBLlI4cpd
	 rMx6YWYaRSdt3e795u6c0sjNswSypf+dzHW/w1/veZMU1itj55ifJbViXQAxJ1MQ5DDf/
	 ZKgx6nHyTqHaGSNBHbpGuKwAY2e/nztRtkrNkVrIL/51EerHgqWadeVfoCL4ctuD6Ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eHdpdi9Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.52
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011052.outbound.protection.outlook.com [52.101.57.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2079606A332;
	Thu, 19 Nov 2026 12:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2079606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eHdpdi9Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yedgS9LHH+bEsd5lsX+SYQHOU5jcjiGwRQyZanQUCJz7Eppqu85bB5o49Ftw4DbbCCpF0AjVkKhy0mZRnNcPyr6RFtxfwxou+3FRKm500ZlREvjQeY/arv7LWyhF7k0f6EtEks5gcdigGColLKE8mOfKUTftAjiDhpFpysuRau5vQsxrqA+ccsATLofyMKpK8AcJVSUyytpffHzrwQNSvuiiTKY/t8i7YER+RwEoafjC8yOAnQ+kIK09vgvY9tgp+tIGnKCHHlJ40Op5kLQqU8NpX5IqKEP3viv5HZAY3BEqWBEenvLT+WHS5aBqn12QSIK4j+wwhQqsPsU69MKtrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRPGkDGFtnk0wXJRfT7kS8pwWbyTvKbbnv1594oFmZg=;
 b=RD0Zd9IcNBJ0l7yTf6xDj+p8MZBF7hRCyiN+OYyeTJrReMMKIihVA8WmVQxTn32tngr6vMTzhj0mscvL8feiuU3peWzmBp2jK3QX3EM6MPbtHRvSfPlugLHZymlYP5LPLpu9YW+cltiOvakFCUrzAl/avUlphT6W/ZaSNcf/kdfE0xNkyaJOtONdQUR3yb7kHDfSswKrM9FApLYPzgNu3zdNZCCaj6QMI8uX8FX+OIO4vohEBJvphU4nti5TpfwV5ciGaWWd6bA4EmUIcTEjGoAWMGnqZXB5CqBgkbdkyNOmKlMGB4BtaDmLmFrDr6d7rdmqMA7P5G8GIWpOdjuilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRPGkDGFtnk0wXJRfT7kS8pwWbyTvKbbnv1594oFmZg=;
 b=eHdpdi9QNx3jBJ1LbelpPP9AkQ62iGIbbirS8lYMKASilppVSHHr4RkXDp4i6Yr7zqIuXwNEgPguqTg0RxO+UME12y0jSzQosrK7vbx3u4PkxWoABbifep/Vev3jJ6E9qMHWWiVqvWw41cFZYNEOFsbxIudEVMRxnFWqC1BnjQLaEJTFyUo+NJnPjlB9K2/mvG5O9QAktO9qjBVmdkDS8pMpJttT3Ndh/XTX37oGEg7tSfq/UD/Gys97xcal49rTDaEAEKUfArh+w5+5wCiXDEtWJI8Y2rvSxQARi471R2SlTdR0xT0jAmG+J/eUUGMhahnulq3POgqFQFnBAO2MkQ==
Received: from BN9PR03CA0540.namprd03.prod.outlook.com (2603:10b6:408:131::35)
 by PH5PR12MB207799.namprd12.prod.outlook.com (2603:10b6:510:501::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 12:26:29 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::24) by BN9PR03CA0540.outlook.office365.com
 (2603:10b6:408:131::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 19
 Nov 2026 12:26:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 12:26:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 04:26:13 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 19 Nov 2026 04:26:12 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Thu, 19 Nov 2026 04:26:12 -0800
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	"Mohan Kumar" <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	"Anupama Kunkulagunta" <akunkulagunt@nvidia.com>, Sheetal
	<sheetal@nvidia.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] ASoC: tegra: ADMAIF: Add Tegra268 support
Date: Thu, 19 Nov 2026 12:25:11 +0000
Message-ID: <20261119122511.1324643-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119122511.1324643-1-sheetal@nvidia.com>
References: <20261119122511.1324643-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|PH5PR12MB207799:EE_
X-MS-Office365-Filtering-Correlation-Id: bf10e3f7-cf3c-45b7-6023-08df46385650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|261022075727099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	7OwZ6CLKbCNemjNYRk8U5xzbXXW8bMoMx1by64cOXaBekpdrpKovKvlx+HjPQ87V7tuDq8egW1Zuy9t62Vp4k/YR44bK9z3o0rt586mz3BKcZeqUq9uGCzU9OLu4OCXGIFM4ksQY4A5HbhUCEIRY2cmLmKSh7lY77s29Y9q/2w1YNODl+BVjqYbadhirlWXFLyyF/LVRokx+75OQNkC8bhfnYLR9QpIzphCa82HWkVwRV/Sw2XyxRJjW1/2kYOmP++ofKj4ZtY0ikpZLIkQWPudrFW/HntlfVlF7atwBussVCjeEgL2Is7pmdK0urmgWKq0i9d5eFNnV9hqEPTjoVnjbuhW4sGkQyzUW5W4xty5UJgxJKk/A0sGo2MTByj1jShn+40Yom9E5BuqFWOjw4juYBF0df+dy6MvMKmJNISMZJQWETulDymA562wcMZdfAckc/StQYtWwdXOxcXUbO9Nrvo5TXfrbmz0+4XFPpKfm4qKZYPumStAHSTtRiG+IwcVVJWjJ8AtWvMCp1Q08hOXtNlFTULI5DDuiZX5IWxGyaO50LgivpNPK6gKPadWgexfoaJQFe8LkYeV5LWjBQGGK53pFo9o8bftDhWmzIhalB3/rCmx37br1FPGp9FaTrU0dj9BCxugFw51Jxf4olmTfOJe7YJ4IF+DSYhBB9u1RPpGl/p518FlDBpgq/UQx
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oqPzlTSOToyU0ErP5OgNLbTJXZi7c5I+BKtaZ94SOT4hFgjQUpV578BEsnkkjw28q74Ja7nKY1bKiA8s6LhIA9ekvoGMskw4ktuuoYJN47ifgIf+uPufNB2f/KpVKOQTjrJf2BEbQs2VTIsDrPbYDXl5EsxrH6PWxrlL0UTT9xm+Ck8VwW6Cf4vFjJDRD3ABafOJ1sHf7VYqS5p9EKs3MIbco15cg4zgpGXD+v+GxNjggdk92DTP9oRGdx7iTacKdv90p3OtMu+I4EmdXJPEhz28oFKECdo4M7x0HSh8UYXf5HG1PhCQxsLOOrYfBSzb2xQFlXv4YA702hXnumhFSS6PHP2qqy3xK9F+tK7oy/WInAoE7FYUKRXDOf5P7uevQm4p68J4mauvVA6rBjP16P2Uj4Tzg1KX4Fw5zrcvYYOvWMJAdWgFVYbcbVfPf7lp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:26:28.8377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf10e3f7-cf3c-45b7-6023-08df46385650
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB207799

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

Tegra268 reuses the Tegra264 ADMAIF register layout but provides only
five RX and five TX interfaces. Add the compatible and SoC data for
this configuration.

Add register defaults and five-entry DAI and control tables. Retain
the Tegra264 32-channel per-stream limit and use Tegra268 FIFO defaults.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
Changes in v2:
- Reuse the Tegra264 register limit (0x205f), as Tegra268 has the same
  register layout, and remove the separate Tegra268 limit.

 sound/soc/tegra/tegra210_admaif.c | 66 +++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h | 18 +++++++++
 2 files changed, 84 insertions(+)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 87e898cc35e4..7ffbc059934e 100644
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
+	.max_register		= TEGRA264_ADMAIF_LAST_REG,
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
index fd9877aa95d3..4290f7a049fb 100644
--- a/sound/soc/tegra/tegra210_admaif.h
+++ b/sound/soc/tegra/tegra210_admaif.h
@@ -31,6 +31,12 @@
 #define TEGRA264_ADMAIF_TX_BASE				0x1000
 #define TEGRA264_ADMAIF_GLOBAL_BASE			0x2000
 #define TEGRA264_ADMAIF_MAX_CHANNEL			32
+/* Tegra268 specific */
+#define TEGRA268_ADMAIF_CHANNEL_COUNT			5
+#define TEGRA268_ADMAIF_RX_BASE				TEGRA264_ADMAIF_RX_BASE
+#define TEGRA268_ADMAIF_TX_BASE				TEGRA264_ADMAIF_TX_BASE
+#define TEGRA268_ADMAIF_GLOBAL_BASE			TEGRA264_ADMAIF_GLOBAL_BASE
+#define TEGRA268_ADMAIF_MAX_CHANNEL			TEGRA264_ADMAIF_MAX_CHANNEL
 /* Global registers */
 #define TEGRA_ADMAIF_GLOBAL_ENABLE			0x0
 #define TEGRA_ADMAIF_GLOBAL_CG_0			0x8
@@ -204,6 +210,18 @@
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

