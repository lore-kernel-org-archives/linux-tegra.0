Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEB320DD51;
	Tue, 22 Apr 2025 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314728; cv=fail; b=UFhNWsKx2rBPr4zryM15r5Y2KGXYqBZm8Em8BjbkRUelzD/ejJzIrw4LWvx4lty7m/NYBYZlytei6uNLmcODjM+brrO7YROV0gKRXcSDLyzk4n/vST3JV+Z0hSVgqjdgtBX5YTX3geJigiP7I77FY+zAt9SHIrfqhzQuFBw17LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314728; c=relaxed/simple;
	bh=MLC6bdXDzpiI2eQ5Uo7heoO2WhzKEnGD7PMyLu53N/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EcsCuuWMMf9ucQXkVaIw8kBFoGrPGRzZjTwoaKtDkmdyLvKY3l032E2ovFe+QovykFv8vZ4AyxKvVrO1hGx5IxHE4hHdPXtQ9xzuo1GTAcwZtt+NrJ+vTOVH7UvwMgnbNafza4rZoVVP8MFmbI2y0kB+hTexrwZTar/gWlRRbCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dmJworY/; arc=fail smtp.client-ip=40.107.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dmJworY/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nC8tkgEGN1KxuHIhoFhXDd8Fc1+MqjNLUQc2J76PPTl/JaiGvQiwHJ9MgFsR+JJnKK2hI5MyXCLfCYrJ56RQcm9tL1nugawSvkCPvYZig3zAzdZo7QQezZ3rrjdR+coen+eiNVb4cOBMJLv8QjN8ue1fehDYL53KHrOLtsspabKduahdHO8WuCz/YNjerfNI137cswzRVXhtAz84N5a5MeqAq7hlRjv/m0298fY/PKbULPz49JRpOqC3zWKW+umeKVX23UqotkXHkQURwO7JqfhuEQD9Dyvh8ICCmKAP3EI8zalDAwdeWUP4MbvbsVVlxhMQepbiZKphypM5kR+CEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eUHun06chheCX4UOHyPy7AE7HHYhWHElO0RVg3Z+PU=;
 b=etH1YiCfSIHJdrIfaj9EPO3yvEwUfrnFPZcZ9OGPwmr22iYP+58yT5yCvMKUcMh8HQJHu+Axfyu2DP+1tZ5sUogo/d42Yf8EvwVNWDEeBYPr2yu1g/vs3Rs5k0dVROUYbSd+coFEVSJMhXF20qt1NUYBPDnMReBuIynM3sgMf1vwPaNXAEaywD4G/0KAR4RGA+K9O6UM8GkpLIocJla3X2PXhtp38KvG+bx2/yH5h3decTa9sbBHOGULXwLhLNMnQIoT7T4basF9Shj2m1f6iRsuF4eSpvou9SReg6ti5TJezBPecsF9Jthy0FJV0UHg2ryJfKLtWCFmrUnyfgLaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eUHun06chheCX4UOHyPy7AE7HHYhWHElO0RVg3Z+PU=;
 b=dmJworY/UxdnvI7RQcPBBmwMwOyOzcZvdQO7y+fJme0tdbmWo1MN5uLPq5y5kHhhZ7RJXOgqA/KTbZuIoz5r6aBnud/Wo+Y3v/MbhggaY5gOfjO6g41n4+xNgBoiRxCcz1tlLtnZ/J41ealUtSjZAYNRkNdwPy+7NZGXus7HDVIQjPYPgjVoEV+6eFvQZkfJGTFli1ZAaJuts9uzRBf9woWWINwiGaCNy+nxUrcoGDKGD2YyXJJAnLnkOthwyegJJxjO55ObllVqaTTSXcqZRwg4XIJoa4VQbYA2BjZGy8UUGMTLj1mrAZ2GASmALxdlBAcqEKrsT58DRYmnT0J6SQ==
Received: from MN2PR06CA0021.namprd06.prod.outlook.com (2603:10b6:208:23d::26)
 by DS0PR12MB8444.namprd12.prod.outlook.com (2603:10b6:8:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 22 Apr
 2025 09:38:36 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::d2) by MN2PR06CA0021.outlook.office365.com
 (2603:10b6:208:23d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 09:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 09:38:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 02:38:19 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 02:38:19 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 02:38:19 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [RESEND PATCH 03/10] ASoC: tegra: ADMAIF: Add Tegra264 support
Date: Tue, 22 Apr 2025 09:38:08 +0000
Message-ID: <20250422093815.506810-4-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|DS0PR12MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e096c4c-f8e2-4cfd-2bc9-08dd81817434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5jkvB9/RBP2gL4IwbXGgXIfHjpo0TRYgZLTJRlrSaoLCdAalDcRGUgIUi6hS?=
 =?us-ascii?Q?5L89F2PhOIETNyMDkwofOQKa0j2J3C5+zhow1SsFHCLD+96m+x3T/j2vHROc?=
 =?us-ascii?Q?f6q2tOE9fLUxir/bXFUPMKdJdd5DxN9ofZIYKNPecY164tw1d72XaTAUrE4E?=
 =?us-ascii?Q?Fu8OjxNn6iX95+CtSfLuDF2AeVPaaY44oPRrnBkHnuiOVxop6S6OCe/shItA?=
 =?us-ascii?Q?ACL8PY0hOqFLpz97ltEuC7AvxQyKPVqCO3OKUv7QX3bx2Bd3AqGllvIhmYnv?=
 =?us-ascii?Q?NvWK08gL7132Vfn2NPfH2GzITDg47HYD0cE7T8mw7OsE1qGQaku5wMALavNn?=
 =?us-ascii?Q?fzPKKzioLyVnM3Rhbs8FPYmHJLDAjfdXDRk8lo8qGhbV5wCUH/I+dD30E5lA?=
 =?us-ascii?Q?lIOrYAEUg+2zARRst4jnb/xaZJlFL32E1Pe/6RWjHo10SryXoEB4fYecu9cJ?=
 =?us-ascii?Q?+GT9BMOeGJMKZ6NzUHKPWCS8XFRKnMSD98LmG0JXl02+HEy/IK+vGV1Jrk1G?=
 =?us-ascii?Q?0fsZYnzzVLM10BwYwssc3f5CfuBJNo9z0cVI8200zsbSykEYwIhI8+Y0OZu3?=
 =?us-ascii?Q?zJn/74IUpX26cDb8XZotCm/Ot++WsMIV0YMtwW0jDU4el3oFpxAtk9/xm9IR?=
 =?us-ascii?Q?6TLwtBleFaxQUG+HZy8+0sRSZdQD8K/AT4fFqGrsRuSgSbEeXexNDBYDzBci?=
 =?us-ascii?Q?ntNMFUIW0jV9v5wIkThnidJiMkALT4Cp1cVFHi6MSJp2MEchEpcmpKh2c00l?=
 =?us-ascii?Q?59lGc7Jol0GmItN4MyhdzLupSbIoFsRsOfePlvfMYaKeT+IryazUy7LHwlkX?=
 =?us-ascii?Q?PrGdfMzDbkWzxm57mV7DQjMNKrvx6rX4EZ5SDAVdHzkXex0nnj+oos7y6OPS?=
 =?us-ascii?Q?/Kx5hTbGcQDwenweg9PkQlvUjDABrHSSyhC65QF/dtxH8L0EtOCRTFKiKjRq?=
 =?us-ascii?Q?jJacRSpv5DMK7TrKQe4ntiBzCRSFoXVXMXHVoEBmttZyT3vImPeGDfA8I92K?=
 =?us-ascii?Q?Lxnr4heoP0tBHdtCd9etLkMn9cZlSlgr38+HiXG+9FSu1kct1q6dFTxclL1k?=
 =?us-ascii?Q?fzF2Brgr1JMlS4Z/VqMLH91zYCJ9s8Ay4UhO7iRzvUeurSiVdU7+EvZ85o/U?=
 =?us-ascii?Q?fYZzIB7cHqwp6eCMwwPWrnTJKUdByJRTrCgESPkHRZYkpxOvfxprvcDX7v47?=
 =?us-ascii?Q?G7QUbZIgy2YCDuPB7AeGSMDnbQoDG0NpEv0OFkkzZQvW1FkvSs2iTMY5CbmQ?=
 =?us-ascii?Q?t/44QZboEqPnmshSpkoOTgaa5Tp9pdEybxzTxwdrQFy/rGFk/3udWtfm2Mk+?=
 =?us-ascii?Q?hs3xnG7uldHfD1hGQkFBTUiELZihSxmofOBKjLpYtWOv40gzdxys8IkAXISE?=
 =?us-ascii?Q?OCnCl9T4ANLrrn+s8wzgXdJNC9HCMnwyGTLqbC4K/UxWwyT8gG3w9da88nmS?=
 =?us-ascii?Q?HoTxL29Cp7JdDMv0dY0bpMC2s7T04gS95qXmwBk5QAI+IJwzEz7VExWSbJF2?=
 =?us-ascii?Q?ASHs+soVGx3BwBeALvM+h6qMtzYkRGw87xAQ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:38:35.4636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e096c4c-f8e2-4cfd-2bc9-08dd81817434
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8444

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

