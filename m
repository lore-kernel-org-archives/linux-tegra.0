Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1E23E34D;
	Tue, 22 Apr 2025 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306941; cv=fail; b=ZgIkJFlFJyqZC4MACioJy7KvC/+u2qjDtvyopD9uPzvwWgMM0cs4lGszYX9edjA65BRuVdAyWkfRtes0EEUbNh67/CwgHsYn9mINMhEPpA4+m2x3CXIm0p53rDIHLopd3rgrb3X5viKDrkQs9oNVoB9Di/aMjh7V8CvNQbctSY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306941; c=relaxed/simple;
	bh=MLC6bdXDzpiI2eQ5Uo7heoO2WhzKEnGD7PMyLu53N/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fd1d6XfxNWL9fGvFuSci7nt0DD9AuJPkKTv+7hL9bz4ibUAbUUziMumpFZRGtwlVx6uG9CDrlH4jtJAq2aNo+w5GAoF/70rvogok5TwQrpTlMV8hkHQ4kpw8qSP4l1Cl/a3AbxawTX89E37trHHIf1OvV/A8bD/g/pNhXr0cW3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jEMgof5x; arc=fail smtp.client-ip=40.107.102.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jEMgof5x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K55S7LqYl29ppK3xio4HmWL8n3IOmMiZLQzVjR8OEh0SZpY6QPrCXbhoWiwhvOnVC1BsTZJFBQr7V05vLL+TU2DyPfy/afsXYICRmN5n2mSL+E1lmG5WUpubM/lyYtcEmhndHZd9PM0Vtw0A2WKbQeeQDc6YH0qPeFxKbCWXYv+yP3nKytpq8jI6fGD8nnMHAObrhD4wO3HIqy7xhiLCVGxRMgCNtuGakO87Ow0sVpZUUoTQMJ3FczwFnOZxLvk3XSvUCXGFAYYZeUEkEn+MNUg0J83T9z2QV4y0NoXwnaNqcGMQyw3i87lGaN9+GuTVtUu0ywp0je70A9nh2bdjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eUHun06chheCX4UOHyPy7AE7HHYhWHElO0RVg3Z+PU=;
 b=lmsgorYXwnb3VOoQGvrb4zmmIhbAsU0IEbysOgY9uUWgToFJT4iCJaIL2EsyFe+HlpRUZP9My7JAqbn09G2SmbZyMFJ0Gwi+azrp+UNcID0YLVOjQg4raOX3OqbLPnoEduJAnhDM4FxyL2ByW8r8Ogri6fZ4pjPFcPTFl6ItNYaixVOZuIL1PuabAZ9EwpljAWCS7JxCdpdjrMsQRWg9w33UbBCVCrXl/Jiv/3jJdf0Ak3ISWI8axSOb/kOMEiMV/2o1Y2E5uuuTKYMQkgZ9vJETEvaUyipA/sJvF/m1lqeq6AVcp1oMQx6y7patpYh96bzbmaGB8JKBvs5kg/HIpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eUHun06chheCX4UOHyPy7AE7HHYhWHElO0RVg3Z+PU=;
 b=jEMgof5xHqNIoBRe+91yo0GgS3Vap6alaZU55iPGL6dsr8AChZZ04Hinp9yHZrWYQTaXDbyxhaMF9yJceQo+0K8IXlGTzeNrEMyxpyXdlplZLE5PmOsRj/xUkCYNm+a711fJItkgOlXzk7b2Vu2r6bdlniMGSPw4156X2VnvQJmys8YDoPmZHOYXaAZWY/5kL9QZQCiRubkSW9jSJTZswPUxg7+RqzfVrPK/pHCGwNJZ10SdZi2KVGHwMYDXH2XM/8BRtsPV8bqha9Lsmfe35AsDr5QVfBRW1o/5qYFIA74xIYNONVV6JwCrUnClcSyV8wCqPsU2lkJfIeDB0BSTDQ==
Received: from SJ0PR05CA0146.namprd05.prod.outlook.com (2603:10b6:a03:33d::31)
 by MW3PR12MB4410.namprd12.prod.outlook.com (2603:10b6:303:5b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 07:28:52 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::6d) by SJ0PR05CA0146.outlook.office365.com
 (2603:10b6:a03:33d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Tue,
 22 Apr 2025 07:28:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 07:28:52 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 00:28:37 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 00:28:36 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 00:28:36 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 03/10] ASoC: tegra: ADMAIF: Add Tegra264 support
Date: Tue, 22 Apr 2025 07:27:58 +0000
Message-ID: <20250422072805.501152-4-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|MW3PR12MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a81de05-cbd5-40f8-e2a2-08dd816f54ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BZc7GO3VgivSe+tyr5pgz2MDflX+hzGUXldMS5jrSahVTUgrAKp72wGi7NA/?=
 =?us-ascii?Q?TcM87oBQf7L9oFUX6v2WVfb4SIRgd5FEUcEzedPQqX3bQcYNbBy/qmPNJ30O?=
 =?us-ascii?Q?8nLk2puqZy66HWrlOqm7+5bApehG8c9WPsAKz68nE4imxeNL8d8IOM1os41K?=
 =?us-ascii?Q?RVfNrRW2h/ZcjBnhKv2VWd7VSY4FIqU2wF7TNPhZPgaM7Gr5LMsP8a8q5o2C?=
 =?us-ascii?Q?CB4s73HOQyKkjk0O0PKz6vh5HRelxpBCv2VQ2KyI10lDnjaUsABaBAduCVck?=
 =?us-ascii?Q?Tue9cMohr6mQuK7+iJaH3Ea9jdOKDFAj4j7uf+DbUmRhyBVvVi9sEGh3sabp?=
 =?us-ascii?Q?0jU/Bj/hrRgoGOJgaT9Jn9lpg6qB4WHlFJWYpMOlVk0MeTZzjUuAi827MW7j?=
 =?us-ascii?Q?Wl5R/LuTX7W33a1ErE0+PoDqgZlUtiRhFALvSz1xmeIEGFCf14c9th6T07xs?=
 =?us-ascii?Q?5Kdn7HLJMzTWUP9f1MVRn39dIwI3j7sgY+zIHl3sfaqRMvjC64wipCi8qSjn?=
 =?us-ascii?Q?NoxnFbEibq8F2VxVBkVv8AK7oKWnlLD7QKfR6bfRFDdWWfJ1PjUCrAVi2rK9?=
 =?us-ascii?Q?LCTbz6yt5iWfplsW64Oj/9dwVDyuRmY9hBWFxh5jOW3/qOHjufEe6co6/QlF?=
 =?us-ascii?Q?FfX7ZSGZGlZc5j1dAJrM+nvPxtu79AcanTQKkAvQH1/Rumj3b71CroyX96Bf?=
 =?us-ascii?Q?sXf0tQYMugyGv1mR5uFJtCgBJKxGEm4QhGzA+S6KyYAKeGCJDZrrPmNPlw9l?=
 =?us-ascii?Q?gIMAXBlp8HeRnJ6fUzbdZ7ytf1YN2LCoch162tcJZYbmrfIHX75ccOJH9tfx?=
 =?us-ascii?Q?VZmNfaFF8byNK7cnLWtzgGmatQJIcwJq9L4NGNKmMkXBfoKHMG7oVy7Yac8S?=
 =?us-ascii?Q?HJYjwl5DPJKh9Lfj9j+v2v0S4e0YQeN8O3PM08C7XqeLZAWEMMA/7xfT3HAX?=
 =?us-ascii?Q?rHDjvFAyU8SjLVUuIJ2vM7HdHtO9QkEcRZ3/BqfD4RGCU8cEpfrNVx0LNQe7?=
 =?us-ascii?Q?MQgZVf0RM2w7uNwPiMv8XQb6MbjCGFnGFjdaeQrwFTdibDlhksOS70jPOaLd?=
 =?us-ascii?Q?vhMHJjiJRJLc3ZtqhC/cHTX70lYSO7sdA2tjpmxTmKFevxh+IFMivW1mDaVM?=
 =?us-ascii?Q?dxmqC4WKX69OKikvR05rby/r79ttOkt05sccPagFIWJW4y9KaIDAZ1WCHMgz?=
 =?us-ascii?Q?jW67H5H3WMsgAQqEn8kdrVsC8u5hlwTYT/3EdPIusRnhixUeThlr8oo3HXA8?=
 =?us-ascii?Q?Hen6uX1WZamPi07MPv+fV/qHDz2lGtYCZ248pf05hrroEQcya/n5AYpG2oCD?=
 =?us-ascii?Q?On86ZfMuHhHSu/Hc3q7hVbGz/nLmWJWqPNOHCdl4Rw9quI3kHyLPLzUYX1Dr?=
 =?us-ascii?Q?Tg0QXITxu+/OY6r7GofA9Km4hHyzEV2XNGBQFLc8QwxiB7+LaKmXT0WdH6Rv?=
 =?us-ascii?Q?0Emxk0aHVQ1IfJ1kRGUlPLoUR4tJmX3wJdUFPKYujfRPY/YRgffbT+z8s/Ui?=
 =?us-ascii?Q?vEc7adTiU2h4QUmZuVFMsatIo6oadrhQpm8T?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:28:52.1417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a81de05-cbd5-40f8-e2a2-08dd816f54ea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410

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

