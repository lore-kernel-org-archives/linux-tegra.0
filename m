Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012068.outbound.protection.outlook.com [52.101.48.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F1930DEAA;
	Mon, 12 Jan 2026 04:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768192289; cv=fail; b=lbeYoUbKKaiDUjzGWFS13oz9VnRCNf8SbGblZXmMVoCCVLfyW46ZRkKDm/ehBnlpGSa7RWrYXF/fbKPqkcqognbEUPUOrvTbfH6DwYYrymPoSEyBlYoTDkV+aHPz4tWuElMc+7eNJ1ZXfMX0ZuEzK4B82+JLaK3lxd69gOkBsfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768192289; c=relaxed/simple;
	bh=OAJqbQH7PJpwdqvIzv4Joc+3LtBXl0enmrsUwqjpTSA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qI+yWEA6EruMW9aL3Tcd4ZWysAGqPjDcByniKiZaaHbNi/afwzabIz5MnQYL/oMfl9xV7kLtF+Q5HSAQN9sqcd0VwOpqimpMWPmBP319sNzjTM4f3UC0h59pj0Lwwb2K7Sx4mu47saCBc/vEkOHHTId6U5rdCp1fQiiMpf8Cj90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tthUbkOg; arc=fail smtp.client-ip=52.101.48.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tthUbkOg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGqKyppYx2X9My3Wk/TlvdojdHhXDNYEz7TQi58POe+daw09soPo4gumT9rbkRbWrsmAYuCOLw0uvzXm0PMsZy6xcZNyZRoNfIyM9fiBzJwdfZE9yLMN2anJp/RviCxaFnCMwuYJTX3myyT0c1iFQMm163psL7RDGFTuOq2NZ8LjuryRan/oTIgtyd6aOU5VzmwTRCbFZ4NN8DqshAvuKRRQDWjM+A7SE1c4NpzTylbKwqpPHyRvSqDqg+AGd9gb/NHafd58RwV/GnRWf/XI2OdGNc8Vn5gd9MxYWPeLE9QSlg3HvOqm+g7hT+U2TqQSGaru8hR1c9YjztgoTw+lXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/JlBOSakJ6lHphY9xavIo62xqbDHbeLC3Oakq7NwW0=;
 b=CMZOLUxu430rqUaLQQIo77qSE5sRKIcYUrWT8oxZFIna8NXHUvBHdIpzuwcpbFm/a892nd0o/JuJkLSxH61vIbxOQzs2NTr9ZoAiUcTomJHvShRZLJ1m5Sa+gukCWT+bhDDi5NsAquQWlHLPtIoRZh4MN0z5iIsUfyYU5OAeeibunUR3htUO+d+21f23lafplFRgm5zqsUJ53EVvBjGwQqc1gzR9wlmitX0Cx9t18vr2f79lo9AwSMd2r6ApANwwMA63/Qsw7nuwTOUqJweJrUiPQOUP8+ppaiPa/JJqhRGQi9PbJnMKo9V2iSA2ItfYXv6TqXvNkNuuzp1Wc0gH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/JlBOSakJ6lHphY9xavIo62xqbDHbeLC3Oakq7NwW0=;
 b=tthUbkOg68zsiCf+KdgUCLhcue0pM0yWFgs3Hrnu5zyNl/AJlan8yTmsBvNEYQ6vd5IFuJEVMhEGM4g7piOnnXimZtCwIB2LqFkpynNJQ+nnOCOHmA/X2tlobP5DtntNMxZg8YRODoapdVdxlUgtp77pl//jdXFfaJisjNOJh3/1b+Y7ELCcgei8SRQcKiNOLubfivPoTOzNqUvGg1flgWHktrFLti3dWQPzJInmAMJZBATDaKuB3rsXKfOyUd/+YI/e2ktlN5kj8mhYMpNrZSMrfd+lVy6ngrneq9Vk1CuDTPPieVmvjpEit2mNbrN2tO2OSGDOiysDpNthGkhT8w==
Received: from SA9PR13CA0015.namprd13.prod.outlook.com (2603:10b6:806:21::20)
 by BL3PR12MB6521.namprd12.prod.outlook.com (2603:10b6:208:3bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 04:31:02 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:21:cafe::ad) by SA9PR13CA0015.outlook.office365.com
 (2603:10b6:806:21::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Mon,
 12 Jan 2026 04:30:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 04:31:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 20:30:45 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 20:30:44 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 11 Jan 2026 20:30:40 -0800
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
Subject: [RFC PATCH v2 3/3] ASoC: tegra: Enable flat_cache_default_is_zero for audio drivers
Date: Mon, 12 Jan 2026 09:58:41 +0530
Message-ID: <20260112042841.51799-4-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112042841.51799-1-sheetal@nvidia.com>
References: <20260112042841.51799-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|BL3PR12MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d9bc07-d1f0-4e56-7fb3-08de51936499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wgzhptv2MwcH12aZNb2TqDv8E4SvEA5c1E1Ea5bC5XKgc30bwWzZYewgbiLL?=
 =?us-ascii?Q?U80aPE4LWtptgn+oI/+z8ivPwcNmMk2eN6Gwq62W0Muwa0gQvXxaCSsWAnmK?=
 =?us-ascii?Q?xFQ5MRncnzqAzcCnolzLcaMqT3M7TmEmuaJ3ymrfZ3HdICaZKT26oxBgeh2m?=
 =?us-ascii?Q?c2coSKpjr3ZgWRAsW6EdPQ8i7twDmc9YFAc0sd7cp+oTR/ppNcZT5a4gQgQ3?=
 =?us-ascii?Q?Z81VrDWJqRgt5ai0qPgJ2LtbvQA3PsWhENgO4TSmqA10Lf5bBOktMqksJyhK?=
 =?us-ascii?Q?+CeCqL4oklkKV++B+4nr1S9OfIemKetGEOohx2QEyW3IdLaeABCfmDk5/k9M?=
 =?us-ascii?Q?8ci5B0zwflOTKQy6VN6teRPVIjQ/tq5QvOBIcG4FalgjsqhDUDxT81aaQUO9?=
 =?us-ascii?Q?00X5Cb1zTAJwIFyEBO7GZijqEmS6O3W49UGD1N1E0HgZEczflV89sTZLZj/3?=
 =?us-ascii?Q?vETfIkvvm96N+IgV1esnH7Dw+t2Fky8gtLQWjJbNKmm5/ul4SiL1oqHaS+1s?=
 =?us-ascii?Q?dA1TfSGYNwnsZiRxBKPRJuraHrbzoOLO70eBeCi4W1DLYfzYZI101EeuVAHT?=
 =?us-ascii?Q?1ZWbgcKFQFJMA+la4iyunyp/1NotQtiuQoHSPMZip+9PzpAVW5q3x9aOKfE4?=
 =?us-ascii?Q?qPmxRUNKYReuqN2DL5hySe8BzM2O3rgGnGLIk0GwZaAbs6dO9uHy416ha7Z0?=
 =?us-ascii?Q?plzW0MWRRlyxZLALtc8b2g4R5vdiNk8xA/08452MCDYp2C1Ai0+71+6JuNav?=
 =?us-ascii?Q?XiI9mSL9rq+QJjW1zG96Q8AVe8+hO2S8FAeiMOPBFocZAOBIJlHT71NHzBsF?=
 =?us-ascii?Q?p3kRk9vzBxQ1ZpkDWalsRT9NgHSOVJuXu4OAuPCt5aNomb2sVR29NTCD+isy?=
 =?us-ascii?Q?PYGq8bK1CjUwHKNNsUv5KNgg7ohocpdgkfVlwOEg+EBRo2Apv0uDIzM/Wtjy?=
 =?us-ascii?Q?uP6rJQIMTyXCN7M6EExoIqC6exqHB5lZc1QHST80KGFpOqj2ISlJgqbx4KuG?=
 =?us-ascii?Q?eNG+8ydlwJnHHmWOtpGXM8Cae9qB6vyfdAsHZMekyerJnJyUAZodItEUXt+c?=
 =?us-ascii?Q?2iSMVrU+hSHKjl8WoSWN62vqOiqfgJg91FnrF9fqG2lHsbD5PrnEUOy14nhn?=
 =?us-ascii?Q?7GotW2JZDHZwDEpZhGplamh73x8LDthYR7c07sANIyoUgeEkNGAOvxWmoR4r?=
 =?us-ascii?Q?HCwN1/1MCuUyfLZobF1Jw01YpOBgj0vByUHu91dRwX6mkAsY2VhS27OyAHXt?=
 =?us-ascii?Q?nzb1WVn6Q2obS9L5rUg8n+60GM+F/vY/NeRJ2k0Qrab5XkObzRzrSPPGlXkO?=
 =?us-ascii?Q?bP53bCBwE2Mu05kKi+Oeu8DuTaDy0ivdENQdKRpscuMaPQ2VIQ2Vo8lEgeh5?=
 =?us-ascii?Q?/wFkIjwUeenggHzE/QBflPkjkbZx1x8IxWtgx4Jnymh9iJy9IccllC6/NJUr?=
 =?us-ascii?Q?rXrCRiLgPOM/LoySf5k8eyJ7B3IVyo7gjLUy7eBQ0jE0dNgieFYbNb46mmrt?=
 =?us-ascii?Q?oQYfHpmInCu+ACUTeANlvTbDf+S9HQKXAaUdZVBZXa6tpUZHu8NjkX0gxeSo?=
 =?us-ascii?Q?esro8cfZS/uT7C7nQkg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 04:31:02.1636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d9bc07-d1f0-4e56-7fb3-08de51936499
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6521

From: Sheetal <sheetal@nvidia.com>

Set flat_cache_default_is_zero flag in Tegra audio driver regmap
configurations.

Tegra APE hardware has numerous registers with zero power-on-reset
values. Use flat_cache_default_is_zero to mark cache entries as valid
instead of adding all these registers to reg_defaults arrays.

This patch depends on:
https://patchwork.ozlabs.org/project/linux-tegra/patch/20251217132524.2844499-1-sheetal@nvidia.com/

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_asrc.c   | 21 ++++++-----
 sound/soc/tegra/tegra186_dspk.c   | 21 ++++++-----
 sound/soc/tegra/tegra210_admaif.c | 63 ++++++++++++++++---------------
 sound/soc/tegra/tegra210_adx.c    | 42 +++++++++++----------
 sound/soc/tegra/tegra210_ahub.c   | 35 +++++++++--------
 sound/soc/tegra/tegra210_amx.c    | 63 ++++++++++++++++---------------
 sound/soc/tegra/tegra210_dmic.c   | 21 ++++++-----
 sound/soc/tegra/tegra210_i2s.c    | 42 +++++++++++----------
 sound/soc/tegra/tegra210_mbdrc.c  | 25 ++++++------
 sound/soc/tegra/tegra210_mixer.c  | 23 +++++------
 sound/soc/tegra/tegra210_mvc.c    | 21 ++++++-----
 sound/soc/tegra/tegra210_ope.c    | 21 ++++++-----
 sound/soc/tegra/tegra210_peq.c    | 25 ++++++------
 sound/soc/tegra/tegra210_sfc.c    | 23 +++++------
 14 files changed, 234 insertions(+), 212 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 2c0220e14a57..5f95b7cb9421 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -941,16 +941,17 @@ static bool tegra186_asrc_volatile_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra186_asrc_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA186_ASRC_CYA,
-	.writeable_reg		= tegra186_asrc_wr_reg,
-	.readable_reg		= tegra186_asrc_rd_reg,
-	.volatile_reg		= tegra186_asrc_volatile_reg,
-	.reg_defaults		= tegra186_asrc_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra186_asrc_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA186_ASRC_CYA,
+	.writeable_reg			= tegra186_asrc_wr_reg,
+	.readable_reg			= tegra186_asrc_rd_reg,
+	.volatile_reg			= tegra186_asrc_volatile_reg,
+	.reg_defaults			= tegra186_asrc_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra186_asrc_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct tegra_asrc_soc_data soc_data_tegra186 = {
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index a762150db802..4183c8fc124f 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -458,16 +458,17 @@ static bool tegra186_dspk_volatile_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra186_dspk_regmap = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA186_DSPK_CODEC_CTRL,
-	.writeable_reg		= tegra186_dspk_wr_reg,
-	.readable_reg		= tegra186_dspk_rd_reg,
-	.volatile_reg		= tegra186_dspk_volatile_reg,
-	.reg_defaults		= tegra186_dspk_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra186_dspk_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA186_DSPK_CODEC_CTRL,
+	.writeable_reg			= tegra186_dspk_wr_reg,
+	.readable_reg			= tegra186_dspk_rd_reg,
+	.volatile_reg			= tegra186_dspk_volatile_reg,
+	.reg_defaults			= tegra186_dspk_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra186_dspk_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct of_device_id tegra186_dspk_of_match[] = {
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index f9f6040c4e34..5ecd83517413 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -232,42 +232,45 @@ static bool tegra_admaif_volatile_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra210_admaif_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA210_ADMAIF_LAST_REG,
-	.writeable_reg		= tegra_admaif_wr_reg,
-	.readable_reg		= tegra_admaif_rd_reg,
-	.volatile_reg		= tegra_admaif_volatile_reg,
-	.reg_defaults		= tegra210_admaif_reg_defaults,
-	.num_reg_defaults	= TEGRA210_ADMAIF_CHANNEL_COUNT * 6 + 1,
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_ADMAIF_LAST_REG,
+	.writeable_reg			= tegra_admaif_wr_reg,
+	.readable_reg			= tegra_admaif_rd_reg,
+	.volatile_reg			= tegra_admaif_volatile_reg,
+	.reg_defaults			= tegra210_admaif_reg_defaults,
+	.num_reg_defaults		= TEGRA210_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra186_admaif_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA186_ADMAIF_LAST_REG,
-	.writeable_reg		= tegra_admaif_wr_reg,
-	.readable_reg		= tegra_admaif_rd_reg,
-	.volatile_reg		= tegra_admaif_volatile_reg,
-	.reg_defaults		= tegra186_admaif_reg_defaults,
-	.num_reg_defaults	= TEGRA186_ADMAIF_CHANNEL_COUNT * 6 + 1,
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA186_ADMAIF_LAST_REG,
+	.writeable_reg			= tegra_admaif_wr_reg,
+	.readable_reg			= tegra_admaif_rd_reg,
+	.volatile_reg			= tegra_admaif_volatile_reg,
+	.reg_defaults			= tegra186_admaif_reg_defaults,
+	.num_reg_defaults		= TEGRA186_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra264_admaif_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA264_ADMAIF_LAST_REG,
-	.writeable_reg		= tegra_admaif_wr_reg,
-	.readable_reg		= tegra_admaif_rd_reg,
-	.volatile_reg		= tegra_admaif_volatile_reg,
-	.reg_defaults		= tegra264_admaif_reg_defaults,
-	.num_reg_defaults	= TEGRA264_ADMAIF_CHANNEL_COUNT * 6 + 1,
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA264_ADMAIF_LAST_REG,
+	.writeable_reg			= tegra_admaif_wr_reg,
+	.readable_reg			= tegra_admaif_rd_reg,
+	.volatile_reg			= tegra_admaif_volatile_reg,
+	.reg_defaults			= tegra264_admaif_reg_defaults,
+	.num_reg_defaults		= TEGRA264_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static int tegra_admaif_runtime_suspend(struct device *dev)
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 6c9a410085bc..de7f64bd5d75 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -616,29 +616,31 @@ static bool tegra264_adx_volatile_reg(struct device *dev,
 }
 
 static const struct regmap_config tegra210_adx_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA210_ADX_CFG_RAM_DATA,
-	.writeable_reg		= tegra210_adx_wr_reg,
-	.readable_reg		= tegra210_adx_rd_reg,
-	.volatile_reg		= tegra210_adx_volatile_reg,
-	.reg_defaults		= tegra210_adx_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra210_adx_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_ADX_CFG_RAM_DATA,
+	.writeable_reg			= tegra210_adx_wr_reg,
+	.readable_reg			= tegra210_adx_rd_reg,
+	.volatile_reg			= tegra210_adx_volatile_reg,
+	.reg_defaults			= tegra210_adx_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_adx_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra264_adx_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA264_ADX_CFG_RAM_DATA,
-	.writeable_reg		= tegra264_adx_wr_reg,
-	.readable_reg		= tegra264_adx_rd_reg,
-	.volatile_reg		= tegra264_adx_volatile_reg,
-	.reg_defaults		= tegra264_adx_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra264_adx_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA264_ADX_CFG_RAM_DATA,
+	.writeable_reg			= tegra264_adx_wr_reg,
+	.readable_reg			= tegra264_adx_rd_reg,
+	.volatile_reg			= tegra264_adx_volatile_reg,
+	.reg_defaults			= tegra264_adx_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra264_adx_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct tegra210_adx_soc_data soc_data_tegra210 = {
diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index e795907a3963..e67850dac18d 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -2073,28 +2073,31 @@ static bool tegra264_ahub_wr_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra210_ahub_regmap_config = {
-	.reg_bits		= 32,
-	.val_bits		= 32,
-	.reg_stride		= 4,
-	.max_register		= TEGRA210_MAX_REGISTER_ADDR,
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.val_bits			= 32,
+	.reg_stride			= 4,
+	.max_register			= TEGRA210_MAX_REGISTER_ADDR,
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra186_ahub_regmap_config = {
-	.reg_bits		= 32,
-	.val_bits		= 32,
-	.reg_stride		= 4,
-	.max_register		= TEGRA186_MAX_REGISTER_ADDR,
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.val_bits			= 32,
+	.reg_stride			= 4,
+	.max_register			= TEGRA186_MAX_REGISTER_ADDR,
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra264_ahub_regmap_config = {
-	.reg_bits		= 32,
-	.val_bits		= 32,
-	.reg_stride		= 4,
-	.writeable_reg		= tegra264_ahub_wr_reg,
-	.max_register		= TEGRA264_MAX_REGISTER_ADDR,
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.val_bits			= 32,
+	.reg_stride			= 4,
+	.writeable_reg			= tegra264_ahub_wr_reg,
+	.max_register			= TEGRA264_MAX_REGISTER_ADDR,
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct tegra_ahub_soc_data soc_data_tegra210 = {
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index c94f8c84e04f..1a7943bb41cc 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -645,42 +645,45 @@ static bool tegra264_amx_volatile_reg(struct device *dev,
 }
 
 static const struct regmap_config tegra210_amx_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA210_AMX_CFG_RAM_DATA,
-	.writeable_reg		= tegra210_amx_wr_reg,
-	.readable_reg		= tegra210_amx_rd_reg,
-	.volatile_reg		= tegra210_amx_volatile_reg,
-	.reg_defaults		= tegra210_amx_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra210_amx_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_AMX_CFG_RAM_DATA,
+	.writeable_reg			= tegra210_amx_wr_reg,
+	.readable_reg			= tegra210_amx_rd_reg,
+	.volatile_reg			= tegra210_amx_volatile_reg,
+	.reg_defaults			= tegra210_amx_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_amx_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra194_amx_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA194_AMX_RX4_LAST_FRAME_PERIOD,
-	.writeable_reg		= tegra194_amx_wr_reg,
-	.readable_reg		= tegra194_amx_rd_reg,
-	.volatile_reg		= tegra210_amx_volatile_reg,
-	.reg_defaults		= tegra210_amx_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra210_amx_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA194_AMX_RX4_LAST_FRAME_PERIOD,
+	.writeable_reg			= tegra194_amx_wr_reg,
+	.readable_reg			= tegra194_amx_rd_reg,
+	.volatile_reg			= tegra210_amx_volatile_reg,
+	.reg_defaults			= tegra210_amx_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_amx_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct regmap_config tegra264_amx_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA264_AMX_RX4_LAST_FRAME_PERIOD,
-	.writeable_reg		= tegra264_amx_wr_reg,
-	.readable_reg		= tegra264_amx_rd_reg,
-	.volatile_reg		= tegra264_amx_volatile_reg,
-	.reg_defaults		= tegra264_amx_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra264_amx_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA264_AMX_RX4_LAST_FRAME_PERIOD,
+	.writeable_reg			= tegra264_amx_wr_reg,
+	.readable_reg			= tegra264_amx_rd_reg,
+	.volatile_reg			= tegra264_amx_volatile_reg,
+	.reg_defaults			= tegra264_amx_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra264_amx_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct tegra210_amx_soc_data soc_data_tegra210 = {
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index 66fff53aeaa6..71b46a86443e 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -474,16 +474,17 @@ static bool tegra210_dmic_volatile_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra210_dmic_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = TEGRA210_DMIC_LP_BIQUAD_1_COEF_4,
-	.writeable_reg = tegra210_dmic_wr_reg,
-	.readable_reg = tegra210_dmic_rd_reg,
-	.volatile_reg = tegra210_dmic_volatile_reg,
-	.reg_defaults = tegra210_dmic_reg_defaults,
-	.num_reg_defaults = ARRAY_SIZE(tegra210_dmic_reg_defaults),
-	.cache_type = REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_DMIC_LP_BIQUAD_1_COEF_4,
+	.writeable_reg			= tegra210_dmic_wr_reg,
+	.readable_reg			= tegra210_dmic_rd_reg,
+	.volatile_reg			= tegra210_dmic_volatile_reg,
+	.reg_defaults			= tegra210_dmic_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_dmic_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static int tegra210_dmic_probe(struct platform_device *pdev)
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index b91e0e6cd7fe..940d9f6bdc3f 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -988,16 +988,17 @@ static bool tegra264_i2s_volatile_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra210_regmap_conf = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA210_I2S_CYA,
-	.writeable_reg		= tegra210_i2s_wr_reg,
-	.readable_reg		= tegra210_i2s_rd_reg,
-	.volatile_reg		= tegra210_i2s_volatile_reg,
-	.reg_defaults		= tegra210_i2s_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra210_i2s_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_I2S_CYA,
+	.writeable_reg			= tegra210_i2s_wr_reg,
+	.readable_reg			= tegra210_i2s_rd_reg,
+	.volatile_reg			= tegra210_i2s_volatile_reg,
+	.reg_defaults			= tegra210_i2s_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_i2s_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 /*
@@ -1035,16 +1036,17 @@ static void tegra210_parse_client_convert(struct device *dev)
 }
 
 static const struct regmap_config tegra264_regmap_conf = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA264_I2S_PAD_MACRO_STATUS,
-	.writeable_reg		= tegra264_i2s_wr_reg,
-	.readable_reg		= tegra264_i2s_rd_reg,
-	.volatile_reg		= tegra264_i2s_volatile_reg,
-	.reg_defaults		= tegra264_i2s_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra264_i2s_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA264_I2S_PAD_MACRO_STATUS,
+	.writeable_reg			= tegra264_i2s_wr_reg,
+	.readable_reg			= tegra264_i2s_rd_reg,
+	.volatile_reg			= tegra264_i2s_volatile_reg,
+	.reg_defaults			= tegra264_i2s_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra264_i2s_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static int tegra210_i2s_probe(struct platform_device *pdev)
diff --git a/sound/soc/tegra/tegra210_mbdrc.c b/sound/soc/tegra/tegra210_mbdrc.c
index 09fe3c5cf540..485fae392741 100644
--- a/sound/soc/tegra/tegra210_mbdrc.c
+++ b/sound/soc/tegra/tegra210_mbdrc.c
@@ -752,18 +752,19 @@ static bool tegra210_mbdrc_precious_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra210_mbdrc_regmap_cfg = {
-	.name			= "mbdrc",
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA210_MBDRC_MAX_REG,
-	.writeable_reg		= tegra210_mbdrc_wr_reg,
-	.readable_reg		= tegra210_mbdrc_rd_reg,
-	.volatile_reg		= tegra210_mbdrc_volatile_reg,
-	.precious_reg		= tegra210_mbdrc_precious_reg,
-	.reg_defaults		= tegra210_mbdrc_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra210_mbdrc_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.name				= "mbdrc",
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_MBDRC_MAX_REG,
+	.writeable_reg			= tegra210_mbdrc_wr_reg,
+	.readable_reg			= tegra210_mbdrc_rd_reg,
+	.volatile_reg			= tegra210_mbdrc_volatile_reg,
+	.precious_reg			= tegra210_mbdrc_precious_reg,
+	.reg_defaults			= tegra210_mbdrc_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_mbdrc_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 int tegra210_mbdrc_hw_params(struct snd_soc_component *cmpnt)
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index ff8e9f2d7abf..b05d1140c689 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -598,17 +598,18 @@ static bool tegra210_mixer_precious_reg(struct device *dev,
 }
 
 static const struct regmap_config tegra210_mixer_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA210_MIXER_CTRL,
-	.writeable_reg		= tegra210_mixer_wr_reg,
-	.readable_reg		= tegra210_mixer_rd_reg,
-	.volatile_reg		= tegra210_mixer_volatile_reg,
-	.precious_reg		= tegra210_mixer_precious_reg,
-	.reg_defaults		= tegra210_mixer_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra210_mixer_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_MIXER_CTRL,
+	.writeable_reg			= tegra210_mixer_wr_reg,
+	.readable_reg			= tegra210_mixer_rd_reg,
+	.volatile_reg			= tegra210_mixer_volatile_reg,
+	.precious_reg			= tegra210_mixer_precious_reg,
+	.reg_defaults			= tegra210_mixer_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_mixer_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct of_device_id tegra210_mixer_of_match[] = {
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 779d4c199da9..a0699563a512 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -690,16 +690,17 @@ static bool tegra210_mvc_volatile_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra210_mvc_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA210_MVC_CONFIG_ERR_TYPE,
-	.writeable_reg		= tegra210_mvc_wr_reg,
-	.readable_reg		= tegra210_mvc_rd_reg,
-	.volatile_reg		= tegra210_mvc_volatile_reg,
-	.reg_defaults		= tegra210_mvc_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra210_mvc_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_MVC_CONFIG_ERR_TYPE,
+	.writeable_reg			= tegra210_mvc_wr_reg,
+	.readable_reg			= tegra210_mvc_rd_reg,
+	.volatile_reg			= tegra210_mvc_volatile_reg,
+	.reg_defaults			= tegra210_mvc_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_mvc_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct of_device_id tegra210_mvc_of_match[] = {
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index 27db70af2746..6a1c05829b4b 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -288,16 +288,17 @@ static bool tegra210_ope_volatile_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra210_ope_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA210_OPE_DIR,
-	.writeable_reg		= tegra210_ope_wr_reg,
-	.readable_reg		= tegra210_ope_rd_reg,
-	.volatile_reg		= tegra210_ope_volatile_reg,
-	.reg_defaults		= tegra210_ope_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra210_ope_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_OPE_DIR,
+	.writeable_reg			= tegra210_ope_wr_reg,
+	.readable_reg			= tegra210_ope_rd_reg,
+	.volatile_reg			= tegra210_ope_volatile_reg,
+	.reg_defaults			= tegra210_ope_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_ope_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static int tegra210_ope_probe(struct platform_device *pdev)
diff --git a/sound/soc/tegra/tegra210_peq.c b/sound/soc/tegra/tegra210_peq.c
index 9a05e6913276..0f90a9d27f2e 100644
--- a/sound/soc/tegra/tegra210_peq.c
+++ b/sound/soc/tegra/tegra210_peq.c
@@ -295,18 +295,19 @@ static bool tegra210_peq_precious_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra210_peq_regmap_config = {
-	.name			= "peq",
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA210_PEQ_CFG_RAM_SHIFT_DATA,
-	.writeable_reg		= tegra210_peq_wr_reg,
-	.readable_reg		= tegra210_peq_rd_reg,
-	.volatile_reg		= tegra210_peq_volatile_reg,
-	.precious_reg		= tegra210_peq_precious_reg,
-	.reg_defaults		= tegra210_peq_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra210_peq_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.name				= "peq",
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_PEQ_CFG_RAM_SHIFT_DATA,
+	.writeable_reg			= tegra210_peq_wr_reg,
+	.readable_reg			= tegra210_peq_rd_reg,
+	.volatile_reg			= tegra210_peq_volatile_reg,
+	.precious_reg			= tegra210_peq_precious_reg,
+	.reg_defaults			= tegra210_peq_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_peq_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 void tegra210_peq_restore(struct regmap *regmap, u32 *biquad_gains,
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index d6341968bebe..4aee0a86c5dc 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3559,17 +3559,18 @@ static bool tegra210_sfc_precious_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_config tegra210_sfc_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= TEGRA210_SFC_CFG_RAM_DATA,
-	.writeable_reg		= tegra210_sfc_wr_reg,
-	.readable_reg		= tegra210_sfc_rd_reg,
-	.volatile_reg		= tegra210_sfc_volatile_reg,
-	.precious_reg		= tegra210_sfc_precious_reg,
-	.reg_defaults		= tegra210_sfc_reg_defaults,
-	.num_reg_defaults	= ARRAY_SIZE(tegra210_sfc_reg_defaults),
-	.cache_type		= REGCACHE_FLAT,
+	.reg_bits			= 32,
+	.reg_stride			= 4,
+	.val_bits			= 32,
+	.max_register			= TEGRA210_SFC_CFG_RAM_DATA,
+	.writeable_reg			= tegra210_sfc_wr_reg,
+	.readable_reg			= tegra210_sfc_rd_reg,
+	.volatile_reg			= tegra210_sfc_volatile_reg,
+	.precious_reg			= tegra210_sfc_precious_reg,
+	.reg_defaults			= tegra210_sfc_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tegra210_sfc_reg_defaults),
+	.cache_type			= REGCACHE_FLAT,
+	.flat_cache_default_is_zero	= true,
 };
 
 static const struct of_device_id tegra210_sfc_of_match[] = {
-- 
2.17.1

