Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021B273D75;
	Tue,  6 Jan 2026 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708565; cv=fail; b=JYkvuSnoLZXxUx7wF0fzD0e9jJwequhR8uhOSTQksQ16vaw/cK/WN8hO5eBidKnfuODXT2Ujwk6gvJIHjNSXeaozZh3MT5U9dunMpS8BuDKpwsb2Y37/mHF579OjEiZ7aFhbi8yE4s6b9yG90ky/sbQBVEhs0x4cjj9zHTNtmWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708565; c=relaxed/simple;
	bh=am+UAYJyM40xYpOGxRoaq26suLyPsWFblUR3WC08qYo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ybxqs7s9btSLs6b5Rfv2ojL2eso4eAzSt1+lxvUEvCkOuLqgFeTsc1eZ1YrxHeePH58D1X4fbfaxT9Y4229kxmIdsBUtO5Xvno0FdnNd1mEdr2t9YJdRRnVLhIED2PSh7ugktp1N1TgwSJRbSquPG3AnpNCBs+IptO74PVUmKh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IrITDoTY; arc=fail smtp.client-ip=52.101.48.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IrITDoTY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDVC5WdzMAurERf3LZQzzqWke5E0Snu26PLXtxpQPXFO20kLLXqRhJbjG3AMsFaIjIywM7jRjzcyZhXwwjPUAWR1c8AEQyuKAt8NsAfOOY/SvDB6Q1k0fjwr2ojthEs+83tHcsa9ATebuCIlmWN9/l5MlXKMjppM9Y7tu1QByuBjkDxkuL7CAtvz/m7dkjXIAAdn34+GXiHK6LbMIWHJYB+nqzrm1QzOZnA24fsl0NcgWsGIUzWAn0wZS75aQC2QJ9HZ8LX6UwuR3s1xi3P4Jyq48suPilgf8/tZ3mlimhBsMdr2SprjvE73VdRjjHyY1hb3uDfzzmR0tmpx/O06DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdI5rmW5x6FWBriYR5I5ZqF02w9A0s5aPNJI/PyOacA=;
 b=apreptE90HqiiJIS/lgorpyRzixz+jJSXKtJWvzgTDTsUP1fpYeyPqExj1Ua8rJsVS9qfL5fwgNq5e288ondY9OgoinbigAtBpJ2fJrWsFxBl6q6/WXsvtverqpeXb0xf1ThGWlyNbNcYaWYXMNPw4jfxMt4FRgwvF799IJgs7h5KBc4G3VIdP99b+lJUxzmw3tTs7vm5m+YHtN7UYq+yj0YZvRgOxstYCyzAuT+62+aGrpQCIAAtSXgcEsk7F0bwXhP/hOQUtCQFW0m5lWCD5slYbF/BkjSFnZjZAUW6zSHuj8AS4xB0L5R1uO3y5+FZHaql30VvUxqNlzA7pVM6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdI5rmW5x6FWBriYR5I5ZqF02w9A0s5aPNJI/PyOacA=;
 b=IrITDoTYyCxjR9e4/or7Tgml7HPBHoIQQcWidefylMfc/5UbeoJ8SX0wLWkb2lGamVqWzcs4JrkKuyi39ZuoDeNEJ0PCDivOc3NTTH6fs7s2rF4WxndaKO4Xa0GW0YBznCI1PoJBOFf3A0PoKs0oDHxyj0jjXcR/jPkeP088aca83KpwgtxEsY+ghRkpML87MDCH2awX569fMU0FYbLJhICQ7byuKEu2ikwEk81lKKx+n4e3V1WqfxvzX5HfbegbwpYBxuZOjEsKCxrH/K6WBEeXvorBUxYJMKxzBJoFHfWU3ByuRFGD+iEKhzGhJ09kFY415QRk3T0FousJXUL84g==
Received: from SA1PR03CA0007.namprd03.prod.outlook.com (2603:10b6:806:2d3::16)
 by SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 14:09:15 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::d2) by SA1PR03CA0007.outlook.office365.com
 (2603:10b6:806:2d3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Tue, 6
 Jan 2026 14:09:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 14:09:15 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 06:09:00 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 06:09:00 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 06:08:56 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Sander Vanheule <sander@svanheule.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [RFC PATCH 2/2] ASoC: tegra: Enable cache_default_is_zero for audio drivers
Date: Tue, 6 Jan 2026 19:38:27 +0530
Message-ID: <20260106140827.3771375-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106140827.3771375-1-sheetal@nvidia.com>
References: <20260106140827.3771375-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|SN7PR12MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: efd531ff-9ee3-4856-1c73-08de4d2d2cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U5vkPjlmS3wSgBk8s4blIsLUKsIoJmuZXRiFSUAeNBPLxunNV/kPiNgp18U5?=
 =?us-ascii?Q?q5S2rxelpJinlZtfdQRr83l/4F8XpaxijcHltAkDGpAla11aHQEbUSJj3Su5?=
 =?us-ascii?Q?AgiJcFAXijrjSl5ah6hCBCeCZZmKALGP7AgnRdtsxevt49N6ABSG4POwhj41?=
 =?us-ascii?Q?ZwTAzpfu/RIs6xjPZUn3J2bupQRLcW8QQqCrYWNb3f3BJA282zUS0f2rTb2k?=
 =?us-ascii?Q?QGIAZ/wMVzwNuwrjibhtCDNnOEPLKUEs032t4g5Yb7QVvu65Ug0z0yBEslnO?=
 =?us-ascii?Q?tNNCI7CoDISv2RmwpJyoIzXY+QIc9qik1dRLSbCcyzriv68aAAV/uAKaQzfa?=
 =?us-ascii?Q?LSaHo7BoKOXu58PNA8VESUKe5OaLtM+7ba84DOFzPZVhlpWBNa4YSegsHsDm?=
 =?us-ascii?Q?HyeQ5jzVC6V07+h1TwVFeYGxcqwwQ6lFQ1dlvuorarll7TNpftGuG08GLev5?=
 =?us-ascii?Q?FzWOoR89KeezYJro1YDk8HBaHtHzkqaG/VAumsvaR2UhrPOWLbKw1s5j3pRi?=
 =?us-ascii?Q?H2o2ZJpM66ZXRxcxyUMGWctKUwWLw42vtn6J13C0n+E5g6Cy061gf/ZdAJq6?=
 =?us-ascii?Q?cYjfrHea7tsaFgbi1GL44k0KaZL6mJDfbs8aDAb0SznljMftP6bN5pCMRoKK?=
 =?us-ascii?Q?4Da0W0CyEWh9bjOfwFom34FWzZsJ3LEJ9Xk2PtDssQI0rFFdw+uOp6xwHTFy?=
 =?us-ascii?Q?8Wsvgn6YgtynL7aGcxbkosGkMvnNVoZVSKtJow2GLiyizl3MNOeQmHUxG+3Q?=
 =?us-ascii?Q?ZaVpKJAtpL9leC/aenpGgY0LFn+aPcWza/uj/igfI2R4CwVCvwQd+Lcd2B07?=
 =?us-ascii?Q?2CYRN0VE0Y6Gj1gUEEB/j7hKixidEfdvtpQt4Gm3VH2Fl0K21mSgSkYY1ayX?=
 =?us-ascii?Q?KUa9uFQnzcQK/5pA2APJOpAZ5waekHZO8o4aCYdjndL+jeyLgbgktcOO28Q2?=
 =?us-ascii?Q?UpYQmRi3tMwB9KRA1OR55B2diLppmjxb4CZrzaFAMQcYkQKsvaUVrJUQNrnT?=
 =?us-ascii?Q?OXgEzJeLnqKag7aNw8caQ0pPtPZGS7cKXR8k/Y4JJ528gp7Yh69dwvMKZzD9?=
 =?us-ascii?Q?pG7iP+iQAVhktwXeP+cT7zt7zPcw8Q3vLmjqlgLpDKK8x2ofIMAjbQEGF4Vj?=
 =?us-ascii?Q?MxknOy5ECXGwRo60nZC2YRPefRUPt+kOqcz/EEFmiy5O+4zZwDj+WDOPp0Ic?=
 =?us-ascii?Q?8ATExMiIkYTtXFH7n0biS4SadD+S0ConH5U8P90vnSqDUb9PoCs4Jke9bv0j?=
 =?us-ascii?Q?uSoNpVie1wFPZEQgn7aya8361piS5SXIPuKyUamAm867eCfqH0fKu2YH3nD7?=
 =?us-ascii?Q?ia/TJAEYUZmXGsY/VpJPOu9d7xmN2Kd4FLyFOgTzMAS6KWsKHDG3gzRZz/UT?=
 =?us-ascii?Q?ghyyGdApr5obe5ADjehb/cWhtinBZ5BT5/ezqcY1+EE0FJ47v37thKW5y14b?=
 =?us-ascii?Q?OmD/QnHATLNQo3qZnb3E4CeU4jpULSi/3RpghPCK7XpfjjIk0hMsmLhnsMDd?=
 =?us-ascii?Q?y77CIH1dWJzY7JwvcRK+4LMa56LBP0hAt+6v2aoe850IsiPAvlP31YykObjh?=
 =?us-ascii?Q?3IDK7zLlkKZHy+YnGq0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:09:15.3133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efd531ff-9ee3-4856-1c73-08de4d2d2cd3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8131

From: Sheetal <sheetal@nvidia.com>

Set cache_default_is_zero flag in Tegra audio driver regmap configurations.

Tegra APE hardware has numerous registers with zero power-on-reset
values. Use cache_default_is_zero to mark cache entries as valid instead
of adding all these registers to reg_defaults arrays.

This patch depends on:
https://patchwork.ozlabs.org/project/linux-tegra/patch/20251217132524.2844499-1-sheetal@nvidia.com/

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_asrc.c   | 1 +
 sound/soc/tegra/tegra186_dspk.c   | 1 +
 sound/soc/tegra/tegra210_admaif.c | 3 +++
 sound/soc/tegra/tegra210_adx.c    | 2 ++
 sound/soc/tegra/tegra210_ahub.c   | 3 +++
 sound/soc/tegra/tegra210_amx.c    | 3 +++
 sound/soc/tegra/tegra210_dmic.c   | 1 +
 sound/soc/tegra/tegra210_i2s.c    | 2 ++
 sound/soc/tegra/tegra210_mbdrc.c  | 1 +
 sound/soc/tegra/tegra210_mixer.c  | 1 +
 sound/soc/tegra/tegra210_mvc.c    | 1 +
 sound/soc/tegra/tegra210_ope.c    | 1 +
 sound/soc/tegra/tegra210_peq.c    | 1 +
 sound/soc/tegra/tegra210_sfc.c    | 1 +
 14 files changed, 22 insertions(+)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 2c0220e14a57..2f3382a674e7 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -951,6 +951,7 @@ static const struct regmap_config tegra186_asrc_regmap_config = {
 	.reg_defaults		= tegra186_asrc_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra186_asrc_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct tegra_asrc_soc_data soc_data_tegra186 = {
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index a762150db802..84c54e710cff 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -468,6 +468,7 @@ static const struct regmap_config tegra186_dspk_regmap = {
 	.reg_defaults		= tegra186_dspk_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra186_dspk_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct of_device_id tegra186_dspk_of_match[] = {
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index f9f6040c4e34..bb2f42560065 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -242,6 +242,7 @@ static const struct regmap_config tegra210_admaif_regmap_config = {
 	.reg_defaults		= tegra210_admaif_reg_defaults,
 	.num_reg_defaults	= TEGRA210_ADMAIF_CHANNEL_COUNT * 6 + 1,
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra186_admaif_regmap_config = {
@@ -255,6 +256,7 @@ static const struct regmap_config tegra186_admaif_regmap_config = {
 	.reg_defaults		= tegra186_admaif_reg_defaults,
 	.num_reg_defaults	= TEGRA186_ADMAIF_CHANNEL_COUNT * 6 + 1,
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra264_admaif_regmap_config = {
@@ -268,6 +270,7 @@ static const struct regmap_config tegra264_admaif_regmap_config = {
 	.reg_defaults		= tegra264_admaif_reg_defaults,
 	.num_reg_defaults	= TEGRA264_ADMAIF_CHANNEL_COUNT * 6 + 1,
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static int tegra_admaif_runtime_suspend(struct device *dev)
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 6c9a410085bc..dd6261a0442c 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -626,6 +626,7 @@ static const struct regmap_config tegra210_adx_regmap_config = {
 	.reg_defaults		= tegra210_adx_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_adx_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra264_adx_regmap_config = {
@@ -639,6 +640,7 @@ static const struct regmap_config tegra264_adx_regmap_config = {
 	.reg_defaults		= tegra264_adx_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra264_adx_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct tegra210_adx_soc_data soc_data_tegra210 = {
diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index e795907a3963..4cf21a9aca32 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -2078,6 +2078,7 @@ static const struct regmap_config tegra210_ahub_regmap_config = {
 	.reg_stride		= 4,
 	.max_register		= TEGRA210_MAX_REGISTER_ADDR,
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra186_ahub_regmap_config = {
@@ -2086,6 +2087,7 @@ static const struct regmap_config tegra186_ahub_regmap_config = {
 	.reg_stride		= 4,
 	.max_register		= TEGRA186_MAX_REGISTER_ADDR,
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra264_ahub_regmap_config = {
@@ -2095,6 +2097,7 @@ static const struct regmap_config tegra264_ahub_regmap_config = {
 	.writeable_reg		= tegra264_ahub_wr_reg,
 	.max_register		= TEGRA264_MAX_REGISTER_ADDR,
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct tegra_ahub_soc_data soc_data_tegra210 = {
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index c94f8c84e04f..0a9402102ba1 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -655,6 +655,7 @@ static const struct regmap_config tegra210_amx_regmap_config = {
 	.reg_defaults		= tegra210_amx_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_amx_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra194_amx_regmap_config = {
@@ -668,6 +669,7 @@ static const struct regmap_config tegra194_amx_regmap_config = {
 	.reg_defaults		= tegra210_amx_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_amx_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra264_amx_regmap_config = {
@@ -681,6 +683,7 @@ static const struct regmap_config tegra264_amx_regmap_config = {
 	.reg_defaults		= tegra264_amx_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra264_amx_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct tegra210_amx_soc_data soc_data_tegra210 = {
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index 66fff53aeaa6..d87f29ce1daa 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -484,6 +484,7 @@ static const struct regmap_config tegra210_dmic_regmap_config = {
 	.reg_defaults = tegra210_dmic_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(tegra210_dmic_reg_defaults),
 	.cache_type = REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static int tegra210_dmic_probe(struct platform_device *pdev)
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index b91e0e6cd7fe..0dc853645905 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -998,6 +998,7 @@ static const struct regmap_config tegra210_regmap_conf = {
 	.reg_defaults		= tegra210_i2s_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_i2s_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 /*
@@ -1045,6 +1046,7 @@ static const struct regmap_config tegra264_regmap_conf = {
 	.reg_defaults		= tegra264_i2s_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra264_i2s_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static int tegra210_i2s_probe(struct platform_device *pdev)
diff --git a/sound/soc/tegra/tegra210_mbdrc.c b/sound/soc/tegra/tegra210_mbdrc.c
index 09fe3c5cf540..83906e484343 100644
--- a/sound/soc/tegra/tegra210_mbdrc.c
+++ b/sound/soc/tegra/tegra210_mbdrc.c
@@ -764,6 +764,7 @@ static const struct regmap_config tegra210_mbdrc_regmap_cfg = {
 	.reg_defaults		= tegra210_mbdrc_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_mbdrc_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 int tegra210_mbdrc_hw_params(struct snd_soc_component *cmpnt)
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index ff8e9f2d7abf..c8157388ad70 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -609,6 +609,7 @@ static const struct regmap_config tegra210_mixer_regmap_config = {
 	.reg_defaults		= tegra210_mixer_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_mixer_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct of_device_id tegra210_mixer_of_match[] = {
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 779d4c199da9..f3a5048dcf7a 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -700,6 +700,7 @@ static const struct regmap_config tegra210_mvc_regmap_config = {
 	.reg_defaults		= tegra210_mvc_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_mvc_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct of_device_id tegra210_mvc_of_match[] = {
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index 27db70af2746..c7ac94f0a711 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -298,6 +298,7 @@ static const struct regmap_config tegra210_ope_regmap_config = {
 	.reg_defaults		= tegra210_ope_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_ope_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static int tegra210_ope_probe(struct platform_device *pdev)
diff --git a/sound/soc/tegra/tegra210_peq.c b/sound/soc/tegra/tegra210_peq.c
index 9a05e6913276..8d4821a4cc58 100644
--- a/sound/soc/tegra/tegra210_peq.c
+++ b/sound/soc/tegra/tegra210_peq.c
@@ -307,6 +307,7 @@ static const struct regmap_config tegra210_peq_regmap_config = {
 	.reg_defaults		= tegra210_peq_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_peq_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 void tegra210_peq_restore(struct regmap *regmap, u32 *biquad_gains,
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index d6341968bebe..89208820d451 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3570,6 +3570,7 @@ static const struct regmap_config tegra210_sfc_regmap_config = {
 	.reg_defaults		= tegra210_sfc_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_sfc_reg_defaults),
 	.cache_type		= REGCACHE_FLAT,
+	.cache_default_is_zero	= true,
 };
 
 static const struct of_device_id tegra210_sfc_of_match[] = {
-- 
2.34.1

