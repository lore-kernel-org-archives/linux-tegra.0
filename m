Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DCE27586C;
	Tue, 29 Apr 2025 06:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906418; cv=fail; b=ZuVwhpIeFs2gQoMkpRwrAYTZE7HWCzN/eK1ETOzt2pLdwKvHxBxot4bLp8y6SuyCEqEg5o7mhDPxuSykdfUu2fSr2A3luon2TYn9EA4NMul8xLJ6YYU1Hq767SA/dwg5n+e8Qnoq3iDbI2o1t59beZR53I2bLrfyoMH+pddEXsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906418; c=relaxed/simple;
	bh=MLC6bdXDzpiI2eQ5Uo7heoO2WhzKEnGD7PMyLu53N/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8OfnH+goyzk6JBmKCFrXALXLT0uyaBHH77V3fpcazEqN+2F2mdMr5jST+v4XxscW6TddVKv+hLa0HHllCQoxStpC3gBb2nLSGyOjvOiLiq5ireEGw3ISSpXNEzRMCxodi03vYQhMeG0fR/V0gn21Z/8ANjmeW7AHBEVRNtUzr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y8hLtLbi; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y8hLtLbi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkQT81SWYenEnkpnAZ0ZLpAdk5ZDWDA1edz+rASiPx77DDM1nKM+M6srKYrhTh4V9nCbiQrK6/onDcBsUnYrAEJ1hmXV8hzqYHPf/2ZIeANCMAayAa2+GMTa6iyeBR7wfVjws6ThYtWDgTrCUPcSIIljXt3C3yVtH6qjWzrUjxHg+t07pnkQMsnshOMhCdbVJeQiu19IXKZE91DtXaVYMhAPcijRYRf5scj8TPQdzX9tlGZO32CYtHoGJ37qcpFcFYogsoGGwVEjGbeR2xKYAKLc+40oLZS0DGqgJ2QLNPFqKNIIhCqsU3wqTeudbWNrA1E3ZKPTkQIANT5bcAp3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eUHun06chheCX4UOHyPy7AE7HHYhWHElO0RVg3Z+PU=;
 b=aAC/0K2Rtd0lUTArzyv9yJLENyUs5JaMW0dct086JL9+3GlwhA7dE+O4NEigYOxSTe8xEOPq2MCMhtS2+AUyLof8dZy5j057r3qIkY1v5PoiAglgFdOSCF+6Pmdgmn0nmBDs/g/GjtHsW4KXBT+4tle3SBOvjabKmArAKRzAKiD6JII+SromucovhbIhBqxoeO+B/bYPLFdEEs0lVYE0BV/pDL3jA5bUhyapzFUPD1yZvfi0eTJpJs0DS/2746qVjQH/0qYCIEzAvQSTx5BLxggFj/Y6O4XWuisMVCDdMZ2N3Q7nyOfr+QWieyEfXJAh4GWFZ/DYXmXODKb5uUHcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eUHun06chheCX4UOHyPy7AE7HHYhWHElO0RVg3Z+PU=;
 b=Y8hLtLbihkTDsCtAiKOAH17XZADQ+mX77Lyw+96w1xwtzzF2QNGYOv4lxLYGVOTTcO41zKO3PCG9J4YwsJAh7rKeaouZIQAKOKGKWtS20kmPGPfKu0gwsA0bBG4B2tB3GnxzhpR5CKEfCJQD58gqDyfJ2q18W0QgCFMKmoKBv/aJaCuOIHaLsF39yP/A/TEFwzjX/uTS2FOqbag6syUHcdx9X+zySbYjwWMshN30zNknowyfg4tUO6XJ4J82m2XmkEZDkCUhmFPdGLdbvC+r3gR6PQ8nM/BZFTQJ9NgdAwvFXko9l37HgVTX/ObQJwhChvctCRSUCW+OoRs0AQnypA==
Received: from MN2PR12CA0026.namprd12.prod.outlook.com (2603:10b6:208:a8::39)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 06:00:06 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:208:a8:cafe::ef) by MN2PR12CA0026.outlook.office365.com
 (2603:10b6:208:a8::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 29 Apr 2025 06:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 06:00:05 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 22:59:46 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 22:59:45 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 28 Apr 2025 22:59:45 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2 04/11] ASoC: tegra: ADMAIF: Add Tegra264 support
Date: Tue, 29 Apr 2025 05:59:34 +0000
Message-ID: <20250429055941.901511-5-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a6c753-2b14-4220-f722-08dd86e31705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wn8mwkgaW8ZFG9lT8o1e4bEMbVzUaFlB0vdsDeR4E1phUc0kEn5nrDnihFtp?=
 =?us-ascii?Q?FO9VD3LQEA+F5VLKE8pghSGANBQbrSFP8XQbWD4Zlax8MqILyPZfnILtfqX4?=
 =?us-ascii?Q?ZZ2ltuB2fOy4wpx91UPX5ZUJxU5HGxpgooqasnQS1LfPoOHU+8KCU4/yvQbw?=
 =?us-ascii?Q?N6vs33UDYLSVpIBbmEBEnxW7CgYzXOpyQsfVSAVa+Hi65wZbcG+QEnd/ZhCk?=
 =?us-ascii?Q?zIHEK8PvFmQiu6crvtRT/BUzJzGlBe6MK3tG0zElNc0oYr9C6aqJdYKQliwm?=
 =?us-ascii?Q?T7Vl4mh1+AZD5azyW1c4GDXd1YdsyOPFi844Y2ZzpTuSMgH2C3UL6yxXrlvI?=
 =?us-ascii?Q?d5kommqBaAm5SELr89DFyCB+qIFDYT6ihYGDcIQVU2Z0breDClV+l/8VGozB?=
 =?us-ascii?Q?RqrKFjNAlNvoEJaS1bMp7WhyF3jo61+8t/esrn6utMZvgjD5BlBKqcH0sLxl?=
 =?us-ascii?Q?fEEHFHTcNMcI38ISFHN51AAeix4B0RIalS2l3LGceF4m3ddkD8dCUpdfCKrw?=
 =?us-ascii?Q?t+/f6ggOdJUHkBRcWTD1HM+hRTS2nqKnr7IafR9rgk6f+FD4Ym+Wf0RwzwfL?=
 =?us-ascii?Q?e0nM89TvHPTkoNf9bpNdEdglwjxLT3b/DZikgEvkE6XMEXssAqW4WuaI96EO?=
 =?us-ascii?Q?B55O8Kgsk0VpY9wgbWe4sv8k+2FvUCdizusksrG77z9ANTU9uMrzTqkx6nFR?=
 =?us-ascii?Q?i324i3mUcTWv9yZQDb41GXkcfUuYviuQ3BouqJUCJE3h6h5rcsfIjx76jjo1?=
 =?us-ascii?Q?OhhuCqvQBzqi8YcoL05tgm9qdZlFI7wYwB5Q0DCBxiWw2pXctMe9bC6RSPb/?=
 =?us-ascii?Q?i7XZJB1P/iYABjR7z2Qn1+uvEVvET1Zq/erZSCHYHu/jvO6OPFhcOonENasd?=
 =?us-ascii?Q?5VKYx12BHbVaIVqXcWSW7GA5IyDomAYLAp3XshCJOC9L7yJSJQOLnAcqypsc?=
 =?us-ascii?Q?NGK9EMhlwMOxCoD/gIYllEKrHJCN8VNNuOXL8fYZfDh+ZGwuc8qbFyvQE6Rv?=
 =?us-ascii?Q?hswdcPOt0YlvQlfeuG0TWLazPeCiK6RqMSl8tYH8bJxv84QBy3+oVIuDSfDm?=
 =?us-ascii?Q?OUFrPTRmfExDIJp5js1H2Sj9x8iY768YZO+uSBwDFOmHbI4jSJlkfnYO9EfD?=
 =?us-ascii?Q?I8SvkC5FitNI1wsINX/Nf8vn5CsN3Vqv47FA9SNgEB7SjbLG2ifMK//9eR94?=
 =?us-ascii?Q?iPjKVxzjZyZKpL1oM7pm4PhzrivBqtvDD2Dde0su4A3n08HIrxQMz2ITL9Ht?=
 =?us-ascii?Q?74ofGcNGGqUrPEEXz0DoEGi3HwzlhUtLMZrrPEuvimYgxv4piwXWLhRrqT5Y?=
 =?us-ascii?Q?aAE4iFzbCW3b+mNHOm+VzqvlJ/oRTIyo4TsaVR9dhjOuWq9ituPF4XgvcYB4?=
 =?us-ascii?Q?1MfbM5bwYgb5lmUTD7/5QJdSZlwYdTwmHz6CSHU8KsoXLvyKFnMN/S8fJKYE?=
 =?us-ascii?Q?oK9lNkuhAhwkquyfmE76NSWJryMOkjcMaXJpI4WW0pNx4erT2RKJnMYtnZVV?=
 =?us-ascii?Q?HPcaloExI8wGNarzFtCCCrFluOhUCTrghd91?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:00:05.6361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a6c753-2b14-4220-f722-08dd86e31705
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030

From: Sheetal <sheetal@nvidia.com>

Add Tegra264 I2S support with following changes:
- Add soc_data for Tegra264-specific variations
- Tegra264 supports 32 RX and 32 TX ADMAIF channels and each ADMAIF
  stream supports max 32 channels. To accommodate the change dais, CIF
  configuration API and driver components are updated.
- Register offsets and default values are updated to align with Tegra264.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_admaif.c | 223 +++++++++++++++++++++++++-----
 sound/soc/tegra/tegra210_admaif.h |  78 +++++++++++
 2 files changed, 263 insertions(+), 38 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 76ff4fe40f65..f88d6a2356e0 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -25,12 +25,12 @@
 
 #define CH_RX_REG(reg, id) CH_REG(admaif->soc_data->rx_base, reg, id)
 
-#define REG_DEFAULTS(id, rx_ctrl, tx_ctrl, tx_base, rx_base)		       \
+#define REG_DEFAULTS(id, rx_ctrl, tx_ctrl, tx_base, rx_base, cif_ctrl)	       \
 	{ CH_REG(rx_base, TEGRA_ADMAIF_RX_INT_MASK, id), 0x00000001 },	       \
-	{ CH_REG(rx_base, TEGRA_ADMAIF_CH_ACIF_RX_CTRL, id), 0x00007700 },     \
+	{ CH_REG(rx_base, TEGRA_ADMAIF_CH_ACIF_RX_CTRL, id), cif_ctrl },     \
 	{ CH_REG(rx_base, TEGRA_ADMAIF_RX_FIFO_CTRL, id), rx_ctrl },	       \
 	{ CH_REG(tx_base, TEGRA_ADMAIF_TX_INT_MASK, id), 0x00000001 },	       \
-	{ CH_REG(tx_base, TEGRA_ADMAIF_CH_ACIF_TX_CTRL, id), 0x00007700 },     \
+	{ CH_REG(tx_base, TEGRA_ADMAIF_CH_ACIF_TX_CTRL, id), cif_ctrl },     \
 	{ CH_REG(tx_base, TEGRA_ADMAIF_TX_FIFO_CTRL, id), tx_ctrl }
 
 #define ADMAIF_REG_DEFAULTS(id, chip)					       \
@@ -38,7 +38,8 @@
 		chip ## _ADMAIF_RX ## id ## _FIFO_CTRL_REG_DEFAULT,	       \
 		chip ## _ADMAIF_TX ## id ## _FIFO_CTRL_REG_DEFAULT,	       \
 		chip ## _ADMAIF_TX_BASE,				       \
-		chip ## _ADMAIF_RX_BASE)
+		chip ## _ADMAIF_RX_BASE,				       \
+		chip ## _ADMAIF_CIF_REG_DEFAULT)
 
 static const struct reg_default tegra186_admaif_reg_defaults[] = {
 	{(TEGRA_ADMAIF_GLOBAL_CG_0 + TEGRA186_ADMAIF_GLOBAL_BASE), 0x00000003},
@@ -78,6 +79,42 @@ static const struct reg_default tegra210_admaif_reg_defaults[] = {
 	ADMAIF_REG_DEFAULTS(10, TEGRA210)
 };
 
+static const struct reg_default tegra264_admaif_reg_defaults[] = {
+	{(TEGRA_ADMAIF_GLOBAL_CG_0 + TEGRA264_ADMAIF_GLOBAL_BASE), 0x00000003},
+	ADMAIF_REG_DEFAULTS(1, TEGRA264),
+	ADMAIF_REG_DEFAULTS(2, TEGRA264),
+	ADMAIF_REG_DEFAULTS(3, TEGRA264),
+	ADMAIF_REG_DEFAULTS(4, TEGRA264),
+	ADMAIF_REG_DEFAULTS(5, TEGRA264),
+	ADMAIF_REG_DEFAULTS(6, TEGRA264),
+	ADMAIF_REG_DEFAULTS(7, TEGRA264),
+	ADMAIF_REG_DEFAULTS(8, TEGRA264),
+	ADMAIF_REG_DEFAULTS(9, TEGRA264),
+	ADMAIF_REG_DEFAULTS(10, TEGRA264),
+	ADMAIF_REG_DEFAULTS(11, TEGRA264),
+	ADMAIF_REG_DEFAULTS(12, TEGRA264),
+	ADMAIF_REG_DEFAULTS(13, TEGRA264),
+	ADMAIF_REG_DEFAULTS(14, TEGRA264),
+	ADMAIF_REG_DEFAULTS(15, TEGRA264),
+	ADMAIF_REG_DEFAULTS(16, TEGRA264),
+	ADMAIF_REG_DEFAULTS(17, TEGRA264),
+	ADMAIF_REG_DEFAULTS(18, TEGRA264),
+	ADMAIF_REG_DEFAULTS(19, TEGRA264),
+	ADMAIF_REG_DEFAULTS(20, TEGRA264),
+	ADMAIF_REG_DEFAULTS(21, TEGRA264),
+	ADMAIF_REG_DEFAULTS(22, TEGRA264),
+	ADMAIF_REG_DEFAULTS(23, TEGRA264),
+	ADMAIF_REG_DEFAULTS(24, TEGRA264),
+	ADMAIF_REG_DEFAULTS(25, TEGRA264),
+	ADMAIF_REG_DEFAULTS(26, TEGRA264),
+	ADMAIF_REG_DEFAULTS(27, TEGRA264),
+	ADMAIF_REG_DEFAULTS(28, TEGRA264),
+	ADMAIF_REG_DEFAULTS(29, TEGRA264),
+	ADMAIF_REG_DEFAULTS(30, TEGRA264),
+	ADMAIF_REG_DEFAULTS(31, TEGRA264),
+	ADMAIF_REG_DEFAULTS(32, TEGRA264)
+};
+
 static bool tegra_admaif_wr_reg(struct device *dev, unsigned int reg)
 {
 	struct tegra_admaif *admaif = dev_get_drvdata(dev);
@@ -220,6 +257,19 @@ static const struct regmap_config tegra186_admaif_regmap_config = {
 	.cache_type		= REGCACHE_FLAT,
 };
 
+static const struct regmap_config tegra264_admaif_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA264_ADMAIF_LAST_REG,
+	.writeable_reg		= tegra_admaif_wr_reg,
+	.readable_reg		= tegra_admaif_rd_reg,
+	.volatile_reg		= tegra_admaif_volatile_reg,
+	.reg_defaults		= tegra264_admaif_reg_defaults,
+	.num_reg_defaults	= TEGRA264_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.cache_type		= REGCACHE_FLAT,
+};
+
 static int tegra_admaif_runtime_suspend(struct device *dev)
 {
 	struct tegra_admaif *admaif = dev_get_drvdata(dev);
@@ -330,7 +380,10 @@ static int tegra_admaif_hw_params(struct snd_pcm_substream *substream,
 
 	tegra_admaif_set_pack_mode(admaif->regmap, reg, valid_bit);
 
-	tegra_set_cif(admaif->regmap, reg, &cif_conf);
+	if (admaif->soc_data->max_stream_ch == TEGRA264_ADMAIF_MAX_CHANNEL)
+		tegra264_set_cif(admaif->regmap, reg, &cif_conf);
+	else
+		tegra_set_cif(admaif->regmap, reg, &cif_conf);
 
 	return 0;
 }
@@ -571,13 +624,13 @@ static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
 	.prepare	= tegra_admaif_prepare,
 };
 
-#define DAI(dai_name)					\
+#define DAI(dai_name, channel)					\
 	{							\
 		.name = dai_name,				\
 		.playback = {					\
 			.stream_name = dai_name " Playback",	\
 			.channels_min = 1,			\
-			.channels_max = 16,			\
+			.channels_max = channel,		\
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				SNDRV_PCM_FMTBIT_S16_LE |	\
@@ -587,7 +640,7 @@ static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
 		.capture = {					\
 			.stream_name = dai_name " Capture",	\
 			.channels_min = 1,			\
-			.channels_max = 16,			\
+			.channels_max = channel,		\
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				SNDRV_PCM_FMTBIT_S16_LE |	\
@@ -598,39 +651,74 @@ static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
 	}
 
 static struct snd_soc_dai_driver tegra210_admaif_cmpnt_dais[] = {
-	DAI("ADMAIF1"),
-	DAI("ADMAIF2"),
-	DAI("ADMAIF3"),
-	DAI("ADMAIF4"),
-	DAI("ADMAIF5"),
-	DAI("ADMAIF6"),
-	DAI("ADMAIF7"),
-	DAI("ADMAIF8"),
-	DAI("ADMAIF9"),
-	DAI("ADMAIF10"),
+	DAI("ADMAIF1", TEGRA210_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF2", TEGRA210_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF3", TEGRA210_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF4", TEGRA210_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF5", TEGRA210_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF6", TEGRA210_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF7", TEGRA210_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF8", TEGRA210_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF9", TEGRA210_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF10", TEGRA210_ADMAIF_MAX_CHANNEL),
 };
 
 static struct snd_soc_dai_driver tegra186_admaif_cmpnt_dais[] = {
-	DAI("ADMAIF1"),
-	DAI("ADMAIF2"),
-	DAI("ADMAIF3"),
-	DAI("ADMAIF4"),
-	DAI("ADMAIF5"),
-	DAI("ADMAIF6"),
-	DAI("ADMAIF7"),
-	DAI("ADMAIF8"),
-	DAI("ADMAIF9"),
-	DAI("ADMAIF10"),
-	DAI("ADMAIF11"),
-	DAI("ADMAIF12"),
-	DAI("ADMAIF13"),
-	DAI("ADMAIF14"),
-	DAI("ADMAIF15"),
-	DAI("ADMAIF16"),
-	DAI("ADMAIF17"),
-	DAI("ADMAIF18"),
-	DAI("ADMAIF19"),
-	DAI("ADMAIF20"),
+	DAI("ADMAIF1", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF2", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF3", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF4", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF5", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF6", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF7", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF8", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF9", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF10", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF11", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF12", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF13", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF14", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF15", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF16", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF17", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF18", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF19", TEGRA186_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF20", TEGRA186_ADMAIF_MAX_CHANNEL),
+};
+
+static struct snd_soc_dai_driver tegra264_admaif_cmpnt_dais[] = {
+	DAI("ADMAIF1", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF2", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF3", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF4", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF5", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF6", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF7", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF8", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF9", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF10", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF11", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF12", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF13", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF14", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF15", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF16", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF17", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF18", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF19", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF20", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF21", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF22", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF23", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF24", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF25", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF26", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF27", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF28", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF29", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF30", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF31", TEGRA264_ADMAIF_MAX_CHANNEL),
+	DAI("ADMAIF32", TEGRA264_ADMAIF_MAX_CHANNEL),
 };
 
 static const char * const tegra_admaif_stereo_conv_text[] = {
@@ -710,6 +798,41 @@ static struct snd_kcontrol_new tegra186_admaif_controls[] = {
 	TEGRA_ADMAIF_CIF_CTRL(20),
 };
 
+static struct snd_kcontrol_new tegra264_admaif_controls[] = {
+	TEGRA_ADMAIF_CIF_CTRL(1),
+	TEGRA_ADMAIF_CIF_CTRL(2),
+	TEGRA_ADMAIF_CIF_CTRL(3),
+	TEGRA_ADMAIF_CIF_CTRL(4),
+	TEGRA_ADMAIF_CIF_CTRL(5),
+	TEGRA_ADMAIF_CIF_CTRL(6),
+	TEGRA_ADMAIF_CIF_CTRL(7),
+	TEGRA_ADMAIF_CIF_CTRL(8),
+	TEGRA_ADMAIF_CIF_CTRL(9),
+	TEGRA_ADMAIF_CIF_CTRL(10),
+	TEGRA_ADMAIF_CIF_CTRL(11),
+	TEGRA_ADMAIF_CIF_CTRL(12),
+	TEGRA_ADMAIF_CIF_CTRL(13),
+	TEGRA_ADMAIF_CIF_CTRL(14),
+	TEGRA_ADMAIF_CIF_CTRL(15),
+	TEGRA_ADMAIF_CIF_CTRL(16),
+	TEGRA_ADMAIF_CIF_CTRL(17),
+	TEGRA_ADMAIF_CIF_CTRL(18),
+	TEGRA_ADMAIF_CIF_CTRL(19),
+	TEGRA_ADMAIF_CIF_CTRL(20),
+	TEGRA_ADMAIF_CIF_CTRL(21),
+	TEGRA_ADMAIF_CIF_CTRL(22),
+	TEGRA_ADMAIF_CIF_CTRL(23),
+	TEGRA_ADMAIF_CIF_CTRL(24),
+	TEGRA_ADMAIF_CIF_CTRL(25),
+	TEGRA_ADMAIF_CIF_CTRL(26),
+	TEGRA_ADMAIF_CIF_CTRL(27),
+	TEGRA_ADMAIF_CIF_CTRL(28),
+	TEGRA_ADMAIF_CIF_CTRL(29),
+	TEGRA_ADMAIF_CIF_CTRL(30),
+	TEGRA_ADMAIF_CIF_CTRL(31),
+	TEGRA_ADMAIF_CIF_CTRL(32),
+};
+
 static const struct snd_soc_component_driver tegra210_admaif_cmpnt = {
 	.controls		= tegra210_admaif_controls,
 	.num_controls		= ARRAY_SIZE(tegra210_admaif_controls),
@@ -730,8 +853,19 @@ static const struct snd_soc_component_driver tegra186_admaif_cmpnt = {
 	.pointer		= tegra_pcm_pointer,
 };
 
+static const struct snd_soc_component_driver tegra264_admaif_cmpnt = {
+	.controls		= tegra264_admaif_controls,
+	.num_controls		= ARRAY_SIZE(tegra264_admaif_controls),
+	.pcm_construct		= tegra_pcm_construct,
+	.open			= tegra_pcm_open,
+	.close			= tegra_pcm_close,
+	.hw_params		= tegra_pcm_hw_params,
+	.pointer		= tegra_pcm_pointer,
+};
+
 static const struct tegra_admaif_soc_data soc_data_tegra210 = {
 	.num_ch		= TEGRA210_ADMAIF_CHANNEL_COUNT,
+	.max_stream_ch	= TEGRA210_ADMAIF_MAX_CHANNEL,
 	.cmpnt		= &tegra210_admaif_cmpnt,
 	.dais		= tegra210_admaif_cmpnt_dais,
 	.regmap_conf	= &tegra210_admaif_regmap_config,
@@ -742,6 +876,7 @@ static const struct tegra_admaif_soc_data soc_data_tegra210 = {
 
 static const struct tegra_admaif_soc_data soc_data_tegra186 = {
 	.num_ch		= TEGRA186_ADMAIF_CHANNEL_COUNT,
+	.max_stream_ch	= TEGRA186_ADMAIF_MAX_CHANNEL,
 	.cmpnt		= &tegra186_admaif_cmpnt,
 	.dais		= tegra186_admaif_cmpnt_dais,
 	.regmap_conf	= &tegra186_admaif_regmap_config,
@@ -750,9 +885,21 @@ static const struct tegra_admaif_soc_data soc_data_tegra186 = {
 	.rx_base	= TEGRA186_ADMAIF_RX_BASE,
 };
 
+static const struct tegra_admaif_soc_data soc_data_tegra264 = {
+	.num_ch		= TEGRA264_ADMAIF_CHANNEL_COUNT,
+	.max_stream_ch	= TEGRA264_ADMAIF_MAX_CHANNEL,
+	.cmpnt		= &tegra264_admaif_cmpnt,
+	.dais		= tegra264_admaif_cmpnt_dais,
+	.regmap_conf	= &tegra264_admaif_regmap_config,
+	.global_base	= TEGRA264_ADMAIF_GLOBAL_BASE,
+	.tx_base	= TEGRA264_ADMAIF_TX_BASE,
+	.rx_base	= TEGRA264_ADMAIF_RX_BASE,
+};
+
 static const struct of_device_id tegra_admaif_of_match[] = {
 	{ .compatible = "nvidia,tegra210-admaif", .data = &soc_data_tegra210 },
 	{ .compatible = "nvidia,tegra186-admaif", .data = &soc_data_tegra186 },
+	{ .compatible = "nvidia,tegra264-admaif", .data = &soc_data_tegra264 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_admaif_of_match);
diff --git a/sound/soc/tegra/tegra210_admaif.h b/sound/soc/tegra/tegra210_admaif.h
index 748f886ee74e..304d45c76a9a 100644
--- a/sound/soc/tegra/tegra210_admaif.h
+++ b/sound/soc/tegra/tegra210_admaif.h
@@ -16,12 +16,21 @@
 #define TEGRA210_ADMAIF_RX_BASE				0x0
 #define TEGRA210_ADMAIF_TX_BASE				0x300
 #define TEGRA210_ADMAIF_GLOBAL_BASE			0x700
+#define TEGRA210_ADMAIF_MAX_CHANNEL			16
 /* Tegra186 specific */
 #define TEGRA186_ADMAIF_LAST_REG			0xd5f
 #define TEGRA186_ADMAIF_CHANNEL_COUNT			20
 #define TEGRA186_ADMAIF_RX_BASE				0x0
 #define TEGRA186_ADMAIF_TX_BASE				0x500
 #define TEGRA186_ADMAIF_GLOBAL_BASE			0xd00
+#define TEGRA186_ADMAIF_MAX_CHANNEL			16
+/* Tegra264 specific */
+#define TEGRA264_ADMAIF_LAST_REG			0x205f
+#define TEGRA264_ADMAIF_CHANNEL_COUNT			32
+#define TEGRA264_ADMAIF_RX_BASE				0x0
+#define TEGRA264_ADMAIF_TX_BASE				0x1000
+#define TEGRA264_ADMAIF_GLOBAL_BASE			0x2000
+#define TEGRA264_ADMAIF_MAX_CHANNEL			32
 /* Global registers */
 #define TEGRA_ADMAIF_GLOBAL_ENABLE			0x0
 #define TEGRA_ADMAIF_GLOBAL_CG_0			0x8
@@ -66,6 +75,7 @@
 #define SW_RESET_MASK					1
 #define SW_RESET					1
 /* Default values - Tegra210 */
+#define TEGRA210_ADMAIF_CIF_REG_DEFAULT			0x00007700
 #define TEGRA210_ADMAIF_RX1_FIFO_CTRL_REG_DEFAULT	0x00000300
 #define TEGRA210_ADMAIF_RX2_FIFO_CTRL_REG_DEFAULT	0x00000304
 #define TEGRA210_ADMAIF_RX3_FIFO_CTRL_REG_DEFAULT	0x00000208
@@ -87,6 +97,7 @@
 #define TEGRA210_ADMAIF_TX9_FIFO_CTRL_REG_DEFAULT	0x0180021a
 #define TEGRA210_ADMAIF_TX10_FIFO_CTRL_REG_DEFAULT	0x0180021d
 /* Default values - Tegra186 */
+#define TEGRA186_ADMAIF_CIF_REG_DEFAULT			0x00007700
 #define TEGRA186_ADMAIF_RX1_FIFO_CTRL_REG_DEFAULT	0x00000300
 #define TEGRA186_ADMAIF_RX2_FIFO_CTRL_REG_DEFAULT	0x00000304
 #define TEGRA186_ADMAIF_RX3_FIFO_CTRL_REG_DEFAULT	0x00000308
@@ -127,6 +138,72 @@
 #define TEGRA186_ADMAIF_TX18_FIFO_CTRL_REG_DEFAULT	0x01800237
 #define TEGRA186_ADMAIF_TX19_FIFO_CTRL_REG_DEFAULT	0x0180023a
 #define TEGRA186_ADMAIF_TX20_FIFO_CTRL_REG_DEFAULT	0x0180023d
+/* Default values - Tegra264 */
+#define TEGRA264_ADMAIF_CIF_REG_DEFAULT			0x00003f00
+#define TEGRA264_ADMAIF_RX1_FIFO_CTRL_REG_DEFAULT	0x00000200
+#define TEGRA264_ADMAIF_RX2_FIFO_CTRL_REG_DEFAULT	0x00000203
+#define TEGRA264_ADMAIF_RX3_FIFO_CTRL_REG_DEFAULT	0x00000206
+#define TEGRA264_ADMAIF_RX4_FIFO_CTRL_REG_DEFAULT	0x00000209
+#define TEGRA264_ADMAIF_RX5_FIFO_CTRL_REG_DEFAULT	0x0000020c
+#define TEGRA264_ADMAIF_RX6_FIFO_CTRL_REG_DEFAULT	0x0000020f
+#define TEGRA264_ADMAIF_RX7_FIFO_CTRL_REG_DEFAULT	0x00000212
+#define TEGRA264_ADMAIF_RX8_FIFO_CTRL_REG_DEFAULT	0x00000215
+#define TEGRA264_ADMAIF_RX9_FIFO_CTRL_REG_DEFAULT	0x00000218
+#define TEGRA264_ADMAIF_RX10_FIFO_CTRL_REG_DEFAULT	0x0000021b
+#define TEGRA264_ADMAIF_RX11_FIFO_CTRL_REG_DEFAULT	0x0000021e
+#define TEGRA264_ADMAIF_RX12_FIFO_CTRL_REG_DEFAULT	0x00000221
+#define TEGRA264_ADMAIF_RX13_FIFO_CTRL_REG_DEFAULT	0x00000224
+#define TEGRA264_ADMAIF_RX14_FIFO_CTRL_REG_DEFAULT	0x00000227
+#define TEGRA264_ADMAIF_RX15_FIFO_CTRL_REG_DEFAULT	0x0000022a
+#define TEGRA264_ADMAIF_RX16_FIFO_CTRL_REG_DEFAULT	0x0000022d
+#define TEGRA264_ADMAIF_RX17_FIFO_CTRL_REG_DEFAULT	0x00000230
+#define TEGRA264_ADMAIF_RX18_FIFO_CTRL_REG_DEFAULT	0x00000233
+#define TEGRA264_ADMAIF_RX19_FIFO_CTRL_REG_DEFAULT	0x00000236
+#define TEGRA264_ADMAIF_RX20_FIFO_CTRL_REG_DEFAULT	0x00000239
+#define TEGRA264_ADMAIF_RX21_FIFO_CTRL_REG_DEFAULT	0x0000023c
+#define TEGRA264_ADMAIF_RX22_FIFO_CTRL_REG_DEFAULT	0x0000023f
+#define TEGRA264_ADMAIF_RX23_FIFO_CTRL_REG_DEFAULT	0x00000242
+#define TEGRA264_ADMAIF_RX24_FIFO_CTRL_REG_DEFAULT	0x00000245
+#define TEGRA264_ADMAIF_RX25_FIFO_CTRL_REG_DEFAULT	0x00000248
+#define TEGRA264_ADMAIF_RX26_FIFO_CTRL_REG_DEFAULT	0x0000024b
+#define TEGRA264_ADMAIF_RX27_FIFO_CTRL_REG_DEFAULT	0x0000024e
+#define TEGRA264_ADMAIF_RX28_FIFO_CTRL_REG_DEFAULT	0x00000251
+#define TEGRA264_ADMAIF_RX29_FIFO_CTRL_REG_DEFAULT	0x00000254
+#define TEGRA264_ADMAIF_RX30_FIFO_CTRL_REG_DEFAULT	0x00000257
+#define TEGRA264_ADMAIF_RX31_FIFO_CTRL_REG_DEFAULT	0x0000025a
+#define TEGRA264_ADMAIF_RX32_FIFO_CTRL_REG_DEFAULT	0x0000025d
+#define TEGRA264_ADMAIF_TX1_FIFO_CTRL_REG_DEFAULT	0x01800200
+#define TEGRA264_ADMAIF_TX2_FIFO_CTRL_REG_DEFAULT	0x01800203
+#define TEGRA264_ADMAIF_TX3_FIFO_CTRL_REG_DEFAULT	0x01800206
+#define TEGRA264_ADMAIF_TX4_FIFO_CTRL_REG_DEFAULT	0x01800209
+#define TEGRA264_ADMAIF_TX5_FIFO_CTRL_REG_DEFAULT	0x0180020c
+#define TEGRA264_ADMAIF_TX6_FIFO_CTRL_REG_DEFAULT	0x0180020f
+#define TEGRA264_ADMAIF_TX7_FIFO_CTRL_REG_DEFAULT	0x01800212
+#define TEGRA264_ADMAIF_TX8_FIFO_CTRL_REG_DEFAULT	0x01800215
+#define TEGRA264_ADMAIF_TX9_FIFO_CTRL_REG_DEFAULT	0x01800218
+#define TEGRA264_ADMAIF_TX10_FIFO_CTRL_REG_DEFAULT	0x0180021b
+#define TEGRA264_ADMAIF_TX11_FIFO_CTRL_REG_DEFAULT	0x0180021e
+#define TEGRA264_ADMAIF_TX12_FIFO_CTRL_REG_DEFAULT	0x01800221
+#define TEGRA264_ADMAIF_TX13_FIFO_CTRL_REG_DEFAULT	0x01800224
+#define TEGRA264_ADMAIF_TX14_FIFO_CTRL_REG_DEFAULT	0x01800227
+#define TEGRA264_ADMAIF_TX15_FIFO_CTRL_REG_DEFAULT	0x0180022a
+#define TEGRA264_ADMAIF_TX16_FIFO_CTRL_REG_DEFAULT	0x0180022d
+#define TEGRA264_ADMAIF_TX17_FIFO_CTRL_REG_DEFAULT	0x01800230
+#define TEGRA264_ADMAIF_TX18_FIFO_CTRL_REG_DEFAULT	0x01800233
+#define TEGRA264_ADMAIF_TX19_FIFO_CTRL_REG_DEFAULT	0x01800236
+#define TEGRA264_ADMAIF_TX20_FIFO_CTRL_REG_DEFAULT	0x01800239
+#define TEGRA264_ADMAIF_TX21_FIFO_CTRL_REG_DEFAULT	0x0180023c
+#define TEGRA264_ADMAIF_TX22_FIFO_CTRL_REG_DEFAULT	0x0180023f
+#define TEGRA264_ADMAIF_TX23_FIFO_CTRL_REG_DEFAULT	0x01800242
+#define TEGRA264_ADMAIF_TX24_FIFO_CTRL_REG_DEFAULT	0x01800245
+#define TEGRA264_ADMAIF_TX25_FIFO_CTRL_REG_DEFAULT	0x01800248
+#define TEGRA264_ADMAIF_TX26_FIFO_CTRL_REG_DEFAULT	0x0180024b
+#define TEGRA264_ADMAIF_TX27_FIFO_CTRL_REG_DEFAULT	0x0180024e
+#define TEGRA264_ADMAIF_TX28_FIFO_CTRL_REG_DEFAULT	0x01800251
+#define TEGRA264_ADMAIF_TX29_FIFO_CTRL_REG_DEFAULT	0x01800254
+#define TEGRA264_ADMAIF_TX30_FIFO_CTRL_REG_DEFAULT	0x01800257
+#define TEGRA264_ADMAIF_TX31_FIFO_CTRL_REG_DEFAULT	0x0180025a
+#define TEGRA264_ADMAIF_TX32_FIFO_CTRL_REG_DEFAULT	0x0180025d
 
 enum {
 	DATA_8BIT,
@@ -148,6 +225,7 @@ struct tegra_admaif_soc_data {
 	unsigned int tx_base;
 	unsigned int rx_base;
 	unsigned int num_ch;
+	unsigned int max_stream_ch;
 };
 
 struct tegra_admaif {
-- 
2.17.1

