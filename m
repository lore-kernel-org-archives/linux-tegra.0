Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061B737D12E;
	Fri, 23 Jan 2026 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162099; cv=fail; b=E6eG38Aw4cHxxztaphdI61jo54LcswHITmAfsUpNyqdCCm2q1BpFgvx9J2WIucQct+RSXi+PaokPQH2nzJTX8vf6M0syF5AkKT9mmKBHOjUfnsTHfeHzU2Jm7xPxAr3OP8CN7bmhPTF6Hz8bs1vuHsD4UlPULlqptEm1nm9Qg1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162099; c=relaxed/simple;
	bh=6rh2Q/UowGFx9TClUbRKYFxU9yabHLAHOVO0ci/5ByI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLMiyp6vuH+Q8u3UGxVruLYcMvbN0wjUTyJsRTcCG+2rfTXrZY/OH89nkVVUMxfjvSm/sNGod8ZeGFCq5lX5ken7b+HENvas6yR90FZUPcl/PdvasqMe1Wqv9R2vwNKShcVeIHqzUieGS8jQsCIadLoZVrgL5yRKQl6k9/AbRm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gyn37w87; arc=fail smtp.client-ip=40.93.194.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gyn37w87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdFZWkWIf3mGfP8FJo+uhR3nQPiXNlXm8Eh204kz8D06tLt4TPKzMJjp2gTO7uWq+cbIFuNL05cb+7s4F4M0tl7onh9HFS4+WEyjpxUMfw3oSjrAs09zKDAXk7sbh+8LMiAGK+kPbpHkPvTlTRHpmm8yQhQ0aVUSTxY/12+ssmtbV344/sGyd41XoGKgkMYmNUsQaoURm/6wwhZTCZxV6+UzhZydTrCe3q3JF9756eSDBC8QoxqVbtBIaBOzltr0EMu+Ubcnzv5qlRTO8BKpL/tg88brWotpN5O0tCu1kjGOobTTJf+aDCjtMH7HNru7huMrKc+1wqRqXITHDxGFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGEuGdaUz35kC4h9+kVm2nRxMqx47U05NOppUV4TJtw=;
 b=VRPntPTaLE2jETfu6T0+rNDnyXejwVOmL6utnuhoOuJDj2F4fKSXa6p/7FdgedqoCtQvVBnWVxf19o9vixwgJK1k0y8/PneK2woNMcY9a6/k2RdjKewD4DUxpjeAhDkXzCqALMQOEjbYsiYP7SpmnVu8XeXpU+JACL9oSxZJq4v3XikL6nlY0Iq3Xilk33XBqz6OrWQVqRw6AQWoRIvvjByZfqRT9mLXYE+/imNo+EkN5++r+9fqvovGDQLXfcVTmJIektPWPnNwpnRlnTkV+GNXNftealHzgMQgPklgZ2eRJqjImkTzpbnLsqK00qi7MryGV431TxT2T1ihhTuPGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGEuGdaUz35kC4h9+kVm2nRxMqx47U05NOppUV4TJtw=;
 b=Gyn37w87Y0Iuvo+UdU4DBVY0nTKGgQ/DyiH2UdqNqsXMRIzsHcL88m2JO9f45jbY1b6OopN8ZcbNKotbiSTd53o1NMxcnHkIpeRwGK+g7Rj3BdMVMWAnZ9JDPCUEH7SKN7KSQjVJ9YOuZ6OhLBoUYWNTK8Lk72ZJ/oTqsvDjrRqb/6jeNLSO2T85LmeSjmi7QhrsOjmxx5z7jSRLt91khNxmSTlc1zrv3TX51lVjrNU3AgxRBghVyff66zYA5rVrZ9lGvmnWRLTyoGyL6x8JfZUuoit0cDLVdVFw1jS4lT+sxNXOkh9CtPefPSOkIMI1UJmgKV74hHs0ez/fbzfnYg==
Received: from BN9P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::31)
 by IA0PR12MB8206.namprd12.prod.outlook.com (2603:10b6:208:403::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 09:54:40 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:13e::4) by BN9P220CA0026.outlook.office365.com
 (2603:10b6:408:13e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 09:54:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 09:54:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:54:26 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:54:26 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 01:54:22 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Sander Vanheule <sander@svanheule.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan kumar <mkumard@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [RFC PATCH v3 3/4] ASoC: tegra: set reg_default_cb callback
Date: Fri, 23 Jan 2026 15:23:45 +0530
Message-ID: <20260123095346.1258556-4-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123095346.1258556-1-sheetal@nvidia.com>
References: <20260123095346.1258556-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|IA0PR12MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: a146d0fd-0963-4bf2-9153-08de5a656cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dmfm38JqU8GICIVZPuqZy/IXr/9S4L+dtcUzdJxYclDNtlL7vQp/CdbMQTHY?=
 =?us-ascii?Q?qr3kgzNntB9JbF2A/0q58it1OkQFmGi1VEY+JtxoRKMC7+DR2wHpfuQWJRSZ?=
 =?us-ascii?Q?dMT6/qULLdOcRq+hiZHrIkjD0M1/a28GaZpDVe7VVYosTHVzbPz5uYOf44Bn?=
 =?us-ascii?Q?TVdpJS1o8XFljCWbDPo1JXtG3DAr2BFz6N+A4mUhMZHKmRbncUK3qsuc2J3A?=
 =?us-ascii?Q?opu8thN0fERit23oiM45ngw/exNK/RGHpoNvEoiZFW9PF7VMIfLfiZERhB+R?=
 =?us-ascii?Q?ah+TXTB9ecSExvWB9yQIgDAzK1USKpJxBiGeygKK4yFPNvxhpLCBP6KjY3c1?=
 =?us-ascii?Q?y1sigJBRUZ8Aq3lV2xMgsAWhuAJEZgdOQ5bOK+7gqWjnzQvAUjvVnKG8x+ea?=
 =?us-ascii?Q?U6YZazMi18SpPPUI7PIP1MEuuDYB5NkDGls8ZXtdm2mPD0tGh22CTWWUlmdf?=
 =?us-ascii?Q?fBmFnjOJ/SWg+x78bWBu7jETY1Q+WsLMTYJ6hhPf02en2dZedEtX9HWrhvYb?=
 =?us-ascii?Q?AzcgrcEbXGYdVqPtd2PFU4uC9vDWuiUxbn/JaAKZxnPF9RdPnnuHlQiMed/P?=
 =?us-ascii?Q?KGxaTOSFu9Yb7oduy6Q30BQoGl6roR1b8w/GE4Bl/OtYDj3I4GQ4BxEwASo8?=
 =?us-ascii?Q?pX77tvi/gSIw3gy0DJV86uauqdMsK75YaRegumj1txa6d/OFWTi86OdZVRYA?=
 =?us-ascii?Q?jiX0lISXM4KtnLZGN12/5ZFnT7RDptckE7Y8+lW3LA6UC+musFCHEcswEOZ9?=
 =?us-ascii?Q?57rTABRk5Q0gtEDq+W6wxgk15pqsY/NsBjWjHxTJFEygtCySBzMrOK9hTUfn?=
 =?us-ascii?Q?fOdV/5I6JwrRdbNaNYsayjWsN2yJ0OC1EOfN24OxoE+XI2RzslQP+aWiaHo+?=
 =?us-ascii?Q?T5C1hR3mvs1tGt/1Ph+yvnvUT545NRNKTe2vmLD0+Xvkf0EuerOmZLZK35n4?=
 =?us-ascii?Q?nYkze6kYtJoe8ne47UVctFKwyQ1tMcjZ+1wJdauuZXwv6PIG5TIGRLrlhFRg?=
 =?us-ascii?Q?cHbDxfDWFS0sSW1GafexlMqjtcWqLFwl8Gdwna/41wxotJeBcx8eOW/gSjNC?=
 =?us-ascii?Q?YXB1Xjieht3yVJwaOXLyFspcF1PMobIDwCgmtzqNGq2hhYcXbCnjBW0DdUSx?=
 =?us-ascii?Q?QYye2cF+x/V3VDIVyjx+E+BqAqXJBWZDrPf0hXCniKF9wW0q9AZZQZhQfqdP?=
 =?us-ascii?Q?/Od0VzQhmHRovpEz9MEX3q5R8CKvU3J232wOYCRuEpMQG36ysd7wq+Wkls19?=
 =?us-ascii?Q?MMwVKwzTkLMXcteN+n4MId3RwSMJb6yPMsq2mjDrZs0ydHje6QO6I/jmE7z1?=
 =?us-ascii?Q?Tv8uEzOEQ7OtrMRw4txb8KiLjeznzutn5T/7vtzN8xnwvygpiMw2TpnqvMCf?=
 =?us-ascii?Q?nHW5JluK/VkPTPW4iS8VzrhRjw5Vdb05JFm/X+G8u/FaI3yeE1B7eN58TSSx?=
 =?us-ascii?Q?TWBzqgtCF7gmB0TJNaVSUb/jksE5AlAMjJq+nRvx2umELIQxuNlqyBC3oifj?=
 =?us-ascii?Q?Qzdb/WB3GQNsSQK937zosJm7INWwKtSrZgCWtwwCNFKupxdeY9xMyPvFvvhD?=
 =?us-ascii?Q?ujnBvcyx5Rzy+t4uoiRNMIExbJuw1fDoXNlKKfz1FRYfYh15xEDDQvgE3Fs3?=
 =?us-ascii?Q?b6DJGhkgixmvlxxO3Q9HmemRe42gWoJ0zx+XGk5ya2qQe3OnvtL6SB021UCf?=
 =?us-ascii?Q?Zmirqw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:54:39.7473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a146d0fd-0963-4bf2-9153-08de5a656cf3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8206

From: Sheetal <sheetal@nvidia.com>

Set reg_default_cb so REGCACHE_FLAT can supply zero defaults without
large reg_defaults tables, simplifying cache initialization for
zero-reset registers.

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
index 2c0220e14a57..d2a5ec7c54cc 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -950,6 +950,7 @@ static const struct regmap_config tegra186_asrc_regmap_config = {
 	.volatile_reg		= tegra186_asrc_volatile_reg,
 	.reg_defaults		= tegra186_asrc_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra186_asrc_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index a762150db802..8816e4967331 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -467,6 +467,7 @@ static const struct regmap_config tegra186_dspk_regmap = {
 	.volatile_reg		= tegra186_dspk_volatile_reg,
 	.reg_defaults		= tegra186_dspk_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra186_dspk_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index f9f6040c4e34..0976779d29f2 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -241,6 +241,7 @@ static const struct regmap_config tegra210_admaif_regmap_config = {
 	.volatile_reg		= tegra_admaif_volatile_reg,
 	.reg_defaults		= tegra210_admaif_reg_defaults,
 	.num_reg_defaults	= TEGRA210_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
@@ -254,6 +255,7 @@ static const struct regmap_config tegra186_admaif_regmap_config = {
 	.volatile_reg		= tegra_admaif_volatile_reg,
 	.reg_defaults		= tegra186_admaif_reg_defaults,
 	.num_reg_defaults	= TEGRA186_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
@@ -267,6 +269,7 @@ static const struct regmap_config tegra264_admaif_regmap_config = {
 	.volatile_reg		= tegra_admaif_volatile_reg,
 	.reg_defaults		= tegra264_admaif_reg_defaults,
 	.num_reg_defaults	= TEGRA264_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 6c9a410085bc..95875c75ddf8 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -625,6 +625,7 @@ static const struct regmap_config tegra210_adx_regmap_config = {
 	.volatile_reg		= tegra210_adx_volatile_reg,
 	.reg_defaults		= tegra210_adx_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_adx_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
@@ -638,6 +639,7 @@ static const struct regmap_config tegra264_adx_regmap_config = {
 	.volatile_reg		= tegra264_adx_volatile_reg,
 	.reg_defaults		= tegra264_adx_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra264_adx_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index fc5892056f83..43a45f785d5b 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -2133,6 +2133,7 @@ static const struct regmap_config tegra210_ahub_regmap_config = {
 	.reg_stride		= 4,
 	.writeable_reg		= tegra210_ahub_wr_reg,
 	.max_register		= TEGRA210_MAX_REGISTER_ADDR,
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
@@ -2142,6 +2143,7 @@ static const struct regmap_config tegra186_ahub_regmap_config = {
 	.reg_stride		= 4,
 	.writeable_reg		= tegra186_ahub_wr_reg,
 	.max_register		= TEGRA186_MAX_REGISTER_ADDR,
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
@@ -2151,6 +2153,7 @@ static const struct regmap_config tegra264_ahub_regmap_config = {
 	.reg_stride		= 4,
 	.writeable_reg		= tegra264_ahub_wr_reg,
 	.max_register		= TEGRA264_MAX_REGISTER_ADDR,
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index c94f8c84e04f..bfda82505298 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -654,6 +654,7 @@ static const struct regmap_config tegra210_amx_regmap_config = {
 	.volatile_reg		= tegra210_amx_volatile_reg,
 	.reg_defaults		= tegra210_amx_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_amx_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
@@ -667,6 +668,7 @@ static const struct regmap_config tegra194_amx_regmap_config = {
 	.volatile_reg		= tegra210_amx_volatile_reg,
 	.reg_defaults		= tegra210_amx_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_amx_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
@@ -680,6 +682,7 @@ static const struct regmap_config tegra264_amx_regmap_config = {
 	.volatile_reg		= tegra264_amx_volatile_reg,
 	.reg_defaults		= tegra264_amx_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra264_amx_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index 66fff53aeaa6..93def7ac4fde 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -483,6 +483,7 @@ static const struct regmap_config tegra210_dmic_regmap_config = {
 	.volatile_reg = tegra210_dmic_volatile_reg,
 	.reg_defaults = tegra210_dmic_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(tegra210_dmic_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type = REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index b91e0e6cd7fe..d8e02f0a3025 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -997,6 +997,7 @@ static const struct regmap_config tegra210_regmap_conf = {
 	.volatile_reg		= tegra210_i2s_volatile_reg,
 	.reg_defaults		= tegra210_i2s_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_i2s_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
@@ -1044,6 +1045,7 @@ static const struct regmap_config tegra264_regmap_conf = {
 	.volatile_reg		= tegra264_i2s_volatile_reg,
 	.reg_defaults		= tegra264_i2s_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra264_i2s_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_mbdrc.c b/sound/soc/tegra/tegra210_mbdrc.c
index 09fe3c5cf540..6a268dbb7197 100644
--- a/sound/soc/tegra/tegra210_mbdrc.c
+++ b/sound/soc/tegra/tegra210_mbdrc.c
@@ -763,6 +763,7 @@ static const struct regmap_config tegra210_mbdrc_regmap_cfg = {
 	.precious_reg		= tegra210_mbdrc_precious_reg,
 	.reg_defaults		= tegra210_mbdrc_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_mbdrc_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index ff8e9f2d7abf..6d3a2b76fd61 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -608,6 +608,7 @@ static const struct regmap_config tegra210_mixer_regmap_config = {
 	.precious_reg		= tegra210_mixer_precious_reg,
 	.reg_defaults		= tegra210_mixer_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_mixer_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 779d4c199da9..6cdc5e1f5507 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -699,6 +699,7 @@ static const struct regmap_config tegra210_mvc_regmap_config = {
 	.volatile_reg		= tegra210_mvc_volatile_reg,
 	.reg_defaults		= tegra210_mvc_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_mvc_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index 27db70af2746..a440888dcdbd 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -297,6 +297,7 @@ static const struct regmap_config tegra210_ope_regmap_config = {
 	.volatile_reg		= tegra210_ope_volatile_reg,
 	.reg_defaults		= tegra210_ope_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_ope_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_peq.c b/sound/soc/tegra/tegra210_peq.c
index 9a05e6913276..2f72e9d541dc 100644
--- a/sound/soc/tegra/tegra210_peq.c
+++ b/sound/soc/tegra/tegra210_peq.c
@@ -306,6 +306,7 @@ static const struct regmap_config tegra210_peq_regmap_config = {
 	.precious_reg		= tegra210_peq_precious_reg,
 	.reg_defaults		= tegra210_peq_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_peq_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index d6341968bebe..b298bf0421b1 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3569,6 +3569,7 @@ static const struct regmap_config tegra210_sfc_regmap_config = {
 	.precious_reg		= tegra210_sfc_precious_reg,
 	.reg_defaults		= tegra210_sfc_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(tegra210_sfc_reg_defaults),
+	.reg_default_cb		= regmap_default_zero_cb,
 	.cache_type		= REGCACHE_FLAT,
 };
 
-- 
2.34.1

