Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C851EE033;
	Mon,  8 Dec 2025 05:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765171271; cv=fail; b=XJbiC0nQVl8cTBUJYhReYp1TZ9oim8RejR10+RWI53j7YDccDz3vK5tKZTdw/MEfWVfoDyvEfuxjY3woLBWv1Xjca/Sc2weH6AUJNP6KNqkbk6nJYis869i9sUF52wLBjOs1/b1snEWeV4jaZv6Y9/UJP3hzqdW+MUv/t85h28w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765171271; c=relaxed/simple;
	bh=nFYoOIq0xf4qgUJqTRDBTUzKEEdzPXkP4yXlY1qZVww=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EJAS7LnoHV1lQICodu1MSWJMZegzwUDxBdtxEmoMDEbOvNvQXFBXrkXZ1zKkN96+VZsMcG6Nptmcr5i2AyHukBtEluy2GIf3rlCZrVZYOx9KhVPL96YNLkRYo4dbg1UiWpBshqE+ccDF90KtxvvVhci+pt8mWdvK6by301kQGiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q8qHJIUk; arc=fail smtp.client-ip=40.107.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q8qHJIUk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsFavZjN1OaBjqZLO1XX+9Dvn7qMDH2mbyxIsAFfUWSJ536yczas46pIW5GLF62TyZcLcADYv31R4IsQZ/Mxt4us+UgMEK4VO9BChTugpOc6DDwjCMp2r2WSkeCs9UXv053amaErGNZoLyXMS1kh36Dp05H/BMYz/71j0jgYuTmXooLdLnRbti+o2AU0buxb4t7WDKJ7uut1PjfGGb8hUXiduTJ95rpF7vtzfrNA/G/Zcs8QSdKYwkgU9KW8ajriRdWgy8iAvPSTsPUiYysfx7A2IhUw/IeQEuipdTAL/vklvXCSWJiBjlgOR95EBEnzHwsISfCrZdNoKKnwuLIr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5772/iPChKMRHW/CFXZ5JJyyQ+QAo+JO6hvMHEx/xDY=;
 b=NjcNVrLo0viIG2sW4xm5yTmDJr3WLC+ZNRSpEjfya0bi6TN+4c1TVeaJuK2fZOXtD92bQEsw2sP/XWJ+T39DJ29QUXrJgCbAFCQnCmcDOi8WnxoFYjdwzpfRv8GxQYw1Ih/sTv9c3HLyelmnGojfZNbBGMJ/mCvfWUVf9It4TiTCMtxehGluTvvK5q7oLXDgGk4ONKUYnPf4jgEGQ+HxScV0C2Q0B1jalzXQ5xMYyftCAtoM7NljdY0HamvaoxF4VWEJENGLbscDz64SvYmkgmWf9w+1/jZ1onrinVqQr0ivCFqyZKXyteZs6JjCq6+MoN1F6CVoRoPZhubiTF7jRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5772/iPChKMRHW/CFXZ5JJyyQ+QAo+JO6hvMHEx/xDY=;
 b=q8qHJIUkdPS9w554CDMyzmKf9zHGxWD7mUMnfnQ5rkH1FTnXZcl5QzhcgDrnzMvQoL6kEY/dz90S/vVbXk1+He8XrXsrLIKenHEUFB9AZ3vJeHeJkvwKjl78cyjZnuFmJfxzNDgOWOpjezlziV8sMTaEGFUAHVQkgoZjZa41A8Ton2ygDVTb6RPQMJ3WdJqqxNc8nN7XW9uBEK/YmIiCCdJlrb/LFZ/FJvd8iL6oFO66k/hVSLVUhOxylYsW/pKTa9oBji3QtvwVw5AHzaWX8yOathspTWI3Em0s2MQ8nEVO7N9j7UTo6AQ9I2p3MM2FKfBVz7xhC6gwcd5t74JhNQ==
Received: from SA9PR11CA0027.namprd11.prod.outlook.com (2603:10b6:806:6e::32)
 by DS7PR12MB9551.namprd12.prod.outlook.com (2603:10b6:8:24f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 05:21:05 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::2c) by SA9PR11CA0027.outlook.office365.com
 (2603:10b6:806:6e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 05:20:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 05:21:05 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 7 Dec
 2025 21:20:49 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 7 Dec
 2025 21:20:48 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 7 Dec 2025 21:20:45 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Sander Vanheule <sander@svanheule.net>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, sheetal
	<sheetal@nvidia.com>
Subject: [PATCH] ASoC: tegra: Fix uninitialized flat cache warning in tegra210_ahub
Date: Mon, 8 Dec 2025 10:50:40 +0530
Message-ID: <20251208052040.4025612-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|DS7PR12MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4641db-04c6-4803-9cb4-08de36199644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s0BGYR9bCH4shErKd1zqlC21ywheVavHIlLK5r75CXY9h69SrWb/Na+FVi/1?=
 =?us-ascii?Q?t67KcFBg2eJlcS8rpvLmLgZpw9LYIjJw2nGq255y+UvWCysouKREelnCBMhJ?=
 =?us-ascii?Q?dBH5TFZ+hAEOrrW6S3PjAcYmpm0hpMJdDsrCfGe52TW4ST1ukaNgMFXqHSTj?=
 =?us-ascii?Q?izZnAJD4mIKZrjQKqpYpo53l34jwHS/00VyptyxXgWJIB9vBbFa/O7hFckuQ?=
 =?us-ascii?Q?is82YZ0FMdk20ZUOCpU7cf6b7sG3xuDIvlCjizx4oPBmi+AcUUGIJprnu+aJ?=
 =?us-ascii?Q?Mkw054PdnADtGvvwjMnFOoMjd8gYmE6M9m8C3vLpFcHjrHdKy1YiBXiKmcIw?=
 =?us-ascii?Q?LCghBGlYrLYuiaZSFbhgaVa9LHnaz6/DL8rDBNkxnT9/HnFu/uamt5SRTFLp?=
 =?us-ascii?Q?M3uRZckCt1kHTFGQsGXc5ZbOlD3JwGyw6xqdmRjggzGYCbTFYnceF/gQyVxR?=
 =?us-ascii?Q?Nb9MD/4Z6tuOr1W9QhEwxQj07oAfKuFVs0giLSTuoiBSTXaE5WrhhH43t/W4?=
 =?us-ascii?Q?IvrxEfvjwx+/8J+8An8rRw9yAxGKM2tOnnh3TA4jnkMVdqWUUiBWblTalmiZ?=
 =?us-ascii?Q?ps6Jgj/Qpn4L8XbAg07VHzBkaHgyZHxcFGYg8usJhzkLR5g9UyMsbhtG5soh?=
 =?us-ascii?Q?Y6ghDKcfaLRex+2Ty2Rxqw/e68kEJ1+gKgQ0XZYHB3EBOY89E9ecByBWBibh?=
 =?us-ascii?Q?rDxONHlkiX4pwWBbEsXfJQuhNyJzaYP61sF+A4W1zEA1Wqk0irqW0hIFam7t?=
 =?us-ascii?Q?jUDyFkcSfRyQqW86PlbxK5n9gWAGyHes8VlIZO93DCK6oy9DEpJWGeDIzKjZ?=
 =?us-ascii?Q?7DwMTIU/z3PQ29rLNaiV16ZlVS5HOOL0JzxjryU0Ow2AkhEjIaz9NQC31E7K?=
 =?us-ascii?Q?ZGHc7YaKZNjOQSCsWPFNwnaQ1JqAfVaDHnPOls6l/qXzwmbRAZCFmRfv2mED?=
 =?us-ascii?Q?VfGp/zAc78d8EZbjYxiT4ghOxAcZ6sg6DRFx7OC94RrebTn3E+95zrEvBxbg?=
 =?us-ascii?Q?x3mQbjuMQ7M62/gn2fbxRe+Xk/HIgCtGAEicL20wP0zPg4LfokvD2Q0Eir/0?=
 =?us-ascii?Q?C94PzPrFrr3KoB4PXZu2rOVn5vz74SUBhv8anhAXEmeZ6JpYKsIfxVgGWeId?=
 =?us-ascii?Q?0cPzzOQSuKr8EOagyyM1Qp03rrHpOQkCXjP/YTo8brS7hHns8sxc8lnvcsBa?=
 =?us-ascii?Q?pzce/MTsrPJ4WClIWF40Cjo+P+8FMUkVwEnn8yVEuXvSB/Zll9o8OiTFNF8L?=
 =?us-ascii?Q?6PQlLQ1CO7VErtLtRW+QaLBynFhpWBF+xJ6m9zNH4JRTD/CBCwrj7XACUSKY?=
 =?us-ascii?Q?IMaNgmeH5A37IircC8ouUbhM1wuIhESNSi1+vdm5RAdAOkua474DIFG2TXeV?=
 =?us-ascii?Q?Ns1dD0aDhcoBRJVuVs+ROw7iKiyODb8dkeFbs9Rpv3HoCnidlRbC6UJxcej2?=
 =?us-ascii?Q?LOHzaxuKn8eWC8rH4V/oMLPyVut3d3p54+Uln50paDTdFkXEyp/r8n8Rquh/?=
 =?us-ascii?Q?DbLyrvOzR734qtDvouObQDy34VWVGsZPNh6FLrxTBkbDh+qHOU4f/FKwBYFV?=
 =?us-ascii?Q?RdiwfhFTdQf1ClVKTgA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 05:21:05.5006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4641db-04c6-4803-9cb4-08de36199644
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9551

From: sheetal <sheetal@nvidia.com>

The tegra210_ahub driver started triggering a warning after commit
e062bdfdd6ad ("regmap: warn users about uninitialized flat cache"),
which flags drivers using REGCACHE_FLAT without register defaults.
Since the driver omits default definitions because its registers are
zero initialized, the following warning is shown:

  WARNING KERN tegra210-ahub 2900800.ahub: using zero-initialized flat cache, this may cause unexpected behavior

Switch to REGCACHE_FLAT_S which is the recommended cache type for
sparse register maps without defaults. This cache type initializes
entries on-demand from hardware, eliminating the warning while using
memory efficiently.

Fixes: e062bdfdd6ad ("regmap: warn users about uninitialized flat cache")
Signed-off-by: sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_ahub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index e795907a3963..261d9067d27b 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -2077,7 +2077,7 @@ static const struct regmap_config tegra210_ahub_regmap_config = {
 	.val_bits		= 32,
 	.reg_stride		= 4,
 	.max_register		= TEGRA210_MAX_REGISTER_ADDR,
-	.cache_type		= REGCACHE_FLAT,
+	.cache_type		= REGCACHE_FLAT_S,
 };
 
 static const struct regmap_config tegra186_ahub_regmap_config = {
@@ -2085,7 +2085,7 @@ static const struct regmap_config tegra186_ahub_regmap_config = {
 	.val_bits		= 32,
 	.reg_stride		= 4,
 	.max_register		= TEGRA186_MAX_REGISTER_ADDR,
-	.cache_type		= REGCACHE_FLAT,
+	.cache_type		= REGCACHE_FLAT_S,
 };
 
 static const struct regmap_config tegra264_ahub_regmap_config = {
@@ -2094,7 +2094,7 @@ static const struct regmap_config tegra264_ahub_regmap_config = {
 	.reg_stride		= 4,
 	.writeable_reg		= tegra264_ahub_wr_reg,
 	.max_register		= TEGRA264_MAX_REGISTER_ADDR,
-	.cache_type		= REGCACHE_FLAT,
+	.cache_type		= REGCACHE_FLAT_S,
 };
 
 static const struct tegra_ahub_soc_data soc_data_tegra210 = {
-- 
2.34.1

