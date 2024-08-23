Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF417E01F;
	Fri, 23 Aug 2024 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724424261; cv=fail; b=JzQBs5P9qxvRranc243dODwzRsOVeOBTvAZwdr2pSF7eIAZ+Lru2fwTuAeTEEeJuATSJxbZepmwiC+x5Du/Zi7GTgzFwuxPEuV6ULDE5uarPxJLg1kzyKeYzPkn6ZDZomid+VgFsEFgF20bgro+R/JGPKpvnA/JAsQcoxAEhIpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724424261; c=relaxed/simple;
	bh=0Rqpk8p/+u18lmHFpunJO7aB88tOIfBZZ0PFVng6C84=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dRp7r0UGjyMu7tBOqC1gvoRNuOphJQyZZvzjYQFuyUaB4Ah/25yPXGVu7vjnP6kzZHXYCzDF+MUGhsoPxiN17hp9I9Ln343Tu+p0Kj2x5ocF+jGKPkL1wpKqBFg63pMcZgCd8W/dnSPkjI4q15fN88G9JZivShJnHe5Cn8HJnKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r9jzCJ6r; arc=fail smtp.client-ip=40.107.212.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r9jzCJ6r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnGocMpRZK6D3Fwcwmrff2iG3FUb959KqnkjhPNw45SWY5XWrAi/AY7GGK3MpJ8r3LsYllaaq9XuRihiM72flezBiGesfoPTuWCXrGy79uQBacWnC2mGyrLbgxysrxnmxaC5zNKiMbwwQs6g2TKTH5OAHrSreg5hViSsL4x72jadGa7mTHBxnCddashazvYCzVx+zQoUjx8FvIqXcoBsbOPp/rLqEGQM+ulKLbnaiyHiJZyo+uQHdax8QpFvfnDrrqycWj4OEF5yiHRcnAl68pB8+RZaW46J5LsYkxJf1v7j6MVJwQGP8hrNPXGNN//4vdeOvuOaAEcpSa8BSQixFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KoK5Z9UNiTAoP/dpzY0KRcgZtFePZz/S3uBwThHQpA=;
 b=uCsXjBC0lyO1I5K7otndNhZEqH8Z8xVdBvRY1ht+UqRICFgEQHe6SaThapYqwssvhJdWxkV1BFbuDOmIeowluEMXjia+oxaduwIOy+daSaY0DgqVB8EMRKaraDKiHMpWlPo5B5eOwpH+qXsQd446Z7SxomV6mx58gR/jyay8Qq+l50qWbm4Tr1F2Fwgg08ds3N+BMIo4Vs8FfEpqCI1scXaHOKYM8k4A682EZPwgYyUfvm18SHstMJzXftDYk1sdw1tru0ZTpLBQy6F7Srt4lWP7AyPYqEXrGCF5Ez5TMywFe25bFtP0ejljeZyWKh59Hz3Y3OEpQnZZyldKOlFGTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KoK5Z9UNiTAoP/dpzY0KRcgZtFePZz/S3uBwThHQpA=;
 b=r9jzCJ6r2qfUsa23r/xiP8e8mwKpXkpP9FHeLeR6vQFaVJGcML0qu/L3YQltctR4rXDUYGY7HZy2D+7BFew4brYJP6at453yZRmgS7z9G4Ec8xLekuIscbIxQfbU2DnrMDRiBmYAE3uLp9J1T2riilsNNhfq1kiRW9krLdPjSsckMfvdeyW+LchxQRT0q7l6JSQSSNxT1l45c+rFMEWD76jVCs+P36yEh+wfemmXYC50rZWZjDt9ifoOWrMVUpMp2fejLurm+TDTuftStPjbxAgU9TjjJ3x3dVuHBCwJ8j81XkABNoU8WsBZPlr0x5WD1MCemX8AXjtBlgQHj72fSA==
Received: from PH8PR07CA0014.namprd07.prod.outlook.com (2603:10b6:510:2cd::25)
 by SJ2PR12MB8691.namprd12.prod.outlook.com (2603:10b6:a03:541::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 14:44:14 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::f2) by PH8PR07CA0014.outlook.office365.com
 (2603:10b6:510:2cd::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Fri, 23 Aug 2024 14:44:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 14:44:14 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 07:44:04 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 07:44:03 -0700
Received: from build-spujar-20240626T115404323.nvidia.com (10.127.8.9) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 07:44:03 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, <rituc@nvidia.com>, <jbrunet@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robelin@nvidia.com>
Subject: [PATCH 0/2] Fixes for Tegra audio
Date: Fri, 23 Aug 2024 14:43:40 +0000
Message-ID: <20240823144342.4123814-1-spujar@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|SJ2PR12MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e85fa5b-5d52-4556-057c-08dcc3820ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dWfu55Fq2DrixIfJ2Aidr23z6GXuEvX0SMZqHQsuT4fio3UJxy+8jsGdTKxA?=
 =?us-ascii?Q?9y0rJgSsxwigkmMATSwc6KFOXMaw21KK2ahEiDwmVZcWpN6+MB0Xn4m36WOk?=
 =?us-ascii?Q?v/iIs2aU/396qa+/sosy3nqRwumRcgyMCWHv7dT+sguxfwX0n8YpzTY3l0mX?=
 =?us-ascii?Q?OIjOfOG1N9EqaH9VICWEYa7luHNDHOM+2i/mTjTbiV9ojXIS+Li0DFLU1wbG?=
 =?us-ascii?Q?avaD1got15A+A9dF9u+5cseWBqPFJDrIrclqi9aZ+kqORJIpT8M1xxTL7hnn?=
 =?us-ascii?Q?KU8HRqY7uQXLd2TE5ld1UbJzYMrOi0I4DAFv5d8O78pQT7XDmP1VaU2bfZ5E?=
 =?us-ascii?Q?hdsWN+DSEI1xwQ4JRqO4VI8Rh+GtpC5h52Z/Bgrw+rdLZa4eMeAQehaZ8xxk?=
 =?us-ascii?Q?UGRUkoo8SNHMMNyiJKLlf8ZwdF4GAr/B4eV/8lwxAMlJIkVtlxAM/x76DQ6P?=
 =?us-ascii?Q?pTlZjeglz717OqJS/fBquIP05i4uY6FtN6phhRm01Z35ha14fbOTibofgQjw?=
 =?us-ascii?Q?BPeDqizXXUUplvOsJZTWYR0/6iX9bE1C0uy2nEDiA/xRzzGubnOgIoIJlhNc?=
 =?us-ascii?Q?YhGedqkYysSXFR3TKIR3w0vjC3DkYwpZP1HPtd5A3cPH9rqvw9ArtFgK5Sp/?=
 =?us-ascii?Q?vXpSD/HwgXvp9WDV8gFiPmcRS5Xwm6zzAckZyV315aiAYoj4dAWJUQrW1Ejo?=
 =?us-ascii?Q?C07vWbiRkkecGCRSYH+cjOiPq4Md6PZQnDTyATap+LEG6+pMH8xKVb7MoIaV?=
 =?us-ascii?Q?W+j42VN2ihDKzrXfcw+vVne7luMtibL39+R0cOmNwu6gkoSXCF78pCNBKgji?=
 =?us-ascii?Q?82jluJ4ndGSsJiN0MvZsNIvLiH3tsI91eftJBTbicQCmCY9jqPsqKDEljajS?=
 =?us-ascii?Q?OH9p314RygBL7OZLouv+6Vx+EB7LbXSRQXFik6lXUkzBPBc1xlb5pe7UC0aj?=
 =?us-ascii?Q?xvpgilN5QX8o9qoev56eJI4Gmj/rWq1VkucELBoFzDqDo4RDGsuSDRj8o3f7?=
 =?us-ascii?Q?WQiCw3lh4TrxNSDHKr01RLv9taHEyegpEn4Nu0rkBBlB/cVD6k6sAdlxox/6?=
 =?us-ascii?Q?PMb54HKG/Ywm3rrT1O/MRFiRYQNRZi5c6aiUFLnYtD6y26PIZxz+ymYLBVQE?=
 =?us-ascii?Q?wM/YN93B5YjwbFmyNszTkPUe/1KMox3qJlWvLhnj92/jbvOLSUjOc4BAKI4C?=
 =?us-ascii?Q?yTwfPajcLwYwzUtBSCAaBoVsOc9vcWtENpsDo5e6+lRLsAp/tta6cvzm8GLS?=
 =?us-ascii?Q?lH8Qkv5yZPDHUw2QGEtRsZ74xCuZtC2RVv7fwRJll7Yvhqh4BFzwB+FCWoUa?=
 =?us-ascii?Q?Obzb0EkZ3Te7bvEWIBNtq65Hps4zNUW8TZGsTyfA2zjM7hl6QUHSpcfoyzl9?=
 =?us-ascii?Q?mLpIwvFVKTQByhATqv6Viz+pm4M0+QKdW7OYHaOjAB8V/cyirkDzWg4xC/Rt?=
 =?us-ascii?Q?uJFaub1XLhy6F/7yX6/9F1Y+fWwzIRu2?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:44:14.0186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e85fa5b-5d52-4556-057c-08dcc3820ed7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8691

This is a small series which fixes two bugs which were discovered
on NVIDIA Jetson AGX Orin platform.

The first patch in the series fixes a KASAN UAF bug discovered
during suspend/resume testing. This is a core DAPM fix.

The second patch fixes CBB error and this is Tegra in AHUB driver.
This error happens when Tegra audio drivers were built as part of
kernel image.

Mohan Kumar (1):
  ASoC: tegra: Fix CBB error during probe()

robelin (1):
  ASoC: dapm: Fix UAF for snd_soc_pcm_runtime object

 sound/soc/soc-dapm.c            |  1 +
 sound/soc/tegra/tegra210_ahub.c | 10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.17.1

